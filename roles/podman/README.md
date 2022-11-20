
# Podman & Toolbox

Installs container runtime environment [podman](https://podman.io/) and
containerized environment utility [toolbox](https://containertoolbx.org/).

Using containers can help to keep a base machine clean. I usually try to avoid
having lots of packages installed when I rarely need them (e.g. latex
packages), have databases at hand when I need them, but only when I need them.
From time to time I also need to work in a very specific environment, that can
be straightforward to build in a container and impossible on a system level.

```sh
$ podman ps # list all running container
$ podman images # list all images
$ podman start redis # start a container named redis
$ podman stop redis # stop container redis
```

## Usage & Recipies

`podman` provides a docker-compatible interface (`alias docker=podman`) that
runs on a user level (non-priviledged).

```sh
# Have a database like postgres, mongodb, redis, etc. at hand w/o the need to
# install it on your base system.
$ podman run --name mongodb -p27017:27017 -d mongo
$ podman run --name postgres -p5432:5432 -d postgres
$ podman run --name redis -p6379:6379 -d redis
```

`toolbox` creates a sandbox environment. A common use-case for me is to keep
my latex environment in such a sandbox. Your file system will seamless be
available for you.

```sh
$ toolbox create latex # create new toolbox named "latex"
$ toolbox enter latex # enter the container
# Packaes will be installed and be available inside the container, the host
# system remains clean.
$ sudo dnf install pdflatex
$ exit # leaving the container
$ toolbox list # list all created container
$ toolbox create --image golang:1.18 go18 # create container w/ Go version 1.18
```
