call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

set number
set shortmess=F
set encoding=utf-8
set ignorecase
set smartcase
set incsearch
set autoindent
set expandtab
set softtabstop=4
set backspace=indent,eol,start
set hlsearch
set linebreak
set wrap
set wildmenu
let &t_Co=16
map <F5> :RMarkdown pdf<CR>

highlight Conceal ctermfg=Yellow ctermbg=None
autocmd VimLeave *.tex !tex-clear %
autocmd FileType tex setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
