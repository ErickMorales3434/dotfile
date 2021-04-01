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
	sudo apt install lightdm bspwm sxhkd rofi python3-pip feh brightnessctl alsa-utils playerctl scrot firefox-esr telegram-desktop obs-studio neovim	
}
function appsYay(){
	yay -S polybar-git 
	yay -S clearine-git
	yay -S visual-studio-code-bin
}
function appsGit(){
	sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
	cd $HOME && git clone https://github.com/polybar/polybar.git 
	cd polybar 
	cd build 
	cmake ..
	make -j$(nproc) 
	sudo make install
	
	cd $HOME && git clone https://github.com/yuune/clearine.git && cd clearine && sudo pip install .

}
function configuration_archives(){
	echo 'Copiando archivos'
	sleep 2
	mkdir $HOME/.config
	cp -rv $HOME/dotfile/config/bspwm $HOME/.config
	cp -rv $HOME/dotfile/config/sxhkd $HOME/.config
	cp -rv $HOME/dotfile/config/alacritty $HOME/.config
	cp -rv $HOME/dotfile/config/clearine $HOME/.config
	cp -rv $HOME/dotfile/config/nvim $HOME/.config
	cp -rv $HOME/dotfile/config/picom $HOME/.config
	cp -rv $HOME/dotfile/config/polybar $HOME/.config
	cp -rv $HOME/dotfile/config/rofi $HOME/.config
	cp -rv $HOME/dotfile/config/wal $HOME/.config
	cp -rv $HOME/dotfile/xinitrc $HOME/.xinitrc
}
function installFonts(){
	echo 'Instalando fuentes'
	sleep 2
	sudo cp -r -v $HOME/dotfile/fonts_bspwm /usr/share/fonts/
	sudo chmod 755 /usr/share/fonts/fonts_bspwm/
}
function editXinitBash(){
	echo 'alias v=nvim' >> $HOME/.bashrc
	echo "alias sv='sudo nvim'" >> $HOME/.bashrc
	sudo dpkg-reconfigure lightdm
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
		installFonts

		asciiFinish

		echo 'Desea reiniciar el equipo?'
		read -p "Ingrese una opcion: 1=SI, 2=NO: " restart_pc
		if [ "$restart_pc" =  '1' ]; then
			echo 'reiniciando'
			reboot
		else
			clear	
		fi

	elif [ "$input_distro" = "2" ]; then
		echo '██████╗ ███████╗██████╗ ██╗ █████╗ ███╗   ██╗'
		echo '██╔══██╗██╔════╝██╔══██╗██║██╔══██╗████╗  ██║'
		echo '██║  ██║█████╗  ██████╔╝██║███████║██╔██╗ ██║'
		echo '██║  ██║██╔══╝  ██╔══██╗██║██╔══██║██║╚██╗██║'
		echo '██████╔╝███████╗██████╔╝██║██║  ██║██║ ╚████║'
		echo '╚═════╝ ╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝'
		
		sleep 2
		appsApt
		appsGit
		configuration_archives
		installFonts
		editXinitBash

		asciiFinish
		echo 'Desea reiniciar el equipo?'
		read -p "Ingrese una opcion: 1=SI, 2=NO: " restart_pc
		if [ "$restart_pc" =  '1' ]; then
			echo 'reiniciando'
			sudo reboot
		else
			clear	
		fi
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
menu


