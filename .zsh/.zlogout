#!/usr/bin/zsh
if (( SHLVL = 1 )); then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    rm "$HOME/.vim/.viminfo"
    rm "$HOME/.vim/.viminfo.tmp"
    kill "$SSH_AGENT_PID"
fi
