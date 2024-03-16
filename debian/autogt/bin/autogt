#!/bin/bash

# Display help page
display_help() {
    echo "Usage: ./autogt [OPTION]..."
    echo "A utility script for automating git operations based on .autogt.conf"
    echo ""
    echo "Options:"
    echo "  --set [repo]     Set up repository with settings from .autogt.conf"
    echo "  --push           Trigger a git push operation"
    echo "  --gh             Perform GitHub specific operations"
    echo "  --help, --h      Display this help and exit"
    echo "  --show           Display all details from .autogt.conf"
}

# Show details from .autogt.conf
show_details() {
    echo "Contents of .autogt.conf:"
    cat ~/.autogt.conf
}

# Main function to parse arguments
main() {
    if [ "$#" -eq 0 ]; then
        read -p "Username: " username
        read -p "Email: " mail
        read -s -p "Git Token: " token  # -s to hide input
        echo

        echo "username=${username}" > ~/.autogt.conf
        echo "mail=${mail}" >> ~/.autogt.conf
        echo "token=${token}" >> ~/.autogt.conf
    else
        case "$1" in
            --set)
                if [ -z "$2" ]; then
                    echo "Please specify the repository name."
                    exit 1
                fi
                /usr/share/autogt/src/set.sh "$2"
                ;;
            --push)
                /usr/share/autogt/src/push.sh
                ;;
            --gh)
                /usr/share/autogt/src/gh.sh
                ;;
            --help|--h)
                display_help
                ;;
            --show)
                show_details
                ;;
            *)
                echo "Invalid argument. Use './autogt --help' for more information."
                exit 1
                ;;
        esac
    fi
}

# Execute main function with all passed arguments
main "$@"
