IMG=env-test

CMD=ansible-playbook
OPTS=-K -i inventory
TAGS=

.PHONY: setup
setup:
	$(CMD) $(OPTS) playbook.yml

.PHONY: pre-setup
pre-setup:
	sudo dnf install -y ansible

.PHONY: test
test:
	IMG=$(IMG) bundle exec ruby specs/*_test.rb

.PHONY: test-setup
test-setup:
	podman build -t $(IMG) .
