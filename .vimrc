" check vim statup time.
" vim --startuptime /tmp/startup.log +q && vim /tmp/startup.log


" smart cursor: change cursor type in different mode.
" https://github.com/kovidgoyal/kitty/issues/2045
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


source ~/.vim/config/autofunc.vim
source ~/.vim/config/helperfunc.vim
source ~/.vim/config/keymaps.vim
" sets how many lines of history VIM has to remember
set history=500
" Enable filetype plugins
filetype plugin on
filetype indent on
""


" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

"with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!"


"""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
"let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set mouse=a

" Always show current position
set ruler
"
" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme
colorscheme gruvbox
set background=dark
set cursorline
set number

" Enable syntax highlighting
syntax enable

" Set regular expression engine automatically
set regexpengine=0

" set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab       " Use spaces instead of tabs
set shiftwidth=4    " 1 tab == 4 spaces
set tabstop=4
set smarttab        " Be smart when using tabs ;)
set autoindent      " Auto indent
set smartindent     " Smart indent
set nowrap          " No wrap lines


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile      " turn backup off
set nowritebackup
set nobackup


""""""""""""""""""""""""""""""""""""""""""""""""""
" => Maps
""""""""""""""""""""""""""""""""""""""""""""""""""l
"Visual mode pressing # searches for the current selection
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Close the current buffer
nnoremap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Move to the next buffer
nnoremap <leader>l :bnext<CR>

" Move to the previous buffer
nnoremap <leader>h :bprevious<CR>

nnoremap <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/
nnoremap <leader>tq :close<CR>
nnoremap <leader>be :edit <C-r>=escape(expand("%:p:h"), " ")<cr>/
nnoremap <leader>vs :vsp <C-r>=escape(expand("%:p:h"), " ")<cr>/
nnoremap <leader>hs :sp <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" open floaterm nnn
nnoremap <leader>n :FloatermNew nnn<CR>
nnoremap <leader>t :FloatermNew<CR>
" save and quit
nnoremap wq :wq<CR>
" save
nnoremap ww :w<CR>
" remove highlight
nnoremap # :nohlsearch<CR>
" quit without save
nnoremap qq :q!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""
" search keyword by selection in visual mode
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
    ""Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin' |
        \ Plug 'ryanoasis/vim-devicons' |
        \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'voldikss/vim-floaterm'
    Plug 'honza/vim-snippets' |
        \ Plug 'SirVer/ultisnips'
    Plug 'mg979/vim-visual-multi'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
""let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
""let g:lsp_diagnostics_enabled = 0

" Add the window number in front of the mode
""function! WindowNumber(...)
""    let builder = a:1
""    let context = a:2
""    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
""    return 0
""endfunction
""
""call airline#add_statusline_func('WindowNumber')
""call airline#add_inactive_statusline_func('WindowNumber')

nnoremap <C-t> :NERDTreeToggle<CR>

""let g:coc_global_extensions = [
""    \ 'coc-json',
""    \ 'coc-clangd',
""    \ 'coc-tsserver',
""    \ 'coc-snippets',
""    \ ]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" fast move
nnoremap H 10hh
nnoremap J 10jj
nnoremap K 10kk
nnoremap L 10ll


"""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" leetcode
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
let g:leetcode_browser = 'firefox'
let g:leetcode_china = 1
let g:leetcode_solution_filetype = 'c'

source ~/.vim/pluginrc.vim
" fix kitty weird escape sequence
" https://github.com/ryanoasis/vim-devicons/issues/359
set t_RV=
