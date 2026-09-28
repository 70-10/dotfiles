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
    local profiles=""

    # credentials ファイルからプロファイル名を抽出
    if [ -f ~/.aws/credentials ]; then
        profiles=$(cat ~/.aws/credentials | grep "^\[" | sed -e 's/\[//g' | sed -e 's/\]//g')
    fi

    # config ファイルから [profile xxx] 形式のプロファイル名を抽出（[default] は除外）
    if [ -f ~/.aws/config ]; then
        local config_profiles=$(cat ~/.aws/config | grep "^\[profile " | sed -e 's/\[profile //g' | sed -e 's/\]//g')
        if [ -n "$profiles" ]; then
            profiles="${profiles}\n${config_profiles}"
        else
            profiles="${config_profiles}"
        fi
    fi

    # 重複を除去してソート、peco で選択
    local selected_profile=$(echo -e "$profiles" | sort -u | peco --query "$LBUFFER")

    if [ -n "$selected_profile" ]; then
        BUFFER="AWS_PROFILE=${selected_profile}"
        CURSOR=$#BUFFER
    fi
}