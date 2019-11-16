
source $DEVKITPRO/switchvars.sh

mkdir -p romfs/Contents/lib/python2.7/
mkdir -p romfs/Contents/lib/python2.7/encodings/
mkdir -p romfs/Contents/lib/python2.7/importlib/
mkdir -p romfs/Contents/lib/python2.7/json/
mkdir -p romfs/Contents/lib/python2.7/xml/
mkdir -p romfs/Contents/lib/python2.7/xml/etree/
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/StringIO.py) romfs/Contents/lib/python2.7/StringIO.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/UserDict.py) romfs/Contents/lib/python2.7/UserDict.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/__future__.py) romfs/Contents/lib/python2.7/__future__.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/_abcoll.py) romfs/Contents/lib/python2.7/_abcoll.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/_sysconfigdata.py) romfs/Contents/lib/python2.7/_sysconfigdata.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/_weakrefset.py) romfs/Contents/lib/python2.7/_weakrefset.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/abc.py) romfs/Contents/lib/python2.7/abc.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/argparse.py) romfs/Contents/lib/python2.7/argparse.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/ast.py) romfs/Contents/lib/python2.7/ast.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/base64.py) romfs/Contents/lib/python2.7/base64.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/codecs.py) romfs/Contents/lib/python2.7/codecs.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/collections.py) romfs/Contents/lib/python2.7/collections.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/colorsys.py) romfs/Contents/lib/python2.7/colorsys.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/contextlib.py) romfs/Contents/lib/python2.7/contextlib.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/copy.py) romfs/Contents/lib/python2.7/copy.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/copy_reg.py) romfs/Contents/lib/python2.7/copy_reg.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/difflib.py) romfs/Contents/lib/python2.7/difflib.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/dis.py) romfs/Contents/lib/python2.7/dis.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/dummy_thread.py) romfs/Contents/lib/python2.7/dummy_thread.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/__init__.py) romfs/Contents/lib/python2.7/encodings/__init__.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/aliases.py) romfs/Contents/lib/python2.7/encodings/aliases.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/ascii.py) romfs/Contents/lib/python2.7/encodings/ascii.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/hex_codec.py) romfs/Contents/lib/python2.7/encodings/hex_codec.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/latin_1.py) romfs/Contents/lib/python2.7/encodings/latin_1.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/raw_unicode_escape.py) romfs/Contents/lib/python2.7/encodings/raw_unicode_escape.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/utf_32_be.py) romfs/Contents/lib/python2.7/encodings/utf_32_be.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/utf_8.py) romfs/Contents/lib/python2.7/encodings/utf_8.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/encodings/zlib_codec.py) romfs/Contents/lib/python2.7/encodings/zlib_codec.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/fnmatch.py) romfs/Contents/lib/python2.7/fnmatch.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/functools.py) romfs/Contents/lib/python2.7/functools.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/genericpath.py) romfs/Contents/lib/python2.7/genericpath.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/gettext.py) romfs/Contents/lib/python2.7/gettext.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/glob.py) romfs/Contents/lib/python2.7/glob.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/hashlib.py) romfs/Contents/lib/python2.7/hashlib.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/heapq.py) romfs/Contents/lib/python2.7/heapq.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/importlib/__init__.py) romfs/Contents/lib/python2.7/importlib/__init__.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/inspect.py) romfs/Contents/lib/python2.7/inspect.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/io.py) romfs/Contents/lib/python2.7/io.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/json/__init__.py) romfs/Contents/lib/python2.7/json/__init__.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/json/decoder.py) romfs/Contents/lib/python2.7/json/decoder.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/json/encoder.py) romfs/Contents/lib/python2.7/json/encoder.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/json/scanner.py) romfs/Contents/lib/python2.7/json/scanner.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/keyword.py) romfs/Contents/lib/python2.7/keyword.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/linecache.py) romfs/Contents/lib/python2.7/linecache.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/locale.py) romfs/Contents/lib/python2.7/locale.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/opcode.py) romfs/Contents/lib/python2.7/opcode.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/os.py) romfs/Contents/lib/python2.7/os.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/pickle.py) romfs/Contents/lib/python2.7/pickle.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/platform.py) romfs/Contents/lib/python2.7/platform.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/posixpath.py) romfs/Contents/lib/python2.7/posixpath.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/random.py) romfs/Contents/lib/python2.7/random.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/re.py) romfs/Contents/lib/python2.7/re.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/repr.py) romfs/Contents/lib/python2.7/repr.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/shlex.py) romfs/Contents/lib/python2.7/shlex.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/shutil.py) romfs/Contents/lib/python2.7/shutil.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/site.py) romfs/Contents/lib/python2.7/site.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/sre_compile.py) romfs/Contents/lib/python2.7/sre_compile.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/sre_constants.py) romfs/Contents/lib/python2.7/sre_constants.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/sre_parse.py) romfs/Contents/lib/python2.7/sre_parse.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/stat.py) romfs/Contents/lib/python2.7/stat.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/string.py) romfs/Contents/lib/python2.7/string.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/struct.py) romfs/Contents/lib/python2.7/struct.py
ln -sf $(realpath external_library_build/pystub/subprocess.py) romfs/Contents/lib/python2.7/subprocess.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/sysconfig.py) romfs/Contents/lib/python2.7/sysconfig.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/tarfile.py) romfs/Contents/lib/python2.7/tarfile.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/tempfile.py) romfs/Contents/lib/python2.7/tempfile.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/textwrap.py) romfs/Contents/lib/python2.7/textwrap.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/threading.py) romfs/Contents/lib/python2.7/threading.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/token.py) romfs/Contents/lib/python2.7/token.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/tokenize.py) romfs/Contents/lib/python2.7/tokenize.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/traceback.py) romfs/Contents/lib/python2.7/traceback.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/types.py) romfs/Contents/lib/python2.7/types.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/urlparse.py) romfs/Contents/lib/python2.7/urlparse.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/warnings.py) romfs/Contents/lib/python2.7/warnings.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/weakref.py) romfs/Contents/lib/python2.7/weakref.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/webbrowser.py) romfs/Contents/lib/python2.7/webbrowser.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/xml/__init__.py) romfs/Contents/lib/python2.7/xml/__init__.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/xml/etree/ElementPath.py) romfs/Contents/lib/python2.7/xml/etree/ElementPath.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/xml/etree/ElementTree.py) romfs/Contents/lib/python2.7/xml/etree/ElementTree.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/xml/etree/__init__.py) romfs/Contents/lib/python2.7/xml/etree/__init__.py
ln -sf $(realpath $PORTLIBS_PREFIX/lib/python2.7/zipfile.py) romfs/Contents/lib/python2.7/zipfile.py

