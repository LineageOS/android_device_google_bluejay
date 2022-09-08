#
# Copyright (C) 2020 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
TARGET_BOARD_INFO_FILE := device/google/bluejay/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := bluejay
TARGET_SCREEN_DENSITY := 420
USES_DEVICE_GOOGLE_BLUEJAY := true

include device/google/gs101/BoardConfig-common.mk
include device/google/gs101/wifi/BoardConfig-wifi.mk
-include vendor/google_devices/gs101/prebuilts/BoardConfigVendor.mk
-include vendor/google_devices/bluejay/proprietary/BoardConfigVendor.mk

$(call soong_config_set,google3a_config,target_device,bluejay)

include device/google/bluejay/bluejay/BoardConfigLineage.mk
