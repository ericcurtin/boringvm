#!/bin/bash

main() {
  set -ex -o pipefail

  local maybe_sudo=""
  if [ "$EUID" -ne 0 ]; then
    maybe_sudo="sudo"
  fi

  local os
  os="$(uname -s)"
  if [ "$os" == "Darwin" ]; then
    brew install shellcheck
    ./install.sh
  else
    $maybe_sudo ./install.sh
  fi

  boringvm images | grep NAME
  pipx install black flake8
  ./lint.sh
  ./tree-status.sh
}

main "$@"

