# dotfiles

[简体中文 (zh-CN)](README-zh-CN.md) - [繁體中文 (zh-TW)](README-zh-TW.md)

Personal dotfiles for my Debian 13 desktop environment.

![main-screenshot](./demo/screenshot/screenshot-2.png)
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

The bottom-right corner of this waybar configuration is used to quickly show the desktop. `labwc` natively supports `ToggleShowDesktop` (toggle show desktop) in version **0.20.0** and later. If you are using labwc 0.20.0 or later, use the `wtype` tool (you need to manually modify the waybar configuration and uncomment the alternative configuration). Otherwise, you need to use `wlrctl`. When using wlrctl, only the show desktop function is available.

> [!NOTE]
> The following operations require root privileges.

#### labwc < 0.20.0 use the following commands:

Debian (minimal installation):

```sh
apt install --no-install-recommends wlrctl
```

ArchLinux (or derivatives):

The AUR is required. Using paru as an example:

```sh
paru -S wlrctl
```

Gentoo users need to manually fetch the source code and compile it because there is no package available in overlays.

#### labwc >= 0.20.0 use the following commands:

Debian (minimal installation):

```sh
apt install --no-install-recommends wtype
```

ArchLinux (or derivatives):

```sh
pacman -S --needed wtype
```

Gentoo:

```sh
emerge --ask --verbose gui-apps/wtype
```

You can also customize the waybar configuration to suit your needs. For example, `fuzzel` can be replaced with your preferred launcher, the programs launched by shortcuts can be changed, the icons can be changed, and so on.

### About Wallpaper Switching
![switch-wallpaper](./demo/gif/switch-wallpaper-2.gif)

The following files are required: the source file `home/.config/labwc/scripts/wpick.py`, the shortcut launcher script `home/.local/bin/wpick`,
the desktop file (optional) `home/.local/share/applications/wpick.desktop`, and the icon files (optional) `home/.local/share/icons/*`

The default wallpaper path recognized by this program is `$HOME/Pictures/wallpaper` (you can change the path by modifying `wpick.py`), and this program only supports `swaybg`.

This program requires the following additional dependencies: `pygobject`, `gtk3`, `swaybg`, and `python3` (most of them are already installed as dependencies, so normally you don't need to worry about them).

**Step 1:**

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

**Step 2:**

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

`current` is a symbolic link created and updated by the wallpaper switching program based on the selected wallpaper. If the `mode` file does not exist, a file with the default value **fill** will be created. The value in this file can be changed by the wallpaper program when manually switching the background mode.

**Step 3:**

Place the source file `wpick.py`, the shortcut launcher script `wpick`, the desktop file `wpick.desktop` (optional), and the icon files (optional) in the specified locations:

You can use the stow tool to manage these files, or you can use the following commands.

Switch to the cloned directory
```sh
cd dotfiles
```

Copy `wpick.py`. Note that this step requires checking whether PATH contains `.local/bin`. If not, add it yourself or use another path.
```sh
mkdir -p ~/.config/labwc/scripts
cp home/.config/labwc/scripts/wpick.py ~/.config/labwc/scripts
```

Copy the launcher script `wpick`
```sh
mkdir -p ~/.local/bin
cp home/.local/bin/wpick ~/.local/bin
```

Copy the desktop file (optional)
```sh
mkdir -p ~/.local/share/applications
cp home/.local/share/applications/wpick.desktop ~/.local/share/applications
```

Copy the icon files (optional)
```sh
cp -r home/.local/share/icons ~/.local/share
```

After completing the steps above, you can launch the wpick program from the launcher or from the command line.
<br>

## Projects Used

[gnuunixchad](https://github.com/gnuunixchad/dotfiles) - Referenced and used a portion of the configuration and scripts with custom modifications

