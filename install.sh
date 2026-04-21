#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SOURCE="$SCRIPT_DIR/.config"
TARGET="$HOME/.config"

source "$SCRIPT_DIR/commands/package_manager.sh"
source "$SCRIPT_DIR/commands/install_programs.sh"
source "$SCRIPT_DIR/commands/link.sh"
source "$SCRIPT_DIR/utils/colors.sh"

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
    if ! pacman -Q "$item" &>/dev/null; then
        if [[ "$item" == "ya" ]]; then
            if pacman -Q git &>/dev/null; then
                echo "installing yay..."
                sudo pacman -S --needed git base-devel 
                git clone https://aur.archlinux.org/yay.git 
                cd yay 
                makepkg -si   
            else
                echo "git is not installed can not install yay"
            fi
        else
            echo "Installing $item..."
            sudo pacman -S "$item"
        fi
    else
        echo "[$item] is already installed"
    fi
done
echo ""

# programs names in package managers to install.
declare -A PROGRAMS_ARRAY=(
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
    [bash]="bash"
    [niri]="niri"
    [nvim]="nvim"
    [yazi]="yazi"
    [ashell]="ashell"
    [kitty]="kitty"
    [impala]="impala"
    [mpv]="mpv"
    [fuzzel]="fuzzel"
    [wal]="python-pywal16"
    [zathura]="zathura"
    [nwg-look]="nwg-look"
    [kew]="kew"
    [btop]="btop"
    [mangohud]="mangohud"
    [cava]="cava"
    [fastfetch]="fastfetch"
    [awww]="awww"
)


# intall needed programs.
NOT_INSTALLED=()
for PROGRAM in "${!PROGRAMS_ARRAY[@]}"; do 
    install_programs "$PROGRAM" "${PROGRAMS_ARRAY[$PROGRAM]}"
    sleep 0.3
done

echo ""
if [[ "${#NOT_INSTALLED[@]}" != 0 ]]; then
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
echo ""
echo "Start creating symlinks..."
FOUND=false
for NAME in "${!CONFIG_DIR_NAME[@]}"; do
    for APP in "${NOT_INSTALLED[@]}"; do
        if [[ "$APP" == "${CONFIG_DIR_NAME[$NAME]}" ]]; then
            FOUND=true
            break
        else
            FOUND=false
        fi
    done
    if ! $FOUND; then
        if [[ "$NAME" == "bash" ]]; then
            link "$NAME" "$SOURCE/$NAME" "$HOME"
        else
            link "$NAME" "$SOURCE/$NAME" "$TARGET"
        fi
    else
        echo "[${CONFIG_DIR_NAME[$NAME]}] is not installed skiping..."
    fi
done


# copy pictures.
echo""
function copy(){
    if $(cp -r "$SCRIPT_DIR/utils/favorites" "$HOME/Pictures/"); then
        echo "Copied PICTURES successfully"
    else
        echo "Something went wrong could not copy PICTURES"
    fi
}
copy

echo ""
echo "Installation Complete!"

# reboot.
echo ""
while true; do
    read -p "do you want to reaboot: " choise
    if [[ "$choise" == "y" ]]; then
        reboot
    elif [[ "$choise" == "n" ]]; then
        break
    else
        echo "valid options: [y/n]"
    fi
done
