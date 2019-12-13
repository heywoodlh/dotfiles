#!/usr/bin/env bash

dir=~/.dotfiles
olddir=~/.dotfiles_old

# List of files/folders to symlink in homedir
files="bashrc bash_profile vim dircolors gitconfig Xresources xinitrc tmux.conf dircolors bw-scripts do-scripts nix"

# Create .dotfiles_old in homedir
mkdir -p $olddir

# Custom command for config dir

if [[ -d ~/.config ]]
then
	mv ~/.config ~/.config.old
fi

ln -s $dir/config ~/.config

# Move any existing dotfiles to dotfiles_old directory, and create symlinks
# from the homedir to any files in the ~/dotfiles
for file in $files; do
    if [[ -f ~/.$file ]]
    then
        mv ~/.$file $olddir
    fi
    ln -sf $dir/$file ~/.$file
done

mkdir -p "$HOME"/Pictures &&\
       	ln -s "$HOME"/.dotfiles/wallpapers "$HOME"/Pictures/wallpapers
