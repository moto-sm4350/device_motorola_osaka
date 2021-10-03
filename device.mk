#
# Copyright (C) 2021 The Raphielscape LLC. and The helluvaOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
#$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Kernel
PRODUCT_COPY_FILES += \
    device/motorola/osaka-kernel/Image:kernel

# Initialization
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.fstab:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_PACKAGES += \
    init.qcom.recovery.rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    CarrierConfigResCommon \
    FrameworksResCommon \
    SystemUIResCommon \
    TelephonyResCommon \
    WifiResCommon \
    OsakaFrameworks \
    OsakaSystemUI

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 30
