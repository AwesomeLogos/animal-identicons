#!/usr/bin/env bash
#
# trace all the raster images with potrace
#

set -o errexit
set -o pipefail
set -o nounset

if [ ! command -v potrace &> /dev/null ]; then
    echo "ERROR: potrace is not installed"
    echo ""
    echo "MacOS:"
    echo "  brew install potrace"
    echo "Linux:"
    echo "  sudo apt-get install potrace"
    exit 1
fi

SCRIPT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_HOME="$(realpath "$SCRIPT_HOME/..")"
RASTER_DIR="$(realpath "$REPO_HOME/raster")"
VECTOR_DIR="${REPO_HOME}/docs/images"

if [ ! -d "${RASTER_DIR}" ]; then
    echo "ERROR: raster image directory not found: ${RASTER_DIR}"
    exit 1
fi

mkdir -p "${REPO_HOME}/tmp"
mkdir -p "${VECTOR_DIR}"

echo "INFO: starting at $(date -u +%Y-%m-%dT%H:%M:%SZ)"

IMAGES=$(find "${RASTER_DIR}" -type f -name "*.png")
echo "INFO: found $(echo "${IMAGES}" | wc -l) images"
for IMAGE in ${IMAGES}; do
    NAME=$(basename "${IMAGE%.png}")
    echo "INFO: tracing ${NAME}"

    TMPFILE="${REPO_HOME}/tmp/${NAME}.pnm"

    # convert .png to .pnm
    magick "${IMAGE}" -fill "#00ff00" -colorize "100%" -trim -background white -alpha remove -alpha off "${TMPFILE}"

    # trace
    SVG="${VECTOR_DIR}/${NAME}.svg"
    potrace -s --tight --margin 0.1 --output "${SVG}" ${TMPFILE}

    timg -b yellow "${SVG}"

    rm "${TMPFILE}"
done

echo "INFO: complete at $(date -u +%Y-%m-%dT%H:%M:%SZ)"
