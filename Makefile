.PHONY: default
default:
	echo "USAGE: make build"

build:
	docker run -itd -v "/Users/smalls/code/project/OpenWrt-XiaomiR4A:/root" -v "/Users/smalls/code/project/res:/res" amd64/ubuntu:20.04