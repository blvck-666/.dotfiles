#!/bin/bash

########################
# Checking for Root user
########################

if [[ $(id -u) -ne 0 ]]
then 
	echo "Please run the script from root user or sudo privilages"
	exit
fi

#############################
# Update and Upgrade packages
#############################

#sudo apt-get update && sudo apt-get upgrade

##############################
# Install Nala package manager
##############################

if [[ "$(which nala)" = "" ]]
then
	sudo apt-get install nala -y
else
	echo "##################################################"
	echo "Package already installed. Skip to next process..."
	echo "##################################################"
fi

########################
# Fetching Nala mirrors.
########################

sudo nala fetch

######################
# Convert APT to Nala.
######################

echo "apt() {
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}" >> ~/.bashrc >> /root/.bashrc 


#######################
# Remove Snap packages.
#######################

LANG=C snap list --all | awk '{print $1}' |
while read snapname; do
	sudo snap remove --purge "$snapname"
done
sudo rm -rf /var/cache/snapd/
sudo apt remove --autoremove snapd
rm -fr ~/snap
touch /etc/apt/preferences.d/nosnap.pref
echo "Package: snapd" >> /etc/apt/preferences.d/nosnap.pref
echo "Pin: release a=*" >> /etc/apt/preferences.d/nosnap.pref
echo "Pin-Priority: -10 >> /etc/apt/preferences.d/nosnap.pref
sudo apt update 
sudo apt install --install-suggests gnome-software

###################
# Install Packages.
###################
sudo nala install build-essential -y
sudo nala install ubuntu-restricted-extras -y
sudo nala install gnome-shell-extension-manager -y 
sudo nala remove irqbalance -y
sudo nala install zsh
# Brave browser installation
sudo nala install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y

#########################
# Fetching Configuration.
#########################

if [[ ! -e $HOME/.config/zsh ]]
then
	mkdir $HOME/.config/zsh
fi

if [[ ! -e $HOME/.themes ]]
then 
	mkdir $HOME/.themes
fi

cd $HOME/.dotfiles/
git submodule update 

exit
