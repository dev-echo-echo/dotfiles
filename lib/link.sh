GREEN="\033[38;2;0;255;0m"
RESET="\033[0m"

function is_simlink() {
    if [[ -L "$1" ]]; then
        return 0
    else 
        return 1
    fi
}

function is_exist() {
    if [[ -e "$1" ]]; then
        return 0
    else 
        return 1
    fi
}

function link() {
    local KEY=$1
    local SOURCE=$2
    local TARGET=$3
    if is_simlink "$TARGET/$KEY"; then   # is it a simlink
        if is_exist "$TARGET/$KEY"; then  # does the file this simlink points to exist.
            echo "[$TARGET/$KEY]  Already Linked And Works, skiping..."
        else
            echo "[$TARGET/$KEY]  Simlink Exists But Broken"
            echo -n "[$SOURCE] -> [$TARGET/$KEY] Fixing..."
            ln -sfn "$SOURCE" "$TARGET/$KEY"   # -f force, -n treat existing symlink as 
            printf "  ($GREEN DONE $RESET)\n" # a normal file(safer when it'is a simlink to a direcotry)
        fi
        return 1
    elif is_exist "$TARGET/$KEY"; then
        echo "[$TARGET/$KEY]  exists, back up"
        mv "$TARGET/$KEY" "$TARGET/$KEY.bak$(date +%s)" 
    fi

    echo -n "[$SOURCE] -> [$TARGET/$KEY] Linking..."
    ln -s "$SOURCE" "$TARGET/$KEY"
    printf "  ($GREEN DONE $RESET)\n"
}
