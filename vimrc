" Vim is based on Vi. Setting `nocompatible` switches from the default " Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" For more information on this.
set hidden

" Show matching braces when text indicator is over them
set showmatch

" Enable syntax highlighting
syntax on

" Show pressed key in statusline
set showcmd

" Fix background color issues when scrolling down and up
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" Fix backspace problem in insert mode (This is for mac)
set backspace=indent,eol,start

" Highlight current line
set cursorline

" Enable line numbers
set number

" This enables relative line numbering mode.
set relativenumber

" Tab completion for files
set wildmenu
set wildmode=longest:list,full

" Case-insensitive search
set ignorecase

" highlight search
"set hlsearch

" Use 4 spaces instead of tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" Increamental search
set incsearch

" No warp in the end
set nowrap

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Highlight 80 column line
set colorcolumn=80

" One more column for information on the left
set signcolumn=yes

" Set textwith to 80, automaticcally waro lines when excceeding.
set tw=80

" Read when files are changed within vim, especically for git branches
set autoread

" Allow project specific vimrc
set exrc
set secure

" plugins
" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')


Plug 'preservim/nerdcommenter'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --all'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
"Plug 'ctrlpvim/ctrlp.vim'

" for make within vim"
Plug 'tpope/vim-dispatch'

" sync files to remote
Plug 'kenn7/vim-arsync'

" fuzzy finder 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Default markdown port: localhost:8090
"Plug 'suan/vim-instant-markdown', {'for': 'markdown',
                                 "\ 'do': 'sudo npm -g install instant-markdown-d'}

" for colorscheme
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'


call plug#end()


" Set colorscheme to gruvbox
colorscheme gruvbox
set background=dark

" Map leader key to <space>
let mapleader = " "

" YCM: go to definition; references
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>

" remap half-page down and up during normal mode navigation
nmap <C-j> <C-d>
nmap <C-k> <C-u>

"" Automatic closing brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap (<CR> (<CR>)<ESC>O

" project structure (tree) visualization
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" project search for fuzzy finder 
nnoremap <C-p> :GFiles<CR>

" sync local to remote server
nnoremap <leader>sc :ARsyncUp<CR>

" shortcut when git merge
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gs :G<CR>

"" Set colorscheme for lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
