function copy(){
    echo "╭────────────────╮"
    echo "│ copying images │"
    echo "╰────────────────╯"
    if [[ ! -d "$HOME/Pictures/favorites" ]]; then
        if cp -r "$SCRIPT_DIR/utils/favorites" "$HOME/Pictures/"; then
            echo "Copied PICTURES successfully"
        else
            echo "Something went wrong could not copy PICTURES"
        fi
    else
        echo "Pictures already exist"
    fi
}
