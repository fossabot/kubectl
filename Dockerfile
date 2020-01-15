FROM alpine

ARG VERSION="v1.16.2"
ENV PS1="\[\e[0;36m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]:\[\e[0;35m\]\w\[\e[0m\]\$ "

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add curl && \
    apk add make

RUN apk add bash-completion \
    && echo 'source /usr/share/bash-completion/bash_completion' >>~/.bashrc \
    && echo 'source <(kubectl completion bash)' >> ~/.bashrc

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${VERSION}/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && mkdir /etc/bash_completion.d/ \
    && kubectl completion bash >/etc/bash_completion.d/kubectl \
    && echo 'alias k=kubectl' >>~/.bashrc \
    && echo 'complete -F __start_kubectl k' >>~/.bashrc

RUN mkdir /kube
WORKDIR /kube

# list all resources https://github.com/kubernetes/kubectl/issues/151#issuecomment-551868982
RUN printf "alias kall='kubectl get \$(kubectl api-resources --verbs=list -o name | paste -sd, -) --ignore-not-found --all-namespaces'\n" >>~/.bashrc
RUN printf "alias kcreatedashboard='kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml'\n" >>~/.bashrc

RUN cat ~/.bashrc
CMD ["/bin/bash"]
