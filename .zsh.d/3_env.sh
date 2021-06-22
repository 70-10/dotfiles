# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# pyenv
eval "$(pyenv init --path)"

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

