#!/bin/bash

# Funktion zum Setzen der Git-Konfiguration und Pushen
set_git_config() {
    local repo=$1
    local username=$(grep "username" "$HOME/.autogit.conf" | cut -d '=' -f 2)
    local mail=$(grep "mail" "$HOME/.autogit.conf" | cut -d '=' -f 2)
    local token=$(grep "token" "$HOME/.autogit.conf" | cut -d '=' -f 2)

    # Git-Konfiguration setzen und pushen
    git remote set-url origin "https://${username}:${token}@github.com/${username}/${repo}"
    git config --global user.email "${mail}"
    git config --global user.name "${username}"
    git add .
    git commit -m "update"
    git branch -m main
    git checkout main
    git push -u origin
}

# Hauptfunktion
main() {
    if [ "$#" -eq 0 ]; then
        echo "Bitte geben Sie den Namen des Repositories an."
        exit 1
    fi
    set_git_config "$1"
}

# Hauptprogramm ausführen
main "$@"
