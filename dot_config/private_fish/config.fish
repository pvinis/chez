/opt/homebrew/bin/mise activate fish | source
/opt/homebrew/bin/direnv hook fish | source
zoxide init fish | source

fish_add_path $HOME/.bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.bun/bin


alias b bun
alias bx bunx
alias bi "bun install"
alias f fork
alias pn pnpm
alias px "pnpm dlx"

set fish_greeting
fish_vi_key_bindings

function cc
    if test -z "$argv"
        cursor .
    else
        cursor $argv
    end
end

function check_repo_reminder --on-variable PWD
    if string match -q "*purge*" (pwd)
        echo "⚠️🎥 time to stream your work!! 🎥⚠️"
        osascript -e 'display notification "⚠️🎥 time to stream your work!! 🎥⚠️" with title "purge work" sound name "Funk"'
    end
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end
