set -eu
TARGET=$(ls -d ~/workspace/* ~/* | fzf --header-first --header="Launch Project" --prompt="🔮 " --preview 'eza --tree --icons --color=always --level 3 --git-ignore {}')
NAME=$(basename $TARGET)
SESSION_NAME=$(echo $NAME | tr [:lower:] [:upper:])

smug start $NAME -a 2>/dev/null || smug start default name=$SESSION_NAME root=$TARGET -a
