# my environment setup

A minimal environment setup, using ansible to manage configs and packages.

- Installs [Development Environment](/roles/system/vars/packages-dev-RedHat.yml)
- Installs [Common Software](/roles/system/vars/packages-RedHat.yml)

## Usage

Install ansible, change the user in playbook.yml, then run `make`.

## Notes

Although the configuration is partly prepared for, currently the system only is used and tested with a RedHat based Fedora Linux to automatically setup a development workstation.

