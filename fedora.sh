# create files in Ubuntu home directory # overwrite any existing files or directories
mv    ~/.bashr     ~/.bashrc.bak
mv    ~/.gitconfig ~/.gitconfig.bak
mv    ~/.inputrc   ~/.inputrc.bak
mv    ~/.tmux.conf ~/.tmux.conf.bak
mv -f ~/.vim       ~/.vim.bak
mv    ~/.vimrc     ~/.vimrc.bak
mv    ~/.xinitrc   ~/.xinitrc.bak
mv    ~/.xsession  ~/.xsession.bak

rm ~/.bashrc
rm ~/.gitconfig
rm ~/.inputrc
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.xinitrc
rm ~/.xsession

echo "source ~/Dropbox/dot-files/bashrc" > ~/.bashrc
echo "source ~/Dropbox/dot-files/bashrc-nyu" >> ~/.bashrc
echo "source ~/Dropbox/dot-files/gvimrc" > ~/.gvimrc
ln -s ~/Dropbox/dot-files/gitconf ~/.gitconfig
ln -s ~/Dropbox/dot-files/inputrc ~/.inputrc  
echo "source ~/Dropbox/dot-files/tmux.conf" > ~/.tmux.conf
cp -a ~/Dropbox/dot-files/dot-vim/. ~/.vim/
echo "source ~/Dropbox/dot-files/vimrc" > ~/.vimrc
