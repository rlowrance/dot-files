# -*- mode: Sh -*-
# this file is run whenever a new terminal is started

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
alias es="emacs --daemon"
alias ect='emacsclient -t'
alias eskill="emacsclient -e '(client-save-kill-emacs)'"
alias eskill='emacsclient -e "(kill-emacs)"'
export ALTERNATE_EDITOR=''
export EDITOR='emacs -nw'
export VISUAL='emacs'

case "$OSTYPE" in
    darwin*) alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs';;
    linux*) ;;
    *);;
esac

# os x only
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

sync=~/Dropbox
ads=$sync/ads
control=$sync/control
todo=$control/todo

PYTHONPATH=$ads/python_lib
export PYTHONPATH

# todo.txt
alias thome='t ls @home; t lsp; t ls judith'
alias tedit='emacs $control/todo/todo.txt'

# edit specific todo-related files
alias todo='emacs $todo/todo.txt &'
alias projects='emacs $todo/projects.org &'
alias maybe='emacs $todo/maybe.org &'
alias tracking='emacs $todo/tracking.org &'
alias migraines='emacs $todo/migraines.org &'

# tmux commands with hard-to-remember invocation options
alias tmuxnew='tmux new -s $1'
alias tmuxa='tmux a -t $1'
alias tmuxkill='tmux kill-session -t $1'

# switch to a directory
alias gadmin="cd $control/admin"
alias gdots="cd $control/dot-files"
alias ggo="cd ~/Dropbox/go-workspace/src/github.com/user/rlowrance"
alias gledger="cd $control/ledger"
alias gref="cd ~/Dropbox/reference"
alias gre="cd $ads/research/shasha/re-avm/src"
alias gtimesheet="cd $control/timesheet"
alias gtodo="cd $control/todo"

# switch directories for ADS clients and prospects
clients=$ads/clients
alias g7chord="cd $clients/7chord/"
alias gads="cd $ads"
alias gaingel="cd $cients/AiNGEL/"
alias gamcap="cd $clients/a-and-m-capital"
alias gblumberg="cd $clients/blumberg-capital"
alias gdetectica="cd $clients/detectica"
alias gmck="cd $clients/mckinsey"
alias gamy="cd $clients/mckinsey/amy-row-zzc461"


# switch to directories for incubations
incubation=$ads/incubation
alias gdsc="cd $incubation/dsc-data-science-certification"

# misc
alias startdropbox='~/.dropbox-dist/dropboxd'
alias fixcapslock='xmodmap $control/dot-files/make-capslock-another-escape.xmodmap'
alias topslowcpu='top -s 30 -o cpu'

# time sheet
alias timesheet='emacs $control/timesheet/timesheet.txt &'
alias timereport='python $control/timesheet/timereport.py'

# ssh to home :: dell
alias sshhome='ssh roy@72.227.133.72'
# once at home:
alias sshjudith='ssh rel@10.0.1.55'
alias sshdell='ssh roy@10.0.1.36'
alias sshrpu='ssh roy@10.0.1.60'
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
[[ :$PATH: == *$todo/todo:* ]] || PATH=$todo:$PATH
alias t='$todo/todo.sh -d $todo/todo.cfg'

# short cuts to servers
#export ACCESS='lowrance@access.cims.nyu.edu'
[[ :$PATH: == $HOME/anaconda2/bin:* ]] || PATH=$HOME/anaconda2/bin:$PATH
#[[ :$PATH: == $HOME/anaconda/bin:* ]] || PATH=$HOME/anaconda/bin:$PATH
# export PATH=~/anaconda2/bin::~/bin:/usr/local/bin:/usr/local/sbin:$PATH

PATH=~$control/dot-files/scripts:$PATH
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

echo "ran control/dot-files/bashrc"

