# Building
This process will be streamlined at a later date.  
## First steps
Load the Switch variables in the environment using the following command: `source $DEVKITPRO/switchvars.sh`  
## CPython 2.x
Change directory to the CPython 2.x repository.  
Apply the CPython 2.x patch contained in `cpython.patch` using GNU patch.  
Create the build directory.  
Change directory to the build directory.  
Copy the `config.site` file contained in the `cpython_config_files` directory to the build directory.  
Configure the CPython 2.x tree in a separate build directory using the following command:  
```
../configure LDFLAGS="-specs=$DEVKITPRO/libnx/switch.specs $LDFLAGS" CONFIG_SITE="config.site" --host=aarch64-none-elf --build=$(config.guess) --prefix="$PORTLIBS_PREFIX" --disable-ipv6 --disable-shared --enable-optimizations
```  
Copy the `Setup.local` file contained in the `cpython_config_files` directory to the `Modules` subdirectory of the build directory.  
Run GNU Make with `libpython2.7.a` as the target.  
Copy the `libpython2.7.a` file to `$DEVKITPRO/portlibs/switch/lib/libpython2.7.a`.  
Run GNU Make with elevated privileges with `inclinstall` as the target.  
Copy the files contained in the `Lib` directory to either `./lib/python2.7` or `romfs:/Contents/lib/python2.7`  
## Pygame_SDL2
Change directory to the Pygame_SDL2 repository.  
Generate Cython C files for Pygame_SDL2 using the following command:  
```
PYGAME_SDL2_STATIC=1 python setup.py
```  
## Ren'Py
Change directory to the Ren'Py repository.  
Apply the Ren'Py patch contained in `renpy.patch` using GNU patch.  
Change directory to the `module` directory.  
Generate Cython C files for Ren'Py modules using the following command:  
```
RENPY_DEPS_INSTALL=$PORTLIBS_PREFIX RENPY_STATIC=1 python setup.py
```  
Copy the files contained in the `renpy` directory to either `./renpy` or `romfs:/Contents/renpy`.  
Copy the `renpy.py` file to either `./renpy.py` or `romfs:/Contents/renpy.py`.  
## Finalization
Copy the `game` directory (you can use the_question or tutorial as a test) to either `./game` or `romfs:/Contents/game`.  
Use `external_library_build/link_sources.bash` to link the Pygame_SDL2 and Ren'Py module source files to the correct place.  
These are the minimum Python and pygame_sdl2 libraries required for Ren'Py to operate correctly:
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
pygame_sdl2/time.py
pygame_sdl2/sysfont.py
pygame_sdl2/version.py
pygame_sdl2/compat.py
pygame_sdl2/DejaVuSans.ttf
pygame_sdl2/__init__.py
pygame_sdl2/sprite.py
pygame_sdl2/threads/Py25Queue.py
pygame_sdl2/threads/__init__.py
pygame_sdl2/DejaVuSans.txt
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
threading.py
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
The following files from the `pystub` directory are required to be copied to the Python standard library directory (replacing files) for Ren'Py to operate correctly:
```
subprocess.py
```
