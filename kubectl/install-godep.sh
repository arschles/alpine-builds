#!/bin/bash

# this script is part of a set that should be run inside a container. run build.sh to run the entire build

go get github.com/tools/godep
export PATH=$PATH:$GOPATH/bin
