# XDG base directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# gnupg
export GNUPGHOME=$XDG_DATA_HOME/gnupg

# jupyter / ipython
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter

# less (disabled)
export LESSHISTFILE=-

# mathematica
#export MATHEMATICA_USERBASE=$XDG_CONFIG_HOME/mathematica

# neovim
export EDITOR=nvim

# path
export PATH=$PATH:/home/jack/.local/bin

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
