#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# (for M1) ARM / x86 Switcher
swa() {
    if  [[ "$(uname -m)" == arm64 ]]; then
        arch=x86_64
    elif [[ "$(uname -m)" == x86_64 ]]; then
        arch=arm64e
    fi
    exec arch -arch $arch "$SHELL" -l
}

if [ "$(uname -m)" = "arm64" ]; then
  export PATH="$HOME/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/Library/Apple/usr/bin:$HOME/.sg:$PATH"
  export HOMEBREW_CACHE=~/homebrew/cache
  export PATH="$PATH:/Users/hiromu.nakamura/homebrew:$PATH"
  export PATH="$PATH:/Users/hiromu.nakamura/homebrew/bin:$PATH"
  export PATH="$HOME/homebrew/opt/openssl@3/bin:$PATH"
  export LDFLAGS="-L/Users/hiromu.nakamura/homebrew/opt/libomp/lib"
  export CPPFLAGS="-I/Users/hiromu.nakamura/homebrew/opt/libomp/include"
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
  # # arm64
  export PYENV_ROOT="$HOME/.pyenv_arm64"
  export PATH="$HOME/.pyenv_arm64/bin:$PATH"
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  # Homebrew
  export GOROOT="$(brew --prefix golang)/libexec"
  # Manual install
  # export GOROOT=/usr/local/go
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:$GOROOT/bin
  eval "$(pyenv init --path)"
else
  export PATH="$HOME/intel/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/Library/Apple/usr/bin:$HOME/.sg:$PATH"
  export HOMEBREW_CACHE=~/intel/homebrew/cache
  export PATH="$HOME/intel/homebrew/opt/openssl@3/bin:$PATH"
  export LDFLAGS="-L/Users/hiromu.nakamura/intel/homebrew/opt/libomp/lib"
  export CPPFLAGS="-I/Users/hiromu.nakamura/intel/homebrew/opt/libomp/include"
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
  # x86_64
  export PYENV_ROOT="$HOME/.pyenv_x64"
  export PATH="$HOME/.pyenv_x64/bin:$PATH"
  eval "$(pyenv init --path)"
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  # Homebrew
  export GOROOT="$(brew --prefix golang)/libexec"
  # Manual install
  # export GOROOT=/usr/local/go
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:$GOROOT/bin
fi

# editor
export EDITOR='vim'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$HOME/.slack/bin:$PATH"
export PATH="$HOME/.colima/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/usr/local/mysql/bin:$PATH"
export PATH="$HOME/any/bin:$PATH"
export PATH="$HOME/.colima/bin:$PATH"
# export PATH="$PATH:/Users/hiromu.nakamura/Library/Application Support/Coursier/bin"
# export PATH="$HOME/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# export PATH="$HOME/.nodebrew/current/bin:$PATH"
export GODEBUG=asyncpreemptoff=1

# alias
alias ls='ls -G'
alias k='kubectl'
alias g='cd "$( ghq list --full-path | peco)"'
alias gt='git status'
alias gp='git push origin $(git symbolic-ref --short HEAD)'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias kc='kubectx'
alias memo='vim ~/ghq/github.com/po3rin/memo'
alias glpipe='glpipewait -u $(pbpaste) ; tput bel'
alias date='date'

export PATH="$(brew --prefix docker)/bin:$PATH"

# 補完
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# histroy
export HISTSIZE=10000
export HISTFILESIZE=10000
export SAVEHIST=1000000
export HISTCONTROL=ignoredups

# fuzzy checkout
fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

alias ch='git branch -a | fzf | xargs git checkout'

# fuzzy open
function peco-browser() {
    selected_repo="$(ghq list | peco)"
    if [ -n "$selected_repo" ]; then
      open https://${selected_repo}
    fi
}
alias rp='peco-browser'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hiromu.nakamura/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hiromu.nakamura/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hiromu.nakamura/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hiromu.nakamura/google-cloud-sdk/completion.zsh.inc'; fi

# k8s
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# mysql
export PATH="$(brew --prefix mysql-client)/bin:$PATH"


# gitlab
export GITLAB_ACCESS_TOKEN=glpat-HnT-_cJYMs6tZLWYWLnQ

# grpc
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# ta-lib
export TA_INCLUDE_PATH="$(brew --prefix ta-lib)/include"
export TA_LIBRARY_PATH="$(brew --prefix ta-lib)/lib"

# Docker
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
dr(){
	docker ps -a | awk 'FNR>1' | fzf | awk -F " " '{print $1}' | xargs docker rm
}
ds(){
	docker ps -a | awk 'FNR>1' | fzf | awk -F " " '{print $1}' | xargs docker stop
}
di(){
	docker images | awk 'FNR>1' | fzf | awk -F " " '{print $1}' | xargs docker rmi
}

# k8s
autoload -Uz compinit
compinit

kjf() {
  kubectl get cronjobs --all-namespaces | tr -s ' ' | cut -d ' ' -f 1,2 | tail -n +2 | fzf | xargs kj
}

## pod選択
kgp(){
	k get ns | awk 'FNR>1' | fzf | awk -F " " '{print $1}' | xargs kubectl get po -n
}
## ns選択
kgn(){
	k get ns | awk 'FNR>1' | fzf | awk -F " " '{print $1}'
}
## nsを引数にpodを選択してログを表示
klogs () {
	kubectl get po -n $1 | awk 'FNR>1' | fzf | awk -F " " '{print $1}' | xargs kubectl logs -n $1
}
## nsとpodを選択してログを表示
kl() {
	klogs $(kgn)
}

source <(kubectl completion zsh)



# prompt
function _kube-current-context () {
	KUBE_PS1_CONTEXT=$(kubectx -c | tr '-' '\n' | tr '_' '\n' | grep -e prod -e qa -e dev | uniq)
}
function _switch-profile () {
  # set the same name on iterm profile name
  case "$KUBE_PS1_CONTEXT" in
   prod ) profile="Prod";;
   * ) profile="Default";;
  esac
  
  echo -ne "\033]1337;SetProfile=$profile\a"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _switch-profile
add-zsh-hook precmd _kube-current-context
RPROMPT="%F{${prompt_pure_colors[path]}}⎈ ${KUBE_PS1_CONTEXT}%f %F{242}%T%f"

# vim-in-prompt
set -o vi
