declare -A targets=(
    [niri-layout.kdl]="$SCRIPT_DIR/config/niri/layout.kdl"
    [kitty-colors.conf]="$SCRIPT_DIR/config/kitty/colors.conf"
    [ashell-ashell.toml]="$SCRIPT_DIR/config/ashell/config.toml"
    #[nvim-theme.lua]="$SCRIPT_DIR/config/nvim/thmes"
)

function generator(){
    echo "╭─────────────────────────╮"
    echo "│ generating config files │"
    echo "╰─────────────────────────╯"
    path="$SCRIPT_DIR/templates"
    find "$path" -type f -name "*.template" | while read input; do
        name=$(basename "$input" .template)
        envsubst < $input > "${targets[$name]}"
        echo "$input --> ${targets[$name]}  ( done )"
    done

}

