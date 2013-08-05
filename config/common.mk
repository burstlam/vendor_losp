PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/losp/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/losp/prebuilt/common/bin/50-slim.sh:system/addon.d/50-slim.sh \
    vendor/losp/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/losp/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# SLIM-specific init file
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/etc/init.local.rc:root/init.losp.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Google Pinyin IME
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/app/GooglePinyin.apk:system/app/GooglePinyin.apk

# Copy phoneloc files
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/lib/libphoneloc-jni.so:system/lib/libphoneloc-jni.so \
    vendor/losp/prebuilt/common/usr/share/phoneloc.dat:system/usr/share/phoneloc.dat

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/losp/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

# Audio Config for DSPManager
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/vendor/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf
#LOCAL CHANGES  - END

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/losp/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/losp/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/losp/prebuilt/common/bin/sysinit:system/bin/sysinit

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/losp/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Required packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    SpareParts \
    Superuser \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    HoloSpiralWallpaper \
    NoiseField \
    Galaxy4 \
    LiveWallpapersPicker \
    PhaseBeam \
    LightLauncher \
    CMFileManager

# Extra Optional packages
PRODUCT_PACKAGES += \
    DashClock

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

PRODUCT_PACKAGE_OVERLAYS += vendor/losp/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/losp/overlay/common

# T-Mobile theme engine
include vendor/losp/config/themes_common.mk

# Versioning System
PRODUCT_VERSION_MAJOR = BETA
PRODUCT_VERSION_MINOR = build
PRODUCT_VERSION_MAINTENANCE = 0.1
ifdef LOSP_BUILD_EXTRA
    LOSP_POSTFIX := -$(LOSP_BUILD_EXTRA)
endif
ifndef LOSP_BUILD_TYPE
    LOSP_BUILD_TYPE := RELEASE
    PLATFORM_VERSION_CODENAME := RELEASE
    LOSP_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
endif

# Set all versions
LOSP_VERSION := LOSP-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(LOSP_BUILD)-$(LOSP_BUILD_TYPE)$(LOSP_POSTFIX)
LOSP_MOD_VERSION := $(LOSP_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.losp.version=$(LOSP_VERSION) \
    ro.modversion=$(LOSP_MOD_VERSION) \
    ro.product.locale.language=zh \
    ro.product.locale.region=CN
