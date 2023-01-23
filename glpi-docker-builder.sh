#!/bin/bash

# config
# GLPI_DOCKER_DIRECTORY="./glpi-docker"
# GLPI_DIRECTORY="./glpi"
# GLPI_NIGHTLY_DIRECTORY="${GLPI_DOCKER_DIRECTORY}/glpi-nightly"
# GLPI_SOURCES_DIRECTORY="${GLPI_NIGHTLY_DIRECTORY}/sources"

# GLPI_IMAGE_NAME="glpi"
# GLPI_IMAGE_PATH="redzioch/glpi"

# read config
# GLPI_DOCKER_REPO=$(yq '.glpi-docker.repository.url' glpi-version.yml)
# GLPI_REPO=$(yq '.glpi.repository.url' glpi-version.yml)
# GLPI_TAG=$(yq '.glpi.tag' glpi-version.yml)

# clone glpi-docker
echo "*** Clone glpi-docker..."
if [ -d "${GLPI_DOCKER_DIRECTORY}" ]; then
  rm -rf ${GLPI_DOCKER_DIRECTORY}
fi
git clone ${GLPI_DOCKER_REPO} ${GLPI_DOCKER_DIRECTORY}

# clone glpi
echo "*** Clone glpi version ${GLPI_APP_TAG}..."
if [ -d "${GLPI_APP_DIRECTORY}" ]; then
  rm -rf ${GLPI_APP_DIRECTORY}
fi
git clone --depth 1 --branch ${GLPI_APP_TAG} ${GLPI_APP_REPO} ${GLPI_APP_DIRECTORY}

# move glpi as sources dir to glpi-docker
mv ${GLPI_APP_DIRECTORY} ${GLPI_DOCKER_DIRECTORY}/${GLPI_DOCKER_NIGHTLY_DIRECTORY}/${GLPI_DOCKER_SOURCES_DIRECTORY}

# remove .git from glpi sources
rm -rf ${GLPI_DOCKER_DIRECTORY}/${GLPI_DOCKER_NIGHTLY_DIRECTORY}/${GLPI_DOCKER_SOURCES_DIRECTORY}/.git

# build image
# cd ${GLPI_NIGHTLY_DIRECTORY}
# docker build -t ${GLPI_IMAGE_NAME} -f Dockerfile .
# if [ $? -ne 0 ]; then
#   echo "Building image failed"
#   exit 1
# fi

# # tag image
# docker tag ${GLPI_IMAGE_NAME} ${GLPI_IMAGE_PATH}
# docker tag ${GLPI_IMAGE_NAME} ${GLPI_IMAGE_PATH}:${GLPI_TAG}

# # push image
# docker push ${GLPI_IMAGE_NAME} --all-tags
# if [ $? -ne 0 ]; then
#   echo "Pushing image failed"
#   exit 1
# fi
