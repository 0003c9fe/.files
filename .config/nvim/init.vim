" Plugins
call plug#begin('~/.nvim/plugged')
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Vimtex / UltiSnips settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
highlight Conceal ctermfg=Yellow ctermbg=None
autocmd VimLeave *.tex !tex-clear %
autocmd FileType tex setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Line numbers
set number relativenumber

" Keep hidden buffers loaded
set hidden

" Case-insensitive search, unless contains caps
set ignorecase
set smartcase

" Show partial matches
set incsearch

" Highlight search matches
set hlsearch

" Indentation
set autoindent
set expandtab
set softtabstop=4

" Height below status bar
set cmdheight=1

" CursorHold timing
set updatetime=300

" Don't give |ins-completion-menu| messages
set shortmess+=c

" Highlight matching brackets
set showmatch
set matchtime=2

" Disable line wrapping
set nowrap

" Don't break words to wrap
set linebreak

" Keep cursor off the edge
set scrolloff=6
set sidescrolloff=6

" Popup menu for commands
set wildmenu

" Enable filetype features
filetype indent plugin on

" Backspace over whitespace
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

" Clipboard 
set clipboard=unnamedplus

set shortmess=F

set encoding=utf-8

set t_Co=256

set laststatus=2
