# Reset
RESET="\033[0m"

# RGB foreground colors
RED="\033[38;2;255;0;0m"
GREEN="\033[38;2;0;255;0m"
BLUE="\033[38;2;0;0;255m"

YELLOW="\033[38;2;255;255;0m"
CYAN="\033[38;2;0;255;255m"
MAGENTA="\033[38;2;255;0;255m"

ORANGE="\033[38;2;255;165;0m"
PINK="\033[38;2;255;105;180m"
PURPLE="\033[38;2;128;0;128m"

LIGHT_BLUE="\033[38;2;173;216;230m"
LIME="\033[38;2;50;205;50m"
GOLD="\033[38;2;255;215;0m"

GRAY="\033[38;2;128;128;128m"
WHITE="\033[38;2;255;255;255m"
BLACK="\033[38;2;0;0;0m"

ombre () {
    python $HOME/.bash-ombre.py 
}

function prompt_command() {
	git=$(git branch --show-current 2>/dev/null)
	env=$(if [[ -n "$VIRTUAL_ENV" ]]; then echo "($(basename $VIRTUAL_ENV))"; fi)
	PS1="\n\[$PINK\]$git\[$RESET$ORANGE\]$env\[$RESET$GRAY\]\u \w \n\[$RESET$ORANGE\] \[$RESET\]"
}
PROMPT_COMMAND=prompt_command   # the shell automaticlly runs each command stored in PROMPT_COMMAND 
                                #  before each prompt 
# you must wrap non visible characters in \[...\] or the cursor jumps to wrong position and backspace deltes weired parts.

