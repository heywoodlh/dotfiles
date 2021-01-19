#!/usr/bin/env bash

if ! command -v peru
then
	if command -v pip3
	then
		pip3 install --user peru
	else
		echo 'Please install python3-pip! Exiting.'
		exit 1
	fi
fi

workingDir=$(pwd)
cd ~/.dotfiles &&\
	python3 -m peru sync

cd $workingDir

dir=~/.dotfiles
olddir=~/.dotfiles.old

# List of files/folders to move to homedir
files="vim gitconfig xinitrc tmux.conf nix vimrc screenrc choose-scripts"

# Create .dotfiles_old in homedir
mkdir -p $olddir

# Custom command for config dir

if [[ -d ~/.config ]]
then
	mv ~/.config ~/.config.old
fi

ln -s $dir/config ~/.config

# Custom command for bin dir

if [[ -d ~/.local/bin ]]
then
	mv ~/.local/bin ~/.local/bin.old
fi

ln -s $dir/bin ~/.local/bin

# Move any existing dotfiles to dotfiles_old directory, and create symlinks
# from the homedir to any files in the ~/dotfiles
for file in $files; do
	if [[ -f ~/.$file ]]
	then
        	mv ~/.$file $olddir
	fi
	ln -s $dir/$file ~/.$file
done

mkdir -p ~/.local/bin/ && ln -s $dir/scripts/ ~/.local/bin/scripts
