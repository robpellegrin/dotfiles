##
# @file:   .bashrc
# @author: Rob Pellegrin 
#
##

# Character codes
#  = U+E0A0
# λ = U+03BB
# ▰ = U+25B0
# ▱ = U+25B1
# ❯ = U+276F

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

##############################
# Begin Shell Customizations #
##############################

export TERM=xterm-256color

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Set default editor to nvim
export EDITOR=vim

custom_files=(
  .aliases
  .cdpath
  .custom_path
)

for file in "${custom_files[@]}"; do
  [[ -f "$HOME/$file" ]] && source "$HOME/$file"
done

# Enable programmable completion if available
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
  fi
fi
#############################
# Minimal Elastic Job Bar
#############################

# Count running background jobs
bg_count() {
    jobs -p 2>/dev/null | wc -l
}

bg_bar() {
    local n
    n=$(bg_count)
    local bar=""

    if (( n == 0 )); then
        # Show a single empty block if no jobs
        bar="▱"
    else
        for ((i=0;i<n;i++)); do
            bar+="▰"
        done
    fi

    echo "$bar"
}

# Color based on number of jobs
bg_color() {
    local n
    n=$(bg_count)
    if (( n == 0 )); then
        echo 36   # cyan
    elif (( n < 3 )); then
        echo 33   # yellow
    else
        echo 31   # red
    fi
}

git_status() {
    local branch dirty_count ahead behind

    # Get current branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

    # Dirty file count
    dirty_count=$(git status --porcelain 2>/dev/null | wc -l)

    # Ahead / behind counts (relative to upstream)
    read ahead behind < <(
        git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null
    )

    # Build status string
    local status=" $branch"

    # Dirty files
    if (( dirty_count > 0 )); then
        status+=" +$dirty_count"
    fi

    # Commits ahead / behind
    if (( ahead > 0 )); then
        status+=" ↑$ahead"
    fi
    if (( behind > 0 )); then
        status+=" ↓$behind"
    fi

    # Color logic
    if (( dirty_count > 0 )); then
        echo -e "\[\e[31m\]$status\[\e[0m\]"   # red if dirty
    else
        echo -e "\[\e[32m\]$status\[\e[0m\]"   # green if clean
    fi
}

PROMPT_COMMAND='
  # Progress bar
  PS1="\[\e[$(bg_color)m\]$(bg_bar)\[\e[0m\] "

  # username@hostname
  #PS1+="\u@\h "

  # Current directory
  PS1+="\[\e[2m\]\w\[\e[0m\] "

  # Git status
  PS1+="$(git_status)\n"

  # Prompt symbol
  PS1+="\[\e[1;35m\]λ\[\e[0m\] "
'

