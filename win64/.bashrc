cd ~

export PS1="\[$(tput setaf 2)\]\u\[$(tput setaf 1)\]@\h\[$(tput setaf 3)\] \W\n\[$(tput sgr0)\]>\[$(tput sgr0)\] "

### Aliases
alias vi='nvim'
alias ll='ls -al --color=auto'

PROMPT_COMMAND='history -a'