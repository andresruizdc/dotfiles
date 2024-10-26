if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_env_variables ]; then
	. ~/.bash_env_variables
fi

# Set default editor to vim
export EDITOR=vim

# include path
export PATH=/usr/include:"$PATH"
export PATH=/usr/sbin:"$PATH"
export PATH=/usr/local/bin:"$PATH"
# Path for user scripts
export PATH=~/bin:"$PATH"
# Path for Android SDK
export PATH=/usr/lib/android-sdk/cmdline-tools/bin:"$PATH"
export PATH=/usr/lib/android-sdk/tools:"$PATH"
# Path for opt
export PATH=/opt/minecraft/bin:"$PATH"
export PATH=/opt/pycharm/bin:"$PATH"
export PATH=/opt/idea/bin:"$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
export PS1='\[\033[1;35m\]<\u@\h \[\033[1;34m\]\w\[\033[1;35m\]>\[\033[0;31m\] \$'
# Run git prompt script to have git branch on cli prompt
source ~/.gitstatus/gitstatus.prompt.sh
PS1+='\n\[\033[1;36m\]>\[\033[0m\] '
export PS2='\[\033[0;36m\]> '

# Cargo - Rust package manager
source "$HOME/.cargo/env"

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# RBENV - Ruby Version Manager and Environment
eval "$(rbenv init - bash)"

# Teamocil completion
complete -W "$(teamocil --list)" teamocil

# SDKMAN - Java Version Manager
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andrdc/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andrdc/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andrdc/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andrdc/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
