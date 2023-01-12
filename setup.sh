#!/usr/bin/env zsh

cat << 'EOF'
 ____   ___ _____ _____ ___ _     _____ ____
|  _ \ / _ \_   _|  ___|_ _| |   | ____/ ___|
| | | | | | || | | |_   | || |   |  _| \___ \
| |_| | |_| || | |  _|  | || |___| |___ ___) |
|____/ \___/ |_| |_|   |___|_____|_____|____/

EOF

title() {
    echo -e "=> \033[33m$@\033[m"
}

info() {
    echo -e "==> \033[32m$@\033[m"
}

title "Defult Settings"
info "defaults write -g InitialKeyRepeat -int 15"
defaults write -g InitialKeyRepeat -int 15
info "defaults write -g KeyRepeat -int 1"
defaults write -g KeyRepeat -int 1

title "Install Homebrew Packages"
rm -f $HOME/.Brewfile
Ln -s $(pwd)/.Brewfile $HOME/.Brewfile
if ! (type brew > /dev/null 2>&1); then
    info "Install xcode-select"
    xcode-select --install
    info "Install Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

info "Install packages"
brew bundle --global

info "Clean up"
brew cleanup

title "Neovim Setting"
info "Install vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

title "Link dotfiles"

for dotfile in $(ls -A | grep -e "^\..*" | egrep -v "\.git$|\.gitignore$|\.config$")
do
  info $dotfile
  rm -f $HOME/$dotfile
  Ln -s $(pwd)/$dotfile $HOME/$dotfile
done

mkdir -p $HOME/.config
for config in $(ls -A .config)
do
  info .config/$config
  rm -rf $HOME/.config/$config
  Ln -s $(pwd)/.config/$config $HOME/.config/$config
done
