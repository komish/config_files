#!/bin/bash

BACKUP_DIR="$HOME/config_backups"
DATE_EXECUTED=$(date +%y-%m-%d-%T)

function help_text { 
cat<<EOF
Usage: Helper Function for populating your home directory 
with the    configuration files from this repository.
Something More Useful should probably go here.
EOF
}

function create_backup_dir {
    if [ -e $BACKUP_DIR ]; then
        return 0;
    else
        mkdir $BACKUP_DIR
    fi
}


## Check for help requests from user input
if [ "$1" == '--help' ] || [ "$1" == '-h' ] || [ "$1" == 'help' ] || [ "$1" == '-H' ]; then
    help_text && exit 0
fi

## Check if user is in the correct directory
if [ ! -e  ./dotfiles ]; then
    echo "You need to run this script in the same location as the 'dotfiles' directory. Exiting." && exit 1;
fi

for i in $(ls ./dotfiles/); do
    CONFIG_PATH="$HOME/.${i}"
    if [ -e  $CONFIG_PATH ]; then
        echo "Found an existing configuration file in place: $CONFIG_PATH"
        echo "Moving this file to backup location: $BACKUP_DIR"
        create_backup_dir && \
        mv $CONFIG_PATH $BACKUP_DIR/${i}.bak.${DATE_EXECUTED} && \
        echo "Moving $CONFIG_PATH into place." && cp ./dotfiles/${i} $CONFIG_PATH && echo;
    else
        echo "Moving $CONFIG_PATH into place."
        cp ./dotfiles/${i} $CONFIG_PATH
    fi
done

echo '[Orc Peon]: Work Complete!' && exit 0