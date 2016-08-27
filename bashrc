# -*- mode: Sh -*-

# ref: http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
#echo $OSTYPE

# \W  basename of current working directory
# prompt PS1="\W $"
PS1="\W $"
#PS1="\h \W $"

# ignore a command if the same command was just recorded
export HISTCONTROL=ignoredups

PYTHONPATH=~/Dropbox/pythonlib/sparsevector
export PYTHONPATH

# protect against mistakes
# MacOS does not use long options
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm="rm -i"

# shortcuts
alias emacs-help="cat ~/Dropboox/tracking/emacs-help.txt"
#alias emacsu="/usr/bin/emacs $@"

# os x only
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# todo.txt
alias thome="t ls @home; t lsp; t ls judith"
alias tnyu="t ls @nyu; t lsp; t ls remi; t ls david; t ls loraine; t ls foster"
alias tvim="vim ~/Dropbox/todo/todo.txt"

# edit specific todo-related files
alias todo="emacs ~/Dropbox/todo/todo.txt --no-splash"
alias projects="emacs ~/Dropbox/todo/projects.org --no-splash"
alias maybe="emacs ~/Dropbox/todo/maybe.org --no-splash"
alias next="emacs ~/Dropbox/next/plan.asciidoc --no-splash"
alias tracking="emacs ~/Dropbox/todo/tracking.org  -no-splash"
alias migraines="emacs ~/Dropbox/todo/migraines.txt  --no-splash"
alias game="emacs ~/Dropbox/admin/NotesAdmin/game-1605NN-proposed.md --no-splash"

# tmux commands with hard-to-remember invocation options
alias tmuxnew="tmux new -s $1"
alias tmuxa="tmux a -t $1"
alias tmuxkill="tmux kill-session -t $1"

# switch to a directory
alias gads="cd ~/Dropbox/ads-applied-data-science/"
alias gdsc="cd ~/Dropbox/ads-applied-data-science/dsc-data-science-certification/"
alias gdots="cd ~/Dropbox/dot-files"
alias gintro="cd ~/Dropbox/teaching/2016-intro-to-data-science/DS_course-kevin-munger-github/roy-2016/"
alias gledger="cd ~/Dropbox/family/ledger/"
alias gnotes="cd ~/Dropbox/Notes"
alias gnotesa="cd ~/Dropbox/admin/NotesAdmin"
alias gre="cd ~/Dropbox/shasha/re-avm/src"
alias gpaper1="cd ~/Dropbox/shasha/re-avm/docs/paper1"
alias gtimesheet="cd ~/Dropbox/timesheet"
alias gtodo="cd ~/Dropbox/todo"

# find notes with specified tag
alias notesls="ls -c ~/Dropbox/Notes/ | grep $*"

# misc
alias startdropbox="~/.dropbox-dist/dropboxd"
alias fixcapslock="xmodmap ~/Dropbox/dot-files/make-capslock-another-escape.xmodmap"
alias topslowcpu="top -s 30 -o cpu"

# time sheet
alias timesheet="emacs ~/Dropbox/timesheet/timesheet.txt"
alias timereport="python ~/Dropbox/timesheet/timereport.py"

# start emacs in terminal
echo $OSTYPE
case "$OSTYPE" in
    darwin*) alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs $@";;
    linux*) ;;
    *);;
esac

# ssh
alias sshhome="ssh roy@66.65.168.212"
alias sshcarmen="ssh rel@10.0.1.22"
alias sshdell="ssh roy@10.0.1.36"
alias sshelektra="ssh roy@10.0.1.28"
alias sshhp="ssh roy@10.0.1.39"

# vnc
alias vnccarmen="vnc://10.0.1.22"

# Set the Lua path for require "filename"
#LUA_THESIS="/Users/$USER/Dropbox/nyu-thesis-project/src.git/lua/"
#ROY1="${LUA_THESIS}?"
#ROY2="${LUA_THESIS}?.lua"

#LUA_KERNEL_SMOOTHERS="/Users/$USER/Dropbox/kernel-smoothers/"
#ROY3="${LUA_KERNEL_SMOOTHERS}?"
#ROY4="${LUA_KERNEL_SMOOTHERS}?.lua"

#LUA_DEFAULT_PATH=";"
#export LUA_PATH="${LUA_DEFAULT_PATH};${ROY1};${ROY2};${ROY3};${ROY4}"

# todo.txt
# make sure PATH contains directory
[[ :$PATH: == *$HOME/Dropbox/todo:* ]] || PATH=$HOME/Dropbox/todo:$PATH
alias t="$HOME/Dropbox/todo/todo.sh -d /Users/$USER/Dropbox/todo/todo.cfg"

# short cuts to servers
#export ACCESS="lowrance@access.cims.nyu.edu"
[[ :$PATH: == $HOME/anaconda2/bin:* ]] || PATH=$HOME/anaconda2/bin:$PATH
#[[ :$PATH: == $HOME/anaconda/bin:* ]] || PATH=$HOME/anaconda/bin:$PATH
# export PATH=~/anaconda2/bin::~/bin:/usr/local/bin:/usr/local/sbin:$PATH

PATH=~/Dropbox/dot-files/scripts:$PATH
PATH=~/java8/jdk1.8.0_92/bin:$PATH
PATH=/usr/local/stata:$PATH
PATH=/Library/TeX/texbin:$PATH
PATH=/usr/local/Cellar/ledger/3.1.1_2/bin:$PATH

# enable tab completion in conda
#eval "$(register-python-argcomplete conda)"

# file containing configuration info for pep8 (used by Python)
export XDG_CONFIG_HOME=~/Dropbox/dot-files/xdg_config_home/
