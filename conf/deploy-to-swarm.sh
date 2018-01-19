#!/usr/bin/env bash

set -xeu

#whoami
#ls -la /root/.ssh
#cat /root/.ssh/id_rsa
#ping ${SWARM_URL} -t 10
#curl ${SWARM_URL}:2375/images/json
#apt-get update && apt-get install openssl -y
#openssl rsa -in /root/.ssh/id_rsa -noout -modulus

docker -H ${SWARM_URL} service create ${SERVICE_EXTRA_CONFIG} --name ${SERVICE_NAME} --detach=false --with-registry-auth ${SERVICE_REPOSITORY}/${SERVICE_NAME}:${SERVICE_TAG}
docker -H ${SWARM_URL} service ls

#ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ${SWARM_USERNAME}@${SWARM_URL} /bin/bash << EOF
#DOCKER_LOGIN=\$(aws ecr get-login --no-include-email --region eu-west-1) && \$DOCKER_LOGIN
#docker service rm ${SERVICE_NAME}
#docker service create ${SERVICE_EXTRA_CONFIG} --name ${SERVICE_NAME} --detach=false --with-registry-auth ${SERVICE_REPOSITORY}/${SERVICE_NAME}:${SERVICE_TAG}
#docker service ls
#EOF
