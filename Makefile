IMG=env-test

CMD=ansible-playbook
OPTS=-K -i inventory
TAGS=system

.PHONY: setup
setup:
	$(CMD) $(OPTS) playbook.yml --tags=$(TAGS)

.PHONY: pre-setup
pre-setup:
	sudo dnf install -y ansible

.PHONY: test
test:
	IMG=$(IMG) bundle exec ruby test/*_test.rb

.PHONY: test-setup
test-setup:
	podman build -t $(IMG) .
