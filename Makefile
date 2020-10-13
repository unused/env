
CMD=ansible-playbook
OPTS=-K -i inventory

system:
	$(CMD) $(OPTS) playbook.yml --tags=system

setup:
	sudo dnf install -y ansible

toolbox:
	./toolbox-builder.sh ruby ruby; \
	./toolbox-builder.sh js javascript; \
	./toolbox-builder.sh latex latex; \
	./toolbox-builder.sh dev dev

.PHONY: system setup toolbox
