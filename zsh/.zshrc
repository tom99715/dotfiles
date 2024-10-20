# Detect the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    OS="other"
fi

# Set paths and configurations based on the detected OS
case $OS in
    linux)
        # Paths for Linux systems (Raspberry Pi OS, Ubuntu, Kali)
        HOMEBREW_PREFIX="$HOME/.linuxbrew"
        ZSH_AUTOCOMPLETE_PATH="$HOME/.zsh/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
        POWERLEVEL10K_PATH="$HOME/.zsh/share/powerlevel10k/powerlevel10k.zsh-theme"
        ZSH_SYNTAX_HIGHLIGHTING_PATH="$HOME/.zsh/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
        ;;
    macos)
        # Paths for macOS
        HOMEBREW_PREFIX="/opt/homebrew"
        ZSH_AUTOCOMPLETE_PATH="$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
        POWERLEVEL10K_PATH="$HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme"
        ZSH_SYNTAX_HIGHLIGHTING_PATH="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
        ;;
    *)
        echo "Unsupported OS detected. Some features may not work correctly."
        ;;
esac

# Enable zsh-autocomplete permanently
if [ -f "$ZSH_AUTOCOMPLETE_PATH" ]; then
    source "$ZSH_AUTOCOMPLETE_PATH"
else
    echo "zsh-autocomplete not found at $ZSH_AUTOCOMPLETE_PATH"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Example aliases
alias kssh="kitten ssh"

# Enable Powerlevel10k theme
if [ -f "$POWERLEVEL10K_PATH" ]; then
    source "$POWERLEVEL10K_PATH"
else
    echo "Powerlevel10k theme not found at $POWERLEVEL10K_PATH"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load zsh-syntax-highlighting plugin
if [ -f "$ZSH_SYNTAX_HIGHLIGHTING_PATH" ]; then
    source "$ZSH_SYNTAX_HIGHLIGHTING_PATH"
else
    echo "zsh-syntax-highlighting not found at $ZSH_SYNTAX_HIGHLIGHTING_PATH"
fi

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Additional custom configuration can go below
source ~/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
