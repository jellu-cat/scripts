#!/bin/sh

############################################################

# Script Name     :   Autostart
# Description     :   WM-agnostic script for setting up
#                     the environment
# Args            :   none
# Author          :   Jellu Cat

############################################################

#############
# Functions #
#############

# Runs a program only if it isn't running
run (){
    local name=$1

    if (pidof "$name" > /dev/null); then
        echo "$name already running!"
    else
        echo "Running $name"
       `$name` &
    fi
}

# Runs a program killing any other instances, useful to restart after
# changing the configuration files
initialize (){
    local name=$1

    if (pidof "$name" > /dev/null); then
        killall "$name"
        echo "$name killed"
    fi

    if [ "$name" = "sxhkd" ]; then
        sxhkd -c ~/.config/sxhkd/sxhkdrc &
        sxhkd -c ~/.config/sxhkd/bsphkd &
        echo "Running $name"
    else
       `$name` &
        echo "Running $name"
    fi
}

setxkbmap latam &

nitrogen --restore &

# Running some essential programs
run compton
run redshift
initialize sxhkd
run copyq

# Somehow, if any change to xmodmap is to be done, the commands needs
# to be one of the last
xmodmap ~/.Xmodmap &

# The status bar is the last thing loaded
bash ~/.config/polybar/forest/launch.sh
