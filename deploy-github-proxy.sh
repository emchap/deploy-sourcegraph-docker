#!/usr/bin/env bash
set -e
source ./replicas.sh

# Description: Rate-limiting proxy for the GitHub API.
#
# CPU: 1
# Memory: 1GB
# Disk: 1GB / non-persistent SSD (only for read-only config file)
# Network: 100mbps
# Liveness probe: n/a
# Ports exposed to other Sourcegraph services: 3180/TCP 6060/TCP
# Ports exposed to the public internet: none
#
docker run --detach \
    --name=github-proxy \
    --network=sourcegraph \
    --restart=always \
    --cpus=1 \
    --memory=1g \
    -e GOMAXPROCS=1 \
    -e SRC_FRONTEND_INTERNAL=sourcegraph-frontend-internal:3090 \
    -e JAEGER_AGENT_HOST=jaeger \
<<<<<<< HEAD
    index.docker.io/sourcegraph/github-proxy:3.28.0@sha256:beec9dcd8e6d801c7358943a411bb0a57fe8305a274d5744e00104008556ec69
=======
    index.docker.io/sourcegraph/github-proxy:3.29.1@sha256:68cdda9e9e3795b2da841b2a6ef5665e14b93a051cee9809bc9081fc04e48d7a
>>>>>>> upstream/3.29

echo "Deployed github-proxy service"
