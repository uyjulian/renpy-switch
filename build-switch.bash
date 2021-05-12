
set -e

source $DEVKITPRO/switchvars.sh
mkdir build-switch
pushd build-switch
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
popd
