" vim-sublime - A minimal Sublime Text -like vim experience bundle
"               http://github.com/grigio/vim-sublime
" Best view with a 256 color terminal and Powerline fonts

set nocompatible
filetype off
" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')
Plug 'gmarik/vundle'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim', {'for': ['html','erb','ejs']}
Plug 'Shougo/neocomplete.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-rails'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'ekalinin/Dockerfile.vim'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'

" Color Themes
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'

" Utilities 
Plug 'ryanss/vim-hackernews'
Plug 'junegunn/limelight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat'

"Javascript
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

call plug#end()
set background=dark
colorscheme solarized

filetype plugin indent on
syntax on

" Use :help 'option' to see the documentation for the given option.
set nowrap
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50
set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" do not history when leavy buffer
set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode 
inoremap <C-c> <Esc>

set completeopt=menuone,longest

"
" Plugins config
"
" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 

" Ultisnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:did_UltiSnips_vim_after = 1
let g:UltiSnipsUsePythonVersion = 2

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y
" Undo, Redo (broken)
" nnoremap <C-z>  :undo<CR>
" inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>
" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
" nnoremap <C-b>  :tabprevious<CR>
" inoremap <C-b>  <Esc>:tabprevious<CR>i
" nnoremap <C-n>  :tabnext<CR>
" inoremap <C-n>  <Esc>:tabnext<CR>i
" nnoremap <C-t>  :tabnew<CR>
" inoremap <C-t>  <Esc>:tabnew<CR>i
" nnoremap <C-k>  :tabclose<CR>
" inoremap <C-k>  <Esc>:tabclose<CR>i

" lazy ':'
map \ :

let mapleader = "\<Space>"
nnoremap <Leader>pp :set paste<CR>
nnoremap <Leader>oo :set nopaste<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>w :winc w<CR>
nnoremap <Leader>q :q<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nmap <Leader>t :TagbarToggle<CR>

" Limelight config 
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
" Stop quit suggestions window
map q: :q 
let g:user_emmet_leader_key='<C-n>'

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


set encoding=utf-8 

let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1


if has("gui_mac") || has("gui_macvim")
  set guifont=Menlo:h13
  set transparency=2
  set linespace=2
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar
endif

au BufWrite * :Autoformat
