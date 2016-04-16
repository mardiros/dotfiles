set nocompatible
set backspace=indent,eol,start
set mouse-=a

" set number

" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions
" and no backup
set nobackup
set noswapfile

set encoding=utf-8
set fileencoding=utf-8

" don't bell or blink
set noerrorbells
set visualbell t_vb=

" search option
set hlsearch "highlight
set ignorecase
set smartcase " dont ignore case when ucase

map <C-t> :tabnew<CR>
map <C-w> :tabclose<CR>
map <F3> :tabprevious<CR>
map <F4> :tabnext<CR>
map <C-O> :Explore<CR>

filetype plugin on
syntax on
colorscheme desert

au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=8

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
" au BufRead,BufNewFile *.py,*.pyw set expandtab
" au BufRead,BufNewFile Makefile* set noexpandtab

au FileType python setlocal ts=4 sw=4 sts=4 et

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

let python_highlight_all=1
let g:pydiction_location = '~/.vim/complete-dict'
