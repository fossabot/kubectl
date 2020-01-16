#!/bin/bash
shopt -s expand_aliases
source ~/.bashrc
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
