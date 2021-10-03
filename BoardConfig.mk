#
# Copyright (C) 2021 The Raphielscape LLC. and The helluvaOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/osaka

include build/make/target/board/BoardConfigMainlineCommon.mk

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    product \
    system \
    system_ext \
    vbmeta_system \
    vendor_boot

# AVB
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := product system system_ext vendor
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holi

# DTB
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := false

# Kernel
BOARD_KERNEL_CMDLINE := \
    androidboot.console=ttyMSM0 \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.selinux=permissive \
    androidboot.usbcontroller=4e00000.dwc3 \
    cgroup.memory=nokmem,nosocket \
    console=ttyMSM0,115200n8 \
    iptable_raw.raw_before_defrag=1 \
    ip6table_raw.raw_before_defrag=1 \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    swiotlb=0
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000

# Partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := product system system_ext vendor
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 6979317760 # (BOARD_SUPER_PARTITION_SIZE / 2) - 4096
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 13958643712

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

# Platform
TARGET_BOARD_PLATFORM := holi

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/init.fstab

