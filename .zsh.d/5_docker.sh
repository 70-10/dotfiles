# Docker
alias d="docker"
alias dc="docker-compose"
if [ -s "/usr/local/bin/dinghy" ] ; then
  alias dm="dinghy"
  alias dm-start="dinghy start && eval \"\$(dinghy shellinit)\""
  alias dm-restart="dinghy restart && eval \"\$(dinghy shellinit)\""
  alias dm-env="eval \"\$(dinghy shellinit)\""
else
  alias dm="docker-machine"
  alias dm-start="docker-machine start default && eval \"\$(docker-machine env default)\""
  alias dm-restart="docker-machine restart default && eval \"\$(docker-machine env default)\""
  alias dm-env="eval \"\$(docker-machine env default)\""
fi

if [ -s "/usr/local/bin/docker-machine" ] ; then
  dm-env > /dev/null 2>&1
fi
