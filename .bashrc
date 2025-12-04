export PS1="\[$(tput setaf 2)\]\u\[$(tput setaf 1)\]@\h\[$(tput setaf 3)\] \W\n\[$(tput sgr0)\]>\[$(tput sgr0)\] "
PROMPT_COMMAND='history -a'



## Aliases
alias vi='vim'
alias ll='ls -al --color=auto'
alias wu='winget upgrade --all --include-unknown'
