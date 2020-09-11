" vim: foldmethod=indent

" Plugins
    call plug#begin(stdpath('data') . '/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'vim-airline/vim-airline'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'SirVer/ultisnips'
    Plug 'airblade/vim-gitgutter'
    Plug 'sheerun/vim-polyglot'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ryanoasis/vim-devicons' " needs to be last
    call plug#end()

    let g:plug_window = 'noautocmd vertical topleft new'

" Use <Space> as the leader
let mapleader = " "

" Use system clipboard
set clipboard+=unnamedplus

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Fix Y behavior
nmap Y y$

" Trim whitespace from lines' ends on save
autocmd BufWritePre * :call TrimWhitespace()
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Press j+k simultaneously to exit insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" Enable mouse
set mouse=a

set termguicolors

" Vim menus autocomletion
set wildmode=longest,list,full

colorscheme dracula

" Display
    set number      " show line numbers
    set cursorline  " highlight current line
    set showmatch   " highlight matching [{()}]
    set scrolloff=5  " always keep at least 5 visible lines

" Status
    set noshowmode

    " vim-airline
        let g:airline_theme = 'dracula'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'

" Indentation
    set tabstop=4      " number of visual spaces per TAB
    set softtabstop=4  " number of spaces in tab when editing
    set shiftwidth=4   " indent by 4 spaces when using >>, <<, == etc
    set expandtab      " tabs are spaces

" Searching
    " turn off search highlight
    nnoremap <leader><space> :nohlsearch<CR>

    set ignorecase smartcase

" Folding
    set nofoldenable
    set foldmethod=syntax

" Splits
    " Use ctrl-[hjkl] to navigate splits
    vnoremap <C-h> <Esc><C-w>h
    vnoremap <C-j> <Esc><C-w>j
    vnoremap <C-k> <Esc><C-w>k
    vnoremap <C-l> <Esc><C-w>l
    inoremap <C-h> <Esc><C-w>h
    inoremap <C-j> <Esc><C-w>j
    inoremap <C-k> <Esc><C-w>k
    inoremap <C-l> <Esc><C-w>l

    " Open new split panes to right and bottom
    set splitbelow splitright

" netrw
    let g:netrw_banner = 0          " Hide annoying 'help' banner
    let g:netrw_liststyle = 3       " Use tree view
    let g:netrw_winsize = 25        " Smaller default window size
    let g:netrw_browse_split = 4    " Open files in previous window
    let g:netrw_altv = 1

" coc.nvim
	let g:coc_global_extensions = [
        \ "coc-css",
        \ "coc-emmet",
        \ "coc-eslint",
        \ "coc-go",
        \ "coc-html",
        \ "coc-json",
        \ "coc-markdownlint",
        \ "coc-prettier",
        \ "coc-python",
        \ "coc-sh",
        \ "coc-spell-checker",
        \ "coc-svelte",
        \ "coc-tsserver",
        \ "coc-yaml",
        \ ]

    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

    " Setup the Prettier command
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Go
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

" FZF
    command! CtrlP execute (len(system('git rev-parse'))) ? ':Files' : ':GFiles'
    nnoremap <C-p> :CtrlP<CR>

    nnoremap <leader><C-p> :Files<CR>

" NERDTree
    " Open NERDTree when opening a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

    " If more than one window and previous buffer was NERDTree, go back to it.
    " autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

    " Toggle NERDTree
    map <C-n> :NERDTreeToggle<CR>

    " Show hidden files (dot files)
    let NERDTreeShowHidden=1

    " Use some rare character to disable jumping to next/prev siblings since
    " their keybindings conflict with mine.
    let g:NERDTreeMapJumpNextSibling="☻"
    let g:NERDTreeMapJumpPrevSibling="☺"

    " nerdtree-git-plugin
        let g:NERDTreeGitStatusUseNerdFonts = 1
