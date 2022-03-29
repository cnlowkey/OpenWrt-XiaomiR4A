#!/bin/sh
# 下载源码
git clone https://github.com/coolsnowwolf/lede.git
mv ./lede/* ./

# 下载自定义插件
rm -rf package/lean/luci-theme-argon

sed -i '$a src-git openwrt-packages https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git openwrt-passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git OpenClash https://github.com/vernesong/OpenClash' feeds.conf.default

cat feeds.conf.default

cd package
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone https://github.com/kenzok8/openwrt-packages.git
git clone https://github.com/Ausaci/luci-app-nat6-helper.git
git clone https://github.com/vernesong/OpenClash.git
# git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall.git