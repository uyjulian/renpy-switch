# Ren'Py for Nintendo Switch
This repository contains a port of Ren'Py to the Nintendo Switch.

## Building
Please check the `external_library_build/Building.md` file.  

## File Formats
It is highly recommended that you use the following file formats:  

* WebP for image assets
* Opus/WebM for audio assets
* H.264/Opus/Matroska for video assets

If these formats are not used, there is a possibility of the program working incorrectly.  
Free tools such as FFmpeg, `cwebp`, and ImageMagick are available to convert file formats.  
The file format can be changed without changing the file extension, so no script (rpy file) changes are needed.  

## RomFS Integration
To integrate the game into one single nro file, uncomment line 45 of Makefile, place game files in a folder named romfs, and build as described in the "Building" section.  
NOTE: If you do not compile the py and rpy files to pyo and rpyc respectively by running the game at least once on a read-write filesystem, the loading time required until the title screen is seen will be increased.  
The `py_compile` module can be used to compile py files to pyo. Example usage of this command: `find . -name \*.py -exec python -O -m py_compile {} \;`  

## File system layout
The following files or folders are required to be in the same directory as the .nro or in RomFS:  
* `lib`
* `renpy`
* `renpy.py`
* `game`

## License
This project is licensed under the MIT license. Please read the `LICENSE` file for more information.
