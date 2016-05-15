set nocompatible " this also changes the meaning of other options

" start pathogen, which manages these plugins
"  syntastic
"  vim-airline
"  vim-markdown-folding

execute pathogen#infect()
"call pathogen#helptags()

syntax on
filetype plugin indent on " indent according to syntax rules for file type
" now any plugins can be extacted to a subdirectory under ~/.vim/bundle and they
" will be added to the 'runtimepath'
" ref: https://github.com/tpope/vim-pathogen

" status line is set by vim-airline

" recommended syntastic settings for new users
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" additional syntastic settings, for which, ref:
" https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
let g:syntastic_aggregate_errors = 1  " run all checkers and aggregate results
let g:syntastic_python_checkers = ['pep8', 'python', 'pyflakes']

" map jk to <ESC>
inoremap jk <ESC>

"two Escapes save the buffer
"map <Esc><Esc> :w<CR>

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
"set noswapfile

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
autocmd BufNewFile,BufReadPost *.md set textwidth=80
autocmd BufNewFile,BufReadPost *.md set formatoptions+=t

" asciidoc file type
autocmd BufNewFile,BufReadPost *.asciidoc set filetype=asciidoc
autocmd FileType asciidoc setlocal textwidth=80

" python file type
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal tabstop=4

" tex file type
autocmd BufNewFile,BufRead *.tex setlocal textwidth=80
autocmd BufNewFile,BufRead *.tex setlocal formatoptions+=t

" the timesheet.txt file
autocmd BufNewFile,BufRead timesheet.txt setlocal textwidth=80
autocmd BufNewFile,BufRead timesheet.txt setlocal formatoptions+=t
autocmd BufNewFile,BufRead timesheet.txt setlocal filetype=text

" txt file type interpretted as markdown file
autocmd BufNewFile,BufRead *.txt setlocal textwidth=80
autocmd BufNewFile,BufRead *.txt setlocal formatoptions+=t
autocmd BufNewFile,BufRead *.txt setlocal filetype=markdown


" .vimrc stuff: note my .vimrc sovrces a file in dropbox
" <leader>ev --> (e)dit my (v)imrc file
" <leader>sv --> (s)ouce my (v)imrc file
nnoremap <leader>ev :split ~/Dropbox/dot-files/vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" abbreviations in insert mode
iab pdb. pdb.set_trace()
