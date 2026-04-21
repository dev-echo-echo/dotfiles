RED="\033[38;2;255;0;0m"
RESET="\033[0m"

function install_programs() {
    local PROGRAM=$1    
    local WHICH_PACKAGE_MANAGER=$2
    if pacman -Qq "$PROGRAM" &> /dev/null; then  
        echo "[$PROGRAM] is already installed skiping..."  
    else
        if [[ "$WHICH_PACKAGE_MANAGER" == "pacman" ]]; then 
            printf "Installing [%s] with pacman\n" "$PROGRAM"
            sudo pacman -S "$PROGRAM" 2>&1
            if [[ $? -eq 0 ]]; then
                echo "["$PROGRAM"] was installed successfully" 
            else
                printf "$RED could not install [$PROGRAM] $RESET \n"
                NOT_INSTALLED+=("$PROGRAM")
            fi
        elif [[ "$WHICH_PACKAGE_MANAGER" == "yay" ]]; then
            echo "Installing [$PROGRAM] with yay"
            yay -S "$PROGRAM"
            if [[ $? -eq 0 ]]; then
                echo "$PROGRAM was installed successfully" 
            else
                printf "$RED could not install [$PROGRAM] $RESET \n"
                NOT_INSTALLED+=("$PROGRAM")
            fi               
        fi
    fi
}

# -n makes the name PROGRAMS_DICT refer to the actual
# associative arry, any read or write operation on PROGRAMS_DICT
# will affect the original associative array.
# without -n you just have a local var
# containing the string PROGRAMS_ARRAY
#
