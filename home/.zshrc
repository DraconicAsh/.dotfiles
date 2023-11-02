
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were copied from ~/.bashrc
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# End of lines copied from ~/.bashrc
alias lsblkc='lsblk -o name,mountpoint,label,size,fstype,uuid,partuuid'
alias editrc="$EDITOR ~/.zshrc && source ~/.zshrc"

alias :q='exit' # You're Welcome

# Aliases for C projects
DEFAULT_C='#include <stdio.h>

int main(){
    printf("Hello, world!\\n");
}'


cfile() { echo $DEFAULT_C > $1.c }

cnew() {
    DEFAULT_MESON="project('$1', 'c', version : '0.1', default_options : ['warning_level=3'])

sources = files([
    'src/$1.c',
])

executable('$1', sources)"

    mkdir $1
    cd $1
    mkdir src
    cfile src/$1
    mkdir subprojects
    echo "$DEFAULT_MESON" > meson.build
    meson setup build
    #meson init --name $1 --build
    git init
}

crelease() {
    dir=release
    if [ ! -d "$dir" ]; then
        meson setup $dir --buildtype=release
    fi
    meson compile -C $dir
}

alias cbuild='meson compile -C build'

# Source local file for machine specific options
source ~/.zsh-localrc

#PS1='[%n@%M %~]$ '

# Enable prompt theme "Pure"
fpath+=(~/.zsh/pure)
autoload -U promptinit; promptinit

# Customize Pure
# zstyle :prompt:pure:path color cyan

prompt pure

# Customize Pure prompt
PURE_PROMPT_SYMBOL=[%n@%M]$

# Source zsh-syntax-highlighting 
# MUST BE END OF FILE
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

[ -f "/home/ash/.ghcup/env" ] && source "/home/ash/.ghcup/env" # ghcup-env
