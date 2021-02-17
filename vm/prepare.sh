mkfs.fat -F32 /dev/vda1
mkfs.ext4 /dev/vda3
mkswap /dev/vda2
swapon /dev/vda2
