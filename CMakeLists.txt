cmake_minimum_required(VERSION 3.0.2)

if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    if(DEFINED ENV{DEVKITPRO})
        set(DEVKITPRO $ENV{DEVKITPRO})
        set(CMAKE_TOOLCHAIN_FILE "$ENV{DEVKITPRO}/switch.cmake" CACHE PATH "toolchain file")
    else()
        message(FATAL_ERROR "Please define DEVKITPRO to point to your SDK path!")
    endif()
endif()

project(renpy-switch)

set(SWITCH_APP_NAME "Ren'Py")
set(SWITCH_AUTHOR   "renpytom")
set(SWITCH_VERSION  "7.3.4")

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE RelWithDebInfo)
endif()

set(C_FLAGS
    -DFRIBIDI_ENTRY=
    -DHAVE_CONFIG_H=1
)

set(OPTIMIZATION_FLAGS
    -Ofast
)

set(INCLUDES
    ${DEVKITPRO}/portlibs/switch/include/python2.7
    include
    include/module
    include/module/src
    include/module/fribidi-src/lib
)

# source/libnx_wrap.c disabled for the time being

set(SOURCES
    source/main.c
    source/module/IMG_savepng.c
    source/module/SDL2_rotozoom.c
    source/module/SDL_gfxPrimitives.c
    source/module/_renpy.c
    source/module/_renpybidi.c
    source/module/alphablit.c
    source/module/core.c
    source/module/egl_none.c
    source/module/ffmedia.c
    source/module/fribidi-arabic.c
    source/module/fribidi-bidi-types.c
    source/module/fribidi-bidi.c
    source/module/fribidi-deprecated.c
    source/module/fribidi-joining-types.c
    source/module/fribidi-joining.c
    source/module/fribidi-mem.c
    source/module/fribidi-mirroring.c
    source/module/fribidi-run.c
    source/module/fribidi-shape.c
    source/module/fribidi.c
    source/module/ftsupport.c
    source/module/pygame_sdl2.color.c
    source/module/pygame_sdl2.controller.c
    source/module/pygame_sdl2.display.c
    source/module/pygame_sdl2.draw.c
    source/module/pygame_sdl2.error.c
    source/module/pygame_sdl2.event.c
    source/module/pygame_sdl2.font.c
    source/module/pygame_sdl2.gfxdraw.c
    source/module/pygame_sdl2.image.c
    source/module/pygame_sdl2.joystick.c
    source/module/pygame_sdl2.key.c
    source/module/pygame_sdl2.locals.c
    source/module/pygame_sdl2.mixer.c
    source/module/pygame_sdl2.mixer_music.c
    source/module/pygame_sdl2.mouse.c
    source/module/pygame_sdl2.power.c
    source/module/pygame_sdl2.pygame_time.c
    source/module/pygame_sdl2.rect.c
    source/module/pygame_sdl2.render.c
    source/module/pygame_sdl2.rwobject.c
    source/module/pygame_sdl2.scrap.c
    source/module/pygame_sdl2.surface.c
    source/module/pygame_sdl2.transform.c
    source/module/renpy.audio.renpysound.c
    source/module/renpy.display.accelerator.c
    source/module/renpy.display.matrix.c
    source/module/renpy.display.render.c
    source/module/renpy.gl.gl.c
    source/module/renpy.gl.gldraw.c
    source/module/renpy.gl.glenviron_shader.c
    source/module/renpy.gl.glrtt_copy.c
    source/module/renpy.gl.glrtt_fbo.c
    source/module/renpy.gl.gltexture.c
    source/module/renpy.parsersupport.c
    source/module/renpy.pydict.c
    source/module/renpy.style.c
    source/module/renpy.styledata.style_activate_functions.c
    source/module/renpy.styledata.style_functions.c
    source/module/renpy.styledata.style_hover_functions.c
    source/module/renpy.styledata.style_idle_functions.c
    source/module/renpy.styledata.style_insensitive_functions.c
    source/module/renpy.styledata.style_selected_activate_functions.c
    source/module/renpy.styledata.style_selected_functions.c
    source/module/renpy.styledata.style_selected_hover_functions.c
    source/module/renpy.styledata.style_selected_idle_functions.c
    source/module/renpy.styledata.style_selected_insensitive_functions.c
    source/module/renpy.styledata.styleclass.c
    source/module/renpy.styledata.stylesets.c
    source/module/renpy.text.ftfont.c
    source/module/renpy.text.textsupport.c
    source/module/renpy.text.texwrap.c
    source/module/renpybidicore.c
    source/module/renpysound_core.c
    source/module/subpixel.c
    source/module/ttgsubtable.c
    source/module/write_jpeg.c
    source/module/write_png.c
)

