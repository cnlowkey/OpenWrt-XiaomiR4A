#!/bin/sh
#
# Copyright (c) 2021-2022 smalls0098 <https://smalls0098.com>
#
# This is free software, licensed under the BSD 3-Clause License.
# See /LICENSE for more information.
#
# https://github.com/cnlowkey/OpenWrt-XiaomiR4A
# Description: Build OpenWrt using GitHub Actions
#

# 修改登录IP
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate
# 修改主机名
sed -i 's/OpenWrt/SmallsRouter/g' package/base-files/files/bin/config_generate
# 修改型号显示
sed -i 's/Xiaomi Mi Router 4A Gigabit Edition/Xiaomi 4A Gigabit/g' target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-gigabit.dts
# 修改固件大小、复制闪存布局文件
sed -i '/Device\/xiaomi_mi-router-4a-gigabit/,/Mi Router 4A/ s/14848k/16064k/' target/linux/ramips/image/mt7621.mk
cp -rf mt7621_xiaomi_mi-router-4a-3g-v2.dtsi target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-3g-v2.dtsi
# 配置smartdns、ipv6、主题、vssr
sed -i '/exit 0/d' package/lean/default-settings/files/zzz-default-settings
# shellcheck disable=SC2129
cat settings/smartdns >> package/lean/default-settings/files/zzz-default-settings
cat settings/ipv6 >> package/lean/default-settings/files/zzz-default-settings
cat settings/theme >> package/lean/default-settings/files/zzz-default-settings
cat settings/vssr >> package/lean/default-settings/files/zzz-default-settings
# 切换ramips内核到5.10
sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.10' target/linux/ramips/Makefile
cat target/linux/ramips/Makefile
# 设置WIFI
sed -i 's/OpenWrt/smalls-plus/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/wireless.default_radio${devidx}.encryption=none/wireless.default_radio${devidx}.encryption=psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/encryption/a\set wireless.default_radio${devidx}.key=smalls0098' package/kernel/mac80211/files/lib/wifi/mac80211.sh
