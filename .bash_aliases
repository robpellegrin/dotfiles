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
if [ -f /usr/bin/eza ]; then
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
elif hostnamectl | grep -i "opensuse" > /dev/null 2>&1; then
    # For openSUSE
    pkg_update="sudo zypper refresh && zypper list-updates"
    pkg_upgrade="sudo zypper update"
fi

# Check if Flatpak is installed and modify commands to include Flatpak updates
if command -v flatpak &> /dev/null; then
    pkg_update="$pkg_update && flatpak remote-ls --updates" # List Flatpak updates
    pkg_upgrade="$pkg_upgrade && sudo flatpak update -y" # Apply Flatpak updates
fi

# Create aliases for update and upgrade commands
alias update="$pkg_update"
alias upgrade="$pkg_upgrade"

# This function moves files to the trash bin
move_to_trash() {
    local trash_dir="/home/$USER/.local/share/Trash/files"
    local info_dir="/home/$USER/.local/share/Trash/info"
    local current_time=$(date +%Y-%m-%dT%H:%M:%S)
    
    # Loop through each argument    
    for item in "$@"; do
        if [[ -e "$item" ]]; then
            # Get the base name and the full path
            local base_name=$(basename "$item")
            local file_name="${base_name}-${current_time}"
            local target="$trash_dir/$file_name"

            # Move the item to the trash
            mv "$item" "$target"

            # Record info about the trashed item (optional)
            echo "[Trash Info]" > "$info_dir/$file_name.trashinfo"
            echo "Path=$(realpath "$item")" >> "$info_dir/$file_name.trashinfo"
            echo "DeletionDate=$current_time" >> "$info_dir/$file_name.trashinfo"

            # echo "Moved '$item' to trash as '$target'."
        else
            echo "Error: '$item' does not exist."
        fi
    done
}

alias trash='move_to_trash'
