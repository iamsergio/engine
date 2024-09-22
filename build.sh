SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

if [[ "$(uname)" == "Darwin" ]]; then
    ${SCRIPT_DIR}/tools/gn --unoptimized --no-goma --no-enable-unittests \
        --no-build-glfw-shell --no-stripped --build-embedder-examples \
        --mac-cpu=arm64 || { echo "gn failed"; exit 1; }
    FLUTTER_BUILD_DIR=host_debug_unopt_arm64
else
    ${SCRIPT_DIR}/tools/gn --unoptimized --no-goma --no-enable-unittests \
        --no-build-glfw-shell --no-stripped || { echo "gn failed"; exit 1; }
    FLUTTER_BUILD_DIR=host_debug_unopt
fi

sh ${SCRIPT_DIR}/ninja.sh

