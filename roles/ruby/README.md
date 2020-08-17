
# ruby ansible role

run, then...

```sh
$ rbenv
$ update-rbenv # shorthand to update rbenv and fetch versions
```

## rbenv

```sh
# optional, to speedup
$ cd ~/.rbenv && src/configure && make -C src
# init rbenv
$ ~/.rbenv/bin/rbenv init
```

see [https://github.com/rbenv/rbenv]

NOTE: Older ruby versions may depend on openssl 1.0 that is packed as separate
library in Fedora via `compat-openssl10-devel` but requires openssl-devel
to be removed. Better install them in a container.
