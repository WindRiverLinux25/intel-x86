IMAGE_INSTALL += "qat"
IMAGE_INSTALL += "${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/qat', [ 'qat17', 'qat20' ], 'qatzip', '', d)}"
