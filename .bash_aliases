alias ...="cd ../.."
alias ..="cd .."
alias clip='xsel -ib'
alias cp="cp -i"
alias df="df -h"
alias dir='dir --color=auto'
alias dirs='dirs -v'
alias free="free -h --mega"
alias ga="git add"
alias gcc='gcc -Wall -Wextra -pedantic'
alias gc="git commit"
alias gp="git pull"
alias gr="git restore"
alias grep='grep --color=auto'
alias gs="git status"
alias lla='ls -lah'
alias ll='ls -lh'
alias ls='ls --color=always'
alias notify='aplay --quiet ~/.local/complete.wav'
alias push="git push"
alias py='python3'
alias rp='rsync --progress'
alias sensors='sensors -f'
alias vdir='vdir --color=auto'
alias docker='podman'

# Only create an alias for bat if it is installed.
if [ -f /usr/bin/bat ]; then
  alias cat="bat"
fi

# Only create an alias for btop if it is installed.
if [ -f /usr/bin/btop ]; then
  alias htop="btop"
fi

# Use eza as the ls command, if it is installed.
if [ -f /usr/bin/eza ] || [ -f /home/$(whoami)/.cargo/bin/eza ]; then
  export EZA_FORMAT="selinux=."
  alias ls='eza --icons --hyperlink'
  alias ll='ls -l'
  alias lla='ls -al'
fi

# Detect the distribution and set package management commands
if [ -f /etc/debian_version ]; then
    # For Debian-based systems
    pkg_update="sudo apt update && apt list --upgradable"
    pkg_upgrade="sudo apt upgrade -y"
elif [ -f /etc/redhat-release ]; then
    # For Red Hat-based systems
    pkg_update="dnf check-update"
    pkg_upgrade="yes | sudo dnf upgrade"
fi

# Check if Flatpak is installed and modify commands to include Flatpak updates
if command -v flatpak &> /dev/null; then
    pkg_update="$pkg_update && flatpak update" # List Flatpak updates
    pkg_upgrade="$pkg_upgrade && sudo flatpak update -y" # Apply Flatpak updates
fi

# Create aliases for update and upgrade commands
alias update="$pkg_update"
alias upgrade="$pkg_upgrade"
