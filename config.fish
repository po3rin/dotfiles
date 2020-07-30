#alias

## git
alias git '/usr/local/Cellar/git/2.26.2/bin/git'
alias gt 'git status'

## vim
alias vimrc 'vim ~/.vimrc'

## bat
alias cat 'bat'

## tmux
alias t 'tmux'

## kubernetes
alias k 'kubectl'
alias kindup 'kind create cluster --config ~/.kind/kind-config.yml'
alias kinddown 'kind delete cluster'

## ghq & peco
alias cdr 'cd (ghq root)/(ghq list | peco)'
alias coder 'code (ghq root)/(ghq list | peco) -r'

## vscode
alias c 'code ./'
alias gocode 'code /usr/local/go/'

## python
alias pip 'pip3'
alias python 'python3'

## Mac controll
alias mute 'osascript -e "set volume with output muted"'
alias mut 'osascript -e "set volume 15/100*7"'
alias mu 'osascript -e "set volume 45/100*7"'

## path dir
alias la 'ls -al'
alias dev 'cd ~/hi_dev'
alias sdev 'cd ~/yagi_dev/kamelio_api_docker'
alias doc 'code ~/yagi_dev/doc'
alias infra 'cd ~/yagi_dev/infra'
alias cdocker 'colordocker'

## docker
alias dp 'docker system prune && docker image prune && docker container prune && docker volume prune'
alias di 'cdocker images'

#path
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH /usr/local/go/bin
set -x PATH $PATH ~/dev/google-cloud-sdk/bin
set -x PATH $PATH $HOME/.nodebrew/current/bin
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH /usr/local/Cellar/git/2.26.1_1/bin

# buildkit
set -x DOCKER_BUILDKIT 1
set -x BUILDKIT_HOST tcp://0.0.0.0:1234
set -x COMPOSE_DOCKER_CLI_BUILD 1

# Go
set -x GO111MODULE on

#fzf
function fvim
	set -l files (git ls-files)
	set -l selected_files (echo "$files" | fzf -m --preview 'head -101 {}')
	vim $selected_files
end

alias fzf 'fzf --preview "bat  --color=always --style=header,grid --line-range :100 {}"'

alias ch "open -a '/Applications/Google Chrome.app' (bmfzf)"


#func

function cd
    if test (count $argv) -eq 0
        return 0
    else if test (count $argv) -gt 1
        printf "%s\n" (_ "Too many args for cd command")
        return 1
    end
    # Avoid set completions.
    set -l previous $PWD

    if test "$argv" = "-"
        if test "$__fish_cd_direction" = "next"
            nextd
        else
            prevd
        end
        return $status
    end
    builtin cd $argv
    set -l cd_status $status
    # Log history
    if test $cd_status -eq 0 -a "$PWD" != "$previous"
        set -q dirprev[$MAX_DIR_HIST]
        and set -e dirprev[1]
        set -g dirprev $dirprev $previous
        set -e dirnext
        set -g __fish_cd_direction prev
    end

    if test $cd_status -ne 0
        return 1
    end
    ls
    return $status
end

eval (direnv hook fish)
