#!/bin/bash

function linker(){
	~/.dotfiles/linker.sh -t "$1" -l "$2" -d "$3"
}
linker soft ~/.dotfiles/wallpapers ~/Pictures/wallpapers
linker soft ~/.dotfiles/nitrogen ~/.config/nitrogen
linker soft ~/.dotfiles/.gitconfig ~/.gitconfig
linker soft ~/.dotfiles/.tmux.conf ~/.tmux.conf
linker soft ~/.dotfiles/autostart ~/.config/autostart
linker soft ~/.dotfiles/nvim ~/.config/nvim
linker soft ~/.dotfiles/fonts ~/.local/share/fonts
