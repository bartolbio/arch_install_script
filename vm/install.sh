#!/bin/bash
	#varie
timedatectl set-ntp true
timedatectl set-timezone Europe/Rome
pacman -Syy
pacman -S reflector --noconfirm
reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
	#installa basi
pacstrap /mnt base linux-firmware linux-lts nano 
genfstab -U /mnt >> /mnt/etc/fstab

