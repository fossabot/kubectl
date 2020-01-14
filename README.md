[![Docker Repository on Quay](https://quay.io/repository/bukow/kubectl/status "Docker Repository on Quay")](https://quay.io/repository/bukow/kubectl)

Created by following [documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl/#optional-kubectl-configurations)
```bash
docker run --rm -it --network=host \
    -v /${PWD}:/kube \
    -v ~.kube/:/root/.kube \
    quay.io/bukow/kubectl
```
```bash
alias kd='docker run --rm -it --network=host -v /${PWD}:/kube -v ~.kube/:/root/.kube quay.io/bukow/kubectl'
alias kd='docker run --rm -it --network=host -v /${PWD}:/kube -v ~.kube/:/root/.kube quay.io/bukow/kubectl:1.16.2'
```


```
The host networking driver only works on Linux hosts, and is not supported on 
Docker Desktop for Mac
Docker Desktop for Windows
Docker EE for Windows Server
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
