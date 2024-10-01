#!/bin/bash

set -e -o pipefail

main() {
  ./install.sh
}

main "$@"

