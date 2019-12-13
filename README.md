This repo serves as a simple Unix environment setup. Tested on Linux and OS X.



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
