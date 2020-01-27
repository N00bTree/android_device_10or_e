LOCAL_PATH := device/10or/e

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)

# Platform
TARGET_BOARD_PLATFORM       := msm8937
TARGET_BOARD_PLATFORM_GPU   := qcom-adreno505
TARGET_BOARD_SUFFIX         := _64

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME    := MSM8937
TARGET_NO_BOOTLOADER            := true

# Kernel
TARGET_KERNEL_ARCH          := arm64
TARGET_KERNEL_HEADER_ARCH   := arm64

BOARD_KERNEL_CMDLINE := \
	console=ttyHSL0,115200,n8 \
	androidboot.console=ttyHSL0 \
	androidboot.hardware=qcom \
	msm_rtb.filter=0x237 \
	ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    androidboot.bootdevice=7824900.sdhci \
    earlycon=msm_hsl_uart,0x78B0000 \
    androidboot.selinux=permissive

BOARD_KERNEL_BASE           	:= 0x80000000
BOARD_RAMDISK_OFFSET        	:= 0x01000000
#BOARD_KERNEL_OFFSET				:= 0x00008000
#BOARD_SECOND_OFFSET				:= 0x00f00000
BOARD_TAGS_OFFSET				:= 0x00000100
BOARD_KERNEL_PAGESIZE       	:= 2048
BOARD_BOOTIMG_HEADER_VERSION	:= 0

#KERNEL_TOOLCHAIN            := $(PWD)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
#KERNEL_TOOLCHAIN_PREFIX     := aarch64-linux-android-
#TARGET_KERNEL_SOURCE        := kernel/10or/msm8937
#TARGET_KERNEL_CONFIG		 := 10or_e_defconfig
#BOARD_KERNEL_SEPARATED_DT   := true
#TARGET_CUSTOM_DTBTOOL       := dtbTool_custom
#BOARD_DTBTOOL_ARGS          :=
#BOARD_KERNEL_LZ4C_DT        := true

BOARD_MKBOOTIMG_ARGS        := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS		+= --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME     := Image.gz
TARGET_PREBUILT_KERNEL		:= $(LOCAL_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

# Android Verified Boot
PLATFORM_SECURITY_PATCH := 2099-12-31
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# system.prop
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Partitions & FS
BOARD_FLASH_BLOCK_SIZE					:= 131072
BOARD_BOOTIMAGE_PARTITION_SIZE			:= 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE		:= 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE			:= 268435456
BOARD_SYSTEMIMAGE_PARTITION_SIZE		:= ‭4508876800
BOARD_SYSTEMIMAGE_PARTITION_TYPE		:= ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE		:= 25295298048
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE	:= ext4
TARGET_USERIMAGES_USE_EXT4				:= true
TARGET_USERIMAGES_USE_F2FS				:= true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/twrp.fstab
#TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Root filesystem
LZMA_RAMDISK_TARGETS := recovery

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Recovery device modules
# TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0

########
# TWRP #
########
# Fs
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true

TW_USE_TOOLBOX := true
TW_NO_BATT_PERCENT := false
# Display
TW_THEME := portrait_hdpi
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_DEFAULT_BRIGHTNESS := 188
TW_MAX_BRIGHTNESS := 1023
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_NO_SCREEN_BLANK := true
TW_NO_SCREEN_TIMEOUT := true
TW_SCREEN_BLANK_ON_BOOT := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NEW_ION_HEAP := true

# Includes
TW_INCLUDE_NTFS_3G := true

# Excludes
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_TWRPAPP := true

# Lun
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

# Locale
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en

TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_SCREEN_TIMEOUT := true

# Encryption support
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_INCLUDE_CRYPTO_FBE := true

# Debug
TWRP_INCLUDE_LOGCAT	:= true
TARGET_USES_LOGD := true
TWRP_EVENT_LOGGING := true
TW_CRYPTO_SYSTEM_VOLD_DEBUG	:= true

# Misc
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_SELECT_BUTTON := true
#TW_INCLUDE_FB2PNG := true
