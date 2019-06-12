LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_ARM_MODE := thumb
# used for testing
# LOCAL_CFLAGS += -g -O0

LOCAL_CFLAGS += \
	-fPIC \
	-Wno-unused-parameter \
	-U_FORTIFY_SOURCE \
	-D_FORTIFY_SOURCE=1 \
	-DSKIA_IMPLEMENTATION=1 \
	-Wno-clobbered -Wno-error \
	-fexceptions \

LOCAL_CPPFLAGS := \
	-std=c++11 \
	-fno-threadsafe-statics \

LOCAL_SRC_FILES := \
	Utils.cpp \
	MpiJpegEncoder.cpp \
	MpiJpegDecoder.cpp \

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libmpp \

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../inc/mpp_inc/ \
	$(LOCAL_PATH)/../inc \

LOCAL_MODULE := libhwjpeg

include $(BUILD_SHARED_LIBRARY)
