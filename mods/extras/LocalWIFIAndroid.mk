LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := LocalWifiLocation
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := LocalWifiLocation

lwifi_root  := $(LOCAL_PATH)
lwifi_dir   := app
lwifi_out   := $(PWD)/$(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
lwifi_build := $(lwifi_root)/$(lwifi_dir)/build
lwifi_apk   := build/outputs/apk/$(lwifi_dir)-release-unsigned.apk

$(lwifi_root)/$(lwifi_dir)/$(lwifi_apk):
	rm -Rf $(lwifi_build)
	mkdir -p $(lwifi_out)
	ln -sf $(lwifi_out) $(lwifi_build)
	cd $(lwifi_root)/$(lwifi_dir) && gradle assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(lwifi_dir)/$(lwifi_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
