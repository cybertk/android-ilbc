#
# Copyright (C) 2011 Kyan He <kyan.ql.he@gmail.com>
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

LOCAL_C_INCLUDES += \
    $(JNI_H_INCLUDE) \
    $(codec_dir)

LOCAL_SRC_FILES := ilbc-codec.c
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog

LOCAL_STATIC_LIBRARIES := libilbc
LOCAL_PRELINK_MODULE := false

include $(BUILD_SHARED_LIBRARY)
