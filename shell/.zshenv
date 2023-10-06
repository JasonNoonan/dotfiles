path=("$HOME/.dotnet/tools" $path)
path=("$HOME/.dotnet" $path)
path+=("/opt/homebrew/bin")
path+=("$HOME/.local/bin")

export ASPNETCORE_ENVIRONMENT="Development"

export ERL_AFLAGS="-kernel shell_history enabled"

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi

export FONTAWESOME_NPM_AUTH_TOKEN=06536BB0-ECE8-4A79-941F-416036FE5BD2
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export MANPAGER="nvim +Man!"

export FZF_DEFAULT_OPTS="--reverse --color=bg+:-1,fg:15,fg+:-1,prompt:6,header:5,pointer:2,hl:3,hl+:3,spinner:05,info:15,border:15"

export BAT_THEME="Catppuccin-mocha"
export PATH
