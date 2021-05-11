set -gx PATH "$HOME/.local/bin" $PATH
set -gx EDITOR "nvim"
set -gx VISUAL $EDITOR
set -gx BROWSER "firefox"

# Python
set -gx PIPENV_VENV_IN_PROJECT "true"
set -gx PYTHONDONTWRITEBYTECODE "true"

# Go
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH
set -gx PATH "/usr/local/go/bin" $PATH

# Yarn
set -gx PATH "$HOME/.yarn/bin" $PATH

# .NET Core
set -gx DOTNET_ROOT "$HOME/.dotnet"
set -gx MSBuildSDKsPath "$DOTNET_ROOT/sdk/"({$DOTNET_ROOT}/dotnet --version)/Sdks
set -gx PATH "$DOTNET_ROOT" $PATH
set -gx PATH "$DOTNET_ROOT/tools" $PATH
complete -f -c dotnet -a "(dotnet complete)"

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

# Go to previous directory using `-`
abbr -a -- - 'cd -'

# Remove greeting
set fish_greeting

# Starship prompt
if command -v starship > /dev/null
    starship init fish | source
else
    # Install Starship if not installed
    echo "Starship prompt (https://starship.rs/) isn't installed. Installing..."
    curl -fsSL https://starship.rs/install.sh | bash
end
