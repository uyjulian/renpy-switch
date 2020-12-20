#include <switch.h>
#include <Python.h>

u32 __nx_applet_exit_mode = 1;
extern u32 __nx_applet_type;
extern size_t __nx_heap_size;

PyMODINIT_FUNC init_libnx();

PyMODINIT_FUNC initpygame_sdl2_color();
PyMODINIT_FUNC initpygame_sdl2_controller();
PyMODINIT_FUNC initpygame_sdl2_display();
PyMODINIT_FUNC initpygame_sdl2_draw();
PyMODINIT_FUNC initpygame_sdl2_error();
PyMODINIT_FUNC initpygame_sdl2_event();
#if 0
PyMODINIT_FUNC initpygame_sdl2_font();
#endif
PyMODINIT_FUNC initpygame_sdl2_gfxdraw();
PyMODINIT_FUNC initpygame_sdl2_image();
PyMODINIT_FUNC initpygame_sdl2_joystick();
PyMODINIT_FUNC initpygame_sdl2_key();
PyMODINIT_FUNC initpygame_sdl2_locals();
#if 0
PyMODINIT_FUNC initpygame_sdl2_mixer();
PyMODINIT_FUNC initpygame_sdl2_mixer_music();
#endif
PyMODINIT_FUNC initpygame_sdl2_mouse();
PyMODINIT_FUNC initpygame_sdl2_power();
PyMODINIT_FUNC initpygame_sdl2_pygame_time();
PyMODINIT_FUNC initpygame_sdl2_rect();
PyMODINIT_FUNC initpygame_sdl2_render();
PyMODINIT_FUNC initpygame_sdl2_rwobject();
PyMODINIT_FUNC initpygame_sdl2_scrap();
PyMODINIT_FUNC initpygame_sdl2_surface();
PyMODINIT_FUNC initpygame_sdl2_transform();

PyMODINIT_FUNC init_renpy();
PyMODINIT_FUNC init_renpybidi();
PyMODINIT_FUNC initrenpy_audio_renpysound();
PyMODINIT_FUNC initrenpy_display_accelerator();
PyMODINIT_FUNC initrenpy_display_render();
PyMODINIT_FUNC initrenpy_display_matrix();
PyMODINIT_FUNC initrenpy_gl_gl();
PyMODINIT_FUNC initrenpy_gl_gldraw();
PyMODINIT_FUNC initrenpy_gl_glenviron_shader();
PyMODINIT_FUNC initrenpy_gl_glrtt_copy();
PyMODINIT_FUNC initrenpy_gl_glrtt_fbo();
PyMODINIT_FUNC initrenpy_gl_gltexture();
#if 0
PyMODINIT_FUNC initrenpy_gl2_gl2draw();
PyMODINIT_FUNC initrenpy_gl2_gl2environ_shader();
PyMODINIT_FUNC initrenpy_gl2_gl2geometry();
PyMODINIT_FUNC initrenpy_gl2_gl2rtt_fbo();
PyMODINIT_FUNC initrenpy_gl2_gl2shader();
PyMODINIT_FUNC initrenpy_gl2_gl2texture();
PyMODINIT_FUNC initrenpy_gl2_uguu();
PyMODINIT_FUNC initrenpy_gl2_uguugl();
#endif
PyMODINIT_FUNC initrenpy_parsersupport();
PyMODINIT_FUNC initrenpy_pydict();
PyMODINIT_FUNC initrenpy_style();
PyMODINIT_FUNC initrenpy_styledata_style_activate_functions();
PyMODINIT_FUNC initrenpy_styledata_style_functions();
PyMODINIT_FUNC initrenpy_styledata_style_hover_functions();
PyMODINIT_FUNC initrenpy_styledata_style_idle_functions();
PyMODINIT_FUNC initrenpy_styledata_style_insensitive_functions();
PyMODINIT_FUNC initrenpy_styledata_style_selected_activate_functions();
PyMODINIT_FUNC initrenpy_styledata_style_selected_functions();
PyMODINIT_FUNC initrenpy_styledata_style_selected_hover_functions();
PyMODINIT_FUNC initrenpy_styledata_style_selected_idle_functions();
PyMODINIT_FUNC initrenpy_styledata_style_selected_insensitive_functions();
PyMODINIT_FUNC initrenpy_styledata_styleclass();
PyMODINIT_FUNC initrenpy_styledata_stylesets();
PyMODINIT_FUNC initrenpy_text_ftfont();
PyMODINIT_FUNC initrenpy_text_textsupport();
PyMODINIT_FUNC initrenpy_text_texwrap();

