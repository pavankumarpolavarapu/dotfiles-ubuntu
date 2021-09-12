#!/usr/bin/env bash
sudo apt-get install -y jq

# HTTPS support
sudo apt-get install apt-transport-https
GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
# Load External Sources if any
chmod +x sources.sh
./sources.sh

# Update the metadata
sudo apt-get update

# Install Essential Packages
sudo apt-get install -y $(jq .minimalpackages[] packages.json | tr -d \")

# Customizations

## Click to Minimize 

function customize(){
	case $1 in 
		'install')
			case $2 in
				'click_to_minimize')
					gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
					;;
				'gnome-terminal')
					GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
					gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ use-system-font false
					gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ font 'Fira Code 11'
					gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ default-size-rows 45 
					gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ default-size-columns 180
					gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ visible-name 'Pavan'
			esac
			;;
		'uninstall') 
			case $2 in
				'click_to_minimize')
					gsettings reset org.gnome.shell.extensions.dash-to-dock click-action
					;;
				'gnome-terminal')
                                        GNOME_TERMINAL_PROFILE=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
					gsettings reset org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ use-system-font
					gsettings reset org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ font
					gsettings reset org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ default-size-rows
					gsettings reset org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ default-size-columns
					gsettings reset org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ visible-name 
			esac
			;;
	esac
}

customize install click_to_minimize
customize install gnome-terminal

