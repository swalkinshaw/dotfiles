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
" }}}

" Swaps and backups
set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.      " keep swp files under ~/.vim/swap
set undofile
set undodir=~/.vim/undo
set undoreload=10000

set autowrite

" Status line {{{

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%#warningmsg#                " Highlight the following as a warning.
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" }}}

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

" Paste toggle (,p)
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

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

"
" Tabline
"
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1

    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let file = bufname(buflist[winnr - 1])
      let file = fnamemodify(file, ':p:t')
      let file = (file == '') ? '[No Name]' : file
      let s .= ' ' . file . ' '
      let s .= winnr
      let s .= (getbufvar(buflist[winnr - 1], '&modified') ? '+ ' : ' ')
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif
      
set rtp+=~/.vim/bundle/vundle 
call vundle#rc()

" github
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/zencoding-vim'
Bundle 'wincent/Command-T'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
" vim-scripts repos
Bundle 'rails.vim'
Bundle 'django.vim'
Bundle 'surround.vim'
" non github repos
" Syntax
Bundle 'php.vim'

filetype plugin indent on
syntax enable

" Solarized theme settings
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized 

au BufRead,BufNewFile *.js set ft=javascript syntax=javascript
au BufRead,BufNewFile *.json set ft=json syntax=javascript
au BufRead,BufNewFile *.html.twig set ft=htmldjango
" automatically jump to last known position in a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

map <Leader>n :NERDTreeToggle<CR>
map <Leader>c :CommandT<CR>

" Command-T
let g:CommandTMaxFiles=20000
let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxHeight=12
let g:CommandTCancelMap=['<Esc>', '<C-c>']

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_disabled_filetypes = ['html']
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
command W w

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
