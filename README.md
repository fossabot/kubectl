[![Docker Repository on Quay](https://quay.io/repository/bukow/kubectl/status "Docker Repository on Quay")](https://quay.io/repository/bukow/kubectl)

Created by following [documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl/#optional-kubectl-configurations)
```bash
docker run --rm -it --network=host \
    -v /${PWD}:/kube \
    -v ~.kube/:/root/.kube \
    quay.io/bukow/kubectl:1.16.2
```
```bash
alias kp='docker run --rm -it \
-v zsh_history_volume:/root/.volumes/ \
-v /${PWD}:/kube \
-v ~.kube/:/root/.kube \
quay.io/bukow/kubectl:1.16.2'

alias kdlinkerd='docker run --rm -it \
-v zsh_history_volume:/root/.volumes/ \
-v /${PWD}:/kube \
-v ~.kube/:/root/.kube \
-p 50750:50750 --expose 50750 \
quay.io/bukow/kubectl:1.16.2'
alias kpull='docker pull quay.io/bukow/kubectl:1.16.2'
```


```
The host networking driver only works on Linux hosts, and is not supported on 
Docker Desktop for Mac
Docker Desktop for Windows
Docker EE for Windows Server
```
