# dotfiles

[English](README.md) - [繁體中文 (zh-TW)](README-zh-TW.md)

我的Debian 13桌面环境配置文件。

![main-screenshot](./demo/screenshot/screenshot-2.png)
<br>

## 使用方法

> [!NOTE]
> 本分支仅包含**Debian 13+labwc**的配置。如果你只想使用Debian版本的dotfiles，建议直接克隆`dot-debian`分支。

### 仅克隆Debian分支

从Codeberg克隆

```sh
git clone --branch dot-debian --single-branch --recurse-submodules https://codeberg.org/hznanami/dotfiles.git
```

或从GitHub克隆

```sh
git clone --branch dot-debian --single-branch --recurse-submodules https://github.com/hznanami/dotfiles.git
```

如果不需要子模块，可以移除`--recurse-submodules`：

```sh
git clone --branch dot-debian --single-branch https://codeberg.org/hznanami/dotfiles.git
```

或：

```sh
git clone --branch dot-debian --single-branch https://github.com/hznanami/dotfiles.git
```

### 如果已经克隆完整仓库

如果你已经克隆了完整仓库，之后想切换到Debian分支：

```sh
git switch dot-debian
```

或：

```sh
git checkout dot-debian
```

### 应用配置

本仓库中的配置文件可以通过以下方式使用：

1. 创建符号链接到主目录
2. 使用GNU Stow管理
3. 手动复制到对应位置

### 手动安装

部分字体和二进制程序不在Debian 13软件仓库中，需要手动下载并安装。

详情请参阅：

`docs/manual-installation.md`

<br>

## 使用的软件

