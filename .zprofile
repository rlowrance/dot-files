# print path components on new lines
alias showpath="echo $PATH | tr ':' '\n'"

python='/Library/Frameworks/Python.framework/Versions/3.13/bin'

# The path array mirrors the PATH scalar variable
typeset -U path
path=(~/bin $python $path)

# Set PATH to include user's bin directories, if they exist
# if [[ -d "$HOME/bin" ]]; then
#     export PATH="$HOME/bin:$PATH"
#     echo $PATH
# fi

# if [[ -d "HOME/.local/bin" ]]; then
#     export PATH="$HOME/.local/bin:$PATH"
# fi


# # Setting PATH for Python 3.13
# # The original version is saved in .zprofile.pysave
# export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:${PATH}"
