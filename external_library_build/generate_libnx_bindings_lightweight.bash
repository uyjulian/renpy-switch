
source /opt/devkitpro/switchvars.sh

mkdir -p libnx_bindings

printf '%%module libnx\n%%{\n#include <switch.h>\n%%}\n' > libnx_bindings/libnx_header_swig.c

cat libnx_bindings/libnx_header_swig.c external_library_build/libnx_minimal.i > libnx_bindings/libnx.i

swig -python libnx_bindings/libnx.i

ln -sf ../libnx_bindings/libnx_wrap.c source/libnx_wrap.c
