#!/bin/sh

set -e

command -V git
command -V vim
command -V zsh

cp ~/.ownconfigs/skel/{.vimrc,.zshrc} ~

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleUpdate +qa

ln -sv ~/.ownconfigs/gitconfig ~/.gitconfig
ln -sv ~/.ownconfigs/gitignore ~/.gitignore
ln -sv ~/.ownconfigs/screenrc ~/.screenrc

function linux_specific {
  command -V dircolors

  ln -sv ~/.ownconfigs/xinitrc ~/.xinitrc
  ln -sv ~/.ownconfigs/Xdefaults ~/.Xdefaults
  mkdir ~/.i3
  ln -sv ~/.ownconfigs/i3config ~/.i3/config
  ln -sv ~/.ownconfigs/i3status.conf ~/.i3status.conf

  echo 'eval $(dircolors -b ~/.ownconfigs/ls_color_db)' >> ~/.zshrc
  echo 'alias ls=" ls --color=auto"' >> ~/.zshrc
}

uname | grep -qsi linux && linux_specific

