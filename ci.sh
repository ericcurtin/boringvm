#!/bin/bash

main() {
  set -ex -o pipefail

  local maybe_sudo=""
  if [ "$EUID" -ne 0 ]; then
    maybe_sudo="sudo"
  fi

  if [ "$os" == "Darwin" ]; then
    ./install.sh
  else
    $maybe_sudo ./install.sh
  fi

  boringvm | grep NAME
}

main "$@"

