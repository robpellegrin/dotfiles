alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias clip='xsel -ib'
alias commit="git commit -m"
alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gcc='gcc -std=c11 -Wall -Wextra -pedantic -pthread'
alias grep='grep --color=auto'
alias lla='ls -lah'
alias ll='ls -lh'
alias ls='ls --color=always'
alias notify='aplay --quiet ~/.local/complete.wav'
alias pull="git pull"
alias push="git push"
alias py='python3'
alias rp='rsync --progress'
alias sensors='sensors -f'
alias vdir='vdir --color=auto'
alias rmtrash='mv -t ~/.local/share/Trash/files/'
alias git-update-all='find ~/github -maxdepth 1 -mindepth 1 -type d -exec bash -c "cd \"{}\" && echo \"Updating \$(basename \"{}\")\" && git pull" \;'

# Configure alias for update & upgrade, depending on the distro used.
if [ -f /etc/debian_version ]; then
    alias update="sudo apt update && apt list --upgradeable"
    alias upgrade="sudo apt upgrade"
elif [ -f /etc/redhat-release ]; then
    alias update="dnf check-update"
    alias upgrade="sudo dnf upgrade"
else
    echo "Unknown distribution"
fi
