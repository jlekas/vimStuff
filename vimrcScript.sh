#!/bin/sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/
vim +PluginInstall +qall

//for ubuntu
sudo apt-get install cowsay
cowsay -f dragon-and-cow Roar "I'm a dragon"
cowthink "Hi"
telnet towel.blinkenlights.nl

