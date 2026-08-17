# dotfiles

[English](README.md) - [简体中文 (zh-CN)](README-zh-CN.md)

我的Debian 13桌面環境設定檔。

> [!NOTE]
> 截圖與示範影片將會在之後補上。

<br>

## 使用方式

> [!NOTE]
> 此分支僅包含**Debian 13 + labwc**的設定。如果你只想使用Debian版本的dotfiles，建議直接複製`dot-debian`分支。

### 僅複製Debian分支

從Codeberg複製

```sh
git clone --branch dot-debian --single-branch --recurse-submodules https://codeberg.org/hznanami/dotfiles.git
```

或從GitHub複製

```sh
git clone --branch dot-debian --single-branch --recurse-submodules https://github.com/hznanami/dotfiles.git
```

如果不需要子模組，可以移除 `--recurse-submodules`：

```sh
git clone --branch dot-debian --single-branch https://codeberg.org/hznanami/dotfiles.git
```

或：

```sh
git clone --branch dot-debian --single-branch https://github.com/hznanami/dotfiles.git
```

### 如果已經複製完整儲存庫

如果你已經複製了完整的儲存庫，之後想切換到Debian分支：

```sh
git switch dot-debian
```

或：

```sh
git checkout dot-debian
```

### 套用設定

此儲存庫中的設定檔可以透過以下方式使用：

1. 建立符號連結到你的家目錄
2. 使用GNU Stow管理
3. 手動複製到對應位置

### 手動安裝

有些字型與二進位檔不在Debian13的套件庫中，需要手動下載與安裝。

請參考：

`docs/manual-installation.md`

<br>

## 使用的軟體

| 元件 | 軟體 |
|------|------|
| 視窗管理器 | [labwc-0.8.4](https://github.com/labwc/labwc) |
| Shell | [bash](https://www.gnu.org/software/bash/bash.html) |
| 終端機 | [foot](https://codeberg.org/dnkl/foot) |
| 面板 | [waybar](https://github.com/Alexays/Waybar) |
| 桌布工具 | [swaybg](https://github.com/swaywm/swaybg) |
| 編輯器 | [neovim](https://github.com/neovim/neovim) |
| 檔案管理器 | [lf](https://github.com/gokcehan/lf) |
| 瀏覽器 | [ungoogled-chromium](https://github.com/ungoogled-software/ungoogled-chromium) |
| 啟動器 | [fuzzel](https://codeberg.org/dnkl/fuzzel) |
| 模糊搜尋 | [fzf](https://github.com/junegunn/fzf) |
| 通知 | [mako](https://github.com/emersion/mako) |
| 鎖定畫面 | [swaylock](https://github.com/swaywm/swaylock) |
| 影片播放器 | [mpv](https://github.com/mpv-player/mpv) |
| 圖片檢視器 | [swayimg](https://github.com/artemsen/swayimg) |
| 螢幕錄製 | [wf-recorder](https://github.com/ammen99/wf-recorder) |
| 權限提升工具 | [doas](https://github.com/Duncaen/OpenDoas) |
| Dotfiles 管理器 | [stow](https://github.com/aspiers/stow) 與 [git](https://github.com/git/git) |

<br>

## 使用到的項目

[gnuunixchad](https://github.com/gnuunixchad/dotfiles) - 參考並使用了部分配置和腳本，並進行了自訂修改

