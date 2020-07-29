. ~/.bash_functions
. ~/.bash_aliases

export PS1="\[\033[32m\]\u@\h\[\033[00m\] \w\[\033[33m\]\$(git_branch)\[\033[00m\] $ "

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=nvim
export PAGER=less
export PATH=$HOME/bin:$HOME/.local/bin:/snap/bin:$PATH


if [[ "$OSTYPE" == "darwin"* ]]; then
    PREFIX=$(brew --prefix)
    # Setting PATH for Python 3.7
    export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
    # Setting PATH for Python 2.7
    export PATH=/Users/ivan/Library/Python/2.7/bin:$PATH
    export PATH=$PATH:/Applications/calibre.app/Contents/console.app/Contents/MacOS
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/ivan/Library/google-cloud-sdk/path.bash.inc' ]; then
        source '/Users/ivan/Library/google-cloud-sdk/path.bash.inc';
    fi
    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/ivan/Library/google-cloud-sdk/completion.bash.inc' ]; then
        source '/Users/ivan/Library/google-cloud-sdk/completion.bash.inc';
    fi
else
    PREFIX=""
fi

# git autocompletion
if [ -f $PREFIX/etc/bash_completion.d/git-completion.bash ]; then
  . $PREFIX/etc/bash_completion.d/git-completion.bash
fi

# kubectl autocompletion
if [[ $(which kubectl) ]]; then
    source <(kubectl completion bash)
    if [ -f $PREFIX/etc/bash_completion ]; then
    . $PREFIX/etc/bash_completion
    fi
fi

# Python
export WORKON_HOME=~/.virtualenvs
export PYTHONBREAKPOINT=ipdb.set_trace

if [ -f /usr/bin/python3 ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
else
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
fi
# Initialize virtualenvwrapper
VIRTUALENVWRAPPER_LOC=$(which virtualenvwrapper_lazy.sh) # /usr/local/bin/virtualenvwrapper_lazy.sh
if [ -f $VIRTUALENVWRAPPER_LOC ]; then
    source $VIRTUALENVWRAPPER_LOC
fi

# Go
export PATH=$PATH:/usr/local/go/bin:${HOME}/go/bin
export GOPATH=$(go env GOPATH)
