set nocompatible " this also changes the meaning of other options

" configure Vundle
" first setup Vundle: git clone https://github.com/VundleVim/Vundle.vim.git 
" ~/.vim/bundle/Vundle.vim
filetype off
set rtp+=~/.vim/bundle/Vundle.vim  " run time path
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle
" add other plug-ins here
Plugin 'mjakl/vim-asciidoc'

" all plugin must be added before the following line
call vundle#end()
filetype plugin indent on  " required for Vundle

" start pathogen
filetype off
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on " indent according to syntax rules for file type
" now any plugs can be extacted to a subdirectory under ~/.vim/bundle and they
" will be added to the 'runtimepath'
" ref: https://github.com/tpope/vim-pathogen

" configure Plugin vim-asciidoc
" set g:vim_asciidoc_initial_foldlevel=1


" Syntastic options
"set statusline+=%#warningmsg#
"set statusline+=#{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_eq = 0

" pymode options
" documentation is available in vim :help pymode
" don't run the mccabe complexity checker
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_options_max_line_length = 120
let g:pymode_folding = 1
let g:pymode_rope = 0
"let g:pymode_lint_options_pep8 = {'max_line_length': 120}

" map jk to <ESC>
inoremap jk <ESC>

"two Escapes save the buffer
map <Esc><Esc> :w<CR>

" vim latex stuff: see vim-latex.sourceforge.net
set grepprg=grep\ -nH\ $* " have grep always generate a file name
let g:tex_flavor='latex'  " load vim-latex for empty .tex files

set hidden " hide buffers instead of closing them
set nowrap " don't wrap lines; scroll horizontally to see long lines

set tabstop=4
set expandtab " convert tabs to spaces

set backspace=indent,eol,start " allow backspacing over everthing in insert mode
set autoindent
set copyindent " copy previous indentation on autoindenting
set number " always show line numbers
set shiftwidth=4 " number of spaces to use for autoindenting
set shiftround " use multiple shiftweidth when indenting with '<'
set showmatch " show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " search is case sensitive iff not all lower case
set smarttab " insert tabs at start of line according to shiftwidth, not tabstop
"set hlsearch " highlight search terms
"set incsearch " show search matches as you type

set history=1000 " remember many commands
set undolevels=1000 " allow many undoes

set visualbell " don't beep
set noerrorbells " don't beep

set nobackup
set noswapfile

" status line
set laststatus=2  " show status line even if just one window

set autoread   " reload a file if it changes
autocmd CursorHold * checktime  " run checktime automatically after 4 secs


set mouse=a " enable mouse for command line, input, navigation

" use Q for formatting current paragraph or selection
vmap Q gq
vmap Q gqap

" make navigating among multiple windows easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w> <C-w>w  " move to next window below or to right; cycle
map <C-W> <C-w>W  " move to next window above to to left; cycle

" clear search buffer when you press ,/
nmap <silent> ,/ :nohlsearch<CR>

 
" disable arrow keys when in insert mode
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>

" auto-reload .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" set color scheme; ones I like are delek, khoeler, railcasts, slate
syntax enable
set background=dark
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme slate

" underline current line in insert mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" highlight cursorline and cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" \c will toggle highlighting on and off (to make it easy to locate the cursor
" in a large file)
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" save and reload folds
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
autocmd BufWrite * mkview
"autocmd BufRead * silent loadview

setlocal foldmethod=indent

" detect *.md as markdown files (not Modula-2)
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" asciidoc file type
autocmd BufNewFile,BufReadPost *.asciidoc set filetype=asciidoc
autocmd FileType asciidoc setlocal textwidth=80

" python file type
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal tabstop=4

" tex file type
autocmd BufNewFile,BufRead *.tex setlocal textwidth=80

" txt file type
autocmd BufNewFile,BufRead *.txt setlocal textwidth=80
"autocmd BufNewFile,BufRead *.txt setlocal formatoptions+=t

" .vimrc stuff: note my .vimrc sovrces a file in dropbox
" <leader>ev --> (e)dit my (v)imrc file
" <leader>sv --> (s)ouce my (v)imrc file
nnoremap <leader>ev :split ~/Dropbox/dot-files/vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" abbreviations in insert mode
iab pdb. pdb.set_trace()
