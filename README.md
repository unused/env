# my environment setup

A minimal Linux environment setup, using Ansible to manage configs and packages.

- Installs [Development Environment](/roles/system/vars/packages-dev-RedHat.yml)
- Installs [Common Software](/roles/system/vars/packages-RedHat.yml)
- Sets some [Gnome File Templates](/roles/system/files/gnome/Templates/)
- Configures GIT, vim, bash

## Usage

Install Ansible, then run `make`.

Actually, there may be some Ansible dependencies missing but you should get pretty clear warnings while executing. For Fedora 23 you have to prepare the system with some python libs.

```sh
$ su -c 'dnf install libselinux-python python-dnf'
```

## FAQ

*What the hack?*

Yes, why should you setup a machine using yaml files but trust me, it totally makes sense. For several years I managed a lot of development environments and after a while I did no longer recognize the difference of installing smth via package manager or config file that triggers package manager, editing configs or editing config templates. Therefor you suffer from no disadvantage when Ansible manage your setup but many profits like versioning, reproducing, structure and transparency.

*Does this run on any Linux box?*

Although the configuration is partly prepared for, currently the system only is used and tested with a RedHat based Fedora Linux to automatically setup a development workstation. If you really want to run this thing on your favourite distribution, let me know, maybe we can take the challenge together.

*Man, there is so much missing in your machine!*

That's the point of a minimal setup. Fork it and adapt it to your needs.

*System is setup, trash this thing now?*

Nope, keep using it to make any changes to your systems. Ansible is clever and will check changes and run the specific commands. Take care for conflicts, if you adapt some Ansible managed file, you might end up with your changes getting overridden.

## Setup Infos

- With clipboard manager parcellite you can use `<ctrl-alt-h>` to get a short history of your last clipboard contents.

## Tips and hints

- In shell use `<ctrl+x><ctrl-e>` to open vim to type a long command.

## Setup Details

### Windowmanager Gnome-Shell

GVim is predefined default editor. To switch between workspaces up/down use `<super-alt-j/k>` or with `shift` to move a window.

