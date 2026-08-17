# dotfiles

[简体中文 (zh-CN)](README-zh-CN.md) - [繁體中文 (zh-TW)](README-zh-TW.md)

Personal dotfiles for my Debian 13 desktop environment.

> [!NOTE]
> Screenshots and demo videos will be added in the future.

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

<br>

## Projects Used

[gnuunixchad](https://github.com/gnuunixchad/dotfiles) - Referenced and used a portion of the configuration and scripts with custom modifications

