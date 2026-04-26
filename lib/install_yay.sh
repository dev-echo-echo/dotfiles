# install yay.
function install_yay(){
    if is_installed yay; then
        echo "[yay] is already installed skipping..."
    else
        echo "installing [yay]..."
        sudo pacman -S --needed git base-devel  
        git clone https://aur.archlinux.org/yay.git || exit 1 # stop if commands fail 
        cd yay || exit 1 
        makepkg -si || exit 1
        cd ..
        rm -rf yay
    fi
}
