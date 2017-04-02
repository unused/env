
CMD=ansible-playbook
OPTS=-K -i inventory

all:
	$(CMD) $(OPTS) playbook.yml ${ARGS}

.PHONY: all test

test:
	echo "todo"

