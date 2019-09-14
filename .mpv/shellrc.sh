# shellrc.sc
# Source this to add additional shell features for mpv.

alias mpvnova='mpv --no-video'
alias mpvshuf='mpvnova --shuffle --loop inf'
alias mpvp='mpvshuf --playlist'

playcurrentdir() {
  mpvnova <(find "$PWD" -type f -follow)
}
alias pcd='playcurrentdir'

playdir() {
  if [[ $# == 0 ]]; then
    echo "playdir requires one or more directories on input."
  else
    if [[ $(uname) == "Linux" ]]; then READLINK=readlink;
    else READLINK=greadlink; fi
    mpvshuf --playlist <(find "$@" -type f -follow -exec $READLINK -f {} \;)
    unset READLINK
  fi
}
alias pd='playdir'