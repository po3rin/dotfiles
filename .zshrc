export UNAME=$(uname -m)

# (for M1) ARM / x86 Switcher
swa() {
    if  [[ $UNAME == arm64 ]]; then
        arch=x86_64
    elif [[ $UNAME == x86_64 ]]; then
        arch=arm64e
    fi
    exec arch -arch $arch "$SHELL" -l
}

if [ "$(uname -m)" = "arm64" ]; then
  export PATH="$HOME/homebrew/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/Library/Apple/usr/bin:$PATH"
  export PYENV_ROOT="$HOME/.pyenv_arm64"
  export PATH="$HOME/.pyenv_arm64/bin:$PATH"
else
  export PATH="$HOME/intel/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/Library/Apple/usr/bin:$PATH"
  export PYENV_ROOT="$HOME/.pyenv_x64"
  export PATH="$HOME/.pyenv_x64/bin:$PATH"
fi

export BREW_PREFIX=$(brew --prefix)
export BREW_PREFIX_XZ=$(brew --prefix xz)
export BREW_PREFIX_GOLANG=$(brew --prefix golang)
export HOMEBREW_CACHE=~"$BREW_PREFIX/cache"
export PATH="$BREW_PREFIX/opt/openssl@3/bin:$PATH"
export CFLAGS="-I$BREW_PREFIX_XZ/include"
export LDFLAGS="-L$BREW_PREFIX_XZ/lib"
export LDFLAGS="-L/$BREW_PREFIX/opt/libomp/lib"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT="$BREW_PREFIX_GOLANG/libexec"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# pyenv
pyenv() {
  unset -f pyenv
  eval "$(command pyenv init -)"
  pyenv $@
}

# editor
export EDITOR='nvim'

_compinit() {
  local re_initialize=0
  for match in ${ZDOTDIR}/.zcompdump*(.Nmh+24); do
    re_initialize=1
    break
  done
  
  autoload -Uz compinit
  if [ "$re_initialize" -eq "1" ]; then
    compinit
    # update the timestamp on compdump file
    compdump
  else
    # omit the check for new functions since we updated today
    compinit -C
  fi
}
 _compinit

# sheldon
cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}
sheldon_cache="$cache_dir/sheldon.zsh"
sheldon_toml="$HOME/.config/sheldon/plugins.toml"
if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
  mkdir -p $cache_dir
  sheldon source > $sheldon_cache
fi
source "$sheldon_cache"
unset cache_dir sheldon_cache sheldon_toml

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.local/bin/env

# tool PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$HOME/.slack/bin:$PATH"
export PATH="$HOME/.colima/bin:$PATH"
export PATH="$HOME/usr/local/mysql/bin:$PATH"
export PATH="$HOME/any/bin:$PATH"
export PATH="$HOME/.colima/bin:$PATH"
export GODEBUG=asyncpreemptoff=1

# alias
alias ls='ls -G'
alias k='kubectl'
alias g='cd "$( ghq list --full-path | peco)"'
alias gt='git status'
alias gp='git push origin $(git symbolic-ref --short HEAD)'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias claudeconf='nvim ~/Library/Application\ Support/Claude/;'
alias kc='kubectx'
alias memo='vim ~/ghq/github.com/po3rin/memo'
alias glpipe='glpipewait -u $(pbpaste) ; tput bel'
alias date='date'

export PATH="$(brew --prefix docker)/bin:$PATH"

# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# histroy
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir)($| )" ]]
}

# pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

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

# bookmark
alias bm='open $(bmfzf)'

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/intel/homebrew/share/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/intel/homebrew/share/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/intel/homebrew/share/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/intel/homebrew/share/google-cloud-sdk/completion.zsh.inc"; fi

# k8s
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# mysql
export PATH="$(brew --prefix mysql-client)/bin:$PATH"

kjf() {
  kubectl get cronjobs --all-namespaces | tr -s ' ' | cut -d ' ' -f 1,2 | tail -n +2 | fzf | xargs kj
}

# grpc
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1

# ta-lib
BREW_PREFIX_TALIB=$(brew --prefix ta-lib)
export TA_INCLUDE_PATH="$BREW_PREFIX_TALIB/include"
export TA_LIBRARY_PATH="$BREW_PREFIX_TALIB/lib"

# Docker
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

# lightgbm
export LDFLAGS="-L$HOME/intel/homebrew/opt/libomp/lib"
export CPPFLAGS="-I$HOME/intel/homebrew/opt/libomp/include"

# . "$HOME/.local/bin/env"
# eval "$(uv generate-shell-completion zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export AIDER_DARK_MODE=true

# claude
alias gc='claude "Add and commit, and write the commit message based on the diff. Please omit the message about editing with claude in the commit message."'

