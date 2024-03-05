#
# Copyright (C) 2017 The LineageOS Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

PLATFORM_PATH := device/motorola/sdm660-common

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Architeture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := SDM660

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Disable sparse on all filesystem images
TARGET_USERIMAGES_SPARSE_EROFS_DISABLED := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_SPARSE_F2FS_DISABLED := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
LOC_HIDL_VERSION := 3.0

# HIDL
DEVICE_MANIFEST_FILE := $(PLATFORM_PATH)/configs/vintf/manifest.xml
ifdef BOARD_USES_KEYMASTER_4
    DEVICE_MANIFEST_FILE += $(PLATFORM_PATH)/configs/vintf/keymaster_4.xml
else
    DEVICE_MANIFEST_FILE += $(PLATFORM_PATH)/configs/vintf/keymaster_3.xml
endif
TARGET_FS_CONFIG_GEN += \
    $(PLATFORM_PATH)/configs/mot_aids.fs

# Init
TARGET_INIT_VENDOR_LIB := //$(PLATFORM_PATH):libinit_sdm660
TARGET_RECOVERY_DEVICE_MODULES := libinit_sdm660

# Jemalloc
MALLOC_SVELTE := true
MALLOC_SVELTE_FOR_LIBC32 := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=2048 androidboot.configfs=true
BOARD_KERNEL_CMDLINE += sched_enable_hmp=1 sched_enable_power_aware=1
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a800000.dwc3
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.veritymode=eio
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/msm-4.4

# LLVM
KERNEL_CUSTOM_LLVM := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 0x40000
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_NO_RECOVERY := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/fsg:/fsg

BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 83886080 # 80 MB

# Properties
TARGET_PRODUCT_PROP += $(PLATFORM_PATH)/properties/product.prop
TARGET_SYSTEM_EXT_PROP += $(PLATFORM_PATH)/properties/system_ext.prop
TARGET_SYSTEM_PROP += $(PLATFORM_PATH)/properties/system.prop
TARGET_VENDOR_PROP += $(PLATFORM_PATH)/properties/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom

# RIL
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true
CUSTOM_APNS_FILE := $(PLATFORM_PATH)/configs/sprint_apns.xml
ODM_MANIFEST_SKUS += qcril
ODM_MANIFEST_QCRIL_FILES := $(PLATFORM_PATH)/configs/vintf/odm_manifest_qcril.xml

# Root
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/private
PRODUCT_PUBLIC_SEPOLICY_DIRS += $(PLATFORM_PATH)/sepolicy/public

# Treble
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Vendor Security Patch Level
VENDOR_SECURITY_PATCH := 2021-02-01

# Verified Boot
BOARD_AVB_ENABLE := false
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Wifi
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
TARGET_HAS_BROKEN_WLAN_SET_INTERFACE := true
