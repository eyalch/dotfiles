autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" vim-go
    " use a LSP client (coc.nvim) for some of vim-go's features
    let g:go_code_completion_enabled = 0
    let g:go_fmt_autosave = 0
    let g:go_gopls_enabled = 0
    let g:go_def_mapping_enabled = 0
    let g:go_doc_keywordprg_enabled = 0

    let g:go_metalinter_autosave = 1
    let g:go_echo_go_info = 1

    " Improve syntax highlighting
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_build_constraints = 1

" coc-go
    " add missing imports on save
    autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
