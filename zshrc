emulate sh -c '. /data/data/com.termux/files/usr/etc/profile'
command_not_found_handler() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found $1
}
source $HOME/.plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ $- != *i* ]] && return

[ -z "$PS1" ] && return
# If not running interactively, don't do anything
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

autoload -U colors && colors

NEWLINE=$'\n'
PS1="%B %{$fg[cyan]%}[%M] %{$fg[yellow]%}- %{$fg[cyan]%}[%n] %{$fg[yellow]%}> %{$fg[green]%}%U[%~]%u%b${NEWLINE} %{$fg[green]%}(%T)-> %{$reset_color%}%b"

autoload -U compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
setopt extendedglob
_comp_options+=(globdots)

# Chroot into system 
if [ -z "${arch-chroot:-}" ] && [ -r /etc/arch-chroot ]; then
    arch-chroot=$(cat /etc/arch-chroot)
fi

force_color_prompt=yes

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=50
setopt appendhistory

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Color for alias
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi

alias ll='ls -lF --color=auto -lAF'
alias l='ls -l --color=auto'
alias ls='ls --color=auto'
alias netr="netstat -rn -f inet"
alias netp="netstat -ant | grep LISTEN"
alias netu="netstat -anut | grep udp"
alias neta="netstat -anotp"
# vim: set noet ft=zsh tw=4 sw=4 ff=unix

