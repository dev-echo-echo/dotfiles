
declare -A targets=(
    [kitty_colors.conf]="$SCRIPT_DIR/config/kitty/colors.conf"
    [niri.kdl]="$SCRIPT_DIR/config/niri/config.kdl"
    [ashell.toml]="$SCRIPT_DIR/config/ashell/config.toml"
    [nvim_colors.lua]="$SCRIPT_DIR/config/nvim/lua/core/colors.lua"
    [yazi_theme.toml]="$SCRIPT_DIR/config/yazi/theme.toml"
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

