
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/lib/libaudio.so:obj/lib/libaudio.so \
    vendor/motorola/olympus/proprietary/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
    vendor/motorola/olympus/proprietary/lib/libaudio.so:system/lib/libaudio.so \
    vendor/motorola/olympus/proprietary/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so

# FINGERPRINT
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/lib/libAuthUDMDrv_1750A100.so:system/lib/libAuthUDMDrv_1750A100.so \
    vendor/motorola/olympus/proprietary/lib/libam2app.so:system/lib/libam2app.so \
    vendor/motorola/olympus/proprietary/lib/libam2server.so:system/lib/libam2server.so \
    vendor/motorola/olympus/proprietary/bin/am2server:system/bin/am2server \
    vendor/motorola/olympus/proprietary/app/GfxEngine.apk:system/app/GfxEngine.apk \
    vendor/motorola/olympus/proprietary/etc/am2server.pubkey:system/etc/am2server.pubkey \

# HAL
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/lib/hw/gralloc.tegra.so:system/lib/hw/gralloc.tegra.so \
    vendor/motorola/olympus/proprietary/lib/hw/overlay.tegra.so:system/lib/hw/overlay.tegra.so \
    vendor/motorola/olympus/proprietary/lib/hw/sensors.olympus.so:system/lib/hw/sensors.olympus.so \
    vendor/motorola/olympus/proprietary/lib/hw/gps.olympus.so:system/lib/hw/gps.olympus.so \
    vendor/motorola/olympus/proprietary/lib/hw/lights.tegra.so:system/lib/hw/lights.tegra.so

# EGL
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/lib/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
    vendor/motorola/olympus/proprietary/lib/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
    vendor/motorola/olympus/proprietary/lib/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so

# OMX
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/lib/libhwmediaplugin.so:system/lib/libhwmediaplugin.so \
    vendor/motorola/olympus/proprietary/lib/libhwmediaplugin.so:obj/lib/libhwmediaplugin.so \
    vendor/motorola/olympus/proprietary/lib/libhwmediarecorder.so:system/lib/libhwmediarecorder.so \
    vendor/motorola/olympus/proprietary/lib/libhwmediarecorder.so:obj/lib/libhwmediarecorder.so \
    vendor/motorola/olympus/proprietary/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so

# Bin
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/bin/mot_boot_mode:system/bin/mot_boot_mode \
    vendor/motorola/olympus/proprietary/bin/ap_gain.bin:system/bin/ap_gain.bin \
    vendor/motorola/olympus/proprietary/bin/nvrm_daemon:system/bin/nvrm_daemon \
    vendor/motorola/olympus/proprietary/bin/nvrm_avp.axf:system/bin/nvrm_avp.axf \
    vendor/motorola/olympus/proprietary/bin/nvddk_audiofx_core.axf:system/bin/nvddk_audiofx_core.axf \
    vendor/motorola/olympus/proprietary/bin/nvrm_avp.axf:system/bin/nvrm_avp.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_wmadec.axf:system/bin/nvmm_wmadec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_wavdec.axf:system/bin/nvmm_wavdec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_vc1dec.axf:system/bin/nvmm_vc1dec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_sw_mp3dec.axf:system/bin/nvmm_sw_mp3dec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_sorensondec.axf:system/bin/nvmm_sorensondec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_service.axf:system/bin/nvmm_service.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_reference.axf:system/bin/nvmm_reference.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_mpeg4dec.axf:system/bin/nvmm_mpeg4dec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_mp3dec.axf:system/bin/nvmm_mp3dec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_mp2dec.axf:system/bin/nvmm_mp2dec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_manager.axf:system/bin/nvmm_manager.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_jpegenc.axf:system/bin/nvmm_jpegenc.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_jpegdec.axf:system/bin/nvmm_jpegdec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_h264dec.axf:system/bin/nvmm_h264dec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_audiomixer.axf:system/bin/nvmm_audiomixer.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_adtsdec.axf:system/bin/nvmm_adtsdec.axf \
    vendor/motorola/olympus/proprietary/bin/nvmm_aacdec.axf:system/bin/nvmm_aacdec.axf \
    vendor/motorola/olympus/proprietary/bin/nvddk_audiofx_transport.axf:system/bin/nvddk_audiofx_transport.axf \
    vendor/motorola/olympus/proprietary/bin/nvddk_audiofx_core.axf:system/bin/nvddk_audiofx_core.axf \
    vendor/motorola/olympus/proprietary/bin/tund:system/bin/tund \
    vendor/motorola/olympus/proprietary/bin/bluetoothd:system/bin/bluetoothd \
    vendor/motorola/olympus/proprietary/bin/sdptool:system/bin/sdptool \
    vendor/motorola/olympus/proprietary/bin/Hostapd:system/bin/Hostapd \
    vendor/motorola/olympus/proprietary/bin/remountpds:system/bin/remountpds \
    vendor/motorola/olympus/proprietary/bin/battd:system/bin/battd \
    vendor/motorola/olympus/proprietary/bin/touchpad:system/bin/touchpad

