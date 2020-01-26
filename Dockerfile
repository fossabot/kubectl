FROM ubuntu

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install \
    bash curl make openssl git

#RUN apk add bash-completion \
#    && echo 'source /usr/share/bash-completion/bash_completion' >>~/.bashrc \
#    && echo 'source <(kubectl completion bash)' >> ~/.bashrc

ARG VERSION="v1.16.2"
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl
#    && mkdir /etc/bash_completion.d/ \
#    && kubectl completion bash >/etc/bash_completion.d/kubectl \
#    && echo 'alias k=kubectl' >>~/.bashrc \
#    && echo 'complete -F __start_kubectl k' >>~/.bashrc

RUN mkdir /kube
WORKDIR /kube

# helm
ARG HELM_VERSION=3.0.2
RUN curl -LO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    tar -xvzf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    chmod +x linux-amd64/helm && \
    mv linux-amd64/helm /usr/local/bin && \
    rm -r "helm-v${HELM_VERSION}-linux-amd64.tar.gz" "linux-amd64"

# zsh ohmyzsh
# ENV PS1="\[\e[0;36m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]:\[\e[0;35m\]\w\[\e[0m\]\$ "
RUN apt-get -y install zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/bukforks/ohmyzsh/master/tools/install.sh)"
RUN sed -i "s/plugins=(git)/plugins=(git kubectl)/g" ~/.zshrc


# list all resources https://github.com/kubernetes/kubectl/issues/151#issuecomment-551868982
RUN printf "alias kall='kubectl get \$(kubectl api-resources --verbs=list -o name | paste -sd, -) --ignore-not-found --all-namespaces'\n" >>~/.zshrc
RUN printf "alias kcreatedashboard='kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml'\n" >>~/.zshrc
RUN printf "alias keventst='kubectl get -w -A events --sort-by=.eventTime'\n" >>~/.zshrc
RUN printf "alias kevents='kubectl get -w -A events --sort-by=.metadata.creationTimestamp'\n" >>~/.zshrc

# linkerd
RUN curl -sL https://run.linkerd.io/install | sh
ENV PATH="/root/.linkerd2/bin:${PATH}"
RUN printf "alias linkerdprecheck='linkerd check --pre'\n" >>~/.zshrc
RUN printf "alias linkerdinstall='linkerd install | kubectl apply -f -'\n" >>~/.zshrc
RUN printf "alias linkerduninstall='linkerd install --ignore-cluster | kubectl delete -f -'\n" >>~/.zshrc
RUN printf "alias linkerdcheck='linkerd check'\n" >>~/.zshrc
RUN printf "alias linkerdash='linkerd dashboard --address=0.0.0.0 &'\n" >>~/.zshrc

RUN apt-get clean
ENTRYPOINT ["/bin/zsh"]
