#!/bin/bash
set -e

if [ "$DEPLOYED" != "true" ]
then
  bin/rails db:migrate 2>/dev/null || bin/rails db:setup || true
fi

exec "$@"