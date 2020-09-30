" Plugins
call plug#begin('~/.nvim/plugged')
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'doums/darcula'
call plug#end()

" CoC settings
" Cycle completion options
inoremap <silent><expr> <TAB>
                        \ pumvisible() ? "\<C-n>" :
                        \ <SID>check_back_space() ? "\<TAB>" :
                        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Open completion menu
inoremap <silent><expr> <c-space> coc#refresh()
" Accept completion option
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Fugitive settings
nnoremap <silent> <Leader>ga :G add %:r\.*<CR>
nnoremap <Leader>gc :silent G commit -m ""<Left>
nnoremap <silent> <Leader>gp :G push<CR>
nnoremap <silent> <Leader>gs :G status<CR>
" Sneak settings
let g:sneak#s_next = 1
" Vimtex / UltiSnips settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_view_forward_search_on_start=0
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
let g:UltiSnipsExpandTrigger='�'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
" Clear extra files
autocmd VimLeave *.tex !tex-clear %
" Spell checker/corrector
autocmd FileType tex setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Statusline settings
" Always show
set laststatus=2
" Remove vims and shorten lightlines mode indicator
set noshowmode
" General settings
let g:lightline = {
      \ 'colorscheme': 'selenized_black',
      \ 'active': {
      \   'left':  [ [ 'mode' ],
      \              [ 'gitbranch' ],
      \              [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'percent' ] ]
      \ },
      \ 'component_function': {
      \ 'gitbranch': 'FugitiveHead'
      \ },
      \ 'mode_map': {
      \ 'n' : 'NOR',
      \ 'i' : 'INS',
      \ 'R' : 'REP',
      \ 'v' : 'VIS',
      \ 'V' : 'VLN',
      \ "\<C-v>" : 'VBL',
      \ 'c' : 'COM',
      \ },
      \ }

" Theming
" Colourschemes
set termguicolors
set background=dark
colorscheme selenized_bw
" CoC menu
autocmd ColorScheme * highlight Pmenu guibg=DarkGrey guifg=black
autocmd ColorScheme * highlight PmenuSel guibg='#70b433' guifg=black

" Vimtex conceal
autocmd ColorScheme * highlight Conceal guibg=none guifg=lightred

" Always show signcolumns
set signcolumn=yes
highlight clear SignColumn

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

" Clear search highlighting
nnoremap <silent> <esc> :nohlsearch<CR>

" Indentation
set autoindent
set expandtab
set softtabstop=4

" Height below status bar
set cmdheight=1

" CursorHold timing
set updatetime=300

" Don't give |ins-completion-menu| messages
set shortmess=F
set shortmess+=c

" Highlight matching brackets
set showmatch
set matchtime=2

" Don't break words to wrap
set linebreak

" Keep cursor off the edge
set scrolloff=6
set sidescrolloff=6

" Popup menu for commands
set wildmenu

" Switch behaviour of g on s
set gdefault

" Enable filetype features
filetype indent plugin on

" Backspace over whitespace
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

" Clipboard
set clipboard=unnamedplus

" No auto-comment on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Sensible split directions
set splitbelow splitright

" I forgot to edit with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically remove trailing whitespace and newlines.
autocmd BufWritePre * silent %s/\s\+$//e | norm! ``
autocmd BufWritePre * silent %s/\n\+\%$//e | norm! ``

" Misc
set nocompatible
set encoding=utf-8
set t_Co=256
