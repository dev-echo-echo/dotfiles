function link() {
    local SOURCE=$1
    local TARGET=$2
    if [[ -L "$TARGET" ]]; then
        echo "Already Linked, skiping..."
        return 1
    elif [[ -e "$TARGET" ]]; then
        echo "TARGET exists, back up"
        mv "$TARGET" "$TARGET.bak" 
    else
        true
    fi

    echo -n "Linking..."
    ln -s "$SOURCE" "$TARGET"
    echo "  (DONE)"
}