// Overide the heap initialization function.
void __libnx_initheap(void)
{
    void*  addr;
    size_t size = 0;
    size_t mem_available = 0, mem_used = 0;
    const size_t max_mem = 0x18000000;

    if (envHasHeapOverride()) {
        addr = envGetHeapOverrideAddr();
        size = envGetHeapOverrideSize();
    }
    else {
        if (__nx_heap_size==0) {
            svcGetInfo(&mem_available, InfoType_TotalMemorySize, CUR_PROCESS_HANDLE, 0);
            svcGetInfo(&mem_used, InfoType_UsedMemorySize, CUR_PROCESS_HANDLE, 0);
            if (mem_available > mem_used+0x200000)
                size = (mem_available - mem_used - 0x200000) & ~0x1FFFFF;
            if (size==0)
                size = 0x2000000*16;
        }
        else {
            size = __nx_heap_size;
        }

        // Limit heap memory to 384 MiB (to give room for VRAM and Python heap)
        if (size > max_mem)
        {
            size = max_mem;
        }

        Result rc = svcSetHeapSize(&addr, size);

        if (R_FAILED(rc))
            diagAbortWithResult(MAKERESULT(Module_Libnx, LibnxError_HeapAllocFailed));
    }

    // References to the bump allocator in Newlib.
    extern char* fake_heap_start;
    extern char* fake_heap_end;

    fake_heap_start = (char*)addr;
    fake_heap_end   = (char*)addr + size;
}

void userAppInit()
{
    romfsInit();
    socketInitializeDefault();
    nxlinkStdio();
}

void userAppExit()
{
    socketExit();
    romfsExit();
}

ConsoleRenderer* getDefaultConsoleRenderer(void)
{
    return NULL;
}

char relative_dir_path[0x400];
char sysconfigdata_file_path[0x400];
char python_home_buffer[0x400];
char python_snprintf_buffer[0x400];
char python_script_buffer[0x400];
char python_error_buffer[0x400];

void show_error_and_exit(const char* message)
{
    Py_Finalize();
    char* first_line = (char*)message;
    char* end = strchr(message, '\n');
    if (end != NULL)
    {
        first_line = python_error_buffer;
        memcpy(first_line, message, (end - message) > sizeof(python_error_buffer) ? sizeof(python_error_buffer) : (end - message));
        first_line[end - message] = '\0';
    }
    ErrorSystemConfig c;
    errorSystemCreate(&c, (const char*)first_line, message);
    errorSystemShow(&c);
    Py_Exit(1);
}

