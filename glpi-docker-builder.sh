#!/bin/bash

# read config
GLPI_DOCKER_REPO=$(yq '.glpi-docker.repository.url' glpi-version.yml)
GLPI_REPO=$(yq '.glpi.repository.url' glpi-version.yml)
GLPI_TAG=$(yq '.glpi.tag' glpi-version.yml)

echo $GLPI_DOCKER_REPO
echo $GLPI_REPO
echo $GLPI_TAG