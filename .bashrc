##
# @file:   .bashrc
# @author: Rob Pellegrin 
#
##

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

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Set default editor to nvim
export EDITOR=vim

# Enable VI mode
set -o vi

# Bind 'jj' to Esc in insert mode
bind 'in vi-insert: "jj": "^["'

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

