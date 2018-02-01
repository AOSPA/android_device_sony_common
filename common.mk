# Copyright (C) 2014 The Android Open Source Project
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

# Vendor version
TARGET_VENDOR_VERSION := 10

# Common path
COMMON_PATH := device/sony/common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Codecs Configuration
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Common etc
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml

# GPS Configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(COMMON_PATH)/rootdir/system/etc/gps_debug.conf:system/etc/gps_debug.conf

# Sensors common
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/sensors/sensors_settings:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensors_settings

# QMI
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/data/dsi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/dsi_config.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/data/netmgr_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/netmgr_config.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/data/qmi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/qmi_config.xml

# Sec Configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# librqbalance
PRODUCT_PACKAGES += \
    librqbalance

# PRODUCT_PLATFORM isn't set yet, thus we check the available path
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
# ramdump cleaner
PRODUCT_PACKAGES += \
    rdclean.sh
endif

# APN list
#PRODUCT_COPY_FILES += \
#    device/sample/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml \
#    device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# TEMP FIX
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service

# Biometric
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# BroadcastRadio
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Hidl
PRODUCT_PACKAGES += \
    android.hidl.manager@1.0

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# USB
PRODUCT_PACKAGES += \
android.hardware.usb@1.0-service

# WIFI
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

PRODUCT_CUSTOM_IMAGE_MAKEFILES := $(COMMON_PATH)/odm.mk

$(call inherit-product, device/sony/common/common-init.mk)
$(call inherit-product, device/sony/common/common-packages.mk)
$(call inherit-product, device/sony/common/common-perm.mk)
$(call inherit-product, device/sony/common/common-prop.mk)
$(call inherit-product, device/sony/common/common-treble.mk)
