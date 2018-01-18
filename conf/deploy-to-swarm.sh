#!/usr/bin/env bash

set -xeu

ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ${SWARM_USERNAME}@${SWARM_URL} << EOF
set +x
DOCKER_LOGIN=$(aws ecr get-login --no-include-email --region eu-west-1) && ${DOCKER_LOGIN}
docker service rm ${SERVICE_NAME}
docker service create ${SERVICE_EXTRA_CONFIG} --name ${SERVICE_NAME} --detach=false --with-registry-auth ${SERVICE_REPOSITORY}/${SERVICE_NAME}:${SERVICE_TAG}
docker service ps ${SERVICE_NAME}
EOF