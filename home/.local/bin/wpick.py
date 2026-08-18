#!/usr/bin/env python3

import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk, GdkPixbuf, GLib

from pathlib import Path
import subprocess
import os

WALLDIR = Path.home() / "Pictures" / "wallpaper"

CACHE_DIR = Path.home() / ".cache" / "labwc" / "wallpaper"
CACHE_DIR.mkdir(parents=True, exist_ok=True)

THUMB_DIR = CACHE_DIR / "thumbs"
THUMB_DIR.mkdir(parents=True, exist_ok=True)

CURRENT = CACHE_DIR / "current"

# Specify the number of wallpapers to load at one time
LOAD_COUNT = 20

IMAGE_EXT = (".jpg",".jpeg",".png",".webp",".bmp",)

def get_thumbnail(img):
    thumb = THUMB_DIR / (img.stem + ".thumb.jpg")
    if (
        thumb.exists()
        and thumb.stat().st_mtime >= img.stat().st_mtime
    ):
        return thumb
    try:
        pix = GdkPixbuf.Pixbuf.new_from_file_at_scale(
            str(img),
            260,
            170,
            True
        )
        pix.savev(str(thumb),"jpeg",[],[])
        return thumb
    except Exception as e:
        print(e)
        return img

class WallpaperWindow(Gtk.Window):
    def __init__(self):
        super().__init__(title="wpick")
        # Set the program window size
        self.set_default_size(900, 600)

        main_box = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL
        )
        self.add(main_box)
        self.search_entry = Gtk.SearchEntry()
        self.search_entry.set_placeholder_text("Search wallpapers...")
        self.search_entry.connect("search-changed",self.search_wallpapers)
        main_box.pack_start(self.search_entry,False,False,5)
        
        scroll = Gtk.ScrolledWindow()
        main_box.pack_start(scroll,True,True,0)
        self.flow = Gtk.FlowBox()
        self.flow.set_max_children_per_line(4)
        self.flow.set_selection_mode(Gtk.SelectionMode.NONE)
        self.flow.set_row_spacing(10)
        self.flow.set_column_spacing(10)

        scroll.add(self.flow)
        self.images = []
        self.filtered_images = []
        self.loaded_count = 0
        
        self.load_button = Gtk.Button(label="Load More Wallpapers")
        self.load_button.connect("clicked",self.load_more)

        main_box.pack_start(
            self.load_button,
            False,
            False,
            5
        )

        self.prepare_images()
        self.load_more()
        self.set_focus(None)

    def prepare_images(self):
        images = sorted(WALLDIR.iterdir())
        for img in images:
            if img.name == "current":
                continue
            if img.suffix.lower() not in IMAGE_EXT:
                continue
            self.images.append(img)
        self.filtered_images = self.images.copy()
    def load_more(self, button=None):
        start = self.loaded_count
        end = start + LOAD_COUNT
        for img in self.filtered_images[start:end]:
            try:
                thumb = get_thumbnail(img)
                pix = GdkPixbuf.Pixbuf.new_from_file(
                    str(thumb)
                )
            except Exception as e:
                print(e)
                continue
            image = Gtk.Image.new_from_pixbuf(pix)
            label = Gtk.Label(
                label=img.name
            )
            box = Gtk.Box(
                orientation=Gtk.Orientation.VERTICAL
            )
            box.pack_start(
                image,
                True,
                True,
                0
            )
            box.pack_start(
                label,
                False,
                False,
                5
            )

            button = Gtk.Button()
            button.set_size_request(280,220)
            button.add(box)
            button.connect(
                "clicked",
                self.change_wallpaper,
                img
            )

            self.flow.add(button)

        self.loaded_count = end
        self.show_all()

        # If no wallpapers are available subsequently, this message will be shown,
        # and the button will be grayed out and unclickable.
        if self.loaded_count >= len(self.filtered_images):
            self.load_button.set_sensitive(False)
            self.load_button.set_label("All Wallpapers Loaded")

    def change_wallpaper(self, button, img):
        try:
            if CURRENT.exists() or CURRENT.is_symlink():
                CURRENT.unlink()
            os.symlink(img, CURRENT)

        except Exception as e:
            print(e)
        old_pid = None
        try:
            result = subprocess.run(
                ["pidof", "swaybg"],
                capture_output=True,
                text=True
            )
            if result.stdout.strip():
                old_pid = result.stdout.strip().split()[0]
        
        except Exception:
            pass

        subprocess.Popen(
            [
                "swaybg",
                "-i",
                str(CURRENT),
                "-m",
                "fill",
            ],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        if old_pid:
            def kill_old():
                try:
                    os.kill(
                        int(old_pid),
                        15
                    )
                except Exception:
                    pass
                return False
            GLib.timeout_add(
                800,
                kill_old
            )

    def search_wallpapers(self, entry):
        text = entry.get_text().lower()
        if text:
            self.filtered_images = [
                img for img in self.images
                if text in img.name.lower()
            ]
        else:
            self.filtered_images = self.images.copy()
        for child in self.flow.get_children():
            self.flow.remove(child)
        self.loaded_count = 0
        # Click that prompt button will load the specified number of subsequent wallpapers
        self.load_button.set_sensitive(True)
        self.load_button.set_label("Load More Wallpapers")
        self.load_more()

# Set dark mode. If you don't need it, please comment out or remove the two lines below
settings = Gtk.Settings.get_default()
settings.set_property("gtk-application-prefer-dark-theme", True)

# Set the application name
GLib.set_prgname("wpick")

win = WallpaperWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()

Gtk.main()
