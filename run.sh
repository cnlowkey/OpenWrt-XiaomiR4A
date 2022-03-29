#!/bin/sh

# 环境准备
sudo apt-get update
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
sudo apt-get -y autoremove --purge
sudo apt-get clean

# 下载源码与插件
export CLONE_SH="clone.sh"
chmod +x $CLONE_SH
sh $CLONE_SH

chmod 777 "staging_dir/host/bin/"

# 生成.config文件
export CONFIG_PA="modify.sh"
mv -f $CONFIG_PA ./.config
sed -i 's/^[ \t]*//g' ./.config
make defconfig

# Make download
make download -j8 || make download -j1 V=s
# shellcheck disable=SC2046
rm -rf $(find ./dl/ -size -1024c)
df -h