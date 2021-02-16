#!/bin/bash
	#varie
timedatectl set-ntp true
timedatectl set-timezone Europe/Rome
	#yay
pacman -S git base-devel --noconfirm
git clone https://aur.archlinux.org/yay-git.git /opt/yay-git
chown -R barto:barto /opt/
chown -R barto:barto /opt/PKGBUILD
chown -R barto:barto /opt/yay-git
	#installa pacchetti
pacman -S  notepadqq  --noconfirm

