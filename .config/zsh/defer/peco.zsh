peco-src() {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}

peco-history() {
    local tac
    if which tac > /dev/null; then
    tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
}

peco-aws-credentials() {
    local aws_credentials=$(cat ~/.aws/credentials | grep "\[" | sed -e 's/\[//g' | sed -e 's/\]//g' | peco --query "$LBUFFER")
    if [ -n "$aws_credentials" ]; then
    BUFFER="AWS_PROFILE=${aws_credentials}"
    CURSOR=$#BUFFER
    fi
}
