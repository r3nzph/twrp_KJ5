# Device Path
DEVICE_PATH := device/tecno/KJ5

TARGET_RECOVERY_DEVICE_DIRS := \
    $(COMMON_PATH) \
    $(DEVICE_PATH)

# Architecture Settings
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

#64bit
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true
TARGET_USES_64_BIT_BINDER := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_TECNO-KJ5
TARGET_RECOVERY_DEVICE_MODULES := libinit_TECNO-KJ5

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader Settings
TARGET_BOOTLOADER_BOARD_NAME := KJ5
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Build Hacks
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Display Settings
TARGET_SCREEN_DENSITY := 320
TW_THEME := portrait_hdpi
DEVICE_RESOLUTION := 1612x720
DEVICE_SCREEN_WIDTH := 1612
DEVICE_SCREEN_HEIGHT := 720

# DTBO
ifndef BOARD_PREBUILT_DTBOIMAGE
BOARD_KERNEL_SEPARATED_DTBO := true
endif
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
ifndef TARGET_PREBUILT_DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
else
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
endif

# Kernel
TARGET_NO_KERNEL := false
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
TARGET_FORCE_PREBUILT_KERNEL := true
BOARD_RAMDISK_USE_LZ4 := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
TARGET_KERNEL_CONFIG := FULL-64_defconfig
TARGET_KERNEL_SOURCE := kernel/tecno/FULL-64

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_PAGE_SIZE := 4096
BOARD_TAGS_OFFSET := 0x0bc08000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_DTB_SIZE := 182209
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_HEADER_SIZE = 2128
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_VENDOR_BASE := 0x40078000

BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partition Sizes
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9122611200 # (BOARD_SUPER_PARTITION_SIZE - 4194304) 4MiB
BOARD_SUPER_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value
BOARD_MAIN_PARTITION_LIST += \
    odm_dlkm \
    product \
    system \
    system_ext \
    vendor \
    vendor_dlkm

BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_STSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_ODM_DLKM := odm_dlkm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Platform Settings
TARGET_BOARD_PLATFORM := mt6768

# VNDK
BOARD_VNDK_VERSION := current

