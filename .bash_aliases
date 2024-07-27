alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias clip='xsel -ib'
alias commit="git commit -m"
alias dir='dir --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='fgrep --color=auto'
alias gcc='gcc -std=c11 -Wall -Wextra -pedantic -pthread'
alias git-update-all='find ~/github -maxdepth 1 -mindepth 1 -type d -exec bash -c "cd \"{}\" && echo \"Updating \$(basename \"{}\")\" && git pull" \;'
alias grep='grep --color=auto'
alias lla='ls -lah'
alias ll='ls -lh'
alias ls='ls --color=always'
alias notify='aplay --quiet ~/.local/complete.wav'
alias pull="git pull"
alias push="git push"
alias py='python3'
alias rmtrash='mv -t ~/.local/share/Trash/files/'
alias rp='rsync --progress'
alias sensors='sensors -f'
alias vdir='vdir --color=auto'

# Detect the distribution and set package management commands
if [ -f /etc/debian_version ]; then
    # For Debian-based systems
    pkg_update="sudo apt update && apt list --upgradable"
    pkg_upgrade="sudo apt upgrade -y"
elif [ -f /etc/redhat-release ]; then
    # For Red Hat-based systems
    pkg_update="dnf check-update"
    pkg_upgrade="sudo dnf upgrade"
else
    # If the distribution is not recognized
    echo "Unknown distribution"
fi

# Check if Flatpak is installed and modify commands to include Flatpak updates
if command -v flatpak &> /dev/null; then
    pkg_update="$pkg_update && flatpak remote-ls --updates" # List Flatpak updates
    pkg_upgrade="$pkg_upgrade && flatpak update -y" # Apply Flatpak updates
fi

# Create aliases for update and upgrade commands
alias update="$pkg_update"
alias upgrade="$pkg_upgrade"
