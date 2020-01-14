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


```
The host networking driver only works on Linux hosts, and is not supported on 
Docker Desktop for Mac
Docker Desktop for Windows
Docker EE for Windows Server
```
