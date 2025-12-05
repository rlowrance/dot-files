# print path components on new lines
alias showpath="echo $PATH | tr ':' '\n'"

# Set PATH to include user's bin directories, if they exist
if [[ -d "$HOME/bin" ]]; then
    export PATH="$HOME/bin:$PATH"
    echo $PATH
fi

if [[ -d "HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
	   
# Setting PATH for Python 3.13
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
export PATH
