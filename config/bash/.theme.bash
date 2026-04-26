source .ombre.sh
source .colors.sh
function prompt_command() {
    user_name=$(whoami)
    ombre "$user_name" 
    user="$gradient"
    current_dir="${PWD/#"$HOME"/""}"  # ${var/#pattern/replacement}
    ombre "$current_dir"
    dir="$gradient"
    current_git_branch=$(git branch --show-current 2>/dev/null) 
    git=$(if [[ -n "$current_git_branch" ]]; then echo " [ $current_git_branch]"; fi )
	env=$(if [[ -n "$VIRTUAL_ENV" ]]; then echo " ($(basename $VIRTUAL_ENV)🐍)"; fi)
	PS1="\n╭─\[$user\]\[$PINK_ANSI\]$git\[$RESET$ORANGE_ANSI\]$env\[$RESET \[$dir\] \n╰──> "
}
PROMPT_COMMAND=prompt_command   # the shell automaticlly runs each command stored in PROMPT_COMMAND 
                                #  before each prompt 
# you must wrap non visible characters in \[...\] or the cursor jumps to wrong position and backspace deltes weired parts.
#if [[ -n $git ]]; then GIT="($git)"; fi
#   main
# ⎇ feature-login
#·