# Recovery Settings
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_GENERIC_KERNEL_IMAGE := false
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.mt6768.rc
BOARD_USES_RECOVERY_AS_BOOT :=
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Security Patches
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Crypto
# TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_CRYPTO_FBE := true
# TW_USE_FSCRYPT_POLICY := 2
# TW_INCLUDE_FBE_METADATA_DECRYPT := true

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Modules
TW_LOAD_VENDOR_BOOT_MODULES := 8250_mtk.ko Upower.ko adapter_class.ko adaptive-ts.ko aee_aed.ko aee_hangdet.ko aee_rs.ko arm_dsu_pmu.ko blocktag.ko bootprof.ko cfg80211.ko charger_class.ko chipone_icnl99xx.ko clk-common.ko clk-disable-unused.ko clk-fmeter-mt6768.ko clk-mt6768-pg.ko clk-mt6768.ko clkbuf.ko clkchk-mt6768.ko clkdbg-mt6768.ko cmdq-platform-mt6768.ko cmdq_helper_inf.ko cpufreq_sugov_ext.ko cqhci.ko device-apc-common-legacy.ko device-apc-mt6768.ko dvfsrc-opp-mt6768.ko emicen.ko emiisu.ko emimpu.ko extcon-mtk-usb.ko extdev_io_class.ko fair.ko ged.ko gpapi.ko i2c-mt65xx.ko icnl9916c_hdp_dsi_vdo_boe_boe_kj5.ko icnl9916c_hdp_dsi_vdo_tm_tm_kj5.ko iommu_debug.ko iommu_secure.ko irq-dbg.ko isee.ko leds-mtk-disp.ko leds-mtk-pwm.ko leds-mtk.ko load_track.ko log_store.ko lzo-rle.ko lzo.ko mac80211.ko mcDrvModule.ko mediatek-drm.ko mediatek_static_power.ko memory-amms.ko meta.ko mmprofile.ko mmqos-common.ko mmqos-mt6768.ko modules.alias modules.dep modules.load modules.load.recovery modules.softdep monitor_hang.ko mrdump.ko mt6358-accdet.ko mt6358-regulator.ko mt6358_battery.ko mt635x-auxadc.ko mt6397.ko mt6577_auxadc.ko mt6768_clkmgr.ko mtk-cmdq-drv-ext.ko mtk-cqdma.ko mtk-dvfsrc-helper.ko mtk-dvfsrc-regulator.ko mtk-dvfsrc.ko mtk-emi.ko mtk-icc-core.ko mtk-kpd.ko mtk-mbox.ko mtk-mmc-autok.ko mtk-mmc-dbg.ko mtk-mmc-mod.ko mtk-mmdvfs-debug.ko mtk-mmdvfs.ko mtk-mml-legacy.ko mtk-pm-domain-disable-unused.ko mtk-pmic-keys.ko mtk-pmic-wrap.ko mtk-scpsys-bringup.ko mtk-scpsys-mt6768.ko mtk-scpsys.ko mtk-smi-bwc.ko mtk-smi-dbg.ko mtk-smi.ko mtk-socinfo.ko mtk-uart-apdma.ko mtk_battery_oc_throttling.ko mtk_bp_thl.ko mtk_charger_algorithm_class.ko mtk_charger_framework.ko mtk_chg_type_det.ko mtk_cm_mgr.ko mtk_cm_mgr_mt6768.ko mtk_core_ctl.ko mtk_cpuhp.ko mtk_cpuidle.ko mtk_disp_notify.ko mtk_dramc.ko mtk_dynamic_loading_throttling.ko mtk_gpu_hal.ko mtk_gpufreq_mt6768.ko mtk_gpufreq_wrapper.ko mtk_iommu.ko mtk_low_battery_throttling.ko mtk_mdpm_v1.ko mtk_mm_heap.ko mtk_panel_ext.ko mtk_pbm.ko mtk_pd_adapter.ko mtk_pd_charging.ko mtk_pep.ko mtk_pep20.ko mtk_perf_ioctl.ko mtk_printk_ctrl.ko mtk_rpmsg_mbox.ko mtk_sync.ko mtk_tinysys_ipi.ko mtk_tran_hvdcp20.ko mtk_tran_tc30.ko mtk_wdt.ko musb_hdrc.ko musb_main.ko nfc_i2c_tms.ko nvmem_mtk-devinfo.ko omnivision_td4160.ko opsMediator.ko pd-chk-mt6768.ko pd_dbg_info.ko phy-generic.ko phy-mtk-tphy.ko pinctrl-mt6768.ko pinctrl-mtk-common-v2_debug.ko pinctrl-mtk-v2.ko pmic_lbat_service.ko pmic_lvsys_notify.ko pwm-mtk-disp.ko reboot-mode.ko regulator-vibrator.ko reset-ti-syscon.ko rpmb-mtk.ko rpmb.ko rt_pd_manager.ko rtc-mt6397.ko scheduler.ko sd_tray.ko sec-rng.ko sec.ko sgm41516d.ko spi-mt65xx.ko spi_slave.ko sspm_v1.ko syscon-reboot-mode.ko system_heap.ko tcpc_class.ko tcpc_rt1711h.ko tcpci_late_sync.ko td4160_hdp_dsi_vdo_hx_hx_kj5.ko td4160_hdp_dsi_vdo_lce_hkc_kj5.ko teeperf.ko thermal_interface.ko tkv.ko tkv_recovery.ko tms_device_modules.ko tnek.ko tran-proc-bootdevice-mod.ko tran_auto_test.ko tran_battery_aging.ko tran_chg.ko tran_common_class.ko tran_drm_panel_i2c.ko tran_fp.ko tran_otg.ko tran_rhi.ko transsion_tranlog.ko uload_ind.ko zram.ko zsmalloc.ko

# Tools
TW_NO_LEGACY_PROPS := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
TWRP_EVENT_LOGGING := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_USE_TOOLBOX := true

# TWRP Configuration
TW_BACKUP_EXCLUSIONS := /Files/fonts
TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_APEX := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "roboto_15x24.h"
TW_EXCLUDE_LPDUMP := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_BASH := true
TW_EXCLUDE_TZDATA := true
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_NANO := true
TW_EXCLUDE_TWRPAPP := true

# Brightness Screen
TW_NO_SCREEN_BLANK := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 150

# USB Configuration
TW_EXCLUDE_DEFAULT_USB_INIT := true

# MTP
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb

# Storage
RECOVERY_SDCARD_ON_DATA := true
TW_USE_EXTERNAL_STORAGE := true
BOARD_ROOT_EXTRA_FOLDERS += usb-otg
BOARD_ROOT_EXTRA_FOLDERS += external_sd

# Props
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# StatusBar
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "70"
TW_CUSTOM_BATTERY_POS := "790"

# Hack depends
ALLOW_MISSING_DEPENDENCIES := true

# Device 
TW_DEVICE_VERSION := SPARK 20 by r3nzph
