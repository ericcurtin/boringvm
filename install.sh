#!/bin/bash

cleanup() {
  rm -rf "$TMP" &
}

available() {
  command -v "$1" >/dev/null
}

download() {
  local curl_cmd=("curl" "--globoff" "--location" "--proto-default" "https")
  curl_cmd+=("-o" "$from" "--remote-time" "--retry" "10" "--retry-max-time")
  curl_cmd+=("10" "https://$url")
  "${curl_cmd[@]}"
}

main() {
  set -e -o pipefail

  local os
  os="$(uname -s)"
  if [ "$os" != "Linux" ]; then
    echo "This script is intended to run on Linux only"
    return 1
  fi

  if [ "$EUID" -ne 0 ]; then
    echo "This script is intended to run as root only"
    return 2
  fi

  local bindir
  for bindir in /opt/homebrew/bin /usr/local/bin /usr/bin /bin; do
    if echo "$PATH" | grep -q $bindir; then
      break
    fi
  done

  TMP="$(mktemp -d)"
  trap cleanup EXIT
  local from="boringvm"
  local url="raw.githubusercontent.com/ericcurtin/boringvm/s/$from"
  local from="$TMP/$from"
  download

  install -D -m755 "$from" "$bindir/"
}

main "$@"

