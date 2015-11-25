#!/bin/bash

# this script is part of a set that should be run inside a container. run build.sh to run the entire build

echo "go get github.com/tools/godep"
go get github.com/tools/godep
export PATH=$PATH:$GOPATH/bin

echo "downloading k8s code"
mkdir -p $GOPATH/src/k8s.io/kubernetes

mkdir -p /kubedl
cd /kubedl
curl -s -L https://github.com/kubernetes/kubernetes/archive/v1.1.1.tar.gz > k8s-1.1.1.tar.gz
tar -xzf k8s-1.1.1.tar.gz
mv kubernetes-1.1.1 $GOPATH/src/k8s.io/kubernetes
cd $GOPATH/src/k8s.io/kubernetes

echo "CGO_ENABLED=0 godep go build -o /pwd/kubectl"
CGO_ENABLED=0 godep go build cmd/kubectl/kubectl.go -o /pwd/kubectl
