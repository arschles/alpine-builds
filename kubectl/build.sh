#!/bin/bash

docker run --net=host --rm -e GOPATH=/gopath -v $PWD:/pwd -w /pwd golang:1.5.1 sh -c './install-godep.sh && ./go-build.sh'
