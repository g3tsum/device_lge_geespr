#
# Copyright 2013 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our omni product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/lge/geespr/device.mk)

# Specify phone tech before including full_phone
$(call inherit-product-if-exists, vendor/omni/config/cdma.mk)

PRODUCT_NAME := omni_geespr
PRODUCT_DEVICE := geespr
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG Optimus G
PRODUCT_MANUFACTURER := LGE

# Kernel inline build
TARGET_KERNEL_CONFIG := geespr_defconfig
TARGET_VARIANT_CONFIG := geespr_defconfig
TARGET_SELINUX_CONFIG := geespr_defconfig

$(call inherit-product-if-exists, vendor/lge/gee/gee-vendor.mk)
