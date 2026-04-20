#!/usr/bin/env bash
SOURCE="$HOME/.dotfiles/.config"
TARGET="$HOME/.config"

source "$HOME/.dotfiles/.config/package_manager.sh"
source "$HOME/.ddotfiles/.config/install_programs.sh"
source "$HOME/.dotfiles/.config/link.sh"

# update the systme.
read -p "do you want to update the system fist: [y/n]" answer
if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
    echo "updating the system..."
    sudo pacman -Syu
fi

# install yay if not installed.
if ! $(command -v yay); then
    echo "installing yay..."
    sudo pacman -S --needed git base-devel 
    git clone https://aur.archlinux.org/yay.git 
    cd yay 
    makepkg -si   
fi

# programs names in package managers to install.
declare -A PROGRMAS_ARRAY
PROGRMAS_ARRAY[niri]="pacman"
PROGRMAS_ARRAY[nvim]="pacman"
PROGRMAS_ARRAY[yazi]="pacman"
PROGRMAS_ARRAY[ashell]="yay"
PROGRMAS_ARRAY[impala]="pacman"
PROGRMAS_ARRAY[mpv]="pacman"
PROGRMAS_ARRAY[fuzzel]="pacman"
PROGRMAS_ARRAY[brave]="yay"
PROGRMAS_ARRAY[wiremix]="pacman"
PROGRMAS_ARRAY[zathura]="pacman"
PROGRMAS_ARRAY[nautilus]="pacman"
PROGRMAS_ARRAY[nwg-look]="yay"
PROGRMAS_ARRAY[btop]="pacman"
PROGRMAS_ARRAY[kew]="yay"
PROGRMAS_ARRAY[mangohud]="pacman"
PROGRMAS_ARRAY[cava]="pacman"
PROGRMAS_ARRAY[fastfetch]="pacman"
PROGRMAS_ARRAY[awww]="pacman"


# programs config dir name. 
declare -A CONFIG_DIR_NAME
CONFIG_DIR_NAME[niri]="same"
CONFIG_DIR_NAME[nvim]="name"
CONFIG_DIR_NAME[yazi]="same"
CONFIG_DIR_NAME[ashell]="same"
CONFIG_DIR_NAME[kitty]="smae"
CONFIG_DIR_NAME[impala]="same"
CONFIG_DIR_NAME[mpv]="same"
CONFIG_DIR_NAME[fuzzel]="same"
CONFIG_DIR_NAME[wal]="same"
CONFIG_DIR_NAME[zathura]="same"
CONFIG_DIR_NAME[nwg-look]="same"
CONFIG_DIR_NAME[kew]="same"
CONFIG_DIR_NAME[btop]="same"
CONFIG_DIR_NAME[mangohud]="same"
CONFIG_DIR_NAME[cava]="same"
CONFIG_DIR_NAME[fastfetch]="same"


EXCEPTIOONS=$(install_programs "$PROGRMAS_ARRAY") 

# link .
for key in "${!CONFIG_DIR_NAME[@]}"; do
    echo "$key -> ${CONFIG_DIR_NAME[$key]}"
    link "$SOURCE/$key" "$TARGET"
done

# link pictures.
link "$HOMR/.dotfile/utils/Pictures" "$HOME/Pictures/favorites"

echo ""
echo "Installation Complete!"

# reboot.
read -p "do you want to reboot: [y/n]" reboot
if [[ "$reboot"=="y" || "$reboot"=="yes" ]]; then
    reboot 
fi
















#for item in $list; do
#    link "$SOURCE/$item" "$TARGET"
#done


#NAME=$(package_manager)

# Access elements
#echo "first element in list: ${PROGRMAS_ARRAY[0]}"
# Add an element
#PROGRMAS_ARRAY+=("kitty")
# Get length
#echo "list length: ${#PROGRMAS_ARRAY[@]}"

#install_programs() $PROGRMAS_ARRAY 
