export PATH="$HOME/.local/bin:/opt/homebrew/opt/dotnet@6/bin:/Users/jasonnoonan/.dotnet:$PATH"
export ASPNETCORE_ENVIRONMENT="Development"

export ERL_AFLAGS="-kernel shell_history enabled"

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export FONTAWESOME_NPM_AUTH_TOKEN=06536BB0-ECE8-4A79-941F-416036FE5BD2
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export MANPAGER="nvim +Man!"

export FZF_DEFAULT_OPTS="--reverse --color=bg+:-1,fg:15,fg+:-1,prompt:6,header:5,pointer:2,hl:3,hl+:3,spinner:05,info:15,border:15"
