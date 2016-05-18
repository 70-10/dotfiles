# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"
