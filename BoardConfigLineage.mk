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
    google/devices/bluejay/google-base/gs101-b0.dtb

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/bluejay/vendor_dlkm.modules.load))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/bluejay/vendor_boot.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

TARGET_KERNEL_EXT_MODULES := \
    amplifiers/audiometrics \
    amplifiers/cs35l41 \
    amplifiers/cs40l25 \
    amplifiers/cs40l26 \
    aoc \
    aoc/alsa \
    aoc/usb \
    bluetooth/broadcom \
    bms \
    display/samsung \
    edgetpu/abrolhos/drivers/edgetpu \
    fingerprint/fpc \
    gpu/mali_pixel \
    gpu/mali_kbase \
    lwis \
    nfc \
    power/reset \
    sensors/hall_sensor \
    touch/common \
    touch/fts/fst2 \
    touch/fts/ftm5 \
    touch/sec \
    uwb/kernel \
    video/gchips \
    wlan/bcmdhd4389 \
    ../devices/google/bluejay/display
