function install_desktop() {
    echo "╭─────────────────────────────╮"
    echo "│ installing desktop packages │"
    echo "╰─────────────────────────────╯"
    install_pkg pacman niri
    install_pkg pacman kitty
    install_pkg yay ashell
}


