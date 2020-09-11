#!/bin/bash

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export TERMINAL="kitty"
export BROWSER="firefox"
export PIPENV_VENV_IN_PROJECT=true
export PYTHONDONTWRITEBYTECODE=true

# Golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Yarn global
export PATH="$HOME/.yarn/bin:$PATH"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;35m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
