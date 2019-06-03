# Quick and dirty build tips
More details will be written at a later date!!

Set switch vars in env: `source /opt/devkitpro/switchvars.sh`  
Apply cpython 2.x patch  
Configure for cpython 2.x 
```
./configure LDFLAGS="-specs=$DEVKITPRO/libnx/switch.specs $LDFLAGS" CONFIG_SITE="config.site" --host=aarch64-none-elf --build=$(config.guess) --prefix="$PORTLIBS_PREFIX" --disable-ipv6 --disable-shared
for func in SETGROUPS FCHDIR FDATASYNC SYMLINK CHROOT
do
  sed -i "s/#define HAVE_$func 1/\/* #undef HAVE_$func *\//" pyconfig.h
done
```  
Make sure `config.site` in `cpython_config_files` is used  
Make sure `Setup.local` in `cpython_config_files` is copied into `Modules` directory in build folder  
Contents of `Lib` folder needs to be in `./lib/python2.7`; same directory as NRO  
Files are needed to copy to correct directories in portlibs directory  
No patches needed for Pygame_SDL2  
Generate cython C files for Pygame_SDL2 
```
CC=aarch64-none-elf-gcc LDSHARED=aarch64-none-elf-gcc PYGAME_SDL2_CFLAGS="`sdl2-config --cflags`" PYGAME_SDL2_LDFLAGS="`sdl2-config --libs` -lpython2.7 -lz -specs=$DEVKITPRO/libnx/switch.specs -lm" PYGAME_SDL2_STATIC=1 python setup.py build_ext --include-dirs $PORTLIBS_PREFIX/include/python2.7 build install -O2 --prefix $PORTLIBS_PREFIX
```  
Apply Ren'Py patch
Generate cython C files for Ren'Py modules 
```
CC=aarch64-none-elf-gcc LDSHARED=aarch64-none-elf-gcc RENPY_DEPS_INSTALL=$PORTLIBS_PREFIX CFLAGS="-I$PORTLIBS_PREFIX/include `sdl2-config --cflags`" LDFLAGS="-L$PORTLIBS_PREFIX/lib `sdl2-config --libs`" RENPY_STATIC=1 python setup.py build_ext --include-dirs $PORTLIBS_PREFIX/include/python2.7 build install -O2 --prefix $PORTLIBS_PREFIX
```  
Contents of `renpy` folder needs to be in `./renpy`; same directory as NRO 
`renpy.py` needs to be in `./renpy.py`; same directory as NRO  
`game` folder (you can use the_question or tutorial as a test) needs to be in `./game`; same directory as NRO  

