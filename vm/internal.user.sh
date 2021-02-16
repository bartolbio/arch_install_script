#!/bin/bash
	#varie
touch /home/barto/.bashrc
echo "# enable bash completion in interactive shells" >> /home/barto/.bashrc
echo "if ! shopt -oq posix; then" >> /home/barto/.bashrc
echo "  if [ -f /usr/share/bash-completion/bash_completion ]; then" >> /home/barto/.bashrc
echo "    . /usr/share/bash-completion/bash_completion" >> /home/barto/.bashrc
echo "  elif [ -f /etc/bash_completion ]; then" >> /home/barto/.bashrc
echo "    . /etc/bash_completion" >> /home/barto/.bashrc
echo "  fi" >> /home/barto/.bashrc
echo "fi" >> /home/barto/.bashrc
		#impostazioni GUI
	#tema scuro
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
	#disabilita lock screen
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
	#layout tastiera
gsettings set org.gnome.desktop.input-sources sources "[('xkb','it')]"
	#power
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
	#volume
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
	#layout tastiera gnome
setxkbmap -layout it	
	#installa yay
cd /opt/yay-git
makepkg -si
git config --global user.email "bartolomeo.besio@gmail.com"
git config --global user.name "bartolbio"
	#test
sudo -u gdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'


