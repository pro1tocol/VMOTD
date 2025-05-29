#!/data/data/com.termux/files/usr/bin/env bash

[ $(basename $SHELL) == "zsh" ] && _PROFILE=$HOME/.zprofile || _PROFILE=$HOME/.profile
[ $(grep "$HOME/.motd/init.sh" $_PROFILE) != "0" ] && echo "$HOME/.motd/init.sh" >> $_PROFILE