Copy files like this: 
```
include/IMG_savepng.h
include/SDL_gfxPrimitives.h
include/arabic-misc.tab.i
include/arabic-shaping.tab.i
include/bidi-type.tab.i
include/bidi-types.h
include/common.h
include/config.h
include/debug.h
include/eglsupport.h
include/fribidi-src/lib/fribidi-arabic.h
include/fribidi-src/lib/fribidi-begindecls.h
include/fribidi-src/lib/fribidi-bidi-types-list.h
include/fribidi-src/lib/fribidi-bidi-types.h
include/fribidi-src/lib/fribidi-bidi.h
include/fribidi-src/lib/fribidi-common.h
include/fribidi-src/lib/fribidi-config.h
include/fribidi-src/lib/fribidi-deprecated.h
include/fribidi-src/lib/fribidi-enddecls.h
include/fribidi-src/lib/fribidi-flags.h
include/fribidi-src/lib/fribidi-joining-types-list.h
include/fribidi-src/lib/fribidi-joining-types.h
include/fribidi-src/lib/fribidi-joining.h
include/fribidi-src/lib/fribidi-mirroring.h
include/fribidi-src/lib/fribidi-shape.h
include/fribidi-src/lib/fribidi-types.h
include/fribidi-src/lib/fribidi-unicode-version.h
include/fribidi-src/lib/fribidi-unicode.h
include/fribidi-src/lib/fribidi.h
include/ftsupport.h
include/glcompat.h
include/joining-type.tab.i
include/joining-types.h
include/mem.h
include/mirroring.tab.i
include/pyfreetype.h
include/pygame_sdl2/pygame_sdl2.display_api.h
include/pygame_sdl2/pygame_sdl2.event.h
include/pygame_sdl2/pygame_sdl2.h
include/pygame_sdl2/pygame_sdl2.rwobject_api.h
include/pygame_sdl2/pygame_sdl2.surface_api.h
include/python_threads.h
include/renpy.h
include/renpybidicore.h
include/renpygl.h
include/renpysound_core.h
include/run.h
include/src/surface.h
include/surface.h
include/ttgsubtable.h
include/write_jpeg.h
include/write_png.h
source/IMG_savepng.c
source/_renpy.c
source/_renpybidi.c
source/alphablit.c
source/core.c
source/egl_none.c
source/ffmedia.c
source/fribidi-arabic.c
source/fribidi-bidi-types.c
source/fribidi-bidi.c
source/fribidi-deprecated.c
source/fribidi-joining-types.c
source/fribidi-joining.c
source/fribidi-mem.c
source/fribidi-mirroring.c
source/fribidi-run.c
source/fribidi-shape.c
source/fribidi.c
source/ftsupport.c
source/pygame_sdl2.color.c
source/pygame_sdl2.controller.c
source/pygame_sdl2.display.c
source/pygame_sdl2.draw.c
source/pygame_sdl2.error.c
source/pygame_sdl2.event.c
source/pygame_sdl2.image.c
source/pygame_sdl2.joystick.c
source/pygame_sdl2.key.c
source/pygame_sdl2.locals.c
source/pygame_sdl2.mouse.c
source/pygame_sdl2.power.c
source/pygame_sdl2.pygame_time.c
source/pygame_sdl2.rect.c
source/pygame_sdl2.rwobject.c
source/pygame_sdl2.scrap.c
source/pygame_sdl2.surface.c
source/pygame_sdl2.transform.c
source/renpy.audio.renpysound.c
source/renpy.display.accelerator.c
source/renpy.display.render.c
source/renpy.gl.gl.c
source/renpy.gl.gldraw.c
source/renpy.gl.glenviron_shader.c
source/renpy.gl.glrtt_copy.c
source/renpy.gl.glrtt_fbo.c
source/renpy.gl.gltexture.c
source/renpy.parsersupport.c
source/renpy.pydict.c
source/renpy.style.c
source/renpy.styledata.style_activate_functions.c
source/renpy.styledata.style_functions.c
source/renpy.styledata.style_hover_functions.c
source/renpy.styledata.style_idle_functions.c
source/renpy.styledata.style_insensitive_functions.c
source/renpy.styledata.style_selected_activate_functions.c
source/renpy.styledata.style_selected_functions.c
source/renpy.styledata.style_selected_hover_functions.c
source/renpy.styledata.style_selected_idle_functions.c
source/renpy.styledata.style_selected_insensitive_functions.c
source/renpy.styledata.styleclass.c
source/renpy.styledata.stylesets.c
source/renpy.text.ftfont.c
source/renpy.text.textsupport.c
source/renpy.text.texwrap.c
source/renpybidicore.c
source/renpysound_core.c
source/subpixel.c
source/ttgsubtable.c
source/write_jpeg.c
source/write_png.c
```  
These are the minimum Python standard libraries required for Ren'Py to operate correctly:
```
StringIO.py
UserDict.py
__future__.py
_abcoll.py
_sysconfigdata.py
_weakrefset.py
abc.py
argparse.py
ast.py
base64.py
codecs.py
collections.py
colorsys.py
contextlib.py
copy.py
copy_reg.py
difflib.py
dis.py
dummy_thread.py
encodings/__init__.py
encodings/aliases.py
encodings/ascii.py
encodings/hex_codec.py
encodings/latin_1.py
encodings/raw_unicode_escape.py
encodings/utf_32_be.py
encodings/utf_8.py
encodings/zlib_codec.py
fnmatch.py
functools.py
genericpath.py
gettext.py
glob.py
hashlib.py
heapq.py
importlib/__init__.py
inspect.py
io.py
json/__init__.py
json/decoder.py
json/encoder.py
json/scanner.py
keyword.py
linecache.py
locale.py
opcode.py
os.py
pickle.py
platform.py
posixpath.py
random.py
re.py
repr.py
shlex.py
shutil.py
site.py
sre_compile.py
sre_constants.py
sre_parse.py
stat.py
string.py
struct.py
sysconfig.py
tarfile.py
tempfile.py
textwrap.py
token.py
tokenize.py
traceback.py
types.py
urlparse.py
warnings.py
weakref.py
webbrowser.py
xml/__init__.py
xml/etree/ElementPath.py
xml/etree/ElementTree.py
xml/etree/__init__.py
zipfile.py
```