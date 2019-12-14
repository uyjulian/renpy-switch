
glad --profile="compatibility" --api="gl=1.3" --generator="c" --spec="gl" --no-loader --extensions="GL_ARB_fragment_program,GL_ARB_fragment_shader,GL_ARB_multitexture,GL_ARB_shader_objects,GL_ARB_shading_language_100,GL_ARB_texture_env_combine,GL_ARB_vertex_buffer_object,GL_ARB_vertex_program,GL_ARB_vertex_shader,GL_EXT_framebuffer_object" --out-path glad_loader

ln -sf ../glad_loader/src/glad.c source/glad.c
rm -f include/glad include/KHR
ln -sf ../glad_loader/include/glad include/glad
ln -sf ../glad_loader/include/KHR include/KHR
