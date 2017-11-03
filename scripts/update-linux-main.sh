#!/bin/bash
set -e

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pushd "$SCRIPTS_DIR/.." > /dev/null

sourcery \
    --sources Tests \
    --templates "$SCRIPTS_DIR/LinuxMain.stencil" \
    --args testimports='@testable import ICUTests'

popd > /dev/null
