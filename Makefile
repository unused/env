
CMD=ansible-playbook
OPTS=-K -i inventory

all:
	$(CMD) $(OPTS) playbook.yml ${ARGS}

prepare:
	su -c 'dnf install libselinux-python python-dnf ansible'

test:
	echo "todo o.O"

.PHONY: all prepare test
