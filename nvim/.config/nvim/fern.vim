let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1           " Show hidden files
let g:fern#drawer_width = 40
let g:fern#disable_default_mappings = 1

map <C-b> :Fern . -drawer -toggle -reveal=%<CR>

" Use fern instead of netrw
    " Disable netrw
    let g:loaded_netrw             = 1
    let g:loaded_netrwPlugin       = 1
    let g:loaded_netrwSettings     = 1
    let g:loaded_netrwFileHandlers = 1

    augroup my-fern-hijack
        autocmd!
        autocmd BufEnter * ++nested call s:hijack_directory()
    augroup END

    function! s:hijack_directory() abort
        let path = expand('%:p')
        if !isdirectory(path)
            return
        endif
        bwipeout %
        execute printf('Fern %s', fnameescape(path))
    endfunction
