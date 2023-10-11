let mapleader = ","
" Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vim/vimrc<cr>
" quick save and quit
nnoremap wq :wq<CR>
nnoremap ww :w<CR>
nnoremap qq :q!<CR>

nmap <F8> :TagbarToggle<CR>

"  ┌┬┐┬┌─┐┌─┐
"  ││││└─┐│
"  ┴ ┴┴└─┘└─┘
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" remove highlight
nnoremap # :nohlsearch<CR>
" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!"
