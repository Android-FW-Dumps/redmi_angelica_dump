#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:71ac7e7e31d8ef849724af2aadbdab1e900d55e6; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:67108864:820f529bf0ad930f3c6af678c6ea6f60558eb5ea \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:71ac7e7e31d8ef849724af2aadbdab1e900d55e6 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
