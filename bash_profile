# this file is run whenever a login-shell is started
# a login shell has a login (user name and password)

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH="~/anaconda2/bin:$PATH"

# run .bashrc commands, if that file exists
# MacOS runs a log-in shell for each new terminal
# so run the new terminal commands, so that they are all in .bashrc
# instead of duplicated in .bashrc and .bash_profile
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

echo ran bash_profile
