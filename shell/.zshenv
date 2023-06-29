export PATH="$HOME/.local/bin:/opt/homebrew/opt/dotnet@6/bin:/Users/jasonnoonan/.dotnet:$PATH"
export ASPNETCORE_ENVIRONMENT="Development"

export ERL_AFLAGS="-kernel shell_history enabled"

export SENDGRID_API_KEY="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"
export STRIPE_API_KEY="sk_test_51LnOD4KVm4WHjNVwUkUZ2onqpLTrCYtS0LmfMJgpUlxSpz2cbAhlMUmsyIKlDj2UWL8x3lhyh5NbYOvsYdF4u3zA00MdftS3MC"

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
  export PINENTRY_USER_DATA="USE_CURSES=1"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export FONTAWESOME_NPM_AUTH_TOKEN=06536BB0-ECE8-4A79-941F-416036FE5BD2
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export MANPAGER="nvim +Man!"
