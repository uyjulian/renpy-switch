#!/usr/local/bin/bash

mkdir -p source/module

ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.color.c) source/module/pygame_sdl2.color.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.controller.c) source/module/pygame_sdl2.controller.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.display.c) source/module/pygame_sdl2.display.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.draw.c) source/module/pygame_sdl2.draw.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.error.c) source/module/pygame_sdl2.error.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.event.c) source/module/pygame_sdl2.event.c
# ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.font.c) source/module/pygame_sdl2.font.c
# ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.gfxdraw.c) source/module/pygame_sdl2.gfxdraw.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.image.c) source/module/pygame_sdl2.image.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.joystick.c) source/module/pygame_sdl2.joystick.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.key.c) source/module/pygame_sdl2.key.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.locals.c) source/module/pygame_sdl2.locals.c
# ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.mixer.c) source/module/pygame_sdl2.mixer.c
# ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.mixer_music.c) source/module/pygame_sdl2.mixer_music.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.mouse.c) source/module/pygame_sdl2.mouse.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.power.c) source/module/pygame_sdl2.power.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.pygame_time.c) source/module/pygame_sdl2.pygame_time.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.rect.c) source/module/pygame_sdl2.rect.c
# ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.render.c) source/module/pygame_sdl2.render.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.rwobject.c) source/module/pygame_sdl2.rwobject.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.scrap.c) source/module/pygame_sdl2.scrap.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.surface.c) source/module/pygame_sdl2.surface.c
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.transform.c) source/module/pygame_sdl2.transform.c
# ln -sf $(realpath ../pygame_sdl2/sdl2.c) source/module/sdl2.c
# ln -sf $(realpath ../pygame_sdl2/src/SDL2_rotozoom.c) source/module/SDL2_rotozoom.c
# ln -sf $(realpath ../pygame_sdl2/src/SDL_gfxPrimitives.c) source/module/SDL_gfxPrimitives.c
ln -sf $(realpath ../pygame_sdl2/src/alphablit.c) source/module/alphablit.c
ln -sf $(realpath ../pygame_sdl2/src/write_jpeg.c) source/module/write_jpeg.c
ln -sf $(realpath ../pygame_sdl2/src/write_png.c) source/module/write_png.c
ln -sf $(realpath ../renpy/module/IMG_savepng.c) source/module/IMG_savepng.c
ln -sf $(realpath ../renpy/module/core.c) source/module/core.c
# ln -sf $(realpath ../renpy/module/egl_angle.c) source/module/egl_angle.c
ln -sf $(realpath ../renpy/module/egl_none.c) source/module/egl_none.c
# ln -sf $(realpath ../renpy/module/egl_x11.c) source/module/egl_x11.c
ln -sf $(realpath ../renpy/module/ffmedia.c) source/module/ffmedia.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-arabic.c) source/module/fribidi-arabic.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-bidi-types.c) source/module/fribidi-bidi-types.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-bidi.c) source/module/fribidi-bidi.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-deprecated.c) source/module/fribidi-deprecated.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-joining-types.c) source/module/fribidi-joining-types.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-joining.c) source/module/fribidi-joining.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-mem.c) source/module/fribidi-mem.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-mirroring.c) source/module/fribidi-mirroring.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-run.c) source/module/fribidi-run.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-shape.c) source/module/fribidi-shape.c
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi.c) source/module/fribidi.c
ln -sf $(realpath ../renpy/module/ftsupport.c) source/module/ftsupport.c
ln -sf $(realpath ../renpy/module/gen-static/_renpy.c) source/module/_renpy.c
ln -sf $(realpath ../renpy/module/gen-static/_renpybidi.c) source/module/_renpybidi.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.angle.gl.c) source/module/renpy.angle.gl.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.angle.gldraw.c) source/module/renpy.angle.gldraw.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.angle.glenviron_shader.c) source/module/renpy.angle.glenviron_shader.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.angle.glrtt_copy.c) source/module/renpy.angle.glrtt_copy.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.angle.glrtt_fbo.c) source/module/renpy.angle.glrtt_fbo.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.angle.gltexture.c) source/module/renpy.angle.gltexture.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.audio.renpysound.c) source/module/renpy.audio.renpysound.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.display.accelerator.c) source/module/renpy.display.accelerator.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.display.matrix.c) source/module/renpy.display.matrix.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.display.render.c) source/module/renpy.display.render.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.gl.c) source/module/renpy.gl.gl.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.gl1.c) source/module/renpy.gl.gl1.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.gldraw.c) source/module/renpy.gl.gldraw.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.glenviron_fixed.c) source/module/renpy.gl.glenviron_fixed.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.glenviron_limited.c) source/module/renpy.gl.glenviron_limited.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.glenviron_shader.c) source/module/renpy.gl.glenviron_shader.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.glrtt_copy.c) source/module/renpy.gl.glrtt_copy.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.glrtt_fbo.c) source/module/renpy.gl.glrtt_fbo.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.gl.gltexture.c) source/module/renpy.gl.gltexture.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl2.gl2draw.c) source/module/renpy.gl2.gl2draw.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl2.gl2environ_shader.c) source/module/renpy.gl2.gl2environ_shader.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl2.gl2geometry.c) source/module/renpy.gl2.gl2geometry.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl2.gl2rtt_fbo.c) source/module/renpy.gl2.gl2rtt_fbo.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl2.gl2shader.c) source/module/renpy.gl2.gl2shader.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl2.gl2texture.c) source/module/renpy.gl2.gl2texture.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl2.uguu.c) source/module/renpy.gl2.uguu.c
# ln -sf $(realpath ../renpy/module/gen-static/renpy.gl2.uguugl.c) source/module/renpy.gl2.uguugl.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.parsersupport.c) source/module/renpy.parsersupport.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.pydict.c) source/module/renpy.pydict.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.style.c) source/module/renpy.style.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_activate_functions.c) source/module/renpy.styledata.style_activate_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_functions.c) source/module/renpy.styledata.style_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_hover_functions.c) source/module/renpy.styledata.style_hover_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_idle_functions.c) source/module/renpy.styledata.style_idle_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_insensitive_functions.c) source/module/renpy.styledata.style_insensitive_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_selected_activate_functions.c) source/module/renpy.styledata.style_selected_activate_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_selected_functions.c) source/module/renpy.styledata.style_selected_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_selected_hover_functions.c) source/module/renpy.styledata.style_selected_hover_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_selected_idle_functions.c) source/module/renpy.styledata.style_selected_idle_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.style_selected_insensitive_functions.c) source/module/renpy.styledata.style_selected_insensitive_functions.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.styleclass.c) source/module/renpy.styledata.styleclass.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.styledata.stylesets.c) source/module/renpy.styledata.stylesets.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.text.ftfont.c) source/module/renpy.text.ftfont.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.text.textsupport.c) source/module/renpy.text.textsupport.c
ln -sf $(realpath ../renpy/module/gen-static/renpy.text.texwrap.c) source/module/renpy.text.texwrap.c
# ln -sf $(realpath ../renpy/module/gl2debug.c) source/module/gl2debug.c
ln -sf $(realpath ../renpy/module/renpybidicore.c) source/module/renpybidicore.c
ln -sf $(realpath ../renpy/module/renpysound_core.c) source/module/renpysound_core.c
ln -sf $(realpath ../renpy/module/subpixel.c) source/module/subpixel.c
ln -sf $(realpath ../renpy/module/ttgsubtable.c) source/module/ttgsubtable.c

