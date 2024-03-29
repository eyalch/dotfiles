" vim: foldmethod=indent

" Use <Space> as the leader
let mapleader = " "

" Use system clipboard
set clipboard+=unnamedplus

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Fix Y behavior
nmap Y y$

" Searching
    " turn off search highlight
    nnoremap <leader><space> :nohlsearch<CR>

    set ignorecase smartcase

" Install vim-plug if not found
let vim_plug_location = ($XDG_DATA_HOME ? $XDG_DATA_HOME : expand('~/.local/share')) . '/nvim/site/autoload/plug.vim'
if empty(glob(vim_plug_location))
  execute 'silent !curl -fLo ' . vim_plug_location . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
    call plug#begin(stdpath('data') . '/plugged')

    if exists('g:vscode')
    Plug 'asvetliakov/vim-easymotion'
    else
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'vim-airline/vim-airline'
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'tpope/vim-commentary'
    " Plug 'preservim/nerdcommenter'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'lambdalisue/fern.vim'
        Plug 'lambdalisue/nerdfont.vim'
        Plug 'lambdalisue/fern-renderer-nerdfont.vim'
        Plug 'lambdalisue/fern-git-status.vim'
        Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'lambdalisue/glyph-palette.vim'
    " Plug 'SirVer/ultisnips'
    Plug 'airblade/vim-gitgutter'
    Plug 'sheerun/vim-polyglot'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'luochen1990/rainbow'
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'
    Plug 'ryanoasis/vim-devicons' " needs to be last
    endif

    call plug#end()

if exists('g:vscode')

    map <Leader> <Plug>(easymotion-prefix)
    nmap s <Plug>(easymotion-s)

    " Turn on case-insensitive feature
    let g:EasyMotion_smartcase = 1

    nmap cqp :call VSCodeNotify('calva.jackIn')<CR>
    nmap cqq :call VSCodeNotify('calva.disconnect')<CR>
    nmap cpr :call VSCodeNotify('calva.loadFile')<CR>
    nmap cpR :call VSCodeNotify('calva.loadNamespace')<CR>
    nmap cpp :call VSCodeNotify('calva.evaluateSelection')<CR>
    nmap cqc :call VSCodeNotify('calva.evalCurrentFormInREPLWindow')<CR>

else

let g:plug_window = 'noautocmd vertical topleft new'

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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

" FZF
    " command! MyFiles execute (len(system('git rev-parse'))) ? ':Files' : ':GFiles --cached --others --exclude-standard'
    command! MyFiles execute (len(system('git rev-parse'))) ? ':Files' : ':GFiles'
    nnoremap <C-p> :MyFiles<CR>
    nnoremap <leader><C-p> :GFiles --others<CR>

" glyph-palette
    augroup my-glyph-palette
        autocmd! *
        autocmd FileType fern,nerdtree,startify call glyph_palette#apply()
    augroup END

" Rainbow
    " let g:rainbow_active = 1

" closetag.vim
    let g:closetag_filetypes = 'html,xhtml,phtml,vue'

runtime go.vim
runtime fern.vim
runtime coc.vim

endif
