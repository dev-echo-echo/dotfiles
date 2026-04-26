
#
# ~/.bashrc
#
###################################
# my own territory  ###############
###################################
# 0. vim mode
set -o vi   #switch line editing system
bind -m vi-command -r "m"    # remove binding
bind -m vi-command -r "l"    # remove binding
bind -m vi-command -r "j"    # remove binding
bind -m vi-command -r "k"    # remove binding
bind -m vi-command '"m": forward-char' 
bind -m vi-command '"j": backward-char'
bind -m vi-command '"l": next-history'
bind -m vi-command '"k": previous-history'

# 0.1 theme
source ~/.theme.bash 
 
#1. aliases 
alias cpp="sudo cpupower frequency-set -g performance"
alias ald="adb shell ls -tr /sdcard/Download"
alias se="source ~/myhome/chatbot/.venv/bin/activate"

alias .="cd ./"                 # current dir
alias ..="cd ../"               # go back on level
alias ...="cd ../../"           # go back two levels
alias ....="cd ../../../"       # go back thre levels
alias .....="cd ../../../../"   # go back four levels

# for a specific city: curl wttr.in/Paris
alias wtr='curl wttr.in'   
# connect with headphones.
alias bch="bluetoothctl connect 41:42:96:C5:E7:99"
# xremap
alias xrc="xremap .config/xremap/config.yml"
alias sky="sudo ~/myhome/transformer/wheel_improved"
alias nicescore="ps -o pid,ni,cmd "

alias camera="qv4l2"
alias shazam="songrec"
alias music="termusic"
alias insta="instagram-cli"

#2. this is raleted to python all of it
# The 'export' command makes the variable available to all child processes in the current shell session
export PYTHONPATH=~/myhome  # Set the PYTHONPATH environment variable to ~/MyHome

# 3. todo

#export GDK_SCALE=1.5
#export QT_SCALE_FACTOR=2

# What this does:
# 1. PYTHONPATH is an environment variable that tells Python where to look for modules/packages.
# 2. By setting PYTHONPATH to ~/MyHome, you're telling Python to also look in this directory 
#    when trying to import modules (like 'chatboot') from your code.
# 3. Normally, Python looks in standard locations like the standard library and the current directory.
# 4. With PYTHONPATH set to ~/MyHome, Python will also check this directory, enabling imports like:
#    from chatboot.utils.colors import gradient
# 5. This is useful for working with a project structure that may not be in the default import paths.

#neofetch
       ########## to display a image in the terminal ############
                     #############################
#fastfetch
#export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json

# --place <width>x<height>@<left>x<top>
#kitty +kitten icat --place 15x10@2x1 "/home/echo/Pictures/RDT_20250724_1624405984748114768698806.jpg"
#for i in 1 2 3 4 5 6 7 ; do
#	echo 
#done

#chafa  -g 3x3 -s 20x15 "/home/echo/Pictures/hei-hei-the-rooster-chief-tui-tamatoa-clip-art-pua-kumbu-cc69cc28f6e33f59cf28ed89b481675d (1).png"
# start tty-clock
#if ! pgrep -x tty-clock > /dev/null; then  # ! means not , pgrep looks for a process if found returns 0 if not returns another number
					# > take the output of commad on left passing it to command on right
					# /dev/null is jsut a trash where you get rid of unwanted data
#        tty-clock	
#fi

###################################
###################################

#export WAYLAND_DISPLAY=wayland-1
#export PATH="$PATH:~/cfiles"  # to add a custom path to echo$PATH but it is not working , actualy is it working
export PATH="$PATH:~/Binaries"  # use binaries from anywhere
#export PATH="$PATH:~/Games"  # use binaries from anywhere
#export PATH="$PATH:~/coding_island"
export PATH="$PATH:~/myhome/chatbot"
#export PATH="$PATH:~/myhome/review_time"
export PATH="$PATH:~/myhome/calmsea/"
# cargo is rust package manager.
export PATH="$PATH:/home/echo/.cargo/bin"


# If not running interactively, don't do anything



#[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return ;;
esac

# Path to the bash it configuration
export BASH_IT="/home/echo/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location "$BASH_IT"/themes/
#export BASH_IT_THEME='envy'   #cooperkid   primer purity envy 90210  brainy95%  envy100%  iterate100%  ##kitsune100%

# Some themes can show whether `sudo` has a current token or not.
# Set `$THEME_CHECK_SUDO` to `true` to check every prompt:
#THEME_CHECK_SUDO='true'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to the location of your work or project folders
#BASH_IT_PROJECT_PATHS="${HOME}/Projects:/Volumes/work/src"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
#source "$BASH_IT"/bash_it.sh


# starship 
#eval "$(starship init bash)"

#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"   

# uv
export PATH="/home/echo/.local/bin:$PATH"
