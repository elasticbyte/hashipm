#!/usr/bin/env bash

###############################################################################
# Copyright 2018 Justin Keller
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

set -eo pipefail; [[ $TRACE ]] && set -x

readonly APP_NAME="hashipm"
readonly VERSION="0.1.0"

_version() {
  echo "$APP_NAME $VERSION"
}


_help() {
  echo "Usage: $APP_NAME command <command-specific-options>"
  echo
  cat<<EOF | column -c2 -t -s,
  install <package>, Install package
  update, Update all installed packages
  help, Display help
  version, Display the current version
EOF
  echo
}

_install() {
  echo "[debug] in _install empty stub function"
}

_update() {
  echo "[debug] in _update empty stub function"
}

_main() {
  local _command="$1"

  if [[ -z $_command ]]; then
    _version
    echo
    _help
    exit 0
  fi

  shift 1
  case "$_command" in
    "install")
      _install
      ;;

    "update")
      _update
      ;;

    "version")
      _version
      ;;

    "help")
      _help
      ;;

    *)
      _help 1>&2
      exit 3
  esac
}

if [[ "$0" == "$BASH_SOURCE" ]]; then
  _main "$@"
fi
