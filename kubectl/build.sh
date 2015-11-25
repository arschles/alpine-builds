#!/bin/bash

docker run --name="kubectl-alpine-build" --net=host --rm -e GOPATH=/gopath -v $PWD:/pwd -w /pwd golang:1.5.1 ./go-build.sh
