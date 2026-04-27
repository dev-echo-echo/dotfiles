#!/usr/bin/env bash
#set -e # exit immediatly if a command fails.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SOURCE="$SCRIPT_DIR/config"
TARGET="$HOME/.config"

# import files.
source "$SCRIPT_DIR/lib/update_system.sh"
source "$SCRIPT_DIR/lib/core.sh"
source "$SCRIPT_DIR/lib/install_yay.sh" 
source "$SCRIPT_DIR/lib/install_base.sh" 
source "$SCRIPT_DIR/lib/install_desktop.sh" 
source "$SCRIPT_DIR/lib/install_tools.sh" 
source "$SCRIPT_DIR/lib/generator.sh" 
source "$SCRIPT_DIR/lib/link.sh" 
source "$SCRIPT_DIR/lib/copy_images.sh" 
source "$SCRIPT_DIR/lib/restart.sh" 
source "$SCRIPT_DIR/utils/arrays.sh" 
# source themes
source "$SOURCE/themes/niri-theme.sh"
source "$SOURCE/themes/kitty-theme.sh"
source "$SOURCE/themes/ashell-theme.sh"

# create needed directories if not exists.
mkdir -p "$TARGET"
mkdir -p "$HOME/Pictures"

# ask password once.
echo "enter password for pacman once"
sudo -v

# install packages
update_system
install_yay
install_base
install_desktop
install_tools

# run generator
generator

# symlink
echo "╭───────────────────╮"
echo "│ creating simlinks │"
echo "╰───────────────────╯"

declare -A LINK_TYPE=(
    [bash]="file"
)

for NAME in "${CONFIG_DIR_NAME[@]}"; do 
    if ! is_installed "${CONFIG_DIR_NAME[$NAME]}"; then
        echo "${CONFIG_DIR_NAME[$NAME]} is not installed skipping..."
    else
        case "${LINK_TYPE[$NAME]}" in 
            "file") 
                link ".bashrc" "$SOURCE/$NAME/.bashrc" "$HOME"
                link ".theme.bash" "$SOURCE/$NAME/.theme.bash" "$HOME" 
                link ".colors.sh" "$SOURCE/$NAME/.colors.sh" "$HOME" 
                link ".ombre.sh" "$SOURCE/$NAME/.ombre.sh" "$HOME" ;;
            *) 
                link "$NAME" "$SOURCE/$NAME" "$TARGET"  ;;
        esac
    fi
done

# copy images
copy

# reboot
restart
