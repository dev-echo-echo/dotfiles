#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SOURCE="$SCRIPT_DIR/.config"
TARGET="$HOME/.config"

source "$SCRIPT_DIR/commands/package_manager.sh"
source "$SCRIPT_DIR/commands/install_programs.sh"
source "$SCRIPT_DIR/commands/link.sh"
source "$SCRIPT_DIR/utils/colors.sh"

# update the systme.
read -p "do you want to update the system fist: [y/n] " answer
if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
    echo "updating the system..."
    sudo pacman -Syu
fi

# programs names in package managers to install.
declare -A PROGRAMS_ARRAY=(
    [bash]="pacman"
    [git]="pacman"
    [niri]="pacman"
    [nvim]="pacman"
    [yazi]="pacman"
    [ashell]="yay"
    [impala]="pacman"
    [mpv]="pacman"
    [fuzzel]="pacman"
    [brave]="yay"
    [wiremix]="pacman"
    [zathura]="pacman"
    [nautilus]="pacman"
    [nwg-look]="yay"
    [btop]="pacman"
    [kew]="yay"
    [mangohud]="pacman"
    [cava]="pacman"
    [fastfetch]="pacman"
    [awww]="pacman"
)

# programs config dir name. 
declare -A CONFIG_DIR_NAME=(
    [bash]="none"
    [niri]="none"
    [nvim]="name"
    [yazi]="none"
    [ashell]="none"
    [kitty]="none"
    [impala]="none"
    [mpv]="none"
    [fuzzel]="none"
    [wal]="none"
    [zathura]="none"
    [nwg-look]="none"
    [kew]="none"
    [btop]="none"
    [mangohud]="none"
    [cava]="none"
    [fastfetch]="none"
    [awww]="none"
)
# intall needed programs.
install_programs PROGRAMS_ARRAY 

# install yay if not installed.
if $(pacman -Q yay); then
    echo "[yay] is already installed"
else
    echo "[yay] is not installed"
    echo "installing yay..."
    sleep 1
    sudo pacman -S --needed git base-devel 
    git clone https://aur.archlinux.org/yay.git 
    cd yay 
    makepkg -si   
fi
echo ""
# link .
echo "Start creating symlinks..."
for NAME in "${!CONFIG_DIR_NAME[@]}"; do
    if [[ "$NAME" == "bash" ]]; then
        link "$NAME" "$SOURCE/$NAME" "$HOME"
    else
        link "$NAME" "$SOURCE/$NAME" "$TARGET"
    fi
done

# copy pictures.
function copy(){
    if $(cp -r "$SCRIPT_DIR/utils/favorites" "$HOME/Pictures/"); then
        echo "  Copied PICTURES successfully"
    else
        echo "  Something went wrong could not copy PICTURES"
    fi
}
copy

echo ""
echo "Installation Complete!"

# reboot.
read -p "do you want to reaboot: " choise
if [[ "$choise" == "y" ]]; then
    reboot
elif [[ "$choise" == "n" ]]; then
    true
else
    echo "valid options: [y/n]"
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
