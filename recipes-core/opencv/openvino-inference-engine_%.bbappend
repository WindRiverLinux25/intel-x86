SRC_URI += "git://github.com/oneapi-src/level-zero.git;protocol=https;destsuffix=git/thirdparty/level_zero/level-zero;name=level-zero;nobranch=1 \
            git://github.com/intel/level-zero-npu-extensions.git;protocol=https;destsuffix=git/src/plugins/intel_npu/thirdparty/level-zero-ext;name=level-zero-ext;nobranch=1 \
            git://github.com/jbeder/yaml-cpp.git;protocol=https;destsuffix=git/src/plugins/intel_npu/thirdparty/yaml-cpp;name=yaml-cpp;nobranch=1 \
           "

SRCREV_level-zero = "c0c23ad24e06a6109550381f9997b0b74fba90d7"
SRCREV_level-zero-ext = "c0156a3390ae39671ff8f2a6f5471f04bb65bb12"
SRCREV_yaml-cpp = "da82fd982c260e7f335ce5acbceff24b270544d1"

LIC_FILES_CHKSUM += "file://thirdparty/level_zero/level-zero/LICENSE;md5=97957beb2f7808ffa247e5d93e6442cc \
                     file://src/plugins/intel_npu/thirdparty/level-zero-ext/LICENSE.txt;md5=01026c6f31113af87989fa288d3c3f0a \
                     file://src/plugins/intel_npu/thirdparty/yaml-cpp/LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c \
                    "

NPU_INSTALL_CMD = "find ${B}/src/plugins/intel_npu/src/plugin/cross-compiled/ -type f -name \"*_disp.cpp\" -exec sed -i -e \"s%${S}%${TARGET_DBGSRC_DIR}%g\" {} + || bberror \"Failed to update dispatcher source paths\""

do_install:append() {
    ${@bb.utils.contains('PACKAGECONFIG', 'intel-npu', '${NPU_INSTALL_CMD}', '', d)}
}
