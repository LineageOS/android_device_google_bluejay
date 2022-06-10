#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true

# Kernel
TARGET_KERNEL_DTBO_PREFIX := dts/
TARGET_KERNEL_DTBO := google/devices/bluejay/dtbo.img
TARGET_KERNEL_DTB := \
    google/devices/bluejay/google-base/gs101-a0.dtb \
    google/devices/bluejay/google-base/gs101-b0.dtb \
    google/devices/bluejay/gs101-bluejay-dev.dtb \
    google/devices/bluejay/gs101-bluejay-proto1_0.dtb \
    google/devices/bluejay/gs101-bluejay-proto1_1.dtb \
    google/devices/bluejay/gs101-bluejay-evt1_0.dtb \
    google/devices/bluejay/gs101-bluejay-evt1_1.dtb \
    google/devices/bluejay/gs101-bluejay-evt1_2.dtb \
    google/devices/bluejay/gs101-bluejay-dvt1_0.dtb \
    google/devices/bluejay/gs101-bluejay-dvt1_1.dtb \
    google/devices/bluejay/gs101-bluejay-pvt1_0.dtb \
    google/devices/bluejay/gs101-bluejay-mp1_0.dtb
TARGET_KERNEL_SOURCE := kernel/google/bluejay/kernel

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/bluejay/vendor_dlkm.modules.load))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/bluejay/vendor_boot.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

# Manifests
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/lineage/config/device_framework_matrix.xml
