[core]
    pager = delta

[delta]
    features = decorations
    line-numbers = true
    syntax-theme = "Solarized (dark)"

[delta "decorations"]
    commit-decoration-style = blue ol
    commit-style = raw
    file-style = omit
    hunk-header-decoration-style = blue box
    hunk-header-file-style = red
    hunk-header-line-number-style = "#067a00"
    hunk-header-style = file line-number syntax

[delta "interactive"]
    keep-plus-minus-markers = false

[diff]
    colorMoved = default

[interactive]
    diffFilter = delta --color-only --features=interactive