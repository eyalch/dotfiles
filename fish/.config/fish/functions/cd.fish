function cd
    if count $argv > /dev/null
        builtin cd "$argv"
    else
        builtin cd ~
    end

    ls
end
