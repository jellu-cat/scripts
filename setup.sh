PWD="$(pwd)"

LOCALBIN=$HOME/.local/bin
mkdir -p $LOCALBIN 

ln -s $PWD/bin/* $HOME/.local/bin
ln -s $PWD/bspswallow/* $HOME/.local/bin
