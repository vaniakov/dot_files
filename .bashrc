. ~/.bash_functions
. ~/.bash_aliases

export PS1="\[\033[32m\]\u@\h\[\033[00m\] \w\[\033[33m\]\$(git_branch)\[\033[00m\] $ "
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=nvim
export PAGER=less
export PATH=$HOME/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:${HOME}/go/bin
export GOPATH=$(go env GOPATH)

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"




if [[ "$OSTYPE" == "darwin"* ]]; then
    PREFIX=$(brew --prefix)
    #export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
    #export PATH=/Users/ivan/Library/Python/2.7/bin:$PATH
    export PATH=$PATH:/Applications/calibre.app/Contents/console.app/Contents/MacOS
else
    export PATH=/snap/bin:$PATH
    PREFIX=""
fi

# git autocompletion
if [ -f $PREFIX/etc/bash_completion.d/git-completion.bash ]; then
  . $PREFIX/etc/bash_completion.d/git-completion.bash
fi

# kubectl autocompletion
if command -v kubectl &> /dev/null; then
    source <(kubectl completion bash)
fi


# aws autocompletion
if command -v aws &> /dev/null; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ivan/Library/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ivan/Library/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/ivan/Library/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ivan/Library/google-cloud-sdk/completion.bash.inc'; fi


# Python
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.8
export PYTHONBREAKPOINT=ipdb.set_trace
# Initialize virtualenvwrapper
source /usr/local/bin/virtualenvwrapper_lazy.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --extended'

[ -f "/Users/ivan/.ghcup/env" ] && source "/Users/ivan/.ghcup/env" # ghcup-env

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
