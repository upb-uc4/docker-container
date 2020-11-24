#!/bin/sh

name=${1%_service}
kubectl config use-context kind-experimental
kubectl rollout restart deployment "$name" -n uc4-lagom