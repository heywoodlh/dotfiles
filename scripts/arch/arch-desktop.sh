#!/usr/bin/env bash

# Update Cached sudo credentials
echo "Updating cached sudo credentials"
sudo -v

sudo cp ~/.dotfiles/scripts/bin/* /usr/bin/

echo "Installing trizen"
./install-trizen

if command -v trizen 
then
	echo "Installing updates"
	trizen -Syu
	echo "Installing from pkgs file"
	while read PACKAGE
	do
        	trizen -S "$PACKAGE" --noconfirm
	done<pkgs
fi	


#Usual Desktop folders
mkdir -p ~/Documents ~/Downloads ~/Pictures ~/Desktop ~/git ~/Games ~/Iso

#Wallpaper
cp ~/.dotfiles/wallpapers/active-background.jpg ~/Pictures/active-background.jpg

#Screensaver stuff
sudo cp ~/.dotfiles/systemd/user/suspend@.service /etc/systemd/system/
sudo systemctl enable suspend@"$USER".service

#Install desktop environment (gnome)

echo "Installing from desktop pkgs file"
while read PACKAGE
do
	trizen -S "$PACKAGE" --noconfirm
done<arch-desktop-pkgs

#Enable display manager
sudo systemctl enable gdm.service

#Enable sxhkd
mkdir -p ~/.config/systemd/user/
cp ~/.dotfiles/systemd/sxhkd.service ~/.config/systemd/user/
systemctl --user enable sxhkd.service
systemctl --user start sxhkd.service

#Change shell to fish
clear
chsh -s /usr/bin/fish
if [[ -f arch-fish-config.txt ]]
then
	cp arch-fish-config.txt ~/.config/fish/config.fish
fi

#Install virtualfish
sudo pip3 install virtualfish

#Enable docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER

#Install open-vm-tools
clear
echo 'Install open-vm-tools? (y/n)'
read RESPONSE
case "$RESPONSE" in
    [yY] | [yY][eE][sS]) sudo pacman -S open-vm-tools xf86-video-vmware --noconfirm && sudo systemctl enable vmtoolsd.service && sudo systemctl start vmtoolsd.service;;
esac