find_package(PkgConfig REQUIRED)
pkg_check_modules(EGL REQUIRED IMPORTED_TARGET egl)
pkg_check_modules(FREETYPE2 REQUIRED IMPORTED_TARGET freetype2)
pkg_check_modules(GLAPI REQUIRED IMPORTED_TARGET glapi)
pkg_check_modules(GLESV2 REQUIRED IMPORTED_TARGET glesv2)
pkg_check_modules(LIBAVCODEC REQUIRED IMPORTED_TARGET libavcodec)
pkg_check_modules(LIBAVFILTER REQUIRED IMPORTED_TARGET libavfilter)
pkg_check_modules(LIBAVFORMAT REQUIRED IMPORTED_TARGET libavformat)
pkg_check_modules(LIBAVUTIL REQUIRED IMPORTED_TARGET libavutil)
pkg_check_modules(LIBDRM_NOUVEAU REQUIRED IMPORTED_TARGET libdrm_nouveau)
pkg_check_modules(LIBSWRESAMPLE REQUIRED IMPORTED_TARGET libswresample)
pkg_check_modules(LIBSWSCALE REQUIRED IMPORTED_TARGET libswscale)
pkg_check_modules(SDL2 REQUIRED IMPORTED_TARGET sdl2)
pkg_check_modules(SDL2_GFX REQUIRED IMPORTED_TARGET SDL2_gfx)
pkg_check_modules(SDL2_IMAGE REQUIRED IMPORTED_TARGET SDL2_image)
pkg_check_modules(SDL2_MIXER REQUIRED IMPORTED_TARGET SDL2_mixer)
pkg_check_modules(SDL2_TTF REQUIRED IMPORTED_TARGET SDL2_ttf)
pkg_check_modules(ZLIB REQUIRED IMPORTED_TARGET zlib)

# Workaround for pkg-config not expanding $(DEVKITPRO)
if(LIBDRM_NOUVEAU_INCLUDE_DIRS)
    set_property(TARGET PkgConfig::LIBDRM_NOUVEAU PROPERTY
                 INTERFACE_INCLUDE_DIRECTORIES "${DEVKITPRO}/portlibs/switch/include")
endif()

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME}
    ${DEVKITPRO}/portlibs/switch/lib/libpython2.7.a
    m
    PkgConfig::EGL
    PkgConfig::FREETYPE2
    PkgConfig::GLAPI
    PkgConfig::GLESV2
    PkgConfig::LIBAVCODEC
    PkgConfig::LIBAVFILTER
    PkgConfig::LIBAVFORMAT
    PkgConfig::LIBAVUTIL
    PkgConfig::LIBDRM_NOUVEAU
    PkgConfig::LIBSWRESAMPLE
    PkgConfig::LIBSWSCALE
    PkgConfig::SDL2
    PkgConfig::SDL2_GFX
    PkgConfig::SDL2_IMAGE
    PkgConfig::SDL2_MIXER
    PkgConfig::SDL2_TTF
    PkgConfig::ZLIB
)

target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDES})
target_compile_options(${PROJECT_NAME} PUBLIC $<$<COMPILE_LANGUAGE:C>:${C_FLAGS}>)
target_compile_options(${PROJECT_NAME} PUBLIC $<$<CONFIG:RELEASE>:${OPTIMIZATION_FLAGS}>)
target_compile_options(${PROJECT_NAME} PUBLIC $<$<CONFIG:RELWITHDEBINFO>:${OPTIMIZATION_FLAGS}>)
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)

add_custom_target(${PROJECT_NAME}.nacp
    COMMAND ${DEVKITPRO}/tools/bin/nacptool
        --create
        \"${SWITCH_APP_NAME}\"
        \"${SWITCH_AUTHOR}\"
        \"${SWITCH_VERSION}\"
        ${PROJECT_NAME}.nacp
)
add_custom_target(${PROJECT_NAME}.nro ALL
    COMMAND ${DEVKITPRO}/tools/bin/elf2nro
        ${PROJECT_NAME}
        ${PROJECT_NAME}.nro
        --icon=${CMAKE_SOURCE_DIR}/icon.jpg
        --nacp=${PROJECT_NAME}.nacp
    DEPENDS ${PROJECT_NAME}.nacp ${PROJECT_NAME} ${CMAKE_SOURCE_DIR}/icon.jpg
)
