
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

#PS1='[%n@%M %~]$ '

# Enable prompt theme "Pure"
fpath+=(~/.zsh/pure)
autoload -U promptinit; promptinit

# Customize Pure
zstyle :prompt:pure:path color green

prompt pure

# Customize Pure prompt
PURE_PROMPT_SYMBOL=[%n@%M]$

# Source zsh-syntax-highlighting 
# MUST BE END OF FILE
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
