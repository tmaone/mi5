LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := NominatimGeocoderBackend
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := NominatimGeocoderBackend

geoco_root  := $(LOCAL_PATH)
geoco_out   := $(PWD)/$(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
geoco_build := $(geoco_root)/$(geoco_dir)/build
geoco_apk   := build/outputs/apk/$(geoco_dir)-release-unsigned.apk

$(geoco_root)/$(geoco_apk):
	rm -Rf $(geoco_build)
	mkdir -p $(geoco_out)
	ln -sf $(geoco_out) $(geoco_build)
	cd $(geoco_root) && gradle assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(geoco_dir)/$(geoco_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
