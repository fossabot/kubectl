[![Docker Repository on Quay](https://quay.io/repository/bukow/kubectl/status "Docker Repository on Quay")](https://quay.io/repository/bukow/kubectl)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fbukowa%2Fkubectl.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fbukowa%2Fkubectl?ref=badge_shield)

```bash
alias kp='docker run --rm -it \
-v zsh_history_volume:/root/.volumes/ \
-v /${PWD}:/kube \
-v ~.kube/:/root/.kube \
quay.io/bukow/kubectl'

alias kdlinkerd='docker run --rm -it \
-v zsh_history_volume:/root/.volumes/ \
-v /${PWD}:/kube \
-v ~.kube/:/root/.kube \
-p 50750:50750 --expose 50750 \
quay.io/bukow/kubectl'
alias kpull='docker pull quay.io/bukow/kubectl:1.16.2'
```


```
The host networking driver only works on Linux hosts, and is not supported on 
Docker Desktop for Mac
Docker Desktop for Windows
Docker EE for Windows Server
```


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fbukowa%2Fkubectl.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fbukowa%2Fkubectl?ref=badge_large)