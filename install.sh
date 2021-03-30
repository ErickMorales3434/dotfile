#!/bin/bash

echo 'Instalacion de BSPWM'
function InstallYay(){
	sudo pacman -S git
	git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si PKGBUILD && cd 
}
function instalador(){
	echo 'actualizando base de datos'
	sudo pacman -Syu
	sleep 2
	echo 'Instalando bspwm'
	sleep 2
	sudo pacman -S bspwm sxhkd alacritty rofi python-pip feh brightnessctl alsa-utils playerctl
}
function polybar_clearine(){
	yay -S polybar-git 
	yay -S clearine-git

}

function menu_installer(){
	#instalador 
	#polybar_clearine
	#configurationWorkpaces
	editBash
}

function configurationWorkpaces(){
	echo 'copiando archivos'
	sleep 3
	mkdir $HOME/.config
	cp -rv config/bspwm $HOME/.config
	cp -rv config/sxhkd $HOME/.config
	cp -rv config/alacritty $HOME/.config
	cp -rv config/clearine $HOME/.config
	cp -rv config/nvim $HOME/.config
	cp -rv config/picom $HOME/.config
	cp -rv config/polybar $HOME/.config
	cp -rv config/rofi $HOME/.config
}
function installFonts(){
	echo 'Instalando fuentes'
	sleep 2
}

function editBash(){
	touch $HOME/.xinitrc
	echo 'sxhkd &' >> $HOME/.xinitrc
	echo 'exec bspwm' >> $HOME/.xinitrc
}
menu_installer
bspc wm -r


