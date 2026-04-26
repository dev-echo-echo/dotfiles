# reboot.
function restart() {
    echo "╭────────╮"
    echo "│ reboot │"
    echo "╰────────╯"
    while true; do
        read -p "do you want to reboot: " choise
        case "$choise" in 
            y | Y) reboot ;;
            n | N) break ;;
            *) echo "valid options: [y or Y / n or N]" 
        esac
    done
}
