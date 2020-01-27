# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Specify phone tech before including full_phone
# $(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Define version
TW_DEVICE_VERSION := 1

# Boot animation
TARGET_SCREEN_HEIGHT    := 1920
TARGET_SCREEN_WIDTH     := 1080

# sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE          := e
PRODUCT_NAME            := omni_e
PRODUCT_MODEL           := E
PRODUCT_BRAND           := 10or
PRODUCT_MANUFACTURER    := 10or
# BOARD_VENDOR            := 10or