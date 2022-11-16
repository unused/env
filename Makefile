
CMD=ansible-playbook
OPTS=-K -i inventory
TAGS=

.PHONY: setup
setup:
	$(CMD) $(OPTS) playbook.yml

.PHONY: pre-setup
pre-setup:
	sudo dnf install -y ansible

.PHONY: test-setup
test-setup:
	podman build -t env-test . && \
		podman run -it --rm -v`pwd`:/home/me/env/:Z env-test
