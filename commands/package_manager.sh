function package_manager() {
    if command -v pacman >&2 /dev/null/; then
        echo "pacman"
    elif command -v apt >&2 /dev/null/; then
        echo "apt"
    elif command -v dnf >&2 /dev/null/; then
        echo "dnf"
    else 
        echo "unknown"
    fi
}
