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

# Ignore duplicates and lines with leading whitespace.
export HISTCONTROL=ignoreboth

HISTIGNORE="clear"
HISTIGNORE="$HISTIGNORE:ls:ll"
HISTIGNORE="$HISTIGNORE:cd:cd *"
HISTIGNORE="$HISTIGNORE:git *"
HISTIGNORE="$HISTIGNORE:gs:ga *:gc *:gd"

export HISTIGNORE

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

git_prompt() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch ahead behind dirty_count branch_color

    branch=$(git symbolic-ref --short HEAD 2>/dev/null \
          || git rev-parse --short HEAD 2>/dev/null)

    # Count modified/staged files (ignore untracked for speed)
    dirty_count=$(git status --porcelain -uno 2>/dev/null | wc -l)

    read ahead behind < <(
        git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null
    )

    (( dirty_count > 0 )) && branch_color=31 || branch_color=32

    printf "\[\e[%sm\] %s" "$branch_color" "$branch"

    (( dirty_count > 0 )) && printf " +%d" "$dirty_count"
    (( ahead > 0 )) && printf " ↑%d" "$ahead"
    (( behind > 0 )) && printf " ↓%d" "$behind"

    printf "\[\e[0m\]"
}

build_prompt() {
    PS1=""
    PS1+="\[\e[$(bg_color)m\]$(bg_bar)\[\e[0m\] "
    PS1+="\[\e[2m\]\w\[\e[0m\] "
    PS1+="$(git_prompt)\n"
    PS1+="\[\e[1;35m\]λ\[\e[0m\] "
}

PROMPT_COMMAND+=(build_prompt)

