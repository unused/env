# my `env`ironment setup

A minimal Linux environment setup using [Ansible] to handle configs and
software packages.

The `roles` contain groups of setup tasks that serve to document and manage
changes to our machine. Every role contains a README file that summarizes
its purpose, usage and provides hints. Most common roles are:

| role                             | description                                                      |
| -------------------------------- | ----------------------------                                     |
| [system](roles/system/README.md) | Base Linux system settings.                                      |
| flatpak                          | Flatpak application deployment framework and packages.           |
| gnome-shell                      | Gnome window manager configuration.                              |
| vim                              | Configuration via [unused/.vim](https://github.com/unused/.vim). |
| ruby                             | Ruby development stuff.                                          |
| kubernetes                       | Local kubernetes development and testing environment.            |
| podman                           | Container image development environment.                         |
| minecraft                        | Linux client setup for Minecraft.                                |

To get some insights one might inspect the [packages vars of system
role](/roles/system/vars/packages-dev-RedHat.yml) or [gnome file
templates](/roles/system/files/gnome/Templates/).

## Usage

On a blank box install Ansible, build-tools, then run `make system`.

```sh
$ make pre-setup # uses dnf to install ansible and build-tools
$ make setup # setup machine, install packages, place configurations, etc.
$ make update TAGS=ruby,vim # update roles ruby and vim
```

## FAQ

*What the hack?*

Yes, why should you setup a machine using yaml files but trust me, it totally
makes sense. For several years I managed a lot of development environments and
after a while I did no longer recognize the difference of installing smth via
package manager or config file that triggers package manager, editing configs
or editing config templates. Therefor you suffer from no disadvantage when
Ansible manage your setup but many profits like versioning, reproducing,
structure, documentation and transparency.

*Does this run on any Linux box?*

Although the configuration is partly prepared for, currently the system is only
used and tested with a RedHat based Fedora Linux to automatically setup a
development workstation. If you really want to run this thing on your favourite
distribution, let me know, maybe we can take the challenge together.

*Man, there is so much missing in your machine!*

That's the point of a minimal setup. Fork it and adapt it to your needs.

*System is setup, trash this thing now?*

Nope, keep using it to make any changes to your systems. Ansible is clever and
will check changes and run the specific commands. Take care for conflicts, if
you adapt some Ansible managed file, you might end up with your changes getting
overridden.

[Ansible]: https://docs.ansible.com/
[Toolbox]: https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/
