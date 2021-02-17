mkfs.fat -F32 /dev/vda1
mkfs.ext4 /dev/vda3
mkswap /dev/vda2
swapon /dev/vda2
mount /dev/vda3 /mnt
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount /dev/vda1 /mnt/boot/efi
