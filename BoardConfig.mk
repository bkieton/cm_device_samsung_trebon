# Copyright (C) 2012 The CyanogenMod Project
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

# BoardConfig.mk
#
# Product compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

## Kernel, bootloader etc.
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_SOURCE := kernel/samsung/msm7x27a
TARGET_KERNEL_CONFIG := cyanogenmod_trebon_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3

## Platform
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_SPARROW_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_SPECIFIC_HEADER_PATH := device/samsung/trebon/include

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

## Assert
TARGET_OTA_ASSERT_DEVICE := trebon,GT-S7500,GT-S7500L

## Webkit
#DYNAMIC_SHARED_LIBV8SO := true
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

## V8
JS_ENGINE := v8
HTTP := chrome

## JIT
WITH_JIT := true
ENABLE_JSC_JIT := true

## Camera
USE_CAMERA_STUB := false
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USES_LEGACY_OVERLAY := true

## Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_OVERLAY := false
TARGET_HAVE_BYPASS  := false
TARGET_USES_GENLOCK := true
TARGET_QCOM_HDMI_OUT := false
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_NO_HW_VSYNC := true
BOARD_EGL_CFG := device/samsung/trebon/prebuilt/lib/egl/egl.cfg

COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DFORCE_CPU_UPLOAD -DSAMSUNG_CAMERA_QCOM
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ICS_DECODERS

## QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_USES_QCOM_PMEM := true
BOARD_USES_QCOM_LIBS := true
#COMMON_GLOBAL_CFLAGS += -DANCIENT_GL

## Other QCOM
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true

## GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

## Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

## Wi-Fi
BOARD_HOSTAPD_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := ath6kl
WIFI_DRIVER_MODULE_PATH := "/system/wifi/ar6000.ko"
WIFI_DRIVER_MODULE_NAME := "ar6000"
BOARD_HAVE_SAMSUNG_WIFI := true
WIFI_AP_DRIVER_MODULE_ARG := "ifname=wlan0 fwmode=2"
WIFI_AP_DRIVER_MODULE_PATH := "/system/wifi/ar6000.ko"
WIFI_AP_DRIVER_MODULE_NAME := "ar6000"
WIFI_AP_FIRMWARE_LOADER := ""

## RIL
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
BOARD_USES_LEGACY_RIL := true

## UMS
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun%d/file"
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun%d/file"

## Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 24

## Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

## Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

## Bootanimation
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

## Use device specific lights module
TARGET_PROVIDES_LIBLIGHT := true

## Recovery, storage
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 979369984
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_SDCARD_INTERNAL := true

## Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/trebon/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/samsung/trebon/recovery/recovery.rc
TARGET_RECOVERY_FSTAB := device/samsung/trebon/recovery/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true

## Partitions
BOARD_DATA_DEVICE := /dev/block/mmcblk0p18
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p16
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p17
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
