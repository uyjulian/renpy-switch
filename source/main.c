#include <switch.h>
#include <Python.h>

PyMODINIT_FUNC initpygame_sdl2_color();
PyMODINIT_FUNC initpygame_sdl2_controller();
PyMODINIT_FUNC initpygame_sdl2_display();
PyMODINIT_FUNC initpygame_sdl2_draw();
PyMODINIT_FUNC initpygame_sdl2_error();
PyMODINIT_FUNC initpygame_sdl2_event();
PyMODINIT_FUNC initpygame_sdl2_event();
PyMODINIT_FUNC initpygame_sdl2_image();
PyMODINIT_FUNC initpygame_sdl2_joystick();
PyMODINIT_FUNC initpygame_sdl2_key();
PyMODINIT_FUNC initpygame_sdl2_locals();
PyMODINIT_FUNC initpygame_sdl2_mouse();
PyMODINIT_FUNC initpygame_sdl2_power();
PyMODINIT_FUNC initpygame_sdl2_pygame_time();
PyMODINIT_FUNC initpygame_sdl2_rect();
PyMODINIT_FUNC initpygame_sdl2_rwobject();
PyMODINIT_FUNC initpygame_sdl2_scrap();
PyMODINIT_FUNC initpygame_sdl2_surface();
PyMODINIT_FUNC initpygame_sdl2_transform();

PyMODINIT_FUNC init_renpy();
PyMODINIT_FUNC init_renpybidi();
PyMODINIT_FUNC initrenpy_audio_renpysound();
PyMODINIT_FUNC initrenpy_parsersupport();
PyMODINIT_FUNC initrenpy_pydict();
PyMODINIT_FUNC initrenpy_style();
PyMODINIT_FUNC initrenpy_styledata_styleclass();
PyMODINIT_FUNC initrenpy_styledata_stylesets();
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
PyMODINIT_FUNC initrenpy_display_render();
PyMODINIT_FUNC initrenpy_display_accelerator();
PyMODINIT_FUNC initrenpy_gl_gl();
PyMODINIT_FUNC initrenpy_gl_gldraw();
PyMODINIT_FUNC initrenpy_gl_gltexture();
PyMODINIT_FUNC initrenpy_gl_glenviron_shader();
PyMODINIT_FUNC initrenpy_gl_glrtt_copy();
PyMODINIT_FUNC initrenpy_gl_glrtt_fbo();
PyMODINIT_FUNC initrenpy_text_textsupport();
PyMODINIT_FUNC initrenpy_text_texwrap();
PyMODINIT_FUNC initrenpy_text_ftfont();

void userShowMessage(const char* message)
{
    consoleInit(NULL);
    fprintf(stderr, "%s\n", message);
    consoleUpdate(NULL);

    while (appletMainLoop())
    {
        hidScanInput();

        if (hidKeysDown(CONTROLLER_P1_AUTO) & KEY_PLUS)
        {
            break;
        }
    }

    consoleExit(NULL);
}

