SUMMARY = "IOTG TSN Reference Software"
DESCRIPTION = "IOTG Time-Sensitive Networking Reference Software"
HOMEPAGE = "https://github.com/intel/iotg_tsn_ref_sw"

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=665202835d998903d52afcb9c30ad9f5"

SRC_URI = "git://github.com/intel/iotg_tsn_ref_sw.git;protocol=https;branch=master"
SRCREV = "d03a8f751ce7206a91ad4c597dead6b324460e48"

PV = "1.0-git${SRCPV}"

S = "${WORKDIR}/git"

COMPATIBLE_MACHINE = 'null'

inherit autotools pkgconfig

DEPENDS += " elfutils libbpf-iotg json-c"

RDEPENDS:${PN} += "\
                    gnuplot-x11 \
                    iperf3 \
                    bash \
                  "

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install(){
    mkdir -p ${D}${datadir}/${BPN}
    cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/${BPN}
}

RRECOMMENDS:${PN}-src = "libbpf-iotg-dev"
