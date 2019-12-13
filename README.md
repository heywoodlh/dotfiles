Simple Unix environment setup via .dotfiles. Tested on Linux and MacOS.



#### Generic Installation:


Installation Prerequisites:

- Git installed.
- Python 3 version of Peru installed (`sudo pip3 install peru`).

#### Installation:

```bash
sudo pip3 instal peru

git clone https://github.com/heywoodlh/.dotfiles "$HOME"/.dotfiles &&\
	cd ~/.dotfiles

peru sync
./.makesym.sh

cd scripts
./install.sh
```

After going through all these steps, log out and then log back in.
