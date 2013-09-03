# install dot files that don't depend on the system
# copy individual files
/bin/cp -rf .inputrc ~/.inputrc
/bin/cp -rf .emacs ~/.emacs
/bin/cp -rf .gvimrc ~/.gvimrc
/bin/cp -rf .tmux.conf ~/.tmux.conf
/bin/cp -rf .vimrc ~/.vimrc
# copy directories
/bin/cp -rf .vim/* ~/.vim

