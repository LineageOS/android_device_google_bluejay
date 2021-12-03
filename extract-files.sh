#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

MY_DIR="$(cd "$(dirname "${0}")"; pwd -P)"

"${MY_DIR}/bluejay/extract-files.sh" "$@"
