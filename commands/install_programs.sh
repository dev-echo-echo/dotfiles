function install_programs() {
    local -n PROGRAMS_DICT=$1    # -n makes the name PROGRAMS_DICT refer to the actual
    local EXCEPTIONS=("")        # associative arry, any read or write operation on PROGRAMS_DICT 
    for PROGRAM in "${!PROGRAMS_DICT[@]}"; do # will affect the original associative array.
        if $(which "$PROGRAM" &> /dev/null); then # without -n you just have a local var 
            echo "[$PROGRAM] is already installed skiping..." # containing the string PROGRAMS_ARRAY 
        else
            if [[ "${PROGRAMS_DICT[$PROGRAM]}" == "pacman" ]]; then 
                echo "Installing [$PROGRAM] with pacman"
                if $(sudo pacman -S "$PROGRAM"); then
                    echo "[$PROGRAM] was installed successfully" 
                else
                    exceptions+=("$PROGRAM")
                fi
            elif [[ "${PROGRAMS_DICT["$PROGRAM"]}" == "yay" ]]; then
                echo "Installing [$PROGRAM] with yay"
                if $(yay -S "$PROGRAM"); then
                    echo "$PROGRAM was installed successfully" 
                else
                    exceptions+=("$PROGRAM")
                fi               
            fi
        fi

    done
    echo "ALL Programs are installed"
    echo "" 
    sleep 1 
    # echo "$EXCEPTIONS"
}

