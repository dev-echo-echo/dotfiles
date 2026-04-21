GREEN="\033[38;2;0;255;0m"
RESET="\033[0m"

function link() {
    local KEY=$1
    local SOURCE=$2
    local TARGET=$3
    if [[ -L "$TARGET/$KEY" ]]; then
        echo "[$TARGET/$KEY]  Already Linked, skiping..."
        sleep 0.5 
        return 1
    elif [[ -e "$TARGET/$KEY" ]]; then
        echo "[$TARGET/$KEY]  exists, back up"
        mv "$TARGET/$KEY" "$TARGET/$KEY.bak" 
        sleep 0.5 
    else
        true
    fi
    echo -n "[$SOURCE] -> [$TARGET/$KEY] Linking..."
    ln -s "$SOURCE" "$TARGET/$KEY"
    printf "  ($GREEN DONE $RESET)\n"
    sleep 0.5 
}
