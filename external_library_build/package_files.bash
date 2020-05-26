
cp renpy-switch-the-question.nro ../ki/renpy-switch-the-question-$1.nro

export RPYS_WORK_DIR=../ki/renpy-switch-sdk-$1
mkdir -p $RPYS_WORK_DIR
pandoc -f gfm -t html README.md -s -o $RPYS_WORK_DIR/README.html
cp LICENSE $RPYS_WORK_DIR/LICENSE
ln -s $(realpath ../lib.zip) $RPYS_WORK_DIR/lib.zip
mkdir -p $RPYS_WORK_DIR/renpy
ln -s $(realpath ../renpy/renpy/common) $RPYS_WORK_DIR/renpy/common
ln -s $(realpath ../renpy/renpy.py) $RPYS_WORK_DIR/renpy.py
cp renpy-switch.elf $RPYS_WORK_DIR/renpy-switch.elf
cp renpy-switch.nro $RPYS_WORK_DIR/renpy-switch.nro
pushd $RPYS_WORK_DIR
7z a -l ../renpy-switch-sdk-$1.7z .
popd