mkdir -p romfs/Contents/lib/python2.7/pygame_sdl2
mkdir -p romfs/Contents/lib/python2.7/pygame_sdl2/threads/
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/DejaVuSans.ttf) romfs/Contents/lib/python2.7/pygame_sdl2/DejaVuSans.ttf
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/DejaVuSans.txt) romfs/Contents/lib/python2.7/pygame_sdl2/DejaVuSans.txt
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/__init__.py) romfs/Contents/lib/python2.7/pygame_sdl2/__init__.py
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/compat.py) romfs/Contents/lib/python2.7/pygame_sdl2/compat.py
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/sprite.py) romfs/Contents/lib/python2.7/pygame_sdl2/sprite.py
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/sysfont.py) romfs/Contents/lib/python2.7/pygame_sdl2/sysfont.py
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/threads/Py25Queue.py) romfs/Contents/lib/python2.7/pygame_sdl2/threads/Py25Queue.py
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/threads/__init__.py) romfs/Contents/lib/python2.7/pygame_sdl2/threads/__init__.py
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/time.py) romfs/Contents/lib/python2.7/pygame_sdl2/time.py
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/version.py) romfs/Contents/lib/python2.7/pygame_sdl2/version.py

rm romfs/Contents/renpy
ln -sf $(realpath ../renpy/renpy) romfs/Contents/renpy
ln -sf $(realpath ../renpy/renpy.py) romfs/Contents/renpy.py

ln -sf $(realpath libnx_bindings/libnx.py) romfs/Contents/lib/python2.7/libnx.py

find romfs -name \*.py -exec python -O -m py_compile {} \;