# Wifi firmware
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    vendor/motorola/olympus/proprietary/etc/wl/sdio-ag-cdc-11n-mfgtest-roml-seqcmds.bin:system/etc/wl/sdio-ag-cdc-11n-mfgtest-roml-seqcmds.bin \
    vendor/motorola/olympus/proprietary/etc/wl/sdio-ag-cdc-full11n-minioctl-roml-pno-wme-aoe-pktfilter-keepalive.bin:system/etc/wl/sdio-ag-cdc-full11n-minioctl-roml-pno-wme-aoe-pktfilter-keepalive.bin \
    vendor/motorola/olympus/proprietary/etc/wl/sdio-g-cdc-roml-reclaim-wme-apsta-idauth-minioctl.bin:system/etc/wl/sdio-g-cdc-roml-reclaim-wme-apsta-idauth-minioctl.bin \
    vendor/motorola/olympus/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf


# subsystem configurations
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/etc/touchpad/20/touchpad.cfg:system/etc/touchpad/20/touchpad.cfg \
    vendor/motorola/olympus/proprietary/etc/touchpad/21/touchpad.cfg:system/etc/touchpad/21/touchpad.cfg \
    vendor/motorola/olympus/proprietary/etc/touchpad/22/touchpad.cfg:system/etc/touchpad/22/touchpad.cfg

# system libs
PRODUCT_COPY_FILES += \
    vendor/motorola/olympus/proprietary/lib/libmirror.so:system/lib/libmirror.so \
    vendor/motorola/olympus/proprietary/lib/libnvwsi.so:system/lib/libnvwsi.so \
    vendor/motorola/olympus/proprietary/lib/libnvddk_2d_v2.so:system/lib/libnvddk_2d_v2.so \
    vendor/motorola/olympus/proprietary/lib/libnvrm.so:system/lib/libnvrm.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_camera.so:system/lib/libnvmm_camera.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_manager.so:system/lib/libnvmm_manager.so \
    vendor/motorola/olympus/proprietary/lib/libcamera.so:obj/lib/libcamera.so \
    vendor/motorola/olympus/proprietary/lib/libcamera.so:system/lib/libcamera.so \
    vendor/motorola/olympus/proprietary/lib/libcamera_client.so:system/lib/libcamera_client.so \
    vendor/motorola/olympus/proprietary/lib/libnvodm_imager.so:system/lib/libnvodm_imager.so \
    vendor/motorola/olympus/proprietary/lib/libnvddk_2d.so:system/lib/libnvddk_2d.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_utils.so:system/lib/libnvmm_utils.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm.so:system/lib/libnvmm.so \
    vendor/motorola/olympus/proprietary/lib/libnvdispmgr_d.so:system/lib/libnvdispmgr_d.so \
    vendor/motorola/olympus/proprietary/lib/libnvdispmgr_d.so:obj/lib/libnvdispmgr_d.so \
    vendor/motorola/olympus/proprietary/lib/libnvddk_audiofx.so:system/lib/libnvddk_audiofx.so \
    vendor/motorola/olympus/proprietary/lib/libnvodm_dtvtuner.so:system/lib/libnvodm_dtvtuner.so \
    vendor/motorola/olympus/proprietary/lib/libnvdispatch_helper.so:system/lib/libnvdispatch_helper.so \
    vendor/motorola/olympus/proprietary/lib/libnvomxilclient.so:system/lib/libnvomxilclient.so \
    vendor/motorola/olympus/proprietary/lib/libcgdrv.so:system/lib/libcgdrv.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_audio.so:system/lib/libnvmm_audio.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_contentpipe.so:system/lib/libnvmm_contentpipe.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_image.so:system/lib/libnvmm_image.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_misc.so:system/lib/libnvmm_misc.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_parser.so:system/lib/libnvmm_parser.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_tracklist.so:system/lib/libnvmm_tracklist.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_video.so:system/lib/libnvmm_video.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_videorenderer.so:system/lib/libnvmm_videorenderer.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_vp6_video.so:system/lib/libnvmm_vp6_video.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_writer.so:system/lib/libnvmm_writer.so \
    vendor/motorola/olympus/proprietary/lib/libnvmm_service.so:system/lib/libnvmm_service.so \
    vendor/motorola/olympus/proprietary/lib/libnvomx.so:system/lib/libnvomx.so \
    vendor/motorola/olympus/proprietary/lib/libnvos.so:system/lib/libnvos.so \
    vendor/motorola/olympus/proprietary/lib/libnvodm_query.so:system/lib/libnvodm_query.so \
    vendor/motorola/olympus/proprietary/lib/libnvodm_misc.so:system/lib/libnvodm_misc.so \
    vendor/motorola/olympus/proprietary/lib/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
    vendor/motorola/olympus/proprietary/lib/libril_rds.so:system/lib/libril_rds.so \
    vendor/motorola/olympus/proprietary/lib/libmoto_ril.so:system/lib/libmoto_ril.so \
    vendor/motorola/olympus/proprietary/lib/librds_util.so:system/lib/librds_util.so \
    vendor/motorola/olympus/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/motorola/olympus/proprietary/lib/libbluetoothd.so:system/lib/libbluetoothd.so \
    vendor/motorola/olympus/proprietary/lib/libnmea.so:system/lib/libnmea.so \
    vendor/motorola/olympus/proprietary/lib/libbattd.so:system/lib/libbattd.so \
    vendor/motorola/olympus/proprietary/lib/libnvrm_channel.so:system/lib/libnvrm_channel.so

