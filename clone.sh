#!/bin/sh
# 下载源码
git clone https://github.com/coolsnowwolf/lede.git
mv ./lede/* ./

# 下载自定义插件
rm -rf package/lean/luci-theme-argon

sed -i '$a src-git openwrt_packages https://github.com/openwrt/packages' feeds.conf.default
sed -i '$a src-git luci https://github.com/openwrt/luci.git' feeds.conf.default
sed -i '$a src-git coolsnowwolf_packages https://github.com/coolsnowwolf/packages' feeds.conf.default
sed -i '$a src-git kiddin9_packages https://github.com/kiddin9/openwrt-packages' feeds.conf.default
sed -i '$a src-git liuran001_packages https://github.com/liuran001/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '$a src-git smallpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '$a src-git openwrtpackages https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git openwrtpasswall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git openclash https://github.com/vernesong/OpenClash' feeds.conf.default
sed -i '$a src-git clashpackages https://github.com/vernesong/packages' feeds.conf.default

cat feeds.conf.default

cd package
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone https://github.com/kenzok8/openwrt-packages.git
git clone https://github.com/Ausaci/luci-app-nat6-helper.git
git clone https://github.com/vernesong/OpenClash.git
 git clone -b packages --single-branch https://github.com/xiaorouji/openwrt-passwall.git