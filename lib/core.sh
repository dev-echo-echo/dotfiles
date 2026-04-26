function is_installed() {
    pacman -Q "$1" &>/dev/null
}

function install_pkg() {
    if is_installed "$2"; then 
        echo "[$2] is already installed skipping..."
    else
        case $1 in
            "pacman") 
                echo "installing [$2] with pacman..."
                sudo pacman -S $2 --needed
                if is_installed $2; then
                    echo "[$2] was installed successfully"
                else
                    echo "something went wrong could not install [$2]"
                fi ;;
            "yay")
                echo "installing [$2] with yay..."
                yay -S $2 --needed
                if is_installed $2; then
                    echo "[$2] was installed successfully"
                else
                    echo "something went wrong could not install [$2]"
                fi ;;
        esac
    fi
}