mkdir -p include/module include/module/pygame_sdl2 include/module/src include/module/fribidi-src/lib

ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.display_api.h) include/module/pygame_sdl2/pygame_sdl2.display_api.h
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.event.h) include/module/pygame_sdl2/pygame_sdl2.event.h
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.rwobject_api.h) include/module/pygame_sdl2/pygame_sdl2.rwobject_api.h
ln -sf $(realpath ../pygame_sdl2/gen-static/pygame_sdl2.surface_api.h) include/module/pygame_sdl2/pygame_sdl2.surface_api.h
ln -sf $(realpath ../pygame_sdl2/src/SDL2_rotozoom.h) include/module/SDL2_rotozoom.h
ln -sf $(realpath ../pygame_sdl2/src/SDL_gfxPrimitives.h) include/module/SDL_gfxPrimitives.h
ln -sf $(realpath ../pygame_sdl2/src/SDL_gfxPrimitives_font.h) include/module/SDL_gfxPrimitives_font.h
ln -sf $(realpath ../pygame_sdl2/src/pygame_sdl2/pygame_sdl2.h) include/module/pygame_sdl2/pygame_sdl2.h
ln -sf $(realpath ../pygame_sdl2/src/python_threads.h) include/module/python_threads.h
ln -sf $(realpath ../pygame_sdl2/src/surface.h) include/module/src/surface.h
ln -sf $(realpath ../pygame_sdl2/src/write_jpeg.h) include/module/write_jpeg.h
ln -sf $(realpath ../pygame_sdl2/src/write_png.h) include/module/write_png.h
ln -sf $(realpath ../renpy/module/IMG_savepng.h) include/module/IMG_savepng.h
ln -sf $(realpath ../renpy/module/eglsupport.h) include/module/eglsupport.h
ln -sf $(realpath ../renpy/module/fribidi-src/config.h) include/module/config.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/arabic-misc.tab.i) include/module/fribidi-src/lib/arabic-misc.tab.i
ln -sf $(realpath ../renpy/module/fribidi-src/lib/arabic-shaping.tab.i) include/module/fribidi-src/lib/arabic-shaping.tab.i
ln -sf $(realpath ../renpy/module/fribidi-src/lib/bidi-type.tab.i) include/module/fribidi-src/lib/bidi-type.tab.i
ln -sf $(realpath ../renpy/module/fribidi-src/lib/bidi-types.h) include/module/bidi-types.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/common.h) include/module/common.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/debug.h) include/module/debug.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-arabic.h) include/module/fribidi-src/lib/fribidi-arabic.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-begindecls.h) include/module/fribidi-src/lib/fribidi-begindecls.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-bidi-types-list.h) include/module/fribidi-src/lib/fribidi-bidi-types-list.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-bidi-types.h) include/module/fribidi-src/lib/fribidi-bidi-types.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-bidi.h) include/module/fribidi-src/lib/fribidi-bidi.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-common.h) include/module/fribidi-src/lib/fribidi-common.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-config.h) include/module/fribidi-src/lib/fribidi-config.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-deprecated.h) include/module/fribidi-src/lib/fribidi-deprecated.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-enddecls.h) include/module/fribidi-src/lib/fribidi-enddecls.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-flags.h) include/module/fribidi-src/lib/fribidi-flags.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-joining-types-list.h) include/module/fribidi-src/lib/fribidi-joining-types-list.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-joining-types.h) include/module/fribidi-src/lib/fribidi-joining-types.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-joining.h) include/module/fribidi-src/lib/fribidi-joining.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-mirroring.h) include/module/fribidi-src/lib/fribidi-mirroring.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-shape.h) include/module/fribidi-src/lib/fribidi-shape.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-types.h) include/module/fribidi-src/lib/fribidi-types.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-unicode-version.h) include/module/fribidi-src/lib/fribidi-unicode-version.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi-unicode.h) include/module/fribidi-src/lib/fribidi-unicode.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/fribidi.h) include/module/fribidi-src/lib/fribidi.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/joining-type.tab.i) include/module/fribidi-src/lib/joining-type.tab.i
ln -sf $(realpath ../renpy/module/fribidi-src/lib/joining-types.h) include/module/fribidi-src/lib/joining-types.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/mem.h) include/module/fribidi-src/lib/mem.h
ln -sf $(realpath ../renpy/module/fribidi-src/lib/mirroring.tab.i) include/module/fribidi-src/lib/mirroring.tab.i
ln -sf $(realpath ../renpy/module/fribidi-src/lib/run.h) include/module/fribidi-src/lib/run.h
ln -sf $(realpath ../renpy/module/ftsupport.h) include/module/ftsupport.h
ln -sf $(realpath ../renpy/module/gl2debug.h) include/module/gl2debug.h
ln -sf $(realpath ../renpy/module/glcompat.h) include/module/glcompat.h
ln -sf $(realpath ../renpy/module/mmx.h) include/module/mmx.h
ln -sf $(realpath ../renpy/module/pyfreetype.h) include/module/pyfreetype.h
ln -sf $(realpath ../renpy/module/renpy.h) include/module/renpy.h
ln -sf $(realpath ../renpy/module/renpybidicore.h) include/module/renpybidicore.h
ln -sf $(realpath ../renpy/module/renpygl.h) include/module/renpygl.h
ln -sf $(realpath ../renpy/module/renpysound_core.h) include/module/renpysound_core.h
ln -sf $(realpath ../renpy/module/steamcallbacks.h) include/module/steamcallbacks.h
ln -sf $(realpath ../renpy/module/ttgsubtable.h) include/module/ttgsubtable.h
ln -sf $(realpath ../renpy/module/uguu/renpygl.h) include/module/renpygl.h
