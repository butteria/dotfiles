# INSTALL

git clone --bare [https://gh-proxy.com/]https://github.com/butteria/dotfiles.git $HOME/.dotfiles.git
export dot="git --git-dir $HOME/.dotfiles.git/ --work-tree $HOME checkout"
# update submodule
dot submodule init && dot submodule update --recursive
dot submodule foreach --recursive 'git reset --hard'
" or dot submodule update --init --recursive
