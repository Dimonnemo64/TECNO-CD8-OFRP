#

#	This file is part of the OrangeFox Recovery Project4
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

FDEVICE="CD8"

#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TW_DEFAULT_LANGUAGE="en"
	export TARGET_DEVICE_ALT="CD8"
	#export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true
	export OF_USE_MAGISKBOOT=1
	export TARGET_ARCH=arm64
	export OF_HIDE_NOTCH=1
	export OF_MAINTAINER_AVATAR="$PWD/device/TECNO/CD8/maintainer.png"
	export OF_USE_CUSTOM_MAINTAINER_PIC=1
	#export OF_CUSTOM_MAINTAINER_PIC_PATH="./magisk/maintainer.png"
	export OF_CLOCK_POS=0
	export OF_FLASHLIGHT_ENABLE=0
	export FOX_ADVANCED_SECURITY=1
	export OF_DISABLE_EXTRA_ABOUT_PAGE=1
	export OF_USE_LOCKSCREEN_BUTTON=1
	export FOX_RESET_SETTINGS=disabled
	export OF_RUN_POST_FORMAT_PROCESS=1
	export OF_MAINTAINER=Dimonnemo64
	export OF_FL_PATH1="/sys/devices/virtual/torch/torch"
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export FOX_USE_BASH_SHELL=1
	export FOX_USE_SPECIFIC_MAGISK_ZIP="./magisk/magisk.apk"
	export FOX_ASH_IS_BASH=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	#export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	#export OF_USE_GREEN_LED=0
	#export OF_SCREEN_H=2340
	#export OF_STATUS_H=80
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export FOX_R11=1
	export FOX_VERSION=R11.0_3-1
	export OF_PATCH_AVB20=1
	export FOX_ADVANCED_SECURITY=1	
	export OF_USE_TWRP_SAR_DETECT=1
	export OF_FL_PATH2=""
	export OF_FLASHLIGHT_ENABLE=1
	export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/bootdevice/by-name/recovery"
	
# let's see what are our build VARs
		if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then		  
		  export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		  export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		  export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		  export | grep "TW_" >> $FOX_BUILD_LOG_FILE
		fi

fi
#
