#!/usr/bin/env bash
set -e

# Description: Backend for syntax highlighting operations.
#
# Disk: none
# Network: 100mbps
# Liveness probe: HTTP GET http://syntect-server:9238/health
# Ports exposed to other Sourcegraph services: 9238/TCP 6060/TCP
# Ports exposed to the public internet: none
#
docker run --detach \
    --name=syntect-server \
    --network=sourcegraph \
    --restart=always \
    --cpus=4 \
    --memory=6g \
<<<<<<< HEAD
    index.docker.io/sourcegraph/syntax-highlighter:3.28.0@sha256:d7163842f41388f41d19ce04833ac5f6d4e41d212869e7d2aea9c38ba6e77261
=======
    index.docker.io/sourcegraph/syntax-highlighter:3.29.1@sha256:1d2ac738eec37f8a3ac4da3d73350a4f9be6a2d730074f07ce42dd9dd978b5fc
>>>>>>> upstream/3.29

echo "Deployed syntect-server service"
