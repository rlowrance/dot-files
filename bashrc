# prompt
PS1="\W $"

# ignore a command if the same command was just recorded
export HISTCONTROL=ignoredups

# protect against mistakes
#alias cp="cp --interactive --verbose"
#alias mv="mv --interactive --verbose"
#alias rm="rm --interactive"
# MacOS doesn't use long options
alias cp="cp -i -v"
alias mv="mv -i -v"
alias rm="rm -i"

# shortcuts
alias emacs-help="cat ~/Dropboox/tracking/emacs-help.txt"
alias todo="vim ~/Dropbox/todo/todo.txt"
alias projects="vim ~/Dropbox/todo/projects.org"
alias maybe="vim ~/Dropbox/todo/maybe.org"
alias tracking="vim ~/Dropbox/todo/tracking.org"
alias timesheet="vim ~/Dropbox/todo/timesheet.txt"
alias migraines="vim ~/Dropbox/todo/migraines.txt"

alias timereport="python ~/Dropbox/timesheet/timereport.py"

# start emacs in terminal
alias emacs="emacs -nw"

# Set Lua's path for require "filename"
#LUA_THESIS="/Users/$USER/Dropbox/nyu-thesis-project/src.git/lua/"
#ROY1="${LUA_THESIS}?"
#ROY2="${LUA_THESIS}?.lua"

#LUA_KERNEL_SMOOTHERS="/Users/$USER/Dropbox/kernel-smoothers/"
#ROY3="${LUA_KERNEL_SMOOTHERS}?"
#ROY4="${LUA_KERNEL_SMOOTHERS}?.lua"

#LUA_DEFAULT_PATH=";"
#export LUA_PATH="${LUA_DEFAULT_PATH};${ROY1};${ROY2};${ROY3};${ROY4}"

# todo.txt
PATH=$PATH:"/Users/$USER/Dropbox/todo"
alias t='/Users/$USER/Dropbox/todo/todo.sh -d /Users/$USER/Dropbox/todo/todo.cfg'

# short cuts to servers
#export ACCESS="lowrance@access.cims.nyu.edu"

# look for executable in ~/bin first, then Homebrew's executables
export PATH="~/anaconda/bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# ssh
alias sshelektra="ssh roy@24.193.90.232"

# enable tab completion in conda
eval "$(register-python-argcomplete conda)"

alias startdropbox="~/.dropbox-dist/dropboxd"
