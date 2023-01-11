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

if type exa > /dev/null 2>&1; then
  alias ls='exa'
else
  alias ls='ls -G'
fi

alias ll='ls -lFh'
alias la='ls -alFh'
alias l='ls -CF'

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
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
  alias sort-package-json='npx -y sort-package-json@1.48'
  alias sort-package-json-ignore-scripts='npx -y sort-package-json'
fi

### Docker
if type docker > /dev/null 2>&1; then
  alias d='docker'
  alias d-compose='docker compose'

  # application command
  alias plantuml-server='docker run -d --name plantuml-server -p 8080:8080 -e PLANTUML_LIMIT_SIZE=160000 plantuml/plantuml-server'
  alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v ${PWD}:/aws amazon/aws-cli'
  alias openapi-generator='docker run -it --rm -v ${PWD}:/local -w /local openapitools/openapi-generator-cli'
  alias radigo='docker run -it --rm -v ${PWD}:/output yyoshiki41/radigo'
  alias kindlegen='docker run -it --rm -v ${PWD}:/kindle 7010/kindlegen'
  alias serve-local='docker run --rm -v ${PWD}:/usr/share/nginx/html:ro -p 8080:80 nginx:alpine'
fi
