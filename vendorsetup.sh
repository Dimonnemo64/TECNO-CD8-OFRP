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
    export FOX_REPLACE_BUSYBOX_PS=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_GREP_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_USE_NANO_EDITOR=1
    export OF_ENABLE_LPTOOLS=1
    export OF_FBE_METADATA_MOUNT_IGNORE=1
    export OF_PATCH_VBMETA_FLAG=1
    export OF_USE_GREEN_LED=0
    export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/bootdevice/by-name/recovery"
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
    export FOX_RECOVERY_BOOT_PARTITION="/dev/block/platform/bootdevice/by-name/boot"
    export FOX_VERSION=R11.0_3-1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export OF_SKIP_FBE_DECRYPTION=1
    export OF_SKIP_FBE_DECRYPTION_SDKVERSION=31
    export OF_OTA_RES_DECRYPT=1
    export OF_NO_RELOAD_AFTER_DECRYPTION=1
    export FOX_USE_SPECIFIC_MAGISK_ZIP="$HOME/Magisk.zip"
    export MAGISK_VER=24.3
# let's see what are our build VARs
		if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then		  
          export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		  export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		  export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		  export | grep "TW_" >> $FOX_BUILD_LOG_FILE
		fi

fi