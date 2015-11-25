#!/bin/bash

# this script is part of a set that should be run inside a container. run build.sh to run the entire build

mkdir -p $GOPATH/src/k8s.io/kubernetes
curl -L https://github.com/kubernetes/kubernetes/archive/v1.1.1.tar.gz > /kubeinstall/k8s-1.1.1.tar.gz
tar -xvzf k8s-1.1.1.tar.gz
mv kubernetes-1.1.1 $GOPATH/src/k8s.io/kubernetes
cd $GOPATH/src/k8s.io/kubernetes/cmd/kubectl
CGO_ENABLED=0 godep go build -o /pwd/kubectl
