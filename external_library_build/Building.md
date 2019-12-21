# Building
This process will be streamlined at a later date.  
## First steps
Load the Switch environment variables into the shell using the following command: `source $DEVKITPRO/switchvars.sh`  
## CPython 2.7.17
Change directory to the CPython 2.7.17 source directory.  
Apply the CPython 2.7.17 patch contained in `cpython.patch` using GNU patch.  
Create the build directory.  
Change directory to the build directory.  
Copy the `config.site` file contained in the `cpython_config_files` directory to the build directory.  
Configure the CPython 2.x tree in a separate build directory using the following command:  
```
../configure LDFLAGS="-specs=$DEVKITPRO/libnx/switch.specs $LDFLAGS" CONFIG_SITE="config.site" --host=aarch64-none-elf --build=$(../config.guess) --prefix="$PORTLIBS_PREFIX" --disable-ipv6 --disable-shared --enable-optimizations
```  
Copy the `Setup.local` file contained in the `cpython_config_files` directory to the `Modules` subdirectory of the build directory.  
Run GNU Make with `libpython2.7.a` as the target.  
Run GNU Make with elevated privileges with `libinstall` as the target.  
## Pygame_SDL2
Change directory to the Pygame_SDL2 repository.  
Generate Cython C files for Pygame_SDL2 using the following command:  
```
PYGAME_SDL2_STATIC=1 python2 setup.py
```  
## Ren'Py 7.3.5.606
Change directory to the Ren'Py repository.  
Checkout version 7.3.5.606: `git checkout 7.3.5.606`  
Apply the Ren'Py patch contained in `renpy.patch` using GNU patch.  
Change directory to the `module` directory.  
Generate Cython C files for Ren'Py modules using the following command:  
```
RENPY_DEPS_INSTALL=$PORTLIBS_PREFIX RENPY_STATIC=1 python1 setup.py
```  
## Finalization
Copy the `game` directory (you can use the_question or tutorial as a test) to either `./game` or `romfs:/Contents/game`.  
Use `external_library_build/link_sources.bash` to link the Pygame_SDL2 and Ren'Py module source files to the correct place.  
Use `external_library_build/link_compile_pylibs.bash` to link and compile the Python, Pygame_SDL2 and Ren'Py module source files to the correct place.  
