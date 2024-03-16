#!/bin/bash

# Display help page
display_help() {
    echo "Usage: ./autogit [OPTION]..."
    echo "A utility script for automating git operations based on .autogit.conf"
    echo ""
    echo "Options:"
    echo "  --set [repo]     Set up repository with settings from .autogit.conf"
    echo "  --push           Trigger a git push operation"
    echo "  --gh             Perform GitHub specific operations"
    echo "  --help, --h      Display this help and exit"
    echo "  --show           Display all details from .autogit.conf"
}

# Show details from .autogit.conf
show_details() {
    echo "Contents of .autogit.conf:"
    cat ~/.autogit.conf
}

# Main function to parse arguments
main() {
    if [ "$#" -eq 0 ]; then
        read -p "Username: " username
        read -p "Email: " mail
        read -s -p "Git Token: " token  # -s to hide input
        echo

        echo "username=${username}" > ~/.autogit.conf
        echo "mail=${mail}" >> ~/.autogit.conf
        echo "token=${token}" >> ~/.autogit.conf
    else
        case "$1" in
            --set)
                if [ -z "$2" ]; then
                    echo "Please specify the repository name."
                    exit 1
                fi
                /usr/share/autogit/src/set.sh "$2"
                ;;
            --push)
                /usr/share/autogit/src/push.sh
                ;;
            --gh)
                /usr/share/autogit/src/gh.sh
                ;;
            --help|--h)
                display_help
                ;;
            --show)
                show_details
                ;;
            *)
                echo "Invalid argument. Use './autogit --help' for more information."
                exit 1
                ;;
        esac
    fi
}

# Execute main function with all passed arguments
main "$@"
