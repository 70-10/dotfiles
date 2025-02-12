ARCH=$(uname -m)
if [[ $ARCH == arm64 ]]; then
    # Apple Silicon
	eval $(/opt/homebrew/bin/brew shellenv)
elif [[ $ARCH == x86_64 ]]; then
    # Intel Mac
	eval $(/usr/local/bin/brew shellenv)
fi
