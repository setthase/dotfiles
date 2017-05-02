" Define Vim plugins list

call plug#begin('~/.config/nvim/bundle')

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'matze/vim-move'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'godlygeek/tabular'
Plug 'szw/vim-smartclose'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

Plug 'sheerun/vim-polyglot'
Plug 'heavenshell/vim-jsdoc'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

call plug#end()

""" Plug-ins related configuration

" gruvbox
let g:gruvbox_guisp_fallback = 'fg'

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_sign_column_always = 1
let g:gitgutter_override_sign_column_highlight = 0

" vim-move
let g:move_key_modifier = 'C'

" NERDTree
let NERDChristmasTree=1                         " Colourful and pretty NERDTree
let NERDTreeShowHidden=1                        " Show hidden files by default
let NERDTreeWinPos='right'                      " Right position

nmap <silent> <C-t> :NERDTreeToggle<CR>         " Use `Ctrl + t` key to toggle NerdTree
nmap <silent> <C-f> :NERDTreeFind<CR>           " Use `Ctrl + f` key to find file in NerdTree

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1

" vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_param_description_separator = ' - '

nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)

" tagbar
nmap <silent> <F8> :TagbarToggle<CR>

" vim-ctrlspace
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceSetDefaultMapping = 0
nmap <silent> <C-Space> :CtrlSpace<CR>

""" Standard configuration

" Make Vim more useful.
set nocompatible

" Use UTF-8 without BOM.
set encoding=utf-8 nobomb

" Make sure to use English language interface
language en_US

" Use the OS clipboard by default (on versions compiled with `+clipboard`).
set clipboard=unnamed

" Enhance command-line completion.
set wildmode=full
set wildmenu

" Allow backspace in insert mode.
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set ttimeoutlen=50

" Optimize for fast terminal connections.
set ttyfast

" Use truecolor terminal
set termguicolors

" Do not redraw while running macros (much faster).
set lazyredraw

" Add the g flag to search/replace by default.
set gdefault

" Change commands map leader.
let mapleader=","

" Don't add empty newlines at the end of files.
set binary
set noeol

" Centralize backups, swap files and undo history.
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps

if exists("&undodir")
  set undodir=~/.config/nvim/undo
endif

" Don't create backups when editing files in certain directories.
set backupskip=/tmp/*,/private/tmp/*

" Reload files changed outside vim.
set autoread

" Respect modeline in files.
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them.
set exrc
set secure

" Enable line numbers.
set number

" Use relative line numbers.
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Enable syntax highlighting.
syntax on

" Highlight current line.
"set cursorline

" Show matching brackets.
set showmatch

" Show “invisible” characters.
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches.
set hlsearch

" Ignore case of searches.
set ignorecase

" Highlight dynamically as pattern is typed.
set incsearch

" Always show status line.
set laststatus=2

" Hide the current mode.
set noshowmode

" Enable mouse in all modes.
set mouse=a

" Disable error bells.
set noerrorbells

" Don't reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position.
set ruler

" Don’t show the intro message when starting Vim.
set shortmess=atI

" Show the filename in the window title bar.
set title

" Show the (partial) command as it's being typed.
set showcmd

" Start scrolling three lines before the horizontal window border.
set scrolloff=5

" Enable spell checking.
set spell

" Don't unload the buffer when it's closed
set hidden

" Strip trailing whitespace (,ss).
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <silent> <leader>ss :call StripWhitespace()<CR>

" Clear last search highlight by pressing ⏎ key.
nnoremap <silent> <CR> :noh<CR><CR>

" Automatic commands.
if has("autocmd")
  " Enable file type detection.
  filetype on

  " Treat .json files as .js.
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

  " Treat .md files as Markdown.
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

  " Treat .tag files as Riot modules
  autocmd BufNewFile,BufRead *.tag setlocal filetype=javascript

  " Close NERDTree automatically if it's the last window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

" Use spaces instead of tab.
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Use the custom theme.
set background=dark
colorscheme gruvbox