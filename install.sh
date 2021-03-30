#!/bin/bash

function ascii(){
	echo '██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗'
	echo '██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║'
	echo '██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║'
	echo '██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║'
	echo '██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║'
	echo '╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝'
	echo '												'
}
function asciiFinish(){
	echo '███████╗██╗███╗   ██╗██╗███████╗██╗  ██╗'
	echo '██╔════╝██║████╗  ██║██║██╔════╝██║  ██║'
	echo '█████╗  ██║██╔██╗ ██║██║███████╗███████║'
	echo '██╔══╝  ██║██║╚██╗██║██║╚════██║██╔══██║'
	echo '██║     ██║██║ ╚████║██║███████║██║  ██║'
	echo '╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝'
	echo '					'
}
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
	sudo pacman -S bspwm sxhkd alacritty rofi python-pip feh brightnessctl alsa-utils playerctl scrot firefox telegram-desktop obs-studio neovim
}
function polybar_clearine(){
	yay -S polybar-git 
	yay -S clearine-git
	yay -S visual-studio-code-bin
}
function configurationWorkpaces(){
	echo 'copiando archivos'
	sleep 2
	mkdir $HOME/.config
	cp -rv config/bspwm $HOME/.config
	cp -rv config/sxhkd $HOME/.config
	cp -rv config/alacritty $HOME/.config
	cp -rv config/clearine $HOME/.config
	cp -rv config/nvim $HOME/.config
	cp -rv config/picom $HOME/.config
	cp -rv config/polybar $HOME/.config
	cp -rv config/rofi $HOME/.config
	cp -rv config/wal $HOME/.wal
}
function installFonts(){
	echo 'Instalando fuentes'
	sleep 2
}

function editXinitBash(){
	touch $HOME/.xinitrc
	echo 'sxhkd &' >> $HOME/.xinitrc
	echo 'exec bspwm' >> $HOME/.xinitrc
	echo 'alias v=nvim' >> $HOME/.bashrc
	echo 'alias sv='sudo nvim'' >> $HOME/.bashrc
}

function menu_installer(){
	echo 'Ingrese el numero de su distribucion actual'
	read input_distro
	if [ "$input_distro" = "1" ]; then
		echo 'distro arch'
	elif [ "$input_distro" = "2" ]; then
		echo 'distro debian'

	else
		echo 'opcion erronea, vuelve a intentarlo' 
	fi
}
ascii
menu_installer
asciiFinish
#bspc wm -r


