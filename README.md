# Archlinux个人安装教程

# WiFi连接
```
wifi-menu
ping
```
# 时间同步
```
timedatectl set-ntp true
```
# 软件仓库选择
```
vim /etc/pacman.d/mirrorlist
```
# or
```
sed -i '/China/!{n;/Server/s/^/#/};t;n' /etc/pacman.d/mirrorlist
```
 分区
```
cfdisk
```
# 分区情况查看
```
lsblk
```
# 分区格式化
```
mkfs.ext4 /dev/sd??
```
# 分区挂载
```
mount /dev/sd?? /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/EFI
mount /dev/sd?? /mnt/home
mount /dev/sd?? /mnt/boot/EFI
```
# 安装基础包
```
pacstrap /mnt base base-devel
```
# 分区表生成
```
genfstab -U /mnt >> /mnt/etc/fstab
```
# 分区表查看
```
cat /mnt/etc/fstab
```
# 新系统进入
```
arch-chroot /mnt
```
# 时区
```
ln -sf /usr/share/zoneinfo/$(tzselect) /etc/localtime
```
# or
```
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```
# 硬件时间设置
```
hwclock --systohc
```
# 区域设置
```
pacman -S vim
vim /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8'  > /etc/locale.conf
```
# 网络连接设置
# 有线连接
```
systemctl enable dhcpcd
```
# 无线连接
```
pacman -S iw wpa_supplicant dialog
```
 or
```
pacman -S networkmanager

systemctl enable NetworkManager
```
# root用户设置
```
passwd
```
# 安装微码 支持NTFS格式
```
pacman -S intel-ucode ntfs-3g
```
# 引导程序安装
```
pacman -S dosfstools grub efibootmgr os-prober

grub-install /dev/sd??
# or
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=ArchLinux

grub-mkconfig -o /boot/grub/grub.cfg
```
# 新系统退出
```
exit
# or
CTRL+D
```
# 分区卸载
```
umount -R /mnt
```
# 重启
```
reboot
```
# 移除U盘

