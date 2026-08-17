# Cyan Rice Niri Dotfiles

> Personal dotfiles for **Niri** (Wayland compositor) on Arch Linux. Cyan theme, minimal, clean.

## Screenshots

<details>
<summary>Interface & Menus</summary>
<br>
<img src="preview/interface.png" width="800">
<img src="preview/menu-apps-wofi.png" width="800">
<img src="preview/waybar.png" width="800">
<img src="preview/powermenu.png" width="800">
<img src="preview/emoji-picker.png" width="800">
<img src="preview/wp-select.png" width="800">
</details>

<details>
<summary>TUI & Apps</summary>
<br>
<img src="preview/tui.png" width="800">
<img src="preview/dunst.png" width="800">
<img src="preview/htop.png" width="800">
<img src="preview/yazi.png" width="800">
</details>

## Stack

| Domain | App |
|--------|-----|
| Window Manager | Niri |
| Shell | Fish + Starship |
| Terminal | Kitty |
| Launcher | Fuzzel |
| Status Bar | Waybar |
| Editor | Neovim (LazyVim) |
| Notifications | Dunst |
| File Manager | Yazi |
| Lock Screen | Swaylock |

## Directory Structure

```
.config/
├── alacritty/        # Terminal emulator
├── btop/             # System monitor
├── cava/             # Audio visualizer
├── dunst/            # Notifications
├── fastfetch/        # System fetch
├── fish/             # Shell config (conf.d/, functions/)
├── glow/             # Markdown reader
├── gtk-3.0/          # GTK3 theme / settings.ini
├── gtk-4.0/          # GTK4 theme
├── htop/             # System monitor
├── imv/              # Image viewer
├── kew/              # Music player
├── kitty/            # Terminal
├── lsd/              # LS colors
├── niri/             # WM config (modules/)
├── shell/            # Shared POSIX aliases/functions/env (SoT)
├── swaylock/         # Lock screen
├── waybar/           # Status bar
├── fuzzel/             # App launcher, powermenu, emoji picker
└── yazi/             # File manager
```

## Install

`install.sh` installs packages with paru. It reads two lists:

- `pkglist-official.txt`
- `pkglist-aur.txt`

Then it runs every script in `setup/`. Note: `restore.sh` is interactive.

### Post-install: Yazi plugins

```bash
# GVFS plugin for MTP/SMB/SFTP (optional)
git clone https://github.com/SGau89/gvfs.yazi ~/.config/yazi/plugins/gvfs.yazi
```

## Cheatsheet

`shell/gen-cheatsheet.sh` makes `CHEATSHEET.md`. It lists all aliases and abbreviations for each shell (POSIX `aliases.sh`, fish `aliases.fish`, fish `abbr.fish`). Run it from `~/.config/shell/` (fish abbr: `cheatgen`). The file is auto-generated and gitignored. Do not edit it by hand.

## Keybinds

| Key | Action |
|-----|--------|
| Mod + Return | Open terminal (kitty) |
| Mod + Shift + B | Open browser (firefox) |
| Mod + B | Select wallpaper |
| Mod + D | App launcher (fuzzel) |
| Mod + N | Open Neovim (kitty) |
| Mod + P | Powermenu (fuzzel) |
| Mod + Shift + N | Notification center (fuzzel) |
| Mod + Shift + W | Random wallpaper |
| Super + E | Emoji picker (fuzzel) |
| Mod + Shift + L | Lock screen (swaylock) |
| Mod + Shift + Slash | Show hotkey overlay |
| Mod + Q | Close window |
| Mod + O | Toggle overview |
| Mod + F | Maximize column |
| Mod + Shift + F | Fullscreen window |
| Mod + M | Maximize window to edges |
| Mod + Ctrl + F | Expand column to available width |
| Mod + C | Center column |
| Mod + Ctrl + C | Center visible columns |
| Mod + V | Toggle floating window |
| Mod + Shift + V | Focus floating ↔ tiling |
| Mod + W | Toggle tabbed column |
| Mod + R / Mod + Shift + R | Cycle column width presets |
| Mod + Ctrl + R | Reset window height |
| Mod + Ctrl + Shift + R | Cycle window height presets |
| Mod + Left/Right or H/L | Focus column |
| Mod + Up/Down or J/K | Focus window |
| Mod + Ctrl + arrows | Move window in column |
| Mod + Home / End | Focus first/last column |
| Mod + Ctrl + Home / End | Move column to first/last |
| Mod + Shift + arrows | Focus monitor |
| Mod + Shift + Ctrl + arrows | Move column to monitor |
| Mod + PageUp/Down or U/I | Focus workspace |
| Mod + Ctrl + PageUp/Down | Move column to workspace |
| Mod + Shift + PageUp/Down | Move workspace |
| Mod + WheelScroll | Focus workspace |
| Mod + Ctrl + WheelScroll | Move column to workspace |
| Mod + Shift + WheelScroll | Focus/move column |
| Mod + 1-9 | Switch workspace |
| Mod + Shift + 1-9 | Move column to workspace |
| Mod + Comma | Consume window into column |
| Mod + Period | Expel window from column |
| Mod + BracketLeft/Right | Consume/expel column |
| Mod + Minus / Equal | Column width -/+ 10% |
| Mod + Shift + Minus / Equal | Window height -/+ 10% |
| Mod + Escape | Toggle shortcuts inhibitor |
| Print / Ctrl + Print / Alt + Print | Screenshot (all / screen / window) |
| Mod + Shift + Period or Ctrl+Alt+Del | Quit niri |
| Mod + Shift + P | Power off monitors |
| XF86Audio\* | Volume up/down, mute |
| XF86MonBrightness\* | Brightness up/down |

## Credits

Based on [aadnanmt/hyprland-dotfiles](https://github.com/aadnanmt/hyprland-dotfiles) — refactored from Hyprland to Niri WM.

- **[elifouts (Dotfiles)](https://github.com/elifouts/Dotfiles):** Original menu configs.
- **[dln (wofi-emoji)](https://github.com/dln/wofi-emoji):** Emoji selector.
- **[victordantasdev/waybar](https://github.com/victordantasdev/waybar):** Waybar base config.
- **[LazyVim](https://www.lazyvim.org/):** Neovim framework.
- **[Niri](https://github.com/YaLTeR/niri):** Wayland compositor.
- **Arch Linux:** Foundation.

## License

GPL-3.0
