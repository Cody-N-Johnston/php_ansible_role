#!/bin/bash
PLAYBOOK_FILE=$1

if [[ -e $PLAYBOOK_FILE ]]; then
	ansible-playbook --connection=local --inventory 127.0.0.1 --limit 127.0.0.1 $PLAYBOOK_FILE --ask-become-pass
else
	echo "Playbook $PLAYBOOK_FILE was not found."
fi
