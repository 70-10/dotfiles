alias mkdirp='mkdir -p'
alias reload='source ~/.zshrc'

alias ssh-configs='cat ~/.ssh/config| grep "Host " | sed -e "s/Host //g"'

alias g='git'

alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias vim="nvim"

alias count='gawk "END{ print NR }"'

alias df='df -h'
alias du='du -h'

alias h='history -i'

if type eza > /dev/null 2>&1; then
  alias ls='eza'
else
  alias ls='ls -G'
fi

alias ll='ls -lhF'
alias la='ls -alhF'
alias l='ls -CF'

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

if type bat > /dev/null 2>&1; then
  alias bat='BAT_THEME="Monokai Extended" bat -p'
fi

### Node modules
if type clipboard > /dev/null 2>&1; then
  alias cb='clipboard'
  alias -g CP='| clipboard'
fi

if type trash > /dev/null 2>&1; then
  alias rm='trash'
fi

if type npx > /dev/null 2>&1; then
  alias cdk='npx -y -p aws-cdk cdk'
  alias fixpkg='npx -y fixpkg'
  alias serve='npx -y serve'
  alias fkill='npx -y -p fkill-cli fkill'
fi

if type copilot > /dev/null 2>&1; then
  alias copilot-codex='COPILOT_MODEL=gpt-5-codex copilot'
  alias copilot-5='COPILOT_MODEL=gpt-5 copilot'
  alias copilot-5-mini='COPILOT_MODEL=gpt-5-mini copilot'
fi

### Docker
if type docker > /dev/null 2>&1; then
  alias d='docker'

  # application command
  alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v ${PWD}:/aws amazon/aws-cli'
  alias openapi-generator='docker run -it --rm -v ${PWD}:/local -w /local openapitools/openapi-generator-cli'
  alias radigo='docker run -it --rm -v ${PWD}:/output yyoshiki41/radigo:v0.11.0'
  alias kindlegen='docker run -it --rm -v ${PWD}:/kindle 7010/kindlegen'
fi
