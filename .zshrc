#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export HOMEBREW_CACHE=~/homebrew/cache
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$HOME/homebrew/bin:/Users/hiromu.nakamura/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:$PATH"

# alias
alias ls='ls -G'
alias hi='cd ~/hi'
alias m3='cd ~/m3'
alias g='cd "$( ghq list --full-path | peco)"'
alias gt='git status'
alias gp='git push origin $(git symbolic-ref --short HEAD)'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

# python
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
export PATH="$PYENV_ROOT/bin:$PATH"

# 補完
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fuzzy checkout
fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}
alias ch='fzf-git-branch'
