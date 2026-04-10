# dotfiles 🚀

> A complete development environment — Neovim + ZSH + Oh My Zsh

---

## Requirements

| Tool | Version |
|------|---------|
| Neovim | 0.12.0+ |
| ZSH | 5.9+ |
| git | 2.43.0+ |
| gcc | 13.3.0+ |
| Node.js | 18+ |

---

## Installation from scratch

### 1. Install essential tools

```bash
wsl --install
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential gcc gdb make git curl wget ripgrep nodejs npm
```

---

### 2. Install Neovim 0.12.0

```bash
# Download
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Extract
tar -xzf nvim-linux-x86_64.tar.gz

# Move to correct location
sudo mv nvim-linux-x86_64 /opt/nvim

# Create symlink
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim

# Verify
nvim --version | head -1
```

> **On Mac:**
> ```bash
> brew install neovim
> ```

---

### 3. Install ZSH + Oh My Zsh

```bash
# Install zsh
sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

> **On Mac:** zsh is pre-installed — install Oh My Zsh directly

---

### 4. Install ZSH plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

---

### 5. Install lazy.nvim

```bash
git clone --filter=blob:none --branch=stable \
  https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim
```

---

### 6. Clone dotfiles and apply

```bash
# Clone the repo
git clone git@github.com:Abodo-Hatim/dotfiles.git ~/dotfiles

# Copy Neovim config
cp -r ~/dotfiles/nvim ~/.config/nvim

# Copy ZSH config
cp ~/dotfiles/.zshrc ~/.zshrc

# Apply ZSH config
source ~/.zshrc
```

---

### 7. Install Nerd Font

- Download **JetBrainsMono Nerd Font** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads)
- Install it and set it as your terminal font
- Required for icons to display correctly in Neovim

---

### 8. Open Neovim and install plugins

```bash
nvim
```

lazy.nvim will automatically install all plugins on first launch.

Then install treesitter parsers:

```
:TSInstall c lua vim bash
```

---

## File structure

```
dotfiles/
├── .zshrc                  ← ZSH config
└── nvim/
    ├── init.lua            ← Entry point
    └── lua/
        ├── options.lua     ← Editor settings
        ├── keymaps.lua     ← Key mappings
        └── plugins/
            ├── colorscheme.lua
            ├── lualine.lua
            ├── nvim-tree.lua
            ├── telescope.lua
            ├── autopairs.lua
            ├── comment.lua
            └── treesitter.lua
```

---

## Neovim Plugins

| Plugin | Version | Role |
|--------|---------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | stable | Plugin manager |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | latest | Color theme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | latest | Status line |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | latest | File explorer |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | latest | Fuzzy finder |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | latest | Auto close brackets |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | latest | Easy commenting |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | latest | Syntax highlighting |

---

## ZSH Plugins

| Plugin | Role |
|--------|------|
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Suggests commands from history |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Highlights commands (green/red) |

**Theme:** `fino-time`

---

## Key mappings

### Neovim — Leader key = `Space`

| Shortcut | Action |
|----------|--------|
| `Space + w` | Save file |
| `Space + q` | Quit |
| `Ctrl + e` | Toggle file explorer |
| `Space + ff` | Find file |
| `Space + fg` | Live grep |
| `Space + fr` | Recent files |
| `gcc` | Toggle line comment |
| `gc` | Toggle comment (Visual mode) |
| `Ctrl + h/j/k/l` | Navigate between windows |

### ZSH

| Key | Action |
|-----|--------|
| `←` | Accept full suggestion |
| `Ctrl + f` | Accept full suggestion |
| `Tab` | Auto complete |
| `↑ / ↓` | Navigate command history |

---

## Update dotfiles

```bash
cd ~/dotfiles
cp -r ~/.config/nvim .
cp ~/.zshrc .
git add .
git commit -m "update: description of changes"
git push
```

---

## Setup on Mac (1337 school)

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install tools
brew install neovim git ripgrep node

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ZSH plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install lazy.nvim
git clone --filter=blob:none --branch=stable \
  https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim

# Clone and apply dotfiles
git clone git@github.com:Abodo-Hatim/dotfiles.git ~/dotfiles
cp -r ~/dotfiles/nvim ~/.config/nvim
cp ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

---

*made with ❤️ for 1337 school*
