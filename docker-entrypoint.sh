#!/bin/sh
set -e

bin/rails db:migrate 2>/dev/null || bin/rails db:setup || true

exec "$@"