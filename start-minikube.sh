#!/bin/bash

set -eu

PROFILE_NAME=${PROFILE_NAME:-knativetutorial}
MEMORY=${MEMORY:-8192}
CPUS=${CPUS:-6}

EXTRA_CONFIG="apiserver.enable-admission-plugins=\
LimitRanger,\
NamespaceExists,\
NamespaceLifecycle,\
ResourceQuota,\
ServiceAccount,\
DefaultStorageClass,\
MutatingAdmissionWebhook"

minikube start \
  --kubernetes-version=v1.18.3 \
  --disk-size=50g \
  --vm-driver=none \
  --extra-config="$EXTRA_CONFIG" \
  --insecure-registry='10.0.0.0/24' 
