LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := OpenWeatherMapProvider
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := OpenWeatherMapProvider

open_root  := $(LOCAL_PATH)
open_dir   := app
open_out   := $(PWD)/$(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
open_build := $(open_root)/$(open_dir)/build
open_apk   := build/outputs/apk/$(open_dir)-release-unsigned.apk

$(open_root)/$(open_dir)/$(open_apk):
	rm -Rf $(open_build)
	mkdir -p $(open_out)
	ln -sf $(open_out) $(open_build)
	cd $(open_root)/$(open_dir) && gradle assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(open_dir)/$(open_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
