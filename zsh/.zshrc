export ZSH=$HOME/.oh-my-zsh

# Install Starship prompt if not installed
if ! command -v starship &> /dev/null; then
    echo "Starship prompt (https://starship.rs/) isn't installed. Installing..."
    curl -fsSL https://starship.rs/install.sh | bash
fi

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(django docker docker-compose httpie sudo)
# Some potentially useful plugins: dotenv

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Auto Suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Run `ls` on every directory change
function chpwd() {
    emulate -L zsh
    ls
}

# Aliases
alias rm="trash"
alias exa="exa --git"
alias ls="exa"
alias l="exa -la"
alias ll="exa -l"
alias grep="grep --color=auto"
alias D="$HOME/Downloads"
alias P="$HOME/Projects"
alias icat="kitty +kitten icat"
alias cat="bat"
alias v="nvim"
alias gst="git st"
alias glg="git lg"

if [ -n "$TMUX" ]; then
    export TERM="screen-256color"
fi

eval "$(starship init zsh)"
