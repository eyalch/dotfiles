export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_BATTERY_SHOW=false
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

# Prompt to attach to the default tmux session; create it if it doesn't exist
if [ -z "$TMUX" ]; then
    TMUX_DEFAULT_SESSION="default"

    tmux has-session -t "$TMUX_DEFAULT_SESSION" 2>/dev/null
    if [ "$?" -eq 0 ]; then
        echo -n "Attach to default tmux session? (Y/n) "
        read answer

        if [[ "$answer" == "Y" || "$answer" == "y" || "$answer" == "" ]]; then
            tmux attach-session -t "$TMUX_DEFAULT_SESSION"
        fi
    else
        tmux new-session -A -s "$TMUX_DEFAULT_SESSION"
    fi
fi
