#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/google/gs101/aosp_common.mk)
$(call inherit-product, device/google/bluejay/device-bluejay.mk)

PRODUCT_NAME := aosp_bluejay
PRODUCT_DEVICE := bluejay
PRODUCT_MODEL := Pixel 6a
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google
