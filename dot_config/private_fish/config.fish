/opt/homebrew/bin/mise activate fish | source
/opt/homebrew/bin/direnv hook fish | source
zoxide init fish | source


fish_add_path $HOME/.bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.bun/bin
fish_add_path /opt/whalebrew/bin


alias b bun
alias bx bunx
alias bi "bun install"
alias f fork
alias pn pnpm
alias px "pnpm dlx"
alias ch chezmoi
alias chc "chezmoi cd"
alias chf "fork (chezmoi source-path)"
alias chu "chezmoi git pull -- --autostash --rebase && chezmoi diff"
alias chU "chezmoi update"
alias chr "chezmoi re-add"

alias oplogin='eval $(op signin --account my)'


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

function upall
    brew bundle
    mise up
    brew upgrade
end

function cleanall
    brew cleanup
    mise prune
    yarn cache clean
    # bun pm cache rm
    pnpm store prune
    npm cache clean --force
    cargo cache -a
    docker system prune -af
    xcrun simctl delete unavailable
    rm -rf ~/Library/Developer/Xcode/DerivedData
    rm -rf ~/Library/Developer/Xcode/Archives
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end
