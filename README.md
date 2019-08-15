# Ren'Py for Nintendo Switch
This repository contains a port of Ren'Py to the Nintendo Switch.

## Building
Please check the `external_library_build/Building.md` file.  

## RomFS Integration
To integrate the game into one single nro file, uncomment line 45 of Makefile, place game files in a folder named romfs, and build as described in the "Building" section.  

## File system layout
The following files or folders are required to be in the same directory as the .nro or in RomFS:  
* `lib`
* `renpy`
* `renpy.py`
* `game`

## License
This project is licensed under the MIT license. Please read the `LICENSE` file for more information.
