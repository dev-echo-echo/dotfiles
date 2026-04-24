source .ombre.sh
source .colors.sh

function prompt_command() {
    user_name=$(whoami)
    ombre "$user_name" 
    user="$gradient"
    current_dir="${PWD/#"$HOME"/"~"}"
    ombre "$current_dir"
    dir="$gradient"
    current_git_branch=$(git branch --show-current 2>/dev/null) 
    git=$(if [[ -n "$current_git_branch" ]]; then echo " [ $current_git_branch]"; fi )
	env=$(if [[ -n "$VIRTUAL_ENV" ]]; then echo " ($(basename $VIRTUAL_ENV)🐍)"; fi)
	PS1="\n╭─\[$user\]\[$PINK\]$git\[$RESET$ORANGE\]$env\[$RESET \[$dir\] \n╰──> "
}

PROMPT_COMMAND=prompt_command 
