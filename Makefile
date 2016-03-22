
CMD=ansible-playbook
OPTS=-K -i inventory

all:
	$(CMD) $(OPTS) playbook.yml

.PHONY: all test

test:
	echo "todo"

