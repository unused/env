# TODO

- [ ] In `/etc/sysconfig/docker` add option `-g /home/me/.docker/storage` ...
      or set '{ "graph": "/home/..." }' in /etc/docker/daemon.json
- [ ] Change storage to overlay2 creating file `/etc/docker/daemon.json` with
      contents `{ "storage-driver": "overlay2" }`
- [ ] Configure selinux to accept container in /home
