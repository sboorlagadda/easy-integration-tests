#!/bin/bash

export TERM=${TERM:-dumb}

set -e

./easy-integration-tests/ci/start_services.sh

set -x

export GOPATH=$PWD/easy-integration-tests
export PATH=$GOPATH/bin:$PATH

echo "$GOPATH"

cd "$GOPATH/src/github.com/sboorlagadda/easystack"
go get github.com/onsi/ginkgo/ginkgo

ls "$GOPATH/bin/"

echo "$PATH"

ginkgo -r

exit 0