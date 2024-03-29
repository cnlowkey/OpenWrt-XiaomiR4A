#!/bin/sh
#
# Copyright (c) 2021-2022 smalls0098 <https://smalls0098.com>
#
# This is free software, licensed under the BSD 3-Clause License.
# See /LICENSE for more information.
#
# https://github.com/cnlowkey/OpenWrt-XiaomiR4Aßå
# Description: Build OpenWrt using GitHub Actions
#
# 下载源码
git clone https://github.com/coolsnowwolf/lede.git
#mv ./lede/* ./

# 修复bug
#https://github.com/coolsnowwolf/lede/issues/9154
#sed -i 's/of_get_mac_address(dp->dn)/of_get_mac_address(dp->dn, dp->mac)/g' lede/target/linux/generic/hack-5.10/781-dsa-register-every-port-with-of_platform.patch
#cat lede/target/linux/generic/hack-5.10/781-dsa-register-every-port-with-of_platform.patch

# 下载自定义插件
rm -rf lede/package/lean/luci-theme-argon
#sed -i '$a src-git openwrt_packages https://github.com/openwrt/packages' feeds.conf.default
#sed -i '$a src-git luci_openwrt https://github.com/openwrt/luci.git' feeds.conf.default
#sed -i '$a src-git kiddin9_packages https://github.com/kiddin9/openwrt-packages' feeds.conf.default
#sed -i '$a src-git liuran001_packages https://github.com/liuran001/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small_packages https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git kenzok8_small_package https://github.com/kenzok8/small-package' feeds.conf.default
#sed -i '$a src-git kenzok8_packages https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

cd lede/package
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
#git clone -b master --single-branch https://github.com/jerrykuku/luci-theme-argon.git
git clone -b master --single-branch https://github.com/jerrykuku/luci-app-argon-config.git
git clone -b master --single-branch https://github.com/kenzok8/openwrt-packages.git
git clone -b main --single-branch https://github.com/Ausaci/luci-app-nat6-helper.git
git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall.git
ls -l
