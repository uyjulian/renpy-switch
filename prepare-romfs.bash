
set -e

rm -rf romfs/Contents
mkdir -p romfs/Contents
rm -rf romfs/Contents/lib.zip romfs/Contents/renpy.py romfs/Contents/renpy
curl -LOC - https://github.com/uyjulian/switch-libpython2/releases/download/v2.7.18-switch1/python27.zip
cp python27.zip romfs/Contents/lib.zip
curl -LOC - https://github.com/uyjulian/switch-librenpy-switch-modules/releases/download/v7.3.5-switch2/renpy-switch-modules-pylibs.zip
zipmerge -S romfs/Contents/lib.zip renpy-switch-modules-pylibs.zip
curl -LOC - https://github.com/uyjulian/switch-librenpy-switch-modules/releases/download/v7.3.5-switch2/renpy.py
cp renpy.py romfs/Contents/renpy.py
curl -LOC - https://github.com/uyjulian/switch-librenpy-switch-modules/releases/download/v7.3.5-switch2/renpy-switch-modules-renpy-common.zip
unzip renpy-switch-modules-renpy-common.zip -d romfs/Contents
