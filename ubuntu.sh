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
#echo "source ~/Dropbox/dot-files/inputrc" > ~/.inputrc  # use VI keys for readlines
echo "source ~/Dropbox/dot-files/tmux.conf" > ~/.tmux.conf
cp -a ~/Dropbox/dot-files/dot-vim/. ~/.vim/
echo "source ~/Dropbox/dot-files/vimrc" > ~/.vimrc
echo "xmodmap ~/Dropbox/dot-files/make-capslock-another-escape.xmodmap" > ~/.xinitrc
