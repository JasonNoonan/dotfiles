# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -Uz compinit && compinit

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export FONTAWESOME_NPM_AUTH_TOKEN=06536BB0-ECE8-4A79-941F-416036FE5BD2
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

alias gap="git commit -a --amend --no-edit && git push --force-with-lease"
alias clean="rm package-lock.json && rm -rf ./node_modules && npm i"

# alias cloudsql="cloud_sql_proxy -instances=prod-4c32cd17:us-central1:janus-0c698b35=tcp:5433"
alias cloudsql="cloud_sql_proxy -instances=staging-e49c5d9c:us-central1:portal=tcp:5433"
alias tunnel="~/workspace/k8s-tunnel.sh"

alias cat="bat"

alias clearNvimCache="rm -rf ~/.local/share/nvim"

alias reloadagent="gpgconf --kill gpg-agent && gpg-connect-agent reloadagent /bye"

alias stripelisten="stripe listen --forward-to localhost:4000/webhooks/stripe"

export PATH="/opt/homebrew/opt/dotnet@6/bin:/Users/jasonnoonan/.dotnet:$PATH"
export ASPNETCORE_ENVIRONMENT="Development"

export ERL_AFLAGS="-kernel shell_history enabled"
. "$(brew --prefix asdf)/libexec/asdf.sh"
export SENDGRID_API_KEY="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"
export STRIPE_API_KEY="sk_test_51LnOD4KVm4WHjNVwUkUZ2onqpLTrCYtS0LmfMJgpUlxSpz2cbAhlMUmsyIKlDj2UWL8x3lhyh5NbYOvsYdF4u3zA00MdftS3MC"

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi
tput setaf ${$(( ( RANDOM % 6 ) + 1 ))} && printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "EYES UP, GUARDIAN"
