# Copyright (C) 2018 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

#COMMON_PATH := device/samsung/universal7570-common
COMMON_PATH := device/samsung/on5xelte

# Platform
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos5
TARGET_SOC := exynos7570
TARGET_BOARD_PLATFORM_GPU := mali-t720
TARGET_BOOTLOADER_BOARD_NAME := universal7570
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_DEVICE := SM-G570M

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_SUPPORTS_64_BIT_APPS := false

# Secondary Architecture
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/samsung/on5xelte
#TARGET_KERNEL_CONFIG := on5xelte_00_defconfig
TARGET_KERNEL_CONFIG := exynos7570-on5xelte_defconfig
KERNEL_TOOLCHAIN_PREFIX:= aarch64-linux-android-
TARGET_KERNEL_CLANG_COMPILE := false
TARGET_KERNEL_CUSTOM_TOOLCHAIN := prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := gcc/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/

# Image
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos
BOARD_KERNEL_SEPARATED_DT := True

#ВАРНИНХ!
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
#ВАРНИНХ!

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3145728000
#BOARD_VENDORIMAGE_PARTITION_SIZE   := 681574400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12066992128
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Extended Filesystem Support
TARGET_EXFAT_DRIVER := sdfat

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/recovery/etc/recovery.fstab

# Recovery (TWRP)
ifeq ($(RECOVERY_VARIANT),twrp)
RECOVERY_SDCARD_ON_DATA := true
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 25500
TW_DEFAULT_BRIGHTNESS := 12800
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_SUPERSU := true
TW_EXTRA_LANGUAGES := true
TW_USE_NEW_MINADBD := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
endif

# Android Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# VNDK
BOARD_VNDK_VERSION := current
#BOARD_VNDK_RUNTIME_DISABLE := false

# Vendor
TARGET_COPY_OUT_VENDOR := vendor

# Enable 64-bits binder
TARGET_USES_64_BIT_BINDER := true

# Graphics
TARGET_USES_HWC2 := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriverArm.so

# DEX Pre-optimization
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true
  endif
endif

# Shims
TARGET_LD_SHIM_LIBS := \
    /vendor/lib/hw/audio.primary.universal7570.so|libshim_audio.so

# Include
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop

# SELinux
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/public

# Lineage hardware
ifneq ($(findstring lineage, $(TARGET_PRODUCT)),)
BOARD_HARDWARE_CLASS := \
    hardware/samsung/lineagehw
endif

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# Inherit from the proprietary version
-include vendor/samsung/universal7570-commom/BoardConfigVendor.mk

