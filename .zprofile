# In this file, set PATH and EDITOR
echo "Starting .zprofile with path: $path"

# In zsh, the path parameter is tied to the PATH environment variable
typeset -U path # assure entries are unique

python='/Library/Frameworks/Python.framework/Versions/3.13/bin'
path+=($python)
path+=(/opt/homebrew/bin)
path+=(/$HOME/bin)

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
echo
echo "ending .zprofile with path: $path"
