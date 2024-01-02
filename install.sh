sudo passwd -d antoine
sudo pacman -Syu --noconfirm

# sudo pacman -S --noconfirm ntfs-3g os-prober
# lsblk
# read -p "Enter windows partion path ? y/N : " win_part
# sudo mount --mkdir $win_part /mnt_win
# sudo echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
# sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo pacman -S --noconfirm firefox man-db neovim vim git network-manager-applet kitty

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
cd ..
rm -rf yay

yay --save --nocleanmenu --nodiffmenu
yay --save --answerclean None --answerdiff None
yay -S --noconfirm --needed flameshot-git npm gnu-free-fonts redshift nemo brightnessctl awesome-git polybar picom alacritty betterlockscreen catppuccin-gtk-theme-mocha conky logo-ls lxappearance neovim neofetch papirus-icon-theme feh rofi xidlehook sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg

cd ~
git clone https://github.com/antoine7878/dotfiles.git
cp -r ~/dotfiles/home/.* ~/

mkdir ~/.config
cp -r ~/dotfiles/config/* ~/.config 

mkdir -p ~/.local/share/fonts
cp -r ~/dotfiles/fonts/* ~/.local/share/fonts
fc-cache -v -f

sudo cp -r ~/.config/sddm/sugar-candy /usr/share/sddm/themes/
sudo cp -r ~/.config/sddm/sddm.conf /etc/

sudo systemctl enable sddm

reboot