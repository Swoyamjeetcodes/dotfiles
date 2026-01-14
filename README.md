## 🧩 Dotfiles Backup (Git Bare Repo + SSH)

### 📦 Create bare repo

```bash
git init --bare ~/.dotfiles
```
### 🔧 Create alias
```bash
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
```
Persist it:
```bash
echo 'alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> ~/.zshrc
source ~/.zshrc
```
###  Hide untracked files
```bash
dot config --local status.showUntrackedFiles no
```
### ➕ Track dotfiles
```bash
dot add ~/.zshrc
dot add ~/.gitconfig
dot add ~/.config/kitty
dot add ~/.config/nvim
dot commit -m "Track dotfiles"
```
### 🌍 Add SSH remote & push
```bash
dot remote add origin git@github.com:Swoyamjeetcodes/dotfiles.git
dot branch -M main
dot push -u origin main
```
### 🔁 Daily usage
```bash
dot status
dot add ~/.zshrc ~/.config/kitty
dot commit -m "Update configs"
dot push
```
### 🔄 Restore on fresh system
```bash
git clone --bare git@github.com:Swoyamjeetcodes/dotfiles.git ~/.dotfiles
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dot checkout
dot config --local status.showUntrackedFiles no
```
✔ No symlinks
✔ Clean `$HOME`
✔ SSH-based
✔ Easy restore
