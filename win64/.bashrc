export PS1="\[$(tput setaf 2)\]\u\[$(tput setaf 1)\]@\h\[$(tput setaf 3)\] \W\n\[$(tput sgr0)\]>\[$(tput sgr0)\] "

### SSH boxes
export NCEVM=ncerndobedev4337.etv.nce.amadeus.net
export BHDEV=bhtv0223.os.amadeus.net
export BHUAT=bhuv0013.os.amadeus.net
export BHPRD=bhpv0310.os.amadeus.net



### HCL tools
export HCL_CLI_MODEL_HOME=C:/Workspace/tools/hcl-cli-model-1.3.1
export HCL_CLI_LOAD_HOME=C:/Workspace/tools/hcl-cli-load-1.3.4
export PATH=$PATH:$HCL_CLI_MODEL_HOME/bin:$HCL_CLI_LOAD_HOME/bin



### Aliases
alias vi='vim'
alias ll='ls -al --color=auto'


### Balabit
function balabit
{
    # Check if help is requested (must be first)
    if [ "$#" -eq 0 ] || [ "$1" = "-h" ]; then
        echo -e "Usage: $0 <target hostname/ip> [<ssh options>]"
        echo -e "puser is calculated automatically."
        return 1
    fi

    local _puser=$(echo "p$USERNAME" | cut -c1-8) # Use cut for compatibility with most shells

    local _host=${1}
    shift && true

    ssh "$@" -l gu=${_puser}@${_puser}@${_host} mucjmpint01.os.amadeus.net
}

function balaget
{
    # Check if help is requested (must be first)
    if [ "$#" -eq 0 ] || [ "$1" = "-h" ]; then
        echo -e "Usage: $0 <target hostname/ip> [<ssh options>]"
        echo -e "puser is calculated automatically."
        return 1
    fi

    local _puser=$(echo "p$USERNAME" | cut -c1-8) # Use cut for compatibility with most shells

    local _host=${1}
    local _source=${2}
    local _dest=${3}
    shift && true

    scp -r gu=${_puser}@${_puser}@${_host}@mucjmpint01.os.amadeus.net:${_source} ${_dest}
}

function balaput
{
    # Check if help is requested (must be first)
    if [ "$#" -eq 0 ] || [ "$1" = "-h" ]; then
        echo -e "Usage: $0 <target hostname/ip> [<ssh options>]"
        echo -e "puser is calculated automatically."
        return 1
    fi

    local _puser=$(echo "p$USERNAME" | cut -c1-8) # Use cut for compatibility with most shells

    local _host=${1}
    local _source=${2}
    local _dest=${3}
    shift && true

    scp -r ${_source} gu=${_puser}@${_puser}@${_host}@mucjmpint01.os.amadeus.net:${_dest}
}
