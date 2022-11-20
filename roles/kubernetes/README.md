
# Kubernetes Dev/Ops Environment

Install kubectl to setup a local kubernetes environment.

## Archive

You can install minikube using the currently deactivated recipe to have a local
k8s playground.

```
# see https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2
$ minikube start --vm-driver kvm # --alsologtostderr
# Note: adding user to libvirt group fails atm, running manually like:
$ sudo usermod -a -G libvirt $(whoami)
$ newgrp libvirt
```

- [x] install kubectl
- [x] install minikube
- [ ] ensure easy update (use latest versions)
- [ ] ensure VM driver is present
  - [ ] download docker-machine and ...-kvm
- [ ] check for kvm2

## References

- [Github minikube drivers][1]
- [Minkube How-To on Fedora Magazin][2]

[1]: https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#kvm-driver
[2]: https://fedoramagazine.org/minikube-kubernetes/

