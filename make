#!/usr/bin/env bash

. "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/util"

ulimit -S -n 1024
unset GREP_OPTIONS

if [ "$(uname)" == "Darwin" ]; then
	export MAC_SDK_VERSION='10.11'
	export ANDROID_HOME=/usr/local/opt/android-sdk
fi

exists "${ANDROID_ROOT}" && cd "${ANDROID_ROOT}"
. "build/envsetup.sh"
brunch cm_gemini-userdebug
out "^^^ Build Complete ^^^^"

#
