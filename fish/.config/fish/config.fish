set -gx PATH "$HOME/.local/bin" $PATH
set -gx EDITOR "nvim"
set -gx VISUAL $EDITOR
set -gx BROWSER "firefox"

# Python
set -gx PYTHONDONTWRITEBYTECODE "true"

# pyenv
set -gx PATH "$HOME/.pyenv/bin" $PATH
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# Go
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH
set -gx PATH "/usr/local/go/bin" $PATH

# Yarn
set -gx PATH "$HOME/.yarn/bin" $PATH

# .NET Core
# set -gx DOTNET_ROOT "$HOME/.dotnet"
# set -gx MSBuildSDKsPath "$DOTNET_ROOT/sdk/"({$DOTNET_ROOT}/dotnet --version)/Sdks
# set -gx PATH "$DOTNET_ROOT" $PATH
# set -gx PATH "$DOTNET_ROOT/tools" $PATH
# complete -f -c dotnet -a "(dotnet complete)"

# Doom Emacs
set -gx PATH "$HOME/.emacs.d/bin" $PATH

# Scripts
set -gx PATH "$HOME/scripts" $PATH

# Aliases
alias cat="bat"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias rm="trash"
alias exa="exa --git"
alias ls="exa"
alias l="exa -la"
alias ll="exa -l"
alias grep="echo 'Use ripgrep!'"
alias gst="git st"
alias glg="git lg"
alias D="cd $HOME/Downloads"
alias P="cd $HOME/Projects"
alias e="emacs"

# Go to previous directory using `-`
abbr -a -- - 'cd -'

# Remove greeting
set fish_greeting

# Starship prompt
starship init fish | source
