#!/bin/bash

# Funktion zum Setzen der Git-Konfiguration und Pushen
set_git_config() {
    local repo=$1
    # Die Befehle für Git in set.sh ausführen und .autogit.conf übergeben
    ./set.sh "$repo"
}

# Hauptfunktion
main() {
    if [ "$#" -eq 0 ]; then
        # Benutzer zur Eingabe von Benutzername, Mail und Git-Token auffordern
        read -p "Benutzername: " username
        read -p "Mail: " mail
        read -p "Git-Token: " token

        # Daten in .autogit.conf speichern
        echo "username=${username}" > ~/.autogit.conf
        echo "mail=${mail}" >> ~/.autogit.conf
        echo "token=${token}" >> ~/.autogit.conf
    elif [ "$1" == "--set" ]; then
        if [ -z "$2" ]; then
            echo "Bitte geben Sie den Namen des Repositories an."
            exit 1
        fi
        # Starte set.sh mit dem Repository-Namen
        set_git_config "$2"
    else
        echo "Ungültiges Argument. Verwenden Sie './autogit' ohne Argumente für die Konfiguration oder './autogit --set <repo>' für das Setzen der Git-Konfiguration und Pushen."
        exit 1
    fi
}

# Hauptprogramm ausführen
main "$@"
