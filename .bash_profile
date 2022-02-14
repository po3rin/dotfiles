export HOMEBREW_CACHE=~/homebrew/cache
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$HOME/homebrew/bin:/Users/hiromu.nakamura/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:$PATH"

alias ls='ls -G'

alias hi='cd ~/hi'
alias m3='cd ~/m3'

# python
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
export PATH="$PYENV_ROOT/bin:$PATH"
