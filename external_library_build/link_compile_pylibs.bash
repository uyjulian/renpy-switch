
source $DEVKITPRO/switchvars.sh

export LIB_BUILD_DIR=../tmp_build

rm -rf $LIB_BUILD_DIR ../lib.zip
cp -as $PORTLIBS_PREFIX/lib/python2.7 $LIB_BUILD_DIR
cp -as $(realpath ../pygame_sdl2/src/pygame_sdl2) $LIB_BUILD_DIR
cp -as $(realpath ../renpy/renpy) $LIB_BUILD_DIR
rm -r $LIB_BUILD_DIR/test
rm -r $LIB_BUILD_DIR/lib2to3/tests
rm $LIB_BUILD_DIR/subprocess.py
ln -sf $(realpath external_library_build/pystub/subprocess.py) $LIB_BUILD_DIR/subprocess.py
ln -sf $(realpath libnx_bindings/libnx.py) $LIB_BUILD_DIR/libnx.py
pushd $LIB_BUILD_DIR
find . -type l -not -name \*.py -delete
find . -type d -empty -delete
find . -name \*.py -exec python2 -OO -m py_compile {} \;
7z a -l ../lib.zip .
popd
ln -sf $(realpath ../lib.zip) romfs/Contents/lib.zip

rm -rf romfs/Contents/renpy
mkdir -p romfs/Contents/renpy
ln -sf $(realpath ../renpy/renpy/common) romfs/Contents/renpy/common
ln -sf $(realpath ../renpy/renpy.py) romfs/Contents/renpy.py