int main(int argc, char* argv[])
{
    setenv("MESA_NO_ERROR", "1", 1);
    if (__nx_applet_type != AppletType_Application)
    {
#if 0
        show_error_and_exit("Only application override is supported by this program.\n\nTo run this program as application override, hold down the R button while launching an application on the menu.");
#endif
#if 1
        setenv("RENPY_LESS_MEMORY", "1", 1);
#endif
    }

    Py_NoSiteFlag = 1;
    Py_IgnoreEnvironmentFlag = 1;
    Py_NoUserSiteDirectory = 1;
    Py_DontWriteBytecodeFlag = 1;
    Py_OptimizeFlag = 2;

    static struct _inittab builtins[] = {
        {"_libnx", init_libnx},

        {"pygame_sdl2.color", initpygame_sdl2_color},
        {"pygame_sdl2.controller", initpygame_sdl2_controller},
        {"pygame_sdl2.display", initpygame_sdl2_display},
        {"pygame_sdl2.draw", initpygame_sdl2_draw},
        {"pygame_sdl2.error", initpygame_sdl2_error},
        {"pygame_sdl2.event", initpygame_sdl2_event},
#if 0
        {"pygame_sdl2.font", initpygame_sdl2_font},
#endif
        {"pygame_sdl2.gfxdraw", initpygame_sdl2_gfxdraw},
        {"pygame_sdl2.image", initpygame_sdl2_image},
        {"pygame_sdl2.joystick", initpygame_sdl2_joystick},
        {"pygame_sdl2.key", initpygame_sdl2_key},
        {"pygame_sdl2.locals", initpygame_sdl2_locals},
#if 0
        {"pygame_sdl2.mixer", initpygame_sdl2_mixer},
        {"pygame_sdl2.mixer_music", initpygame_sdl2_mixer_music},
#endif
        {"pygame_sdl2.mouse", initpygame_sdl2_mouse},
        {"pygame_sdl2.power", initpygame_sdl2_power},
        {"pygame_sdl2.pygame_time", initpygame_sdl2_pygame_time},
        {"pygame_sdl2.rect", initpygame_sdl2_rect},
        {"pygame_sdl2.render", initpygame_sdl2_render},
        {"pygame_sdl2.rwobject", initpygame_sdl2_rwobject},
        {"pygame_sdl2.scrap", initpygame_sdl2_scrap},
        {"pygame_sdl2.surface", initpygame_sdl2_surface},
        {"pygame_sdl2.transform", initpygame_sdl2_transform},

        {"_renpy", init_renpy},
        {"_renpybidi", init_renpybidi},
        {"renpy.audio.renpysound", initrenpy_audio_renpysound},
        {"renpy.display.accelerator", initrenpy_display_accelerator},
        {"renpy.display.matrix", initrenpy_display_matrix},
        {"renpy.display.render", initrenpy_display_render},
        {"renpy.gl.gl", initrenpy_gl_gl},
        {"renpy.gl.gldraw", initrenpy_gl_gldraw},
        {"renpy.gl.glenviron_shader", initrenpy_gl_glenviron_shader},
        {"renpy.gl.glrtt_copy", initrenpy_gl_glrtt_copy},
        {"renpy.gl.glrtt_fbo", initrenpy_gl_glrtt_fbo},
        {"renpy.gl.gltexture", initrenpy_gl_gltexture},
#if 0
        {"renpy.gl2.gl2draw", initrenpy_gl2_gl2draw},
        {"renpy.gl2.gl2geometry", initrenpy_gl2_gl2geometry},
        {"renpy.gl2.gl2shader", initrenpy_gl2_gl2shader},
        {"renpy.gl2.gl2texture", initrenpy_gl2_gl2texture},
        {"renpy.gl2.uguu", initrenpy_gl2_uguu},
        {"renpy.gl2.uguugl", initrenpy_gl2_uguugl},
#endif
        {"renpy.parsersupport", initrenpy_parsersupport},
        {"renpy.pydict", initrenpy_pydict},
        {"renpy.style", initrenpy_style},
        {"renpy.styledata.style_activate_functions", initrenpy_styledata_style_activate_functions},
        {"renpy.styledata.style_functions", initrenpy_styledata_style_functions},
        {"renpy.styledata.style_hover_functions", initrenpy_styledata_style_hover_functions},
        {"renpy.styledata.style_idle_functions", initrenpy_styledata_style_idle_functions},
        {"renpy.styledata.style_insensitive_functions", initrenpy_styledata_style_insensitive_functions},
        {"renpy.styledata.style_selected_activate_functions", initrenpy_styledata_style_selected_activate_functions},
        {"renpy.styledata.style_selected_functions", initrenpy_styledata_style_selected_functions},
        {"renpy.styledata.style_selected_hover_functions", initrenpy_styledata_style_selected_hover_functions},
        {"renpy.styledata.style_selected_idle_functions", initrenpy_styledata_style_selected_idle_functions},
        {"renpy.styledata.style_selected_insensitive_functions", initrenpy_styledata_style_selected_insensitive_functions},
        {"renpy.styledata.styleclass", initrenpy_styledata_styleclass},
        {"renpy.styledata.stylesets", initrenpy_styledata_stylesets},
        {"renpy.text.ftfont", initrenpy_text_ftfont},
        {"renpy.text.textsupport", initrenpy_text_textsupport},
        {"renpy.text.texwrap", initrenpy_text_texwrap},

        {NULL, NULL}
    };

    if (argc != 1)
    {
        show_error_and_exit("Only one argument (the program itself) should be passed to the program.\n\nPlease use hbmenu to run this program.");
    }

    if (strchr(argv[0], ' '))
    {
        show_error_and_exit("No spaces should be contained in the program path.\n\nPlease remove spaces from the program path.");
    }

    if (!strchr(argv[0], ':'))
    {
        show_error_and_exit("Program path does not appear to be an absolute path.\n\nPlease use hbmenu to run this program.");
    }

    char* last_dir_separator = strrchr(argv[0], '/');

    if (last_dir_separator)
    {
        size_t dirpath_size = last_dir_separator - argv[0];
        memcpy(relative_dir_path, argv[0], dirpath_size);
        relative_dir_path[dirpath_size] = '\000';
    }
    else
    {
        getcwd(relative_dir_path, sizeof(relative_dir_path));
    }

    char* dir_paths[] = {
        "romfs:/Contents",
        relative_dir_path,
        NULL,
    };

    int found_sysconfigdata = 0;
    int found_renpy = 0;

    for (int i = 0; i < sizeof(dir_paths); i += 1)
    {
        if (dir_paths[i] == NULL)
        {
            break;
        }
        snprintf(sysconfigdata_file_path, sizeof(sysconfigdata_file_path), "%s/lib.zip", dir_paths[i]);
        FILE* sysconfigdata_file = fopen((const char*)sysconfigdata_file_path, "rb");
        if (sysconfigdata_file != NULL)
        {
            found_sysconfigdata = 1;
            fclose(sysconfigdata_file);
        }

        snprintf(python_script_buffer, sizeof(python_script_buffer), "%s/renpy.py", dir_paths[i]);
        FILE* renpy_file = fopen((const char*)python_script_buffer, "rb");
        if (renpy_file != NULL)
        {
            found_renpy = 1;
            fclose(renpy_file);
        }

        if (found_sysconfigdata == 1 && found_renpy == 1)
        {
            snprintf(python_home_buffer, sizeof(python_home_buffer), "%s/lib.zip", dir_paths[i]);
            snprintf(python_snprintf_buffer, sizeof(python_snprintf_buffer), "import sys\nsys.path = ['%s/lib.zip']", dir_paths[i]);
            Py_SetPythonHome(python_home_buffer);
            break;
        }
    }

    if (found_sysconfigdata == 0)
    {
        show_error_and_exit("Could not find lib.zip.\n\nPlease ensure that you have extracted the files correctly so that the \"lib.zip\" file is in the same directory as the nro file.");
    }

    if (found_renpy == 0)
    {
        show_error_and_exit("Could not find renpy.py.\n\nPlease ensure that you have extracted the files correctly so that the \"renpy.py\" file is in the same directory as the nro file.");
    }

    Py_InitializeEx(0);

    PyImport_ExtendInittab(builtins);

    char* pyargs[] = {
        python_script_buffer,
        NULL,
    };

    PySys_SetArgvEx(1, pyargs, 1);

    int python_result;

    python_result = PyRun_SimpleString(python_snprintf_buffer);

    if (python_result == -1)
    {
        show_error_and_exit("Could not set the Python path.\n\nThis is an internal error and should not occur during normal usage.");
    }

#define x(lib) \
    { \
        if (PyRun_SimpleString("import " lib) == -1) \
        { \
            show_error_and_exit("Could not import python library " lib ".\n\nPlease ensure that you have extracted the files correctly so that the \"lib\" folder is in the same directory as the nro file, and that the \"lib\" folder contains the folder \"python2.7\". \nInside that folder, the file \"" lib ".py\" or folder \"" lib "\" needs to exist."); \
        } \
    }

    x("os");
    x("pygame_sdl2");
    x("encodings");

#undef x

    FILE* renpy_file = fopen((const char*)python_script_buffer, "rb");
    if (renpy_file == NULL)
    {
        show_error_and_exit("Could not open renpy.py after Python initialization.\n\nThis is an internal error and should not occur during normal usage.");
    }
    else
    {
        python_result = PyRun_SimpleFileEx(renpy_file, (const char*)python_script_buffer, 1);
    }

    if (python_result == -1)
    {
        show_error_and_exit("An uncaught Python exception occurred during renpy.py execution.\n\nPlease look in the \"Ren'Py Logs\" folder on the SD card root for more information about this exception.");
    }

    Py_Exit(0);
    return 0;
}
