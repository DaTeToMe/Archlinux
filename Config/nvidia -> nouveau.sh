#!/bin/bash
# nvidia -> nouveau

/usr/bin/sudo /bin/sed -i 's/#options nouveau modeset=1/options nouveau modeset=1/' /etc/modprobe.d/modprobe.conf
/usr/bin/sudo /bin/sed -i 's/#MODULES="nouveau"/MODULES="nouveau"/' /etc/mkinitcpio.conf

/usr/bin/sudo /usr/bin/pacman -Rdds --noconfirm nvidia-173xx{,-utils}
/usr/bin/sudo /usr/bin/pacman -S --noconfirm nouveau-dri xf86-video-nouveau

#/usr/bin/sudo /bin/cp {10-monitor,30-nouveau}.conf /etc/X11/xorg.conf.d/

/usr/bin/sudo /sbin/mkinitcpio -p linux

#想要成功地完成切换，一次重启是很有必要的。 请根据您正在使用的驱动版本来修改一些地方(在这里我使用的是nvidia-173xx)
#假如您正在使用的xorg-server的版本低于1.10.2-1，取消注释行，复制和删除{10-monitor,30-nouveau}.conf。自从1.10.2-1之后的版本，xorg-server修补为自动加载nouveau。我保留了10-monitor.conf和30-nouveau.conf[broken link: invalid section]在同一个目录作为这个脚本，必要时还要调整一下路径。
