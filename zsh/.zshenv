# For Golang
GOPATH=~/go

export SUDO_EDITOR=nvim
export VISUAL=nvim
export EDITOR=nvim
# Use all processors when building
export MAKEFLAGS="-j$(nproc)"
#ignore .gitignore and include hidden files as well
#export FZF_CTRL_T_COMMAND='ag -U --hidden --ignore .git -g ""'

# For Android Studio
export _JAVA_AWT_WM_NONREPARENTING=1

typeset -U PATH path
path=("/usr/bin" "$path[@]" "$HOME/bin" "$GOPATH/bin")
export PATH
