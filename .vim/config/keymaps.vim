let mapleader = ","

" Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vim/vimrc<cr>


" Map auto complete of (, [. {, ', "
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i


" fast compile in vim.
map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>
