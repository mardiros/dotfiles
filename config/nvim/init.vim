
set number

function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Move Backup Files to ~/.nvim/sessions
set backupdir=~/.local/share/nvim/swap
set dir=~/.local/share/nvim/swap
" and no backup
set nobackup
set noswapfile

" 256 Colors
set t_Co=256
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"

" encoding
set encoding=utf-8
set fileencoding=utf-8

" don't bell or blink
set noerrorbells
set visualbell t_vb=

" search option
set hlsearch "highlight
set ignorecase
set smartcase " dont ignore case when ucase

cnoreabbr o tabedit

noremap <C-s> :w<CR>
noremap <S-Tab> :tabprevious<CR>
noremap <Tab> :tabnext<CR>
noremap <C-k> :YcmCompleter GoToDefinition<CR>
noremap <C-e> :NERDTreeToggle<CR>
noremap <C-t> :tabnew<CR>
noremap <C-y> :vertical split<CR>
noremap <C-u> :split<CR>
noremap <S-u> :redo<CR>

" Never enter in replace mode
imap <Insert> <Nop>

call plug#begin('~/.config/nvim/plugged/')

Plug 'ctrlpvim/ctrlp.vim'

Plug 'freeo/vim-kalisi'

Plug 'hdima/python-syntax'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'

" Code to execute when the plugin is loaded on demand
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

call plug#end()

set scrolloff=7
set ruler
set textwidth=0
set expandtab
set shiftwidth=2
set fileformat=unix

set splitbelow
set splitright

autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1
filetype plugin on
syntax on
colorscheme kalisi
set background=dark

au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=8

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4

au BufRead,BufNewFile Makefile* set noexpandtab

au FileType python setlocal ts=4 sw=4 sts=4 et

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Ignore pyc files
let NERDTreeIgnore = ['\.pyc$']


set noshowmode

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme= 'jellybeans'

