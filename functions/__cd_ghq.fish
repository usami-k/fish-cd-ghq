function __cd_ghq -d 'Change directory to select from ghq list'
    if not command -sq ghq
        echo 'Error: __cd_ghq needs ghq command.'
    end
    if not command -sq fzf
        echo 'Error: __cd_ghq needs fzf command.'
    end
    ghq list --full-path | fzf --no-sort --query (commandline) | read selected
    test -n "$selected" ; and cd "$selected"
    commandline -f repaint
end
