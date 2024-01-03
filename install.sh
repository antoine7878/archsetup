sudo passwd -d antoine
sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm ntfs-3g os-prober
lsblk
read -p "Enter windows partion path ? y/N : " win_part
sudo mount --mkdir $win_part /mnt_win
sudo echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo pacman -S --noconfirm noto-fonts  ttf-roboto-mono-nerd firefox man-db neovim vim git network-manager-applet kitty xclip

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
cd ..
rm -rf yay

yay --save --nocleanmenu --nodiffmenu
yay --save --answerclean None --answerdiff Nonegbh
yay -S --noconfirm --needed noto-color-emoji-fontconfig flameshot-git npm gnu-free-fonts redshift nemo brightnessctl awesome-git polybar picom alacritty betterlockscreen catppuccin-gtk-theme-mocha conky logo-ls lxappearance neovim neofetch papirus-icon-theme feh rofi xidlehook sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg

cd ~
git clone https://github.com/antoine7878/dotfiles.git
cp -r ~/dotfiles/home/.* ~/

mkdir -p ~/.config
cp -r ~/dotfiles/config/* ~/.config 

mkdir -p ~/.local/share/fonts
cp -r ~/dotfiles/fonts/* ~/.local/share/fonts
fc-cache -v -f

sudo cp -r ~/.config/sddm/sugar-candy /usr/share/sddm/themes/
sudo cp -r ~/.config/sddm/sddm.conf /etc/

sudo systemctl enable sddm

sudo mkdir -p /etc/modprobe.d/
sudo touch /etc/modprobe.d/blacklist-nouveau.conf

sudo echo -e "blacklist nouveau/noptions nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf

sudo mkdir -p /etc/udev/rules.d/
sudo touch /etc/udev/rules.d/00-remove-nvidia.rules
sudo echo -e '# Remove NVIDIA USB xHCI Host Controller devices, if present/nACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"/n/n# Remove NVIDIA USB Type-C UCSI devices, if present/nACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"/n# Remove NVIDIA Audio devices, if present/nACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"/n/n# Remove NVIDIA VGA/3D controller devices/nACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"' >> /etc/udev/rules.d/00-remove-nvidia.rules


# install nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# fix grub

# setup ssh github
ssh-keygen -t ed25519 -C "antoine.letellier90@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard

# reboot