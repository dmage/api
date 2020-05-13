#!/bin/sh -eu

builtins='[a-z0-9]+|struct{}'
pkgs='k8s\.io/api/.*|k8s\.io/apimachinery/.*|github\.com/openshift/api/.*'

go run ./hack/typelinter \
    -whitelist="^(?:\[]|\*|map\[string])*(?:$builtins|(?:$pkgs)\.[A-Za-z0-9]+)\$" \
    -excluded=github.com/openshift/api/build/v1.BuildStatus:Duration \
    -excluded=github.com/openshift/api/image/dockerpre012.Config:ExposedPorts \
    -excluded=github.com/openshift/api/image/dockerpre012.ImagePre012:Created \
    -excluded=github.com/openshift/api/imageregistry/v1.ImagePrunerSpec:KeepYoungerThan \
    ./...
