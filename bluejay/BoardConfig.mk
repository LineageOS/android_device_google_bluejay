#
# SPDX-FileCopyrightText: 2020 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#

# Enable load module in parallel
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

# The modules which need to be loaded in sequential
BOARD_KERNEL_CMDLINE += fips140.load_sequential=1
BOARD_KERNEL_CMDLINE += exynos_mfc.load_sequential=1
BOARD_KERNEL_CMDLINE += exynos_drm.load_sequential=1
BOARD_KERNEL_CMDLINE += pcie-exynos-core.load_sequential=1
BOARD_KERNEL_CMDLINE += g2d.load_sequential=1

TARGET_BOARD_INFO_FILE := device/google/bluejay/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := bluejay
TARGET_SCREEN_DENSITY := 420

BOARD_KERNEL_CMDLINE += disable_dma32=on

include device/google/gs101/BoardConfig-common.mk
include device/google/gs101/wifi/BoardConfig-wifi.mk

DEVICE_PATH := device/google/bluejay
VENDOR_PATH := vendor/google/bluejay
include $(DEVICE_PATH)/$(TARGET_BOOTLOADER_BOARD_NAME)/BoardConfigLineage.mk
