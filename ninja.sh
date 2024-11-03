#!/bin/bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

if [[ "$(uname)" == "Darwin" ]]; then
    FLUTTER_BUILD_DIR=host_debug_unopt_arm64
else
    FLUTTER_BUILD_DIR=host_debug_unopt
fi

ninja -C ${SCRIPT_DIR}/../out/${FLUTTER_BUILD_DIR}
