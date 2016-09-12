# -*- mode: Sh -*-

# \W  basename of current working directory
# prompt PS1="\W $"
PS1="\W $"
#PS1="\h \W $"

# turn on bash completion
# ref: http://stackoverflow.com/questions/394230/detect-the-os-from-a-bash-script
# ref: https://www.cs.cmu.edu/~15131/f16/topics/terminal-configuration/configuring-bash/
echo $OSTYPE
case "$OSTYPE" in
    darwin*) if [ -f $(brew --prefix)/etc/bash_completion ]; then
		 source $(brew --prefix)/etc/bash_completion
	     fi;;
    linux*) if [ -f /etc/bash_completion ]; then
		source /etc/bash_completion
	    fi;;
    *);;
esac

# ignore a command if the same command was just recorded
export HISTCONTROL=ignoredups

PYTHONPATH=~/Dropbox/pythonlib/sparsevector
export PYTHONPATH

# protect against mistakes
# MacOS does not use long options
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cp='cp -i -v'
alias ln='ln -i'
alias mv='mv -i -v'
alias rm='rm -i'

#  colorize output
case "$OSTYPE" in
    linux*)
	alias diff='colordiff'
	alias grep='grep --color=auto'
	alias ls='ls --color=auto'
	;;
esac

# emacs
alias e='emacs'
alias ec='emacsclient -c -a emacs'
alias ect='emacsclient -t'
alias emacskill="emacsclient -e '(client-save-kill-emacs)'"
alias emacs-help='cat ~/Dropbox/tracking/emacs-help.txt'
export ALTERNATE_EDITOR=''
export EDITOR='emacsclient -t'
export VISUAL='emacsclient -c -a emacs'

case "$OSTYPE" in
    darwin*) alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs';;
    linux*) ;;
    *);;
esac

# os x only
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# todo.txt
alias thome='t ls @home; t lsp; t ls judith'
alias tnyu='t ls @nyu; t lsp; t ls remi; t ls david; t ls loraine; t ls foster'
alias tvim='vim ~/Dropbox/todo/todo.txt'

# edit specific todo-related files
alias todo='emacs ~/Dropbox/todo/todo.txt &'
alias projects='emacs ~/Dropbox/todo/projects.org &'
alias maybe='emacs ~/Dropbox/todo/maybe.org &'
alias next='emacs ~/Dropbox/next/plan.asciidoc &'
alias tracking='emacs ~/Dropbox/todo/tracking.org &'
alias migraines='emacs ~/Dropbox/todo/migraines.txt &'
alias game='emacs ~/Dropbox/admin/NotesAdmin/game-1605NN-proposed.md &'

# tmux commands with hard-to-remember invocation options
alias tmuxnew='tmux new -s $1'
alias tmuxa='tmux a -t $1'
alias tmuxkill='tmux kill-session -t $1'

# switch to a directory
alias gadmin='cd ~/Dropbox/admin/'
alias gads='cd ~/Dropbox/ads/'
alias gcti='cd ~/Dropbox/ads/cti/'
alias gdsc='cd ~/Dropbox/ads-applied-data-science/dsc-data-science-certification/'
alias gdots='cd ~/Dropbox/dot-files'
alias ggo='cd ~/Dropbox/go-workspace/src/github.com/user/rlowrance'
alias gledger='cd ~/Dropbox/family/ledger/'
alias gmed='cd ~/family/medical/'
alias gre='cd ~/Dropbox/shasha/re-avm/src'
alias gpaper1='cd ~/Dropbox/shasha/re-avm/docs/paper1'
alias gref='cd ~/Dropbox/reference'
alias gtimesheet='cd ~/Dropbox/timesheet'
alias gtodo='cd ~/Dropbox/todo'

# misc
alias startdropbox='~/.dropbox-dist/dropboxd'
alias fixcapslock='xmodmap ~/Dropbox/dot-files/make-capslock-another-escape.xmodmap'
alias topslowcpu='top -s 30 -o cpu'

# time sheet
alias timesheet='emacs ~/Dropbox/timesheet/timesheet.txt &'
alias timereport='python ~/Dropbox/timesheet/timereport.py'

# ssh
alias sshhome='ssh roy@66.65.168.212'
alias sshcarmen='ssh rel@10.0.1.22'
alias sshdell='ssh roy@10.0.1.36'
alias sshelektra='ssh roy@10.0.1.28'
alias sshhp='ssh roy@10.0.1.39'

# vnc
alias vnccarmen='vnc://10.0.1.22'

# Set the Lua path for require 'filename'
#LUA_THESIS='/Users/$USER/Dropbox/nyu-thesis-project/src.git/lua/'
#ROY1='${LUA_THESIS}?'
#ROY2='${LUA_THESIS}?.lua'

#LUA_KERNEL_SMOOTHERS='/Users/$USER/Dropbox/kernel-smoothers/'
#ROY3='${LUA_KERNEL_SMOOTHERS}?'
#ROY4='${LUA_KERNEL_SMOOTHERS}?.lua'

#LUA_DEFAULT_PATH=';'
#export LUA_PATH='${LUA_DEFAULT_PATH};${ROY1};${ROY2};${ROY3};${ROY4}'

# todo.txt
# make sure PATH contains directory
[[ :$PATH: == *$HOME/Dropbox/todo:* ]] || PATH=$HOME/Dropbox/todo:$PATH
alias t='$HOME/Dropbox/todo/todo.sh -d /Users/$USER/Dropbox/todo/todo.cfg'

# short cuts to servers
#export ACCESS='lowrance@access.cims.nyu.edu'
[[ :$PATH: == $HOME/anaconda2/bin:* ]] || PATH=$HOME/anaconda2/bin:$PATH
#[[ :$PATH: == $HOME/anaconda/bin:* ]] || PATH=$HOME/anaconda/bin:$PATH
# export PATH=~/anaconda2/bin::~/bin:/usr/local/bin:/usr/local/sbin:$PATH

PATH=~/Dropbox/dot-files/scripts:$PATH
PATH=~/java8/jdk1.8.0_92/bin:$PATH
PATH=/usr/local/stata:$PATH
PATH=/Library/TeX/texbin:$PATH
PATH=/usr/local/Cellar/ledger/3.1.1_2/bin:$PATH

# enable tab completion in conda
#eval '$(register-python-argcomplete conda)'

# file containing configuration info for pep8 (used by Python)
export XDG_CONFIG_HOME=~/Dropbox/dot-files/xdg_config_home/

# go-lang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Dropbox/go-workspace
export PATH=$PATH:$GOPATH/bin

# start emacs server
emacs --daemon
