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
set wildignore+=*tmp/**                          " tmp dir
set wildignore+=*coverage/**                     " Rails specific
set wildignore+=*node_modules/*                  " npm modules
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

" Get rid of Ex-mode map
nnoremap Q <nop>

" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" Fix backspace key in xterm
" inoremap <BS>

inoremap <C-l> <C-x><C-l>
inoremap <C-f> function () {}<Left>

" Enable mouse in insert and normal mode
"set mouse=n

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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" github
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/buftabs'
Plugin 'gregsexton/gitv'
Plugin 'kana/vim-smartinput'
Plugin 'nono/vim-handlebars'
Plugin 'groenewege/vim-less'
Plugin 'chase/vim-ansible-yaml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'janko-m/vim-test'
Plugin 'jparise/vim-graphql'
Plugin 'bogado/file-line'
Plugin 'rhysd/vim-crystal'
Plugin 'tpope/vim-markdown'
" vim-scripts repos
Plugin 'django.vim'
Plugin 'php.vim'
call vundle#end()

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
au BufRead,BufNewFile *.j2 set ft=htmldjango
" automatically jump to last known position in a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

map <Leader>n :NERDTreeToggle<CR>

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

" Ruby test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR>

" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=1
set ttyfast
set lazyredraw

" ctrlp
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" use minitest in graphql-ruby for _spec files
autocmd BufNewFile,BufRead ~/dev/graphql-ruby/spec/* let test#ruby#minitest#file_pattern = '_spec\.rb'

" use dev in shopify
"autocmd BufNewFile,BufRead ~/dev/shopify/* let test#ruby#minitest#executable = 'dev test'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby', 'javascript']

" show vertical ruler
set colorcolumn=120
