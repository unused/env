# my environment setup

A minimal Linux environment setup, using Ansible to manage configs and packages.

- Installs [Development Environment](/roles/system/vars/packages-dev-RedHat.yml)
- Installs [Common Software](/roles/system/vars/packages-RedHat.yml)
- Sets some [Gnome File Templates](/roles/system/files/gnome/Templates/)
- Configures git, vim, bash, rbenv, npm, golang, gnome-shell, minecraft.

## Usage

Install Ansible, then run `make`.

Actually, there may be some Ansible dependencies missing but you should get
pretty clear warnings while executing. For Fedora 23 you have to prepare the
system with some python libs.

```sh
$ make prepare # uses dnf to install some required packages
$ make
$ make ARGS=--tags=javascript # run tagged tasks only
```

Available roles are:

- system (default) ... Base linux system settings.
- gnome-shell (default) ... Gnome window manager configuration.
- vim (default) ... Configuration via
  [unused/.vim](https://github.com/unused/.vim).
- ruby (default) ... Programming language development environment.
- javascript (default) ... Programming language development environment.
- bumblebee ... Nvidia optimus Linux driver setup.
- kubernetes ... Local kubernetes development and testing environment.
- cron ... WIP
- docker ... WIP
- exercism ... WIP

## FAQ

*What the hack?*

Yes, why should you setup a machine using yaml files but trust me, it totally
makes sense. For several years I managed a lot of development environments and
after a while I did no longer recognize the difference of installing smth via
package manager or config file that triggers package manager, editing configs
or editing config templates. Therefor you suffer from no disadvantage when
Ansible manage your setup but many profits like versioning, reproducing,
structure and transparency.

*Does this run on any Linux box?*

Although the configuration is partly prepared for, currently the system only is
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

## Setup Infos, Details and Hints

- The clipboard manager parcellite provides a list of your last clipboard
  contents. You can access it with global shortcut `<ctrl-alt-h>`.
- To switch between workspaces (up/down) in gnome-shell use `<super-alt-j/k>`
  or with `shift` to move a window.
- In any terminal use `<ctrl+x><ctrl-e>` to open vim and type a long command.
- [imagemin] and [svgo] are nice cli tools to optimize images. Note:
  [images.guide] is a good read by Addy Osmani.

[imagemin]: https://github.com/imagemin/imagemin-cli
[svgo]: https://github.com/svg/svgo
[images.guide]: https://images.guide/

