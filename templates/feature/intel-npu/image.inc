# Install OpenCV and OpenCV static libraries
# OpenCV is required for image processing tasks that may be accelerated using the Intel NPU.
# The staticdev package provides static libraries for development, in case static linking is needed for the NPU-related applications.
IMAGE_INSTALL += "opencv opencv-staticdev"

# Install Python3 pip and dependencies
# These packages are needed for running Python-based AI and machine learning applications.
IMAGE_INSTALL += "python3-pip python3-six"

# Install the Intel NPU driver, firmware, and tests
# The `linux-npu-driver` is the core driver required to interface with the Intel NPU hardware.
# `linux-npu-driver-firmware` installs necessary firmware to enable communication with the hardware.
# `linux-npu-driver-tests` provides test cases to validate the functionality of the driver and hardware.
IMAGE_INSTALL += "linux-npu-driver linux-npu-driver-firmware linux-npu-driver-tests"
