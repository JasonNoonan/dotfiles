tput setaf ${$(( ( RANDOM % 6 ) + 1 ))} && printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "EYES UP, GUARDIAN"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_SILENT

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -Uz compinit && compinit


alias gap="git commit -a --amend --no-edit && git push --force-with-lease"
alias clean="rm package-lock.json && rm -rf ./node_modules && npm i"

# alias cloudsql="cloud_sql_proxy -instances=prod-4c32cd17:us-central1:janus-0c698b35=tcp:5433"
alias cloudsql="cloud_sql_proxy -instances=staging-e49c5d9c:us-central1:portal=tcp:5433"
alias tunnel="~/workspace/k8s-tunnel.sh"

alias cat="bat"

alias clearNvimCache="rm -rf ~/.local/share/nvim"

alias reloadagent="gpgconf --kill gpg-agent && gpg-connect-agent reloadagent /bye"

alias stripelisten="stripe listen --forward-to localhost:4000/webhooks/stripe"

# use exa for ls
alias ls='exa -a --icons --color=always --group-directories-first'
alias la='exa -al --icons --color=always --group-directories-first'
alias ll='exa -l --icons --color=always --group-directories-first'
alias lt='exa -aT --icons --color=always --group-directories-first'

# source this file
alias zso='source $HOME/.zshrc && source $HOME/.zshenv'

# elixir aliases
alias ips="iex -S mix phx.server"
alias mco="mix coveralls"
alias mcoh="mix coveralls.html"
alias mdl="mix dialyzer"
alias mcr="mix credo --strict"
alias mdc="mix deps.compile"
alias mdg="mix deps.get"
alias mes="mix ecto.setup"

alias serve="static -a 0.0.0.0 -p 8000" # simple static HTML server

alias rm="trash-put -v"
alias cp="cp -iv"
alias mv="mv -iv"

cdpath=(. $HOME/.config $HOME/workspace)

# fzf
function fgo() {
  target=$(command ls -d ~/* ~/workspace/* ~/.config/* ~/dots | fzf --preview "exa --tree --icons --level=3 --git-ignore {}")

  cd $target
  nvim
}

function w() {
  fd $1 | entr -c "''${@:2}"
}

function ew() {
  fd "\.exs?$" | entr -c "$@"
}

# vim keybindings for zsh
plugins=(vi-mode)

. "$(brew --prefix asdf)/libexec/asdf.sh"
. "$HOME/.cargo/env"

eval "$(direnv hook zsh)"

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
source ~/workspace/fzf-tab/fzf-tab.plugin.zsh
