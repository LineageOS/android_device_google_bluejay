#!/usr/bin/env -S PYTHONPATH=../../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.extract import extract_fns_user_type
from extract_utils.extract_pixel import (
    extract_pixel_factory_image,
    extract_pixel_firmware,
    pixel_factory_image_regex,
    pixel_firmware_regex,
)
from extract_utils.file import FileArgs, FileList
from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/google/bluejay',
    'hardware/google/av',
    'hardware/google/interfaces',
    'hardware/google/pixel',
]


def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None


lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'com.google.edgetpu_app_service-V3-ndk',
        'com.google.edgetpu_vendor_service-V2-ndk',
    ): lib_fixup_vendor_suffix,
    'android.hardware.sensors-V2-ndk': lib_fixup_remove,
}

blob_fixups: blob_fixups_user_type = {
    'product/etc/felica/common.cfg': blob_fixup()
        .patch_file('osaifu-keitai.patch'),
    'vendor/etc/init/init.modem_logging_control.rc': blob_fixup()
        .regex_replace(' && property:ro.debuggable=0', ''),
    (
        'vendor/etc/init/fingerprint-goodix.rc',
        'vendor/etc/init/init.storage.rc',
    ) : blob_fixup()
        .regex_replace('ro.build.type=userdebug', 'ro.debuggable=1'),
}  # fmt: skip

extract_fns: extract_fns_user_type = {
    pixel_factory_image_regex: extract_pixel_factory_image,
    pixel_firmware_regex: extract_pixel_firmware,
}

module = ExtractUtilsModule(
    'bluejay',
    'google',
    device_rel_path='device/google/bluejay/bluejay',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_generated_carriersettings_file=True,
    add_firmware_proprietary_file=True,
    extract_fns=extract_fns,
)


def fix_vendor_file_list(file_list: FileList):
    # flp.default & gps.default have incorrect SONAME
    # gpsd depends on android.hardware.sensors-V2-ndk & android.hardware.sensors-V3-ndk
    disable_checkelf_file_paths = [
        'vendor/bin/hw/gpsd',
        'vendor/lib64/hw/flp.default.so',
        'vendor/lib64/hw/gps.default.so',
    ]
    for file_path in disable_checkelf_file_paths:
        file_list.get_file(file_path).set_arg(FileArgs.DISABLE_CHECKELF, True)

    module_suffix_file_paths = [
        'vendor/lib/com.google.edgetpu_app_service-V3-ndk.so',
        'vendor/lib64/com.google.edgetpu_app_service-V3-ndk.so',
        'vendor/lib64/com.google.edgetpu_vendor_service-V2-ndk.so',
    ]

    for file_path in module_suffix_file_paths:
        file_list.get_file(file_path).set_arg(FileArgs.MODULE_SUFFIX, '_vendor')

    powerstats_service_file_path = (
        'vendor/bin/hw/android.hardware.power.stats-service.pixel'
    )
    file_list.get_file(powerstats_service_file_path).set_arg(
        FileArgs.REQUIRED, 'pixel_powerstats_xml'
    )


module.add_generated_proprietary_file(
    'proprietary-files-vendor.txt',
    partition='vendor',
    skip_file_list_name='skip-files-vendor.txt',
    fix_file_list=fix_vendor_file_list,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
