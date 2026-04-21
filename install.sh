#!/usr/bin/env bash
#set -e # exit immediatly if a command fails.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SOURCE="$SCRIPT_DIR/.config"
TARGET="$HOME/.config"

# create needed directories if not exists.
mkdir -p "$TARGET"
mkdir -p "$HOME/Pictures"

source "$SCRIPT_DIR/commands/install_programs.sh"
source "$SCRIPT_DIR/commands/link.sh"
source "$SCRIPT_DIR/utils/colors.sh"
source "$SCRIPT_DIR/utils/arrays.sh"

echo "enter password for pacman once"
sudo -v   # ask password once.

# update the system.
while true; do
    read -p "do you want to update the system first: [y/n] " answer
    if [[ "$answer" == "y" ]]; then
        echo "updating the system..."
        sudo pacman -Syu
        break
    elif [[ "$answer" == "n" ]]; then
        true 
        break
    else
        echo "valid options are [y/n]"
    fi
done

INITIAL_PROGRAMS=("bash" "git" "yay")
for item in "${INITIAL_PROGRAMS[@]}"; do
    if ! is_installed "$item" &>/dev/null; then
        if [[ "$item" == "yay" ]]; then
            if is_installed "git"; then
                echo "installing yay..."
                sudo pacman -S --needed git base-devel  
                git clone https://aur.archlinux.org/yay.git || exit 1 # stop if commands fail 
                cd yay || exit 1 
                makepkg -si || exit 1
                cd ..
                rm -rf yay
            else
                echo "git is not installed can not install yay"
            fi
        else
            echo "Installing $item..."
            sudo pacman -S --needed "$item"
        fi
    else
        echo "[$item] is already installed"
    fi
done
echo ""

# intall needed programs.
NOT_INSTALLED=()
for PROGRAM in "${!PROGRAMS_ARRAY[@]}"; do 
    install_programs "$PROGRAM" "${PROGRAMS_ARRAY[$PROGRAM]}"
done

echo ""
if (( "${#NOT_INSTALLED[@]}" != 0 )); then
    echo "programs could not install: "
    for niprogram in "${NOT_INSTALLED[@]}"; do
        echo -n "  [$niprogram]"
    done
    echo ""
    while true; do
        read -p "do you want to continue: " userinput
        if [[ "$userinput" == "y" ]]; then
            break
        elif [[ "$userinput" == "n" ]]; then
            exit
        else
            echo "valid options are [y/n]"
        fi
    done
else
    echo "All programs are installed!"
fi


# link .
declare -A LINK_TYPE=(
    [bash]="file"
    )
echo ""
echo "Start creating symlinks..."
for NAME in "${!CONFIG_DIR_NAME[@]}"; do
    if is_installed "${CONFIG_DIR_NAME[$NAME]}"; then
        if [[ "${LINK_TYPE[$NAME]}" == "file" ]]; then
            link ".bashrc" "$SOURCE/$NAME/.bashrc" "$HOME"
            link ".theme.bash" "$SOURCE/$NAME/.theme.bash" "$HOME"
        else
            link "$NAME" "$SOURCE/$NAME" "$TARGET"
        fi
    else
        echo "[${CONFIG_DIR_NAME[$NAME]}] is not installed skipping..."
    fi
done


# copy pictures.
echo ""
function copy(){
    if [[ ! -d "$HOME/Pictures/favorites" ]]; then
        if cp -r "$SCRIPT_DIR/utils/favorites" "$HOME/Pictures/"; then
            echo "Copied PICTURES successfully"
        else
            echo "Something went wrong could not copy PICTURES"
        fi
    else
        echo "Pictures already exists"
    fi
}
copy

echo ""
echo "Installation Complete!"

# reboot.
echo ""
while true; do
    read -p "do you want to reboot: " choise
    if [[ "$choise" == "y" ]]; then
        reboot
    elif [[ "$choise" == "n" ]]; then
        break
    else
        echo "valid options: [y/n]"
    fi
done
