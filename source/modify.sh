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
sed -i 's/192.168.1.1/192.168.31.1/g' lede/package/base-files/files/bin/config_generate
# 修改主机名
sed -i 's/OpenWrt/SmallsRouter/g' lede/package/base-files/files/bin/config_generate
# 修改型号显示
sed -i 's/Xiaomi Mi Router 4A Gigabit Edition/Xiaomi 4A Gigabit/g' lede/target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-gigabit.dts
# 修改固件大小、复制闪存布局文件
sed -i '/Device\/xiaomi_mi-router-4a-gigabit/,/Mi Router 4A/ s/14848k/16064k/' lede/target/linux/ramips/image/mt7621.mk
\cp -rf source/mt7621.dtsi lede/target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-3g-v2.dtsi
# 配置smartdns、ipv6、主题、vssr
sed -i '/exit 0/d' lede/package/lean/default-settings/files/zzz-default-settings
cat source/settings/smartdns >> lede/package/lean/default-settings/files/zzz-default-settings
cat source/settings/ipv6 >> lede/package/lean/default-settings/files/zzz-default-settings
cat source/settings/theme >> lede/package/lean/default-settings/files/zzz-default-settings
cat source/settings/vssr >> lede/package/lean/default-settings/files/zzz-default-settings
echo "exit 0" >> lede/package/lean/default-settings/files/zzz-default-settings
# 切换ramips内核到5.10
sed -i '/KERNEL_PATCHVER/cKERNEL_PATCHVER:=5.10' lede/target/linux/ramips/Makefile
# 复制内核5.10版本CPU超频补丁
#\cp -rf preset-models/322-mt7621-fix-cpu-clk-add-clkdev.patch target/linux/ramips/patches-5.10/322-mt7621-fix-cpu-clk-add-clkdev.patch
# 设置WIFI
sed -i 's/OpenWrt/smalls-plus/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i 's/wireless.default_radio${devidx}.encryption=none/wireless.default_radio${devidx}.encryption=psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#sed -i '/encryption/a\set wireless.default_radio${devidx}.key=coolxiaomi' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# 修改登录密码为coolxiaomi
#sed -i '/root/croot:$1$CBd7u73H$LvSDVXLBrzpk4JfuuN.Lv1:18676:0:99999:7:::' package/base-files/files/etc/shadow
