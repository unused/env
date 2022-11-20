
# Ruby Environment using Rbenv

run, then...

```sh
$ ruby -v # show current Ruby version
$ rbenv version # see how rbenv did decide to set current Ruby version
$ rbenv versions # list installed versions
$ rbenv install --list-all # show all Ruby versions that can be installed
$ rbenv install 3.1.2 # install ruby version 3.1.2
$ update-rbenv # custom shorthand to update rbenv and fetch ruby versions
```

## Ruby Environment

[rbenv](https://github.com/rbenv/rbenv) is a Ruby version manager that allows
you to use different versions of Ruby on your machine. If you create a
`.ruby-version` file in the root of your project, rbenv will automatically
switch to this environment for you.

```sh
# optional, to speedup
$ cd ~/.rbenv && src/configure && make -C src
# init rbenv
$ ~/.rbenv/bin/rbenv init
```

NOTE: Old versions of Ruby depend on openssl 1.0 that is packed as separate
library in Fedora via `compat-openssl10-devel` but requires openssl-devel to be
removed. Better install them in a container.

## Rubygems System

- `mailcatcher` creates a local smtp stub to record mails instead of sending
  them and additionally starts a local [website](http://localhost:1080) to
  browse catched emails.
