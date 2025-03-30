#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from TECNO-KJ5 device
$(call inherit-product, device/tecno/TECNO-KJ5/device.mk)

PRODUCT_DEVICE := TECNO-KJ5
PRODUCT_NAME := omni_TECNO-KJ5
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO KJ5
PRODUCT_MANUFACTURER := tecno

PRODUCT_GMS_CLIENTID_BASE := android-tecno

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_kj5_h6931-user 12 SP1A.210812.016 798204 release-keys"

BUILD_FINGERPRINT := TECNO/KJ5-OP/TECNO-KJ5:12/SP1A.210812.016/250115V1871:user/release-keys
