#
# Copyright (C) 2021 The LineageOS Project
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

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Display
$(call inherit-product, hardware/qcom-caf/sm8350/display/config/display-product.mk)

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Kernel
PRODUCT_COPY_FILES += \
    device/motorola/osaka-kernel/Image:kernel

# Initialization
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.fstab:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom

PRODUCT_PACKAGES += \
    init.qcom.recovery.rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/sm8350/display

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

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 30
