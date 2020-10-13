#!/usr/bin/bash

NAME=$1
TAGS=$2

echo "Creating toolbox $NAME with tags $TAGS\n"

# toolbox create -c $NAME
#
# toolbox run -c $NAME sudo dnf install -y ansible
toolbox run -c $NAME ansible-playbook -K -i inventory playbook.yml --tags=$TAGS
