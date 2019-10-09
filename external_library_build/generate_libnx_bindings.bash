
source /opt/devkitpro/switchvars.sh

mkdir -p libnx_bindings

printf '#include <switch.h>\n' > libnx_bindings/libnx_nopp.c
aarch64-none-elf-gcc ${CPPFLAGS} libnx_bindings/libnx_nopp.c -E -o libnx_bindings/libnx_pp.c

perl -l -p -e 's/^#.*\z$n//mg' libnx_bindings/libnx_pp.c > libnx_bindings/libnx_pp1.c
cat libnx_bindings/libnx_pp1.c | sed '/^[[:space:]]*$/d' > libnx_bindings/libnx_pp2.c
perl -l -p -e 's/__attribute__\(\([^)(]*+(?:(?R)[^)(]*)*+\)\)//mg' libnx_bindings/libnx_pp2.c > libnx_bindings/libnx_pp3.c
perl -l -p -e 's/__attribute__ \(\([^)(]*+(?:(?R)[^)(]*)*+\)\)//mg' libnx_bindings/libnx_pp3.c > libnx_bindings/libnx_pp4.c
perl -l -p -e 's/__attribute__\(\(__aligned__\(__alignof__\(long long\)\)\)\)//mg' libnx_bindings/libnx_pp4.c > libnx_bindings/libnx_pp5.c
perl -l -p -e 's/__attribute__\(\(__aligned__\(__alignof__\(long double\)\)\)\)//mg' libnx_bindings/libnx_pp5.c > libnx_bindings/libnx_pp6.c
perl -l -p -e 's/__extension__//mg' libnx_bindings/libnx_pp6.c > libnx_bindings/libnx_pp7.c
perl -l -p -e 's/_Alignas\(8\)//mg' libnx_bindings/libnx_pp7.c > libnx_bindings/libnx_pp8.c
perl -l -p -e 's/_Bool/bool/mg' libnx_bindings/libnx_pp8.c > libnx_bindings/libnx_pp9.c
perl -l -p -e 's/^typedef unsigned int wchar_t;\z$n//mg' libnx_bindings/libnx_pp9.c > libnx_bindings/libnx_pp10.c
perl -l -p -e 's/__inline/inline/mg' libnx_bindings/libnx_pp10.c > libnx_bindings/libnx_pp11.c
perl -l -p -e 's/^extern struct in_addr __nxlink_host;\z$n//mg' libnx_bindings/libnx_pp11.c > libnx_bindings/libnx_pp12.c
perl -0 -l -p -e 's/ static inline uint32_t $n__crc32.*$n\{$n(.*)$n\}$n//smg' libnx_bindings/libnx_pp12.c > libnx_bindings/libnx_pp13.c
perl -0 -l -p -e 's/static inline u32 crc32.* \{$n(.*)$n\}$n//smg' libnx_bindings/libnx_pp13.c > libnx_bindings/libnx_pp14.c
perl -0 -l -p -e 's/int pselect \(.*\)$n *;$n//smg' libnx_bindings/libnx_pp14.c > libnx_bindings/libnx_pp15.c

printf '%%module libnx\n%%{\n#include <switch.h>\n%%}\n' > libnx_bindings/libnx_header_swig.c

cat libnx_bindings/libnx_header_swig.c libnx_bindings/libnx_pp15.c > libnx_bindings/libnx.i

swig -python libnx_bindings/libnx.i

ln -sf ../libnx_bindings/libnx_wrap.c source/libnx_wrap.c
