" File-type
filetype on
filetype off

" Tabs and Spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set expandtab
set autoindent
set smartindent
set smarttab

" Misc
set number
set ruler
set showcmd
set showmatch
set nowrap
set hidden
set modeline
set autoread       " auto-reload modified files (with no local changes)
set nocompatible   " don't try to be compatible with vi
set ignorecase     " ignore case in search
set smartcase      " override ignorecase if uppercase is used in search string
set report=0       " report all changes
set laststatus=2   " always show status-line
set cursorline     " highlight current line
set scrolloff=4
set nofoldenable
set shell=/bin/zsh

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store?                      " OSX bullshit
set wildignore+=*vendor/bundle/*,public/assets/* " Rails specific
set wildignore+=*node_modules/*                  " npm modules
set wildignore+=*target/*,resources/public/*     " clojure projects
" }}}

" Swaps and backups
set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=$HOME/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Show trailing whitespace
set list listchars=tab:→\ ,trail:·

set autowrite

" Better search
set hlsearch
set incsearch

" Show trailing white-space
let ruby_space_errors = 1
let c_space_errors = 1
let javascript_space_errors = 1

let mapleader = ","

" Easy command mode switch
inoremap jj <Esc>

" Yank to OS X pasteboard.
noremap <leader>y "*y

" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" Fix backspace key in xterm
" inoremap <BS>

inoremap <C-l> <C-x><C-l>

inoremap <C-f> function () {}<Left>

" Enable mouse in insert and normal mode
" set mouse=vin

" Create an empty line underneath without moving the cursor
noremap <CR> mlo<Esc>`l

" Indent with spacebar
noremap <space> >>
noremap <BS> <<

" Move easily between ^ and $
noremap <C-h> ^
noremap <C-l> $

nnoremap Y y$
nnoremap D d$

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" It's 2011.
noremap j gj
noremap k gk

" After copying a visual block, keep cursor at end of block for easy pasting
vnoremap y y`>

" Moving around in splits
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Removing arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Indent whole file
map <Leader>i gg=G

" Minimum window height = 0
set wmh=0

" Required for rubyblock
runtime macros/matchit.vim

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" github
Bundle 'gmarik/vundle'
Bundle 'mattn/zencoding-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'janx/vim-rubytest'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/gist-vim'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/buftabs'
Bundle 'gregsexton/gitv'
Bundle 'kana/vim-smartinput'
Bundle 'nono/vim-handlebars'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'groenewege/vim-less'
" vim-scripts repos
Bundle 'django.vim'
Bundle 'php.vim'

filetype plugin indent on
syntax enable

" Solarized theme settings
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

" Powerline settings
let g:Powerline_symbols = 'fancy'

au BufRead,BufNewFile *.js set ft=javascript syntax=javascript
au BufRead,BufNewFile *.json set ft=json syntax=javascript
au BufRead,BufNewFile *.twig set ft=htmldjango
au BufRead,BufNewFile *.rabl set ft=ruby
" automatically jump to last known position in a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

map <Leader>n :NERDTreeToggle<CR>

" Rubytest
map <Leader>\ <Plug>RubyTestRun
map <Leader>' <Plug>RubyFileRun
map <Leader>/ <Plug>RubyTestRunLast
let g:rubytest_cmd_test = 'ruby -I "lib:test" %p'
let g:rubytest_cmd_testcase = 'ruby -I "lib:test" %p -n "/%c/"'
let g:rubytest_in_quickfix = 1

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['html', 'sass', 'hbs'] }
let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'
let g:syntastic_jsl_conf = '$HOME/.jshintrc'
let g:syntastic_jshint_conf = '$HOME/.jshintrc'

" Gundo
let g:gundo_width = 30
let g:gundo_preview_bottom = 1

" Gundo
nnoremap <leader>g :GundoToggle<CR>

" Tagbar
nnoremap <leader>q :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoclose = 1

" Remove search highlighting
noremap <leader><space> :noh<cr>:match none<cr>:2match none<cr>:3match none<cr>

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Remap :W to :w
command! W w

" Indent/unident block (,]) (,[)
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

" Use <leader>S to sort properties.  Turns this:
"
"     p {
"         width: 200px;
"         height: 100px;
"         background: red;
"
"         ...
"     }
"
" into this:

"     p {
"         background: red;
"         height: 100px;
"         width: 200px;
"
"         ...
"     }
"
au BufNewFile,BufRead *.css  nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Add dashes to the list of 'word characters' for CSS files:
au Filetype css setlocal iskeyword+=-

" Remove slashes from list of 'word characters':
setlocal iskeyword-=/\/

" Use Shift-Return to turn this:
"     <tag>|</tag>
"
" into this:
"     <tag>
"         |
"     </tag>
au BufNewFile,BufRead *.html inoremap <buffer> <s-cr> <cr><esc>kA<cr>
au BufNewFile,BufRead *.html nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

nore ; :

" Clean whitespace
map <leader>s  :%s/\s\+$//<cr>:let @/=''<CR>

" Easily move to start/end of line
" Note that L is g_, not $, so it acts the same in normal and visual mode.
noremap H ^
noremap L g_

command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge

" Clojure settings
au VimEnter clj RainbowParenthesesToggle
au Syntax clj RainbowParenthesesLoadRound
au Syntax clj RainbowParenthesesLoadSquare
au Syntax clj RainbowParenthesesLoadBraces
