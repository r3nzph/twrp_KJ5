#!/bin/bash

        export OF_DISABLE_TWRP_COMPATIBILITY_MODE := true
        export FOX_ENABLE_APP_MANAGER=1
        export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
   	export TW_DEFAULT_LANGUAGE="en"
        export OF_MAINTAINER="r3nzph"
	export LC_ALL="C"
 	export ALLOW_MISSING_DEPENDENCIES=true
	export TARGET_DEVICE_ALT="KJ5"
	export FOX_TARGET_DEVICES="KJ5"
	export FOX_VIRTUAL_AB_DEVICE=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export OF_ENABLE_LPTOOLS=1
	export FOX_USE_NANO_EDITOR=1
        #export OF_QUICK_BACKUP_LIST="/boot;/data;"
        export OF_QUICK_BACKUP_LIST="/boot;/super;"
        export FOX_DELETE_AROMAFM=1
        export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"; # Sun 21 Mar 04:26:40 GMT 2021

	# use magisk 25.1 for the magisk addon
	export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v28.1.zip

        export OF_KEEP_DM_VERITY=1
        export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0
        export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
        export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
	# screen settings
        export OF_SCREEN_H=2400
        export OF_STATUS_H=95
        export OF_STATUS_INDENT_LEFT=48
        export OF_STATUS_INDENT_RIGHT=48
        export OF_ALLOW_DISABLE_NAVBAR=0
        export OF_CLOCK_POS=1

	# maximum permissible splash image size (in kilobytes)
	#export OF_SPLASH_MAX_SIZE=2048

	# ensure that /sdcard is bind-unmounted before f2fs data repair or format
	export OF_UNBIND_SDCARD_F2FS=1

	# instruct magiskboot v24+ to always patch the vbmeta header when patching the recovery/boot image; do *not* remove!
        export FOX_PATCH_VBMETA_FLAG=1

	# no special MIUI stuff
        export FOX_VANILLA_BUILD=1


	# full size
	export OF_DYNAMIC_FULL_SIZE=9126805504

# instruct magiskboot v24+ to always patch the vbmeta header when patching the recovery/boot image; do *not* remove!
        export FOX_PATCH_VBMETA_FLAG="1"

	# vendor_boot-as-recovery
	if [ "$FOX_VENDOR_BOOT_RECOVERY" = "1" ]; then
	   export FOX_VARIANT="vBaR"
	fi

	#lz4; this can cause a bootloop in some ROMs, so don't use it except for lz4 ROMs
	if [ "$OF_USE_LZ4_COMPRESSION" = "1" ]; then
	   export FOX_VARIANT="lz4"
	fi
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
