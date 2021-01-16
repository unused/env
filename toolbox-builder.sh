#!/usr/bin/bash

if ! [[ $# -eq 2 ]] ; then
  echo "Missing arguments. Usage: "
  echo "  $ ./toolbox-builder.sh <name> <tags>"
  exit -1
fi

NAME=$1
TAGS=$2

if ! toolbox list | grep -q $NAME; then
  echo "Creating toolbox $NAME"
  toolbox create -c $NAME
  toolbox run -c $NAME sudo dnf install -y ansible
fi

echo "Updating toolbox $NAME with tags $TAGS"
toolbox run -c $NAME ansible-playbook -K -i inventory playbook.yml --tags=$TAGS
