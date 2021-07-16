#!/usr/bin/env bash
set -e
source ./replicas.sh

# Description: Handles conversion of uploaded precise code intelligence bundles.
#
# Ports exposed to other Sourcegraph services: 3188/TCP
# Ports exposed to the public internet: none
#
docker run --detach \
    --name=precise-code-intel-worker \
    --network=sourcegraph \
    --restart=always \
    --cpus=2 \
    --memory=4g \
<<<<<<< HEAD
    -e 'SRC_FRONTEND_INTERNAL=sourcegraph-frontend-internal:3090' \
    index.docker.io/sourcegraph/precise-code-intel-worker:3.28.0@sha256:80f0ad97f81f63fca0cd062e6be7a15642f4bc187ea9280cb658dd32edd1016d
=======
    -e SRC_FRONTEND_INTERNAL=sourcegraph-frontend-internal:3090 \
    -e JAEGER_AGENT_HOST=jaeger \
    index.docker.io/sourcegraph/precise-code-intel-worker:3.29.1@sha256:364d097cce739ec158af2b795c6cb4402f296d9f761d4d8d2cbefa5a45e4a06e
>>>>>>> upstream/3.29

echo "Deployed precise-code-intel-worker service"
