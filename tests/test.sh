#!/bin/bash
source ~/.zshrc
set -eux

type kall
type kcreatedashboard
type keventst
type kevents
type linkerdprecheck
type linkerdinstall
type linkerduninstall
type linkerdcheck
type linkerdash
type k

k version --client
type helm
# ohmyzsh kubectl
type kdelcm
# zsh history
if [[ "$HISTFILE" == "/root/.volumes/.zsh_history" ]]; then true; fi
