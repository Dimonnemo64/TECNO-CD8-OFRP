#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/omni_CD8.mk

add_lunch_combo omni_CD8-eng
add_lunch_combo omni_CD8-user
add_lunch_combo omni_CD8-userdebug
