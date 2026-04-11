#!/usr/bin/env bash

echo "home bash logout reached $(date)" >> /tmp/home_logout_bash
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    /bin/rm "$HOME/.viminfo"
    history -c
    kill "$SSH_AGENT_PID"
fi
