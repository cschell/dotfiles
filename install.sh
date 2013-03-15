#!/bin/sh

ln -fs `pwd`/zshrc ~/.zshrc
ln -fs `pwd`/oh-my-zsh ~/.oh-my-zsh
ln -fs `pwd`/vimrc ~/.vimrc
ln -fs `pwd`/vim ~/.vim

vim +BundleInstall +qa