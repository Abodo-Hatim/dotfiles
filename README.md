# dotfiles 🚀

> A complete development environment for 1337 school — Neovim + ZSH + Oh My Zsh

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

## Table of Contents

- [Windows Setup (WSL)](#windows-setup-wsl)
- [Mac Setup (1337 school)](#mac-setup-1337-school)
- [File Structure](#file-structure)
- [Neovim Plugins](#neovim-plugins)
- [ZSH Plugins](#zsh-plugins)
- [Key Mappings](#key-mappings)
- [Update Dotfiles](#update-dotfiles)

---

## Windows Setup (WSL)

### 1. Install WSL 2


```powershell
wsl --install
```

---

### 2. Update the system

```bash
sudo apt update && sudo apt upgrade -y
```

---

### 3. Install essential development tools

```bash
sudo apt install -y build-essential gcc gdb make git curl wget
```

| Tool | Version | Role |
|------|---------|------|
| `gcc` | 13.3.0 | C compiler |
| `gdb` | 15.1 | Debugger |
| `make` | 4.3 | Build automation |
| `git` | 2.43.0 | Version control |

---

### 4. Install Neovim 0.12.0

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

---

### 5. Create Neovim config structure - (Optional)

```bash
mkdir -p ~/.config/nvim/lua/plugins
touch ~/.config/nvim/init.lua
touch ~/.config/nvim/lua/options.lua
touch ~/.config/nvim/lua/keymaps.lua
```

---

### 6. Install lazy.nvim

```bash
git clone --filter=blob:none --branch=stable \
  https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim
```

---

### 7. Apply dotfiles

```bash
# Clone the repo
git clone git@github.com:Abodo-Hatim/dotfiles.git ~/dotfiles

# Copy Neovim config
cp -r ~/dotfiles/nvim ~/.config/nvim

# Copy ZSH config
cp ~/dotfiles/.zshrc ~/.zshrc
```

---

### 8. Open Neovim and install plugins

```bash
nvim
```

lazy.nvim will automatically install all plugins on first launch.

Then install treesitter parsers inside Neovim:

```
:TSInstall c lua vim bash
```

---

### 9. Install ripgrep (required for telescope live grep)

```bash
sudo apt install -y ripgrep
```

---

### 10. Install Nerd Font

- Download **JetBrainsMono Nerd Font** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads)
- Extract and install all `.ttf` files (right click → Install for all users)
- Open your terminal settings and set the font to `JetBrainsMono Nerd Font`

---

### 11. Install ZSH + Oh My Zsh

```bash
# Install ZSH
sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

When asked: `Do you want to change your default shell to zsh? [Y/n]` → type `Y`

---

### 12. Install ZSH plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Enable plugins in `~/.zshrc`:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

---

### 14. Setup SSH key and connect to GitHub

```bash
# Configure git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Generate SSH key
ssh-keygen -t ed25519 -C "your@email.com"

# Copy public key
cat ~/.ssh/id_ed25519.pub
```

Add the public key to [github.com/settings/keys](https://github.com/settings/keys)

Verify connection:

```bash
ssh -T git@github.com
```

---

## Mac Setup

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

### 2. Install essential tools

```bash
brew install gcc gdb make git curl wget ripgrep node
```

---

### 3. Install Neovim

```bash
brew install neovim

# Verify
nvim --version | head -1
```

---

### 4. Install lazy.nvim

```bash
git clone --filter=blob:none --branch=stable \
  https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim
```

---

### 5. Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

### 6. Install ZSH plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Enable plugins in `~/.zshrc`:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

---

### 7. Apply dotfiles via HTTPS

```bash
# Clone the repo using HTTPS (no SSH key needed)
git clone https://github.com/Abodo-Hatim/dotfiles.git ~/dotfiles

# Copy Neovim config
cp -r ~/dotfiles/nvim ~/.config/nvim

# Copy ZSH config
cp ~/dotfiles/.zshrc ~/.zshrc

# Apply ZSH config
source ~/.zshrc
```

---

### 8. Open Neovim and install plugins

```bash
nvim
```

Then install treesitter parsers:

```
:TSInstall c lua vim bash
```

---

### 9. Install Nerd Font on Mac

- Download **JetBrainsMono Nerd Font** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads)
- Double click each `.ttf` file → Install Font
- Set the font in your terminal preferences

---

## File Structure

```
dotfiles/
├── .zshrc                      ← ZSH config
└── nvim/
    ├── init.lua                ← Entry point
    └── lua/
        ├── options.lua         ← Editor settings
        ├── keymaps.lua         ← Key mappings
        └── plugins/
            ├── colorscheme.lua ← tokyonight theme
            ├── lualine.lua     ← Status line
            ├── nvim-tree.lua   ← File explorer
            ├── telescope.lua   ← Fuzzy finder
            ├── autopairs.lua   ← Auto close brackets
            ├── comment.lua     ← Easy commenting
            └── treesitter.lua  ← Syntax highlighting
```

---

## Neovim Plugins

| Plugin | Role |
|--------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Color theme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto close brackets |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Easy commenting |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |

---

## ZSH Plugins

| Plugin | Role |
|--------|------|
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Suggests commands from history |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Highlights commands (green/red) |

**Theme:** `fino-time`

---

## Key Mappings

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

## Update Dotfiles

```bash
cd ~/dotfiles
cp -r ~/.config/nvim .
cp ~/.zshrc .
git add .
git commit -m "update: description of changes"
git push
```

---

*made with ❤️*

