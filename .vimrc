" check vim statup time.
" vim --startuptime /tmp/startup.log +q && vim /tmp/startup.log
"   ╔═╗┬  ┬ ┬┌─┐┬┌┐┌
"   ╠═╝│  │ ││ ┬││││
"   ╩  ┴─┘└─┘└─┘┴┘└┘
call plug#begin('~/.vim/plugged')
    Plug 'Yggdroot/indentLine'
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/tagbar'
    Plug 'mhinz/vim-startify'
    Plug 'lervag/vimtex'
    Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'blueyed/vim-diminactive'
    Plug 'jiangmiao/auto-pairs'
    Plug 'morhetz/gruvbox'
    "Plug 'sainnhe/gruvbox-material'
    Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin' |
        \ Plug 'ryanoasis/vim-devicons' |
        \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'voldikss/vim-floaterm'
    Plug 'honza/vim-snippets' |
   "     \ Plug 'SirVer/ultisnips'
    Plug 'mg979/vim-visual-multi'
call plug#end()


"  ┌─┐┌─┐┌┐┌┌─┐┬┌─┐
"  │  │ ││││├┤ ││ ┬
"  └─┘└─┘┘└┘└  ┴└─┘
source ~/.vim/config/autofunc.vim
source ~/.vim/config/keymaps.vim
source ~/.vim/config/pluginrc.vim


"  ┌┐ ┌─┐┌─┐┬┌─┐
"  ├┴┐├─┤└─┐││
"  └─┘┴ ┴└─┘┴└─┘
filetype plugin on
filetype indent on
syntax enable
set background=dark
set cursorline
set number
set regexpengine=0
set history=500
set foldcolumn=1
set encoding=utf-8
set ffs=unix,dos,mac
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set smartindent
set nowrap
set noswapfile
set nowritebackup
set nobackup
set autoread
au FocusGained,BufEnter * checktime
set so=7
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
set cmdheight=1
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set termguicolors
colorscheme gruvbox
"set mouse=

" smart cursor: change cursor type in different mode.
" https://github.com/kovidgoyal/kitty/issues/2045
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" fix kitty weird escape sequence
" https://github.com/ryanoasis/vim-devicons/issues/359
set t_RV=
