#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE

# EUICC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# HBM
PRODUCT_PACKAGES := \
    HbmSVManagerOverlay

# Kernel
TARGET_PREBUILT_KERNEL := device/google/bluejay-kernel/Image.lz4

# Build necessary packages for vendor

# Audio
PRODUCT_PACKAGES += \
    libaudioroutev2.vendor \
    libtinycompress

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth-V1-ndk.vendor:64 \
    hardware.google.bluetooth.bt_channel_avoidance@1.0.vendor:64

# Camera
PRODUCT_PACKAGES += \
    libGralloc4Wrapper

# Codec2
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.0.vendor \
    libavservices_minijail.vendor \
    libcodec2_hidl@1.0.vendor \
    libcodec2_vndk.vendor \
    libexynosutils \
    libexynosv4l2 \
    libmedia_ecoservice.vendor \
    libsfplugin_ccodec_utils.vendor \
    libstagefright_bufferpool@2.0.1.vendor

# Confirmation UI
PRODUCT_PACKAGES += \
    android.hardware.confirmationui-V1-ndk.vendor:64 \
    android.hardware.confirmationui-lib.trusty:64 \
    android.hardware.confirmationui@1.0.vendor:64 \
    libteeui_hal_support.vendor:64

# Graphics
PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport.vendor \
    libhwbinder.vendor

# Identity credential
PRODUCT_PACKAGES += \
    android.hardware.identity-V5-ndk.vendor:64 \
    android.hardware.identity-support-lib.vendor:64 \
    android.hardware.identity_credential.xml

# Json
PRODUCT_PACKAGES += \
    libjson:64

# Nos
PRODUCT_PACKAGES += \
    libkeymaster4support.vendor:64 \
    libkeymint_support.vendor:64 \
    libnos:64 \
    libnosprotos:64 \
    libnos_client_citadel:64 \
    libnos_datagram:64 \
    libnos_datagram_citadel:64 \
    libnos_feature:64 \
    libnos_transport:64 \
    nos_app_avb:64 \
    nos_app_identity:64 \
    nos_app_keymaster:64 \
    nos_app_weaver:64 \
    pixelpowerstats_provider_aidl_interface-cpp.vendor:64

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0.vendor \
    android.hardware.sensors@2.0-ScopedWakelock.vendor \
    android.hardware.sensors@2.0.vendor \
    android.hardware.sensors@2.1.vendor \
    libsensorndkbridge \
    sensors.dynamic_sensor_hal

# Trusty
PRODUCT_PACKAGES += \
    android.trusty.stats.nw.setter-cpp.vendor:64 \
    libbinder_trusty:64 \
    libtrusty_metrics:64

# Misc interfaces
PRODUCT_PACKAGES += \
    android.frameworks.stats-V1-cpp.vendor:64 \
    android.frameworks.stats-V1-ndk.vendor:32 \
    android.hardware.authsecret-V1-ndk.vendor:64 \
    android.hardware.biometrics.common-V3-ndk.vendor:64 \
    android.hardware.biometrics.fingerprint-V3-ndk.vendor:64 \
    android.hardware.gnss-V3-ndk.vendor:64 \
    android.hardware.health-V1-ndk.vendor \
    android.hardware.input.common-V1-ndk.vendor:64 \
    android.hardware.input.processor-V1-ndk.vendor:64 \
    android.hardware.keymaster@3.0.vendor:64 \
    android.hardware.keymaster@4.0.vendor:64 \
    android.hardware.keymaster@4.1.vendor:64 \
    android.hardware.neuralnetworks-V4-ndk.vendor:64 \
    android.hardware.neuralnetworks@1.0.vendor:64 \
    android.hardware.neuralnetworks@1.1.vendor:64 \
    android.hardware.neuralnetworks@1.2.vendor:64 \
    android.hardware.neuralnetworks@1.3.vendor:64 \
    android.hardware.oemlock-V1-ndk.vendor:64 \
    android.hardware.power@1.0.vendor:64 \
    android.hardware.power@1.1.vendor:64 \
    android.hardware.power@1.2.vendor:64 \
    android.hardware.radio.config@1.0.vendor \
    android.hardware.radio.config@1.1.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio@1.2.vendor \
    android.hardware.radio@1.3.vendor \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio@1.6.vendor \
    android.hardware.thermal-V1-ndk.vendor:32 \
    android.hardware.thermal@1.0.vendor:32 \
    android.hardware.thermal@2.0.vendor:32 \
    android.hardware.weaver-V2-ndk.vendor:64 \
    android.hardware.wifi-V1-ndk.vendor:64 \
    com.google.hardware.pixel.display-V4-ndk.vendor:64

# Properties
TARGET_VENDOR_PROP := $(LOCAL_PATH)/vendor.prop
