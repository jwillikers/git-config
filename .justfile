default: install

alias f := format
alias fmt := format

format:
    just --fmt --unstable

install:
    #!/usr/bin/env bash
    set -euxo pipefail
    distro=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)
    if [ "$distro" = "fedora" ]; then
        variant=$(awk -F= '$1=="VARIANT_ID" { print $2 ;}' /etc/os-release)
        if [ "$variant" = "toolbx" ]; then
            sudo dnf --assumeyes install gcr git-credential-libsecret git-delta pre-commit
        elif [ "$variant" = "iot" ] || [[ "$variant" = *-atomic ]]; then
            sudo rpm-ostree install --idempotent gcr git-credential-libsecret git-delta pre-commit
            echo "Reboot to finish installation."
        fi
    fi
    cp --update=none config/work.inc.template config/work.inc
    ln --force --no-dereference --relative --symbolic config "{{ config_directory() }}/git"
    systemctl --user enable --now gcr-ssh-agent.socket
