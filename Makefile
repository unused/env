IMG=env-test

CMD=ansible-playbook
OPTS=-K -i inventory
TAGS=system

.PHONY: setup
setup:
	$(CMD) $(OPTS) playbook.yml

.PHONY: pre-setup
pre-setup:
	sudo dnf install -y ansible

.PHONY: update
update:
	$(CMD) $(OPTS) playbook.yml --tags=$(TAGS)

.PHONY: check
check:
	$(CMD) $(OPTS) playbook.yml --check

.PHONY: diff
diff:
	$(CMD) $(OPTS) playbook.yml --check --diff

.PHONY: test
test:
	IMG=$(IMG) bundle exec ruby ./test.rb

.PHONY: test-setup
test-setup:
	podman build -t $(IMG) .
