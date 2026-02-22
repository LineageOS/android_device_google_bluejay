#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := bluejay
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

# Inherit from gs101
include device/google/gs101/common.mk

# Overlays
PRODUCT_PACKAGES += \
    DMServiceOverlayVendorBluejay \
    FrameworkResOverlayProductBluejay \
    FrameworkResOverlayVendorBluejay \
    HbmSVManagerOverlayProductBluejay \
    PixelNfcOverlayBluejay \
    SafetyRegulatoryInfoOverlayProductBluejay \
    SettingsGoogleBluejayOverlay \
    SettingsGoogleOverlayProductBluejay \
    SettingsOverlayG1AZG \
    SettingsOverlayGB17L \
    SettingsOverlayGB62Z \
    SettingsOverlayGX7AS \
    SystemUIGoogleOverlayVendorBluejay

PRODUCT_PACKAGES += \
    ApertureOverlayBluejay

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.bluejay.rc

PRODUCT_PACKAGES += \
    init.recovery.bluejay.touch.rc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 32

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
