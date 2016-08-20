LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := LocalGSMLocation
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := LocalGSMLocation

lgsm_root  := $(LOCAL_PATH)
lgsm_dir   := app
lgsm_out   := $(PWD)/$(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
lgsm_build := $(lgsm_root)/$(lgsm_dir)/build
lgsm_apk   := build/outputs/apk/$(lgsm_dir)-release-unsigned.apk

$(lgsm_root)/$(lgsm_dir)/$(lgsm_apk):
	rm -Rf $(lgsm_build)
	mkdir -p $(lgsm_out)
	ln -sf $(lgsm_out) $(lgsm_build)
	cd $(lgsm_root)/$(lgsm_dir) && gradle assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(lgsm_dir)/$(lgsm_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
