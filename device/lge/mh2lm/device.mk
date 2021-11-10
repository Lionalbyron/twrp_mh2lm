#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/lge/mh2lm

# A/B
AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL (add  android.hardware.boot@1.1-impl.recovery \    bootctrl.$(PRODUCT_PLATFORM) \    bootctrl.$(PRODUCT_PLATFORM).recovery \)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.1-impl.recovery \    
#    bootctrl.$(PRODUCT_PLATFORM) \
    bootctrl.$(PRODUCT_PLATFORM).recovery \
    android.hardware.boot@1.0-service
#PRODUCT_PACKAGES += \
#    bootctrl.msmnile

#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    bootctrl.msmnile \
#    libgptutils \
#    libz \
#    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload
    
# Fastbootd (add)
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock
#    fastbootd \
#    resetprop    

# qcom decryption (add)
PRODUCT_PACKAGES += \
    bootctrl.msmnile
#    qcom_decrypt \
    qcom_decrypt_fbe
    
# Soong namespaces (add)
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
#    hardware/qcom/bootctrl    //会不会重复？
# Dynamic partitions (add)
PRODUCT_USE_DYNAMIC_PARTITIONS := true
