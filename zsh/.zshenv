# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

# Define Zim location
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
# }}} End configuration added by Zim install

typeset -U PATH path
path=("$path[@]" "$HOME/bin")
export PATH

export SUDO_EDITOR=nvim
export VISUAL=nvim
export EDITOR=nvim
#Use all 4 threads when building
export MAKEFLAGS="-j$(nproc)"
#ignore .gitignore and include hidden files as well
#export FZF_CTRL_T_COMMAND='ag -U --hidden --ignore .git -g ""'
