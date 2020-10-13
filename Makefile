
CMD=ansible-playbook
OPTS=-K -i inventory

system:
	$(CMD) $(OPTS) playbook.yml --tags=system

setup:
	sudo dnf install -y ansible

toolbox:
	toolbox list && \
		toolbox create -c ruby && \
		podman exec ruby dnf install -y ansible && \
		podman exec ruby $(CMD) $(OPTS) playbook.yml --tags=ruby && \
		toolbox create -c dev && \
		podman exec dev dnf install -y ansible && \
		podman exec dev $(CMD) $(OPTS) playbook.yml --tags=dev \
		toolbox create -c latex && \
		podman exec latex dnf install -y ansible && \
		podman exec latex $(CMD) $(OPTS) playbook.yml --tags=latex

.PHONY: system setup toolbox