int main(int argc, char* argv[])
{
    Py_NoSiteFlag = 1;
    Py_IgnoreEnvironmentFlag = 1;
    Py_NoUserSiteDirectory = 1;

    static struct _inittab builtins[] = {
        {"pygame_sdl2.event", initpygame_sdl2_event},
        {"pygame_sdl2.error", initpygame_sdl2_error},
        {"pygame_sdl2.color", initpygame_sdl2_color},
        {"pygame_sdl2.controller", initpygame_sdl2_controller},
        {"pygame_sdl2.rect", initpygame_sdl2_rect},
        {"pygame_sdl2.rwobject", initpygame_sdl2_rwobject},
        {"pygame_sdl2.surface", initpygame_sdl2_surface},
        {"pygame_sdl2.display", initpygame_sdl2_display},
        {"pygame_sdl2.event", initpygame_sdl2_event},
        {"pygame_sdl2.locals", initpygame_sdl2_locals},
        {"pygame_sdl2.key", initpygame_sdl2_key},
        {"pygame_sdl2.mouse", initpygame_sdl2_mouse},
        {"pygame_sdl2.joystick", initpygame_sdl2_joystick},
        {"pygame_sdl2.power", initpygame_sdl2_power},
        {"pygame_sdl2.pygame_time", initpygame_sdl2_pygame_time},
        {"pygame_sdl2.image", initpygame_sdl2_image},
        {"pygame_sdl2.transform", initpygame_sdl2_transform},
        {"pygame_sdl2.draw", initpygame_sdl2_draw},
        {"pygame_sdl2.scrap", initpygame_sdl2_scrap},

        {"_renpy", init_renpy},
        {"_renpybidi", init_renpybidi},
        {"renpy.audio.renpysound", initrenpy_audio_renpysound},
        {"renpy.parsersupport", initrenpy_parsersupport},
        {"renpy.pydict", initrenpy_pydict},
        {"renpy.style", initrenpy_style},
        {"renpy.styledata.styleclass", initrenpy_styledata_styleclass},
        {"renpy.styledata.stylesets", initrenpy_styledata_stylesets},
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
        {"renpy.display.render", initrenpy_display_render},
        {"renpy.display.accelerator", initrenpy_display_accelerator},
        {"renpy.gl.gl", initrenpy_gl_gl},
        {"renpy.gl.gldraw", initrenpy_gl_gldraw},
        {"renpy.gl.gltexture", initrenpy_gl_gltexture},
        {"renpy.gl.glenviron_shader", initrenpy_gl_glenviron_shader},
        {"renpy.gl.glrtt_copy", initrenpy_gl_glrtt_copy},
        {"renpy.gl.glrtt_fbo", initrenpy_gl_glrtt_fbo},
        {"renpy.text.textsupport", initrenpy_text_textsupport},
        {"renpy.text.texwrap", initrenpy_text_texwrap},
        {"renpy.text.ftfont", initrenpy_text_ftfont},

        {NULL, NULL}
    };

    Result romfs_result = romfsInit();

    socketInitializeDefault();

    nxlinkStdio();

    FILE* sysconfigdata_file = fopen("romfs:/Contents/lib/python2.7/_sysconfigdata.py", "rb");
    if (sysconfigdata_file == NULL)
    {
        sysconfigdata_file = fopen("./lib/python2.7/_sysconfigdata.py", "rb");
        if (sysconfigdata_file == NULL)
        {
            userShowMessage(
                "The lib/python2.7/_sysconfigdata.py file is not located in the same directory as this executable.\n"
                "Press + to return.\n"
            );
            return 1;
        }
        else
        {
            Py_SetPythonHome("./lib/python2.7");
            fclose(sysconfigdata_file);
        }
    }
    else
    {
        Py_SetPythonHome("romfs:/Contents/lib/python2.7");
        fclose(sysconfigdata_file);
    }

    Py_InitializeEx(0);

    PyImport_ExtendInittab(builtins);

    PySys_SetArgv(argc, argv);

    int python_result;

    python_result = PyRun_SimpleString(
        "import sys\n"

        "del sys.path[:]\n"

        "pathdirs = ['romfs:/Contents/lib/python2.7', 'romfs:/Contents', './lib/python2.7', '.']\n"

        "for i in pathdirs:\n"
        "\tsys.path.append(i)\n"

        "import os\n"
        "import pygame_sdl2\n"

        "del sys.path[:]\n"

        "for i in pathdirs:\n"
        "\tj = os.path.abspath(os.path.realpath(i))\n"
        "\tif os.path.exists(j):\n"
        "\t\tsys.path.append(j)\n"

        "import os\n"
        "import pygame_sdl2\n"
        "import encodings\n"
    );

    if (python_result == -1)
    {
        Py_Finalize();
        userShowMessage(
            "An error occurred while initializing the Python engine.\n"
            "Please verify that the lib/python2.7 folder in the same directory as this executable contains the correct files.\n"
            "Press + to return.\n"
        );
        return 1;
    }

    FILE* renpy_file = fopen("romfs:/Contents/renpy.py", "rb");
    if (renpy_file == NULL)
    {
        renpy_file = fopen("./renpy.py", "rb");
        if (renpy_file == NULL)
        {
            Py_Finalize();
            userShowMessage(
                "The renpy.py file is not located in the same directory as this executable.\n"
                "Press + to return.\n"
            );
            return 1;
        }
        else
        {
            python_result = PyRun_SimpleFileEx(renpy_file, "./renpy.py", 1);
        }
    }
    else
    {
        python_result = PyRun_SimpleFileEx(renpy_file, "romfs:/Contents/renpy.py", 1);
    }

    if (python_result == -1)
    {
        Py_Finalize();
        userShowMessage(
            "I apologize, but an uncaught Python exception occurred.\n"
            "Press + to return.\n"
        );
        return 1;
    }

    if (!R_FAILED(romfs_result))
    {
        romfsExit();
    }

    socketExit();

    Py_Finalize();
    return 0;
}
