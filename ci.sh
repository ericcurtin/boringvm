#!/bin/bash

set -e -o pipefail

main() {
  ./install.sh
  boringvm | grep NAME
}

main "$@"

