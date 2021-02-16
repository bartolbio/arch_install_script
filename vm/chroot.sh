#!/bin/bash
	#reflector
pacman -Syy
pacman -S reflector --noconfirm
reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
	#grub
pacman -S grub efibootmgr --noconfirm
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
	#lingua
rm /etc/locale.gen
cp /installscript/locale.gen /etc/
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8 
echo 'KEYMAP=it' > /etc/vconsole.conf
	#hostname
touch /etc/hostname
echo ArchVM > /etc/hostname
echo '127.0.0.1 localhost' >> /etc/hostname
echo '::1 localhost' >> /etc/hostname
echo '127.0.1.1 ArchVM' >> /etc/hostname
	#installazione pacchetti
pacman -S xorg xorg-server --noconfirm
pacman -S gdm gnome-session gnome-control-center gnome-terminal nautilus --noconfirm
pacman -S networkmanager gnome-tweaks --noconfirm
pacman -S sudo bash-completion --noconfirm
systemctl enable gdm NetworkManager sshd
	#aggiunta utenti
useradd -m -G wheel -s /bin/bash barto
echo "AllowUsers barto root" >>  /etc/ssh/sshd_config 
	#chiusura
echo "root:rootPSW!" | chpasswd
echo "barto:5496" | chpasswd

rm /etc/sudoers
cp /installscript/sudoers /etc/
rm /etc/gdm/custom.conf
cp /installscript/custom.conf /etc/gdm/
exit
