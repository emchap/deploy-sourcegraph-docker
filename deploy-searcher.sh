#!/usr/bin/env bash
set -e
source ./replicas.sh

# Description: Backend for text search operations.
#
# Disk: 128GB / non-persistent SSD
# Network: 100mbps
# Liveness probe: HTTP GET http://searcher:3181/healthz
# Ports exposed to other Sourcegraph services: 3181/TCP 6060/TCP
# Ports exposed to the public internet: none
#
VOLUME="$HOME/sourcegraph-docker/searcher-$1-disk"
./ensure-volume.sh $VOLUME 100
docker run --detach \
    --name=searcher-$1 \
    --network=sourcegraph \
    --restart=always \
    --cpus=2 \
    --memory=2g \
    -e GOMAXPROCS=2 \
    -e SRC_FRONTEND_INTERNAL=sourcegraph-frontend-internal:3090 \
    -e JAEGER_AGENT_HOST=jaeger \
    -v $VOLUME:/mnt/cache \
<<<<<<< HEAD
    index.docker.io/sourcegraph/searcher:3.28.0@sha256:e6686e172864038cfad9515a5eb6c285151ce8e5600a7044702bc6b77bff0b91
=======
    index.docker.io/sourcegraph/searcher:3.29.1@sha256:907c403a9e1b24b25d8b099e155bb4d22e3399cf985bf2119217b0797f7e57f3
>>>>>>> upstream/3.29

echo "Deployed searcher $1 service"
