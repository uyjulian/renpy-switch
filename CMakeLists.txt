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
)

# source/libnx_wrap.c disabled for the time being

set(SOURCES
    source/main.c
)

set(CMAKE_PREFIX_PATH "${DEVKITPRO}/portlibs/switch")
set(ENV{PKG_CONFIG_PATH} "${DEVKITPRO}/portlibs/switch/lib/pkgconfig")

find_package(PkgConfig REQUIRED)
# Workaround for library paths not being set correctly
set(pkgcfg_lib_FREETYPE2_nx /opt/devkitpro/libnx/lib/libnx.a)
set(pkgcfg_lib_LIBAVFILTER_nx /opt/devkitpro/libnx/lib/libnx.a)
set(pkgcfg_lib_LIBAVFORMAT_nx /opt/devkitpro/libnx/lib/libnx.a)
set(pkgcfg_lib_EGL_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/pic/libm.a)
set(pkgcfg_lib_FREETYPE2_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/pic/libm.a)
set(pkgcfg_lib_GLAPI_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/pic/libm.a)
set(pkgcfg_lib_GLESV2_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/pic/libm.a)
set(pkgcfg_lib_LIBAVCODEC_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_LIBAVFILTER_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_LIBAVFORMAT_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_LIBAVUTIL_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_LIBSWRESAMPLE_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_LIBSWSCALE_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_SDL2_IMAGE_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_SDL2_MIXER_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_SDL2_TTF_m /opt/devkitpro/devkitA64/aarch64-none-elf/lib/libm.a)
set(pkgcfg_lib_SDL2_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_SDL2_GFX_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_SDL2_IMAGE_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_SDL2_MIXER_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_SDL2_TTF_EGL /opt/devkitpro/portlibs/switch/lib/libEGL.a)
set(pkgcfg_lib_LIBDRM_NOUVEAU_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_GFX_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_IMAGE_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_MIXER_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_TTF_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_drm_nouveau /opt/devkitpro/portlibs/switch/lib/libdrm_nouveau.a)
set(pkgcfg_lib_SDL2_GFX_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_IMAGE_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_MIXER_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_TTF_SDL2 /opt/devkitpro/portlibs/switch/lib/libSDL2.a)
set(pkgcfg_lib_SDL2_IMAGE_z /opt/devkitpro/portlibs/switch/lib/libz.a)
set(pkgcfg_lib_SDL2_TTF_z /opt/devkitpro/portlibs/switch/lib/libz.a)
set(pkgcfg_lib_SDL2_GFX_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_IMAGE_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_MIXER_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_TTF_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_glapi /opt/devkitpro/portlibs/switch/lib/libglapi.a)
set(pkgcfg_lib_SDL2_IMAGE_SDL2_image /opt/devkitpro/portlibs/switch/lib/libSDL2_image.a)
set(pkgcfg_lib_SDL2_GFX_SDL2_gfx /opt/devkitpro/portlibs/switch/lib/libSDL2_gfx.a)
set(pkgcfg_lib_SDL2_IMAGE_jpeg /opt/devkitpro/portlibs/switch/lib/libjpeg.a)
set(pkgcfg_lib_SDL2_IMAGE_png16 /opt/devkitpro/portlibs/switch/lib/libpng16.a)
set(pkgcfg_lib_SDL2_IMAGE_webp /opt/devkitpro/portlibs/switch/lib/libwebp.a)
set(pkgcfg_lib_SDL2_MIXER_SDL2_mixer /opt/devkitpro/portlibs/switch/lib/libSDL2_mixer.a)
set(pkgcfg_lib_SDL2_MIXER_modplug /opt/devkitpro/portlibs/switch/lib/libmodplug.a)
set(pkgcfg_lib_SDL2_MIXER_mpg123 /opt/devkitpro/portlibs/switch/lib/libmpg123.a)
set(pkgcfg_lib_SDL2_MIXER_ogg /opt/devkitpro/portlibs/switch/lib/libogg.a)
set(pkgcfg_lib_SDL2_MIXER_opus /opt/devkitpro/portlibs/switch/lib/libopus.a)
set(pkgcfg_lib_SDL2_MIXER_opusfile /opt/devkitpro/portlibs/switch/lib/libopusfile.a)
set(pkgcfg_lib_SDL2_MIXER_stdc++ /opt/devkitpro/devkitA64/aarch64-none-elf/lib/pic/libstdc++.a)
set(pkgcfg_lib_SDL2_MIXER_vorbisidec /opt/devkitpro/portlibs/switch/lib/libvorbisidec.a)
set(pkgcfg_lib_SDL2_TTF_SDL2_ttf /opt/devkitpro/portlibs/switch/lib/libSDL2_ttf.a)
set(pkgcfg_lib_SDL2_TTF_bz2 /opt/devkitpro/portlibs/switch/lib/libbz2.a)
set(pkgcfg_lib_SDL2_TTF_freetype /opt/devkitpro/portlibs/switch/lib/libfreetype.a)
set(pkgcfg_lib_SDL2_TTF_png16 /opt/devkitpro/portlibs/switch/lib/libpng16.a)

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
    ${DEVKITPRO}/portlibs/switch/lib/librenpy-switch-modules.a
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
        --romfsdir=${CMAKE_SOURCE_DIR}/romfs
    DEPENDS ${PROJECT_NAME}.nacp ${PROJECT_NAME} ${CMAKE_SOURCE_DIR}/icon.jpg
)
