#!/bin/bash

main() {
  set -ex -o pipefail

  black --line-length 80 boringvm
  flake8 --max-line-length=80 boringvm
  shellcheck *.sh
}

main "$@"

