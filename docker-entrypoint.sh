#!/bin/bash
set -e

# source Geant4 environment if present; ignore failure
if [ -f /opt/geant4/share/Geant4/geant4make/geant4make.sh ]; then
  # shellcheck disable=SC1090
  source /opt/geant4/share/Geant4/geant4make/geant4make.sh || true
fi

# replace shell with the command passed to container so signals are forwarded
exec "$@"