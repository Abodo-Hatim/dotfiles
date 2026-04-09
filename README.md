# dotfiles 🚀

> بيئة تطوير كاملة — Neovim + ZSH + Oh My Zsh

---

## المتطلبات

| الأداة | الإصدار |
|--------|---------|
| Neovim | 0.12.0+ |
| ZSH | 5.9+ |
| git | 2.43.0+ |
| gcc | 13.3.0+ |

---

## التثبيت من الصفر

### 1. تثبيت الأدوات الأساسية

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential gcc gdb make git curl wget ripgrep nodejs npm
```

### 2. تثبيت Neovim 0.12.0

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar -xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
```

> **على Mac:** `brew install neovim`

### 3. تثبيت ZSH + Oh My Zsh

```bash
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 4. تثبيت plugins ZSH

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 5. تثبيت lazy.nvim

```bash
git clone --filter=blob:none --branch=stable \
  https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim
```

### 6. تحميل dotfiles وتطبيقها

```bash
git clone git@github.com:Abodo-Hatim/dotfiles.git ~/dotfiles
cp -r ~/dotfiles/nvim ~/.config/nvim
cp ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

### 7. فتح Neovim وتثبيت الـ plugins

```bash
nvim
```

ثم داخل Neovim:
```
:TSInstall c lua vim bash
```

---

## هيكل الملفات

```
dotfiles/
├── .zshrc
└── nvim/
    ├── init.lua
    └── lua/
        ├── options.lua
        ├── keymaps.lua
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

| Plugin | الدور |
|--------|-------|
| lazy.nvim | مدير الـ plugins |
| tokyonight.nvim | ثيم الألوان |
| lualine.nvim | شريط الحالة |
| nvim-tree.lua | مستعرض الملفات |
| telescope.nvim | بحث سريع |
| nvim-autopairs | إغلاق الأقواس |
| Comment.nvim | تعليق الكود |
| nvim-treesitter | تلوين الكود |

---

## ZSH Plugins

| Plugin | الدور |
|--------|-------|
| zsh-autosuggestions | اقتراح الأوامر |
| zsh-syntax-highlighting | تلوين الأوامر |

**الثيم:** `fino-time`

---

## الاختصارات — Leader key = Space

| الاختصار | الوظيفة |
|----------|---------|
| `Space + w` | حفظ الملف |
| `Space + q` | إغلاق |
| `Ctrl + e` | مستعرض الملفات |
| `Space + ff` | بحث عن ملف |
| `Space + fg` | بحث داخل الملفات |
| `Space + fr` | آخر الملفات |
| `gcc` | تعليق السطر |
| `Ctrl + h/j/k/l` | التنقل بين النوافذ |

---

## تحديث الـ dotfiles

```bash
cd ~/dotfiles
cp -r ~/.config/nvim .
cp ~/.zshrc .
git add .
git commit -m "update: وصف التغيير"
git push
```

---

## على Mac في 1337

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim git ripgrep node
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --filter=blob:none --branch=stable \
  https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim
git clone git@github.com:Abodo-Hatim/dotfiles.git ~/dotfiles
cp -r ~/dotfiles/nvim ~/.config/nvim
cp ~/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

---

*made with ❤️ for 1337 school*      
