# create files, directories, and soft links in home directory 

# step 1: make copies of existing target files and directories
mv    ~/.bashrc     ~/.bashrc.bak
mv    ~/.gitconfig ~/.gitconfig.bak
mv    ~/.inputrc   ~/.inputrc.bak
mv    ~/.tmux.conf ~/.tmux.conf.bak

#rm -r ~/.vim.bak
#mv -f ~/.vim       ~/.vim.bak
#mv    ~/.vimrc     ~/.vimrc.bak

mv    ~/.xinitrc   ~/.xinitrc.bak
mv    ~/.xsession  ~/.xsession.bak

# ~/.emacs.d is maintained separately on each system, for now
mv    ~/.emacs ~/.emacs.bak
cp -r ~/.emacs.d ~/.emacs.d.bak

dotfiles=~/OneDrive/control/dot-files
# step 2: create files and directories in $HOME
echo "source $dotfiles/bashrc" > ~/.bashrc
# enable the line below if the systems is at NYU
#echo "source ~/Dropbox/dot-files/bashrc-nyu" >> ~/.bashrc

ln -s $dotfiles/gitconfig ~/.gitconfig

ln -s $dotfiles/inputrc ~/.inputrc  

#ln -s ~/Dropbox/dot-files/emacs ~/.emacs
cp $dotfiles/emacs ~/.emacs
cp -r $dotfiles/emacs.d-dell ~/.emacs.d
# ls -s ~/Dropbox/dot-files/emacs.d ~/.emacs.d
# cp -r ~/Dropbox/dot-files/emacs.d ~/.emacs.d

echo "source $dotfiles/tmux.conf" > ~/.tmux.conf

# vim config files
#cp -a ~/Dropbox/dot-files/dot-vim/. ~/.vim
#echo "source ~/Dropbox/dot-files/vimrc" > ~/.vimrc
#echo "source ~/Dropbox/dot-files/gvimrc" > ~/.gvimrc

source bashrc
