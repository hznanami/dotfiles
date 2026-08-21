# dotfiles

[简体中文 (zh-CN)](README-zh-CN.md) - [繁體中文 (zh-TW)](README-zh-TW.md)

Personal dotfiles for my Debian 13 desktop environment.

![main-screenshot](./demo/screenshot/screenshot-1.png)
<br>

## Usage

> [!NOTE]
> This branch contains only the configuration for **Debian 13 + labwc**. If you only want the Debian version of these dotfiles, clone the `dot-debian` branch directly.

### Clone the Debian Branch Only

Clone from Codeberg:

```sh
git clone --branch dot-debian --single-branch --recurse-submodules https://codeberg.org/hznanami/dotfiles.git
```

Or clone from GitHub:

```sh
git clone --branch dot-debian --single-branch --recurse-submodules https://github.com/hznanami/dotfiles.git
```

If you do not need the submodule, simply omit `--recurse-submodules`:

```sh
git clone --branch dot-debian --single-branch https://codeberg.org/hznanami/dotfiles.git
```

Or:

```sh
git clone --branch dot-debian --single-branch https://github.com/hznanami/dotfiles.git
```

### If You Have Already Cloned the Repository

If you have already cloned the entire repository and want to switch to the Debian branch:

```sh
git switch dot-debian
```

Or:

```sh
git checkout dot-debian
```

### Applying the Configuration

The configuration files in this repository can be used in one of the following ways:

1. Create symbolic links to your home directory.
2. Manage them with GNU Stow.
3. Copy them manually to the appropriate locations.

### Manual Installation

Some fonts and binaries are not available in the Debian 13 repositories and must be installed manually.

For details, see:

`docs/manual-installation.md`

<br>

## Programs

| Component | Program |
|----------|---------|
| Window Manager | [labwc-0.8.4](https://github.com/labwc/labwc) |
| Shell | [bash](https://www.gnu.org/software/bash/bash.html) |
| Terminal | [foot](https://codeberg.org/dnkl/foot) |
| Panel | [waybar](https://github.com/Alexays/Waybar) |
| Wallpaper Utility | [swaybg](https://github.com/swaywm/swaybg) |
| Editor | [neovim](https://github.com/neovim/neovim) |
| File Manager | [lf](https://github.com/gokcehan/lf) |
| Browser | [ungoogled-chromium](https://github.com/ungoogled-software/ungoogled-chromium) |
| Launcher | [fuzzel](https://codeberg.org/dnkl/fuzzel) |
| Fuzzy Finder | [fzf](https://github.com/junegunn/fzf) |
| Notification | [mako](https://github.com/emersion/mako) |
| Lock Screen | [swaylock](https://github.com/swaywm/swaylock) |
| Video Player | [mpv](https://github.com/mpv-player/mpv) |
| Image Viewer | [swayimg](https://github.com/artemsen/swayimg) |
| Screen Recorder | [wf-recorder](https://github.com/ammen99/wf-recorder) |
| Privilege Escalation Tool | [doas](https://github.com/Duncaen/OpenDoas) |
| Dotfiles Manager | [stow](https://github.com/aspiers/stow) & [git](https://github.com/git/git) |

### About waybar
![waybar](./demo/gif/waybar-1.gif)

The required packages are `waybar` and `fuzzel`. waybar must be version `0.14.0` or newer. If your waybar version is older than this,
the `ext/workspaces` configuration is not supported, which means you will not be able to switch workspaces by clicking the workspace buttons.

The bottom-right corner of this waybar configuration is used for quickly showing the desktop. This feature requires `wlrctl`.

> [!NOTE]
> The following operations require root privileges.

Debian (minimal installation):

```sh
apt install --no-install-recommends wlrctl
```

ArchLinux (or derivatives):

This uses the AUR. Using `paru` as an example:

```sh
paru -S wlrctl
```

Gentoo users need to fetch the source code and compile it manually, because there is no package available in overlays.

You can also customize the waybar configuration to suit your needs. For example, `fuzzel` can be replaced with your preferred launcher, the programs launched by shortcuts can be changed, the icons can be changed, and so on.

### About Wallpaper Switching
![switch-wallpaper](./demo/gif/switch-wallpaper-1.gif)

The following files are required: the source file `home/.config/labwc/scripts/wpick.py`, the shortcut launcher script `home/.local/bin/wpick`,
the desktop file (optional) `home/.local/share/applications/wpick.desktop`, and the icon files (optional) `home/.local/share/icons/*`

This program only supports swaybg.

This program requires the following additional dependencies: `pygobject`, `gtk3`, `swaybg`, and `python3` (most of them are already installed as dependencies, so normally you don't need to worry about them).

Step 1:

> [!NOTE]
> The following operations require root privileges.

Debian (minimal installation):

```sh
apt install --no-install-recommends python3-gi gir1.2-gtk-3.0 swaybg python3-minimal
```

ArchLinux (or derivatives):

```sh
pacman -S --needed python-gobject gtk3 swaybg python
```

Gentoo (`python` is already a required dependency of portage, so it does not need to be installed again):

```sh
emerge --ask --verbose dev-python/pygobject x11-libs/gtk+ gui-apps/swaybg
```

Step 2:

Set the autostart for labwc to:

```sh
# Set wallpaper with wpick.
MODE_FILE="$HOME/.cache/labwc/wallpaper/mode"
if [ ! -f "$MODE_FILE" ]; then
   echo fill > "$MODE_FILE"
fi
MODE=$(cat "$MODE_FILE")
swaybg -i "$HOME/.cache/labwc/wallpaper/current" -m "$MODE" >/dev/null 2>&1 &
```

`current` is a symbolic link created and updated by the wallpaper switching program based on the selected wallpaper. If the `mode` file does not exist, a file with the default value `fill` will be created. The value in this file can be changed by the wallpaper program when manually switching the background mode.
<br>

## Projects Used

[gnuunixchad](https://github.com/gnuunixchad/dotfiles) - Referenced and used a portion of the configuration and scripts with custom modifications

