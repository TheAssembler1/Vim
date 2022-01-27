syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=!/.vim/undodir
set undofile
set incsearch
set laststatus=2
set noshowmode
set cursorline

highlight LineNr ctermfg=grey ctermbg=black
highlight CursorLineNR ctermfg=white ctermbg=black
highlight CursorLine cterm=bold ctermbg=8 ctermfg=NONE

call plug#begin('~/.vim/plugged')
Plug 'vim-utils/vim-man'
Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'itchyny/lightline.vim'
call plug#end()
