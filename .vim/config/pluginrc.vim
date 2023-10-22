"  ┌─┐┌─┐┌─┐ ┌┐┌┬  ┬┬┌┬┐
"  │  │ ││   │││└┐┌┘││││
"  └─┘└─┘└─┘o┘└┘ └┘ ┴┴ ┴
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
"  ┌─┐┬─┐┬ ┬┬  ┬┌┐ ┌─┐─┐ ┬
"  │ ┬├┬┘│ │└┐┌┘├┴┐│ │┌┴┬┘
"  └─┘┴└─└─┘ └┘ └─┘└─┘┴ └─
let g:gruvbox_contrast_dark = 'soft'

"  ╔╗╔┌─┐┬─┐┌┬┐╔╦╗┬─┐┌─┐┌─┐
"  ║║║├┤ ├┬┘ ││ ║ ├┬┘├┤ ├┤
"  ╝╚╝└─┘┴└──┴┘ ╩ ┴└─└─┘└─┘
" => Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] |endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeMinimalUI = 1

" Delete file and directory to rubbish bin through trash-cli
let g:NERDTreeRemoveFileCmd = 'trash-put '
let g:NERDTreeRemoveDirCmd = 'trash-put '
let g:NERDTreeAutoDeleteBuffer = 1
nnoremap <C-t> :NERDTreeToggle<CR>


"  ┌─┐┬┬─┐┬  ┬┌┐┌┌─┐
"  ├─┤│├┬┘│  ││││├┤
"  ┴ ┴┴┴└─┴─┘┴┘└┘└─┘
" => Add the window number in front of the mode
function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

nmap <F8> :TagbarToggle<CR>


"  ┌─┐┬  ┌─┐┌─┐┌┬┐┌─┐┬─┐┌┬┐
"  ├┤ │  │ │├─┤ │ ├┤ ├┬┘│││
"  └  ┴─┘└─┘┴ ┴ ┴ └─┘┴└─┴ ┴
" open floaterm nnn
nnoremap ee :FloatermNew nnn<CR>

"  ┬  ┬┬┌┬┐┌┬┐┌─┐─┐ ┬
"  └┐┌┘││││ │ ├┤ ┌┴┬┘
"   └┘ ┴┴ ┴ ┴ └─┘┴ └─
" => set xelatex as default compiler
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk_engines = { '_' : '-xelatex' }
let g:vimtex_compiler_latexrun_engines = { '_': 'xelatex' }

" => set zathura as default pdf viewer
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 1
