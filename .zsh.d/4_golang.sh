# export GOPATH=$HOME/develop/practice/vagrant/golang/go
GO_VERSION=`go version | awk -F "go" '{print $3}' | awk '{print $1}'`
THIRD_PARTY=$HOME/.golang/$GO_VERSION
PRACTICE_PROJECT=$HOME/develop/practice/golang
WORK_PROJECT=$HOME/develop/workspace/golang
export GOPATH=$THIRD_PARTY:$WORK_PROJECT:$PRACTICE_PROJECT
export PATH=$THIRD_PARTY/bin:$PATH
