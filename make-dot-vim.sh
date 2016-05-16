cp -a dot-vim/. dot-vim.bak/
rm -rf dot-vim

# install Pathogen
cd ~/Dropbox/dot-files
mkdir -p dot-vim/autoload
mkdir -p dot-vim/bundle
curl -LSso dot-vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install syntastic (syntax highlighting)j
cd ~/Dropbox/dot-files/dot-vim/bundle
git clone https://github.com/scrooloose/syntastic.git

# install vim-airline (status line)
cd ~/Dropbox/dot-files/dot-vin/bundle
git clone https://github.com/vim-airline/vim-airline.git

# install vim-markdown-folding
cd ~/Dropbox/dot-files/dot-vim/bundle
git clone https://github.com/nelstrom/vim-markdown-folding.git

# Generate help tags
echo to generate vim help tags, reload vim and execute :Helptags
