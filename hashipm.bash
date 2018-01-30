#!/usr/bin/env bash

###############################################################################
# Copyright 2018 Elastic Byte
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

set -eo pipefail; [[ $TRACE ]] && set -x

readonly NAME="hashipm"
readonly VERSION="0.1.0"

_version() {
    echo "$NAME v$VERSION"
    echo
}


_help() {
    echo "Usage: $NAME [--version] [--help] command [command-specific-args]"
    echo
    cat<<EOF | column -c2 -t -s,
    get <package>, Download and install package
EOF
}

_get() {
    local package=$1

    if [ -z "$package" ]; then
        echo "Argument <package> is required" 1>&2
        exit 4
    fi

    local yaml_path="packages/$package/index.yaml"

    if [ ! -f "$yaml_path" ]; then
        echo "Package '$package' not found" 1>&2
        exit 5
    fi

    local latest_version=$(curl --silent "https://api.github.com/repos/hashicorp/$package/releases/latest" |
        grep '"tag_name":' |
        sed -E 's/.*"([^"]+)".*/\1/')

    if [ -z "$current_version" ]; then
        echo "Failed to determine the latest version of package '$package'" 1>&2
        exit 6
    fi

    source lib/yaml.sh
    create_variables "$yaml_path"
}

_main() {
    local cmd="$1"

    if [[ -z $cmd ]]; then
        _help 1>&2
        exit 3
    fi

    shift 1
    case "$cmd" in
        "get")
            _get "$@"
            ;;

        "--version")
            _version
            ;;

        "--help")
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
