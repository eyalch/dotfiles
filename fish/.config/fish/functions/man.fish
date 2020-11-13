function man --description "wrap the 'man' manual page opener to use color in formatting"
  # start of bold:
  set -x LESS_TERMCAP_md (set_color --bold red)
  # end of all formatting:
  set -x LESS_TERMCAP_me (set_color normal)

  # start of standout (inverted colors):
  set -x LESS_TERMCAP_so (set_color --reverse)
  # end of standout (inverted colors):
  set -x LESS_TERMCAP_se (set_color normal)

  # start of underline:
  set -x LESS_TERMCAP_us (set_color --underline)
  # end of underline:
  set -x LESS_TERMCAP_ue (set_color normal)

  command man $argv
end
