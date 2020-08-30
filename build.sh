#!/bin/bash

set -e

export GOPATH=`pwd`
export GO_EXECUTABLE=`which go`

# Set vscode settings
mkdir -p .vscode
echo -n "{
    \"go.gopath\": \"`pwd`\"
}" > .vscode/settings.json

"$GO_EXECUTABLE" get github.com/wricardo/gomux
"$GO_EXECUTABLE" get github.com/joho/godotenv
"$GO_EXECUTABLE" get github.com/go-redis/redis
"$GO_EXECUTABLE" get github.com/aws/aws-sdk-go/aws
"$GO_EXECUTABLE" get github.com/aws/aws-sdk-go/service/s3

mkdir -p bin

GOOS=linux GOARCH=amd64 "$GO_EXECUTABLE" build -o bin/rcsm src/main.go