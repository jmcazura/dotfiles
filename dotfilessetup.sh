# tmux
#   * ncurses 6.0 https://www.gnu.org/software/ncurses/
#   * libevent 2.x. 	http://libevent.org
# tmux-ressurect					 -done
# vim
# vim-plug  #vim packages manager			 -done
# git
# xclip
# fzf - fuzzy finder
# fzf.vim
# openssh-server
# silversearcher-ag https://github.com/ggreer/the_silver_searcher

DOTFILES=$(pwd)

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +q +q!

mkdir -pv $HOME/.vim/tmp/

# Need to fix: Install tmux via script below
# git clone https://github.com/tmux/tmux.git $HOME/.tmux
# sh $HOME/.tmux/autogen.sh
# .$HOME/.tmux/configure && make

# TMUX
ln -sf $DOTFILES/tmux.conf $HOME/.tmux.conf

# install tmux-resurrect
git clone https://github.com/tmux-plugins/tmux-resurrect $HOME/.tmux-resurrect
tmux source-file ~/.tmux.conf

# VIM
ln -sf $DOTFILES/vimrc $HOME/.vimrc

# ALIASES
ln -sf $DOTFILES/bash_aliases $HOME/.bash_aliases

# PROFILE
ln -sf $DOTFILES/profile $HOME/.profile

# BASHRC
cat ./bashrc >> $HOME/.bashrc

# gitignore_global
ln -sf $DOTFILES/gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile '~/.gitignore_global'
