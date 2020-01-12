
source /opt/devkitpro/switchvars.sh

mkdir -p libnx_bindings

printf '#include <switch.h>\n' > libnx_bindings/libnx_nopp.c
aarch64-none-elf-gcc ${CPPFLAGS} libnx_bindings/libnx_nopp.c -E -o libnx_bindings/libnx_pp.c

cat libnx_bindings/libnx_pp.c | \
	awk '/switch/{a=1}a' | \
	perl -l -p -e 's/^#.*\z$n//mg' | \
	sed '/^[[:space:]]*$/d'  | \
	perl -l -p -e 's/__attribute__\(\([^)(]*+(?:(?R)[^)(]*)*+\)\)//mg' | \
	perl -l -p -e 's/__attribute__ \(\([^)(]*+(?:(?R)[^)(]*)*+\)\)//mg' | \
	perl -l -p -e 's/__attribute__\(\(__aligned__\(__alignof__\(long long\)\)\)\)//mg' | \
	perl -l -p -e 's/__attribute__\(\(__aligned__\(__alignof__\(long double\)\)\)\)//mg' | \
	perl -l -p -e 's/__extension__//mg' | \
	perl -l -p -e 's/_Alignas\(8\)//mg' | \
	perl -l -p -e 's/_Alignas\(4\)//mg' | \
	perl -l -p -e 's/_Bool/bool/mg' | \
	perl -l -p -e 's/^typedef unsigned int wchar_t;\z$n//mg' | \
	perl -l -p -e 's/__inline/inline/mg' | \
	perl -l -p -e 's/^extern struct in_addr __nxlink_host;\z$n//mg' | \
	perl -l -p -e 's/^Result fsldrSetCurrentProcess\(void\);\z$n//mg' | \
	perl -l -p -e 's/^Result ldrShellFlushArguments\(void\);\z$n//mg' | \
	perl -l -p -e 's/^Result ldrDmntFlushArguments\(void\);\z$n//mg' | \
	perl -l -p -e 's/^Service\* splFsGetServiceSession\(void\);\z$n//mg' | \
	perl -l -p -e 's/^Service\* splSslGetServiceSession\(void\);\z$n//mg' | \
	perl -l -p -e 's/^Service\* splManuGetServiceSession\(void\);\z$n//mg' | \
	perl -l -p -e 's/^Service\* splCryptoGetServiceSession\(void\);\z$n//mg' | \
	perl -l -p -e 's/^Service\* splEsGetServiceSession\(void\);\z$n//mg' | \
	perl -l -p -e 's/^NWindow\* nwindowGetDefault\(void\);\z$n//mg' | \
	perl -0 -l -p -e 's/ static inline uint32_t $n__crc32.*$n\{$n(.*)$n\}$n//smg' | \
	perl -0 -l -p -e 's/static inline u32 crc32.* \{$n(.*)$n\}$n//smg' | \
	perl -0 -l -p -e 's/int pselect \(.*\)$n *;$n//smg' > libnx_bindings/libnx_pp15.c

printf '%%module libnx\n%%{\n#include <switch.h>\n%%}\n' > libnx_bindings/libnx_header_swig.c

cat libnx_bindings/libnx_header_swig.c libnx_bindings/libnx_pp15.c > libnx_bindings/libnx.i

swig -python libnx_bindings/libnx.i

ln -sf ../libnx_bindings/libnx_wrap.c source/libnx_wrap.c
