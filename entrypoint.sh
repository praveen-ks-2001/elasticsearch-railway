#!/bin/bash
set -euo pipefail
exec /bin/tini -- /usr/local/bin/docker-entrypoint.sh eswrapper