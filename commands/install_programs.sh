function install_programs() {
    local PROGRAMs_DICT=$1
    EXCEPTIONS=("")   
    for PROGRAM in "$!{PROGRMAS_DICT[@]}"; do
        if $(which $PROGRAM &> /dev/null); then 
            echo "$PROGRAM is installed"
        else
            if [[ "${PROGRMAS_DICT["$PROGRAM"]}" == "pacman" ]]; then 
                if $(sudo pacman -S "$program"); then
                    echo "$program was installed successfully" 
                else
                    exceptions+=("$program")
                fi
            elif [[ "${PROGRMAS_DICT["$PROGRAM"]}" == "yay" ]]; then
                if $(yay -S "$program"); then
                    echo "$program was installed successfully" 
                else
                    exceptions+=("$program")
                fi               
            fi
        fi

    done
    echo "$EXCEPTIONS"
}
