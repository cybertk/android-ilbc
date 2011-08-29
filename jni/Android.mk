LOCAL_PATH := $(call my-dir)

# Build codec.
include $(CLEAR_VARS)

LOCAL_MODULE := libilbc

codec_dir := iLBC_RFC3951

LOCAL_SRC_FILES := \
    $(codec_dir)/anaFilter.c \
    $(codec_dir)/constants.c \
    $(codec_dir)/createCB.c \
    $(codec_dir)/doCPLC.c \
    $(codec_dir)/enhancer.c \
    $(codec_dir)/filter.c \
    $(codec_dir)/FrameClassify.c \
    $(codec_dir)/gainquant.c \
    $(codec_dir)/getCBvec.c \
    $(codec_dir)/helpfun.c \
    $(codec_dir)/hpInput.c \
    $(codec_dir)/hpOutput.c \
    $(codec_dir)/iCBConstruct.c \
    $(codec_dir)/iCBSearch.c \
    $(codec_dir)/iLBC_decode.c \
    $(codec_dir)/iLBC_encode.c \
    $(codec_dir)/LPCdecode.c \
    $(codec_dir)/LPCencode.c \
    $(codec_dir)/lsf.c \
    $(codec_dir)/packing.c \
    $(codec_dir)/StateConstructW.c \
    $(codec_dir)/StateSearchW.c \
    $(codec_dir)/syntFilter.c

LOCAL_C_INCLUDES += $(common_C_INCLUDES)

LOCAL_PRELINK_MODULE := false

include $(BUILD_STATIC_LIBRARY)

# Build JNI wrapper
include $(CLEAR_VARS)

LOCAL_MODULE := libilbc-codec

LOCAL_C_INCLUDES += $(JNI_H_INCLUDE)
LOCAL_SRC_FILES := ilbc-codec.c

LOCAL_STATIC_LIBRARIES := libilbc
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)