| 组件 | 软件 |
|------|------|
| 窗口管理器 | [labwc-0.8.4](https://github.com/labwc/labwc) |
| Shell | [bash](https://www.gnu.org/software/bash/bash.html) |
| 终端 | [foot](https://codeberg.org/dnkl/foot) |
| 面板 | [waybar](https://github.com/Alexays/Waybar) |
| 壁纸工具 | [swaybg](https://github.com/swaywm/swaybg) |
| 编辑器 | [neovim](https://github.com/neovim/neovim) |
| 文件管理器 | [lf](https://github.com/gokcehan/lf) |
| 浏览器 | [ungoogled-chromium](https://github.com/ungoogled-software/ungoogled-chromium) |
| 启动器 | [fuzzel](https://codeberg.org/dnkl/fuzzel) |
| 模糊查找 | [fzf](https://github.com/junegunn/fzf) |
| 通知 | [mako](https://github.com/emersion/mako) |
| 锁屏 | [swaylock](https://github.com/swaywm/swaylock) |
| 视频播放器 | [mpv](https://github.com/mpv-player/mpv) |
| 图片查看器 | [swayimg](https://github.com/artemsen/swayimg) |
| 屏幕录制 | [wf-recorder](https://github.com/ammen99/wf-recorder) |
| 权限提升工具 | [doas](https://github.com/Duncaen/OpenDoas) |
| Dotfiles管理器 | [stow](https://github.com/aspiers/stow) 与 [git](https://github.com/git/git) |

### 关于waybar
![waybar](./demo/gif/waybar-1.gif)

需要用到的软件包为：`waybar`、`fuzzel`，其中waybar版本要`0.14.0`以上，如果你的waybar版本低于此版本，
则不支持此配置的`ext/workspaces`，也就无法通过点击工作区按钮来切换工作区。

该waybar配置的右下角为快速显示桌面，`labwc`在**0.20.0**以上原生支持`ToggleShowDesktop`（切换显示桌面）功能，如果你的labwc为0.20.0以上就使用`wtype`工具（需要自行更改waybar配置取消备用注释），否则需要用到`wlrctl`，如果使用wlrctl只能使用显示桌面功能。

> [!NOTE]
> 以下操作需要root权限

#### **labwc < 0.20.0** 请使用以下命令：

Debian（最小化安装）:

```sh
apt install --no-install-recommends wlrctl
```

ArchLinux（或衍生版本）：

需要用到AUR，以paru为例
```sh
paru -S wlrctl
```

Gentoo用户需要自己手动拉取源码编译，因为overlays没有包

#### **labwc >= 0.20.0** 请使用以下命令：

Debian（最小化安装）:

```sh
apt install --no-install-recommends wtype
```

ArchLinux（或衍生版本）：

```sh
pacman -S --needed wtype
```

Gentoo：

```sh
emerge --ask --verbose gui-apps/wtype
```

另外可以自定义修改waybar配置来符合你的需求，比如fuzzel可以更换你喜爱的启动器、更换快捷启动的程序、更改图标等等。


### 关于壁纸切换
![switch-wallpaper](./demo/gif/switch-wallpaper-2.gif)

需要用到的文件：源码`home/.config/labwc/scripts/wpick.py`、快捷启动脚本`home/.local/bin/wpick`、
desktop文件（可选）`home/.local/share/applications/wpick.desktop`、图标文件（可选）`home/.local/share/icons/*`

另外该程序默认识别的壁纸路径为`$HOME/Pictures/wallpaper`（可自行通过修改`wpick.py`来更改路径）,且该程序只支持`swaybg`

该程序需要安装以下额外依赖：`pygobject`、`gtk3`、`swaybg`、`python3`（大部分已作为依赖安装，正常情况可以不用管）

**步骤一：**

> [!NOTE]
> 以下操作需要root权限

Debian（最小化安装）:

```sh
apt install --no-install-recommends python3-gi gir1.2-gtk-3.0 swaybg python3-minimal
```

ArchLinux（或衍生版本）：

```sh
pacman -S --needed python-gobject gtk3 swaybg python
```

Gentoo （python作为portage的必要依赖，不需要重新安装）：
```sh
emerge --ask --verbose dev-python/pygobject x11-libs/gtk+ gui-apps/swaybg
```

**步骤二：**

设定labwc的autostart为：

```sh
# Set wallpaper with wpick.
MODE_FILE="$HOME/.cache/labwc/wallpaper/mode"
if [ ! -f "$MODE_FILE" ]; then
   echo fill > "$MODE_FILE"
fi
MODE=$(cat "$MODE_FILE")
swaybg -i "$HOME/.cache/labwc/wallpaper/current" -m "$MODE" >/dev/null 2>&1 &
```

其中`current`为软链接文件，由壁纸切换程序根据选择的壁纸进行链接更改；当`mode`文件不存在时则会创建一个默认值为**fill**的文件，该文件里的值由壁纸软件通过手动切换背景模式来更改

**步骤三：**

将源码文件`wpick.py`、快捷启动脚本`wpick`、desktop文件`wpick.desktop`（可选）、图标文件（可选）放到指定位置：

你可以使用stow工具来管理这些文件，或者也可以使用以下命令

切换克隆下来的目录
```sh
cd dotfiles
```

复制wpick.py，注意此步骤需要确认PATH是否存在".local/bin"，如果没有请自行加上或者改用其他路径
```sh
mkdir -p ~/.config/labwc/scripts
cp home/.config/labwc/scripts/wpick.py ~/.config/labwc/scripts
```

复制启动脚本wpick
```sh
mkdir -p ~/.local/bin
cp home/.local/bin/wpick ~/.local/bin
```

复制desktop文件（可选）
```sh
mkdir -p ~/.local/share/applications
cp home/.local/share/applications/wpick.desktop ~/.local/share/applications
```

复制图标文件（可选）
```sh
cp -r home/.local/share/icons ~/.local/share
```

执行完以上步骤可在launcher或者命令行启动wpick程序
<br>

## 使用到的项目

[gnuunixchad](https://github.com/gnuunixchad/dotfiles) - 参考并使用了部分配置和脚本，并进行了自定义修改

