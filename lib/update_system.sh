# update the system.

function update_system() {
    while true; do
        read -p "do you want to update the system first: [y/n] " answer
        case "$answer" in
            y | Y)  echo "updating the system..."; sudo pacman -Syu; break ;;
            n | N) break ;;
            *) echo "valid options are [y or Y / n or N]" ;;
        esac
    done
}


