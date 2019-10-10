
rm -f romfs/Contents/renpy/renpy
rm romfs/Contents/renpy
cp -R ../renpy/renpy romfs/Contents/renpy
for f in $(find romfs/Contents -type l);do cp --remove-destination $(readlink $f) $f;done;
