# \h  host name up to first .
# \W  basename of current working directory
# prompt PS1="\W $"
PS1="\h \W $"

# ignore a command if the same command was just recorded
export HISTCONTROL=ignoredups

# protect against mistakes
#alias cp="cp --interactive --verbose"
#alias mv="mv --interactive --verbose"
#alias rm="rm --interactive"
# MacOS does not use long options
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm="rm -i"

# shortcuts
alias emacs-help="cat ~/Dropboox/tracking/emacs-help.txt"

# todo.txt
alias thome="t ls @home; t lsp; t ls judith"
alias tnyu="t ls @nyu; t lsp; t ls remi; t ls david; t ls loraine; t ls foster"

# edit specific todo-related files
alias todo="vim ~/Dropbox/todo/todo.txt"
alias projects="vim ~/Dropbox/todo/projects.org"
alias maybe="vim ~/Dropbox/todo/maybe.org"
alias next="vim ~/Dropbox/next/plan.asciidoc"
alias tracking="vim ~/Dropbox/todo/tracking.org"
alias migraines="vim ~/Dropbox/todo/migraines.txt"

# tmux commands with hard-to-remember invocation options
alias tmuxnew="tmux new -s $1"
alias tmuxa="tmux a -t $1"
alias tmuxkill="tmux kill-session -t $1"

# switch to a directory
alias gdots="cd ~/Dropbox/dot-files"
alias gnotes="cd ~/Dropbox/Notes"
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
alias timesheet="vim ~/Dropbox/timesheet/timesheet.txt"
alias timereport="python ~/Dropbox/timesheet/timereport.py"

# start emacs in terminal
alias emacs="emacs -nw"

# ssh
alias sshelektra="ssh roy@66.65.168.212"
alias sshcarmen="ssh rel@10.0.1.22"

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
[[ :$PATH: == $HOME/anaconda/bin:* ]] || PATH=$HOME/anaconda/bin:$PATH
# export PATH=~/anaconda2/bin::~/bin:/usr/local/bin:/usr/local/sbin:$PATH


# enable tab completion in conda
eval "$(register-python-argcomplete conda)"

# file containing configuration info for pep8 (used by Python)
export XDG_CONFIG_HOME=~/Dropbox/dot-files/xdg_config_home/
