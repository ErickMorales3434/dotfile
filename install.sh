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
function installYay(){
	sudo pacman -S git
	cd 
	git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si PKGBUILD && cd 
	cd dotfile
}
function appsPacman(){
	echo 'actualizando base de datos'
	sudo pacman -Syu
	sleep 2
	echo 'Instalando bspwm y aplicaciones extras'
	sleep 2
	sudo pacman -S bspwm sxhkd alacritty rofi python-pip feh brightnessctl alsa-utils playerctl scrot firefox telegram-desktop obs-studio neovim
}
function appsApt(){
	echo 'actualizando base de datos'
	sudo apt update
	sudo apt upgrade
	sleep 2
	echo 'Instalando bspwm y aplicaciones extras'
	sleep 2
	sudo apt install bspwm sxhkd rofi python-pip feh brightnessctl alsa-utils playerctl scrot firefox-esr telegram-desktop obs-studio neovim	
}
function appsYay(){
	yay -S polybar-git 
	yay -S clearine-git
	yay -S visual-studio-code-bin
}
function configuration_archives(){
	echo 'Copiando archivos'
	sleep 2
	#mkdir $HOME/.config
	cp -rv config/bspwm $HOME/.config
	cp -rv config/sxhkd $HOME/.config
	cp -rv config/alacritty $HOME/.config
	cp -rv config/clearine $HOME/.config
	cp -rv config/nvim $HOME/.config
	cp -rv config/picom $HOME/.config
	cp -rv config/polybar $HOME/.config
	cp -rv config/rofi $HOME/.config
	cp -rv config/wal $HOME/.config/
}
function installFonts(){
	echo 'Instalando fuentes'
	sleep 2
	#sudo cp -rv /fonts-bspwm /usr/share/fonts
	cp -rv fonts-bspwm $HOME/Documentos/prueba/
	chmod +w $HOME/Documentos/fonts-bspwm
}
function editXinitBash(){
	touch $HOME/.xinitrc
	echo 'sxhkd &' >> $HOME/.xinitrc
	echo 'exec bspwm' >> $HOME/.xinitrc
	echo 'alias v=nvim' >> $HOME/.bashrc
	echo "alias sv='sudo nvim'" >> $HOME/.bashrc
}
function menu(){
	echo 'Ingrese el numero de su distribucion actual'
	echo '1<------------Arch Linux'
	echo '2<------------Debian Linux'
	read -p "Ingrese un numero: " input_distro
	if [ "$input_distro" = "1" ]; then
		echo ' █████╗ ██████╗  ██████╗██╗  ██╗   '
		echo '██╔══██╗██╔══██╗██╔════╝██║  ██║  '
		echo '███████║██████╔╝██║     ███████║  '
		echo '██╔══██║██╔══██╗██║     ██╔══██║  '
		echo '██║  ██║██║  ██║╚██████╗██║  ██║  '
		echo '╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝  '
		echo '                                  '
		echo '<---------------------------------->'
		sleep 2
		installYay
		appsPacman
		appsYay
		configuration_archives
		editXinitBash

		asciiFinish

		echo 'Reinciando Equipo'
		echo '4'
		sleep 1
		echo '3'
		sleep 1
		echo '2'
		sleep 1
		echo '1'
		sleep 1
		reboot

	elif [ "$input_distro" = "2" ]; then
		echo '██████╗ ███████╗██████╗ ██╗ █████╗ ███╗   ██╗'
		echo '██╔══██╗██╔════╝██╔══██╗██║██╔══██╗████╗  ██║'
		echo '██║  ██║█████╗  ██████╔╝██║███████║██╔██╗ ██║'
		echo '██║  ██║██╔══╝  ██╔══██╗██║██╔══██║██║╚██╗██║'
		echo '██████╔╝███████╗██████╔╝██║██║  ██║██║ ╚████║'
		echo '╚═════╝ ╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝'
		
		sleep 2
		appsApt
		configuration_archives
		editXinitBash

		asciiFinish
	else
		echo '███████╗██████╗ ██████╗  ██████╗ ██████╗' 
		echo '██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔══██╗'
		echo '█████╗  ██████╔╝██████╔╝██║   ██║██████╔╝'
		echo '██╔══╝  ██╔══██╗██╔══██╗██║   ██║██╔══██╗'
		echo '███████╗██║  ██║██║  ██║╚██████╔╝██║  ██║'
		echo '╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝'
		echo 'opcion erronea, vuelve a intentarlo'                                   
	fi
}
ascii
#menu
installFonts

