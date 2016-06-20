# create files, directories, and soft links in home directory 

# step 1: make copies of existing target files and directories
mv    ~/.bashrc     ~/.bashrc.bak
mv    ~/.gitconfig ~/.gitconfig.bak
mv    ~/.inputrc   ~/.inputrc.bak
mv    ~/.tmux.conf ~/.tmux.conf.bak
rm -r ~/.vim.bak
mv -f ~/.vim       ~/.vim.bak
mv    ~/.vimrc     ~/.vimrc.bak
mv    ~/.xinitrc   ~/.xinitrc.bak
mv    ~/.xsession  ~/.xsession.bak

# step 2: create files and directories in $HOME
echo "source ~/Dropbox/dot-files/bashrc" > ~/.bashrc
# enable the line below if the systems is at NYU
#echo "source ~/Dropbox/dot-files/bashrc-nyu" >> ~/.bashrc
echo "source ~/Dropbox/dot-files/gvimrc" > ~/.gvimrc
ln -s ~/Dropbox/dot-files/gitconf ~/.gitconfig
ln -s ~/Dropbox/dot-files/inputrc ~/.inputrc  
echo "source ~/Dropbox/dot-files/tmux.conf" > ~/.tmux.conf
cp -a ~/Dropbox/dot-files/dot-vim/. ~/.vim/
echo "source ~/Dropbox/dot-files/vimrc" > ~/.vimrc
# now done in Unity via Gnome Tweak Tool
#echo "xmodmap ~/Dropbox/dot-files/make-capslock-another-escape.xmodmap" > ~/.xinitrc
