# Detect the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    OS="other"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh




#add mactex to path
if [[ "$OSTYPE" == "darwin"* ]]; then
	export PATH="/Library/TeX/texbin:$PATH"
fi

#aliases

source ~/.config/zsh/.nasAlias

alias wakeMain='wakeonlan $NAS_MAIN'
alias wakeBackup='wakeonlan $NAS_BACKUP'

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias kssh='kitten ssh'
    alias sshPi5='kitten ssh tom-pi-5.local'
    alias update='brew update && brew upgrade'

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    
    OS_ID=$(grep '^ID=' /etc/os-release | cut -d'=' -f2 | tr -d '"')

    if [ "$OS_ID" = "ubuntu" ]; then
    	alias update='sudo apt-get update && sudo apt-get upgrade'

    elif [ "$OS_ID" = "debian" ]; then
    	alias update='sudo apt-get update && sudo apt-get upgrade'
    
    elif [ "$OS_ID" = "kali" ]; then
        
    fi
fi

#antigen setup 
source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Syntax highlighting/autocomplete plugins
antigen bundle marlonrichert/zsh-autocomplete@main
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#unused configs, move higher up in file when changing

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode auto

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# HIST_STAMPS="mm/dd/yyyy"

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi