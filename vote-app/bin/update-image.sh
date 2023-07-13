#!/bin/bash

set -eou
# TODO 
cluster=$1
application_ns=$2
application_name=$3
application_version=$4
image_name='quarkus-app'

cd ${cluster}/${application_ns}/${application_name}/
kustomize edit set image ${image_name}=acme.com/repository/${application_name}:${application_version}