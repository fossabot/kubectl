[![Docker Repository on Quay](https://quay.io/repository/bukow/kubectl/status "Docker Repository on Quay")](https://quay.io/repository/bukow/kubectl)
```bash
docker run --rm -it --network=host \
    -v /${PWD}:/kube \
    -v ~.kube/:/root/.kube \
    quay.io/bukow/kubectl
```
```bash
alias k='docker run --rm -it --network=host -v /${PWD}:/kube -v ~.kube/:/root/.kube quay.io/bukow/kubectl'
alias k='docker run --rm -it --network=host -v /${PWD}:/kube -v ~.kube/:/root/.kube quay.io/bukow/kubectl:1.16.2'
```
