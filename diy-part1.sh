#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default

./scripts/feeds clean
./scripts/feeds update -a
./scripts/feeds install -a

rm -rf package/lean/luci-app-rclone
rm -rf package/lean/rclone-ng
rm -rf package/lean/rclone-webui-react
rm -rf package/lean/rclone

rm -rf package/lean/v2ray
rm -rf package/lean/v2ray-plugin
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/v2ray-plugin package/v2ray-plugin
svn co https://github.com/xiaorouji/openwrt-package/trunk/package/v2ray package/v2ray

rm -rf package/lean/luci-app-unblockmusic
rm -rf package/lean/UnblockNeteaseMusic
rm -rf package/lean/UnblockNeteaseMusicGo

svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusicGo package/luci-app-unblockmusic
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusic package/UnblockNeteaseMusic
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/UnblockNeteaseMusicGo package/UnblockNeteaseMusicGo

rm -rf feeds/packages/net/smartdns
svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns package/net/smartdns	

rm -rf feeds/packages/net/https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy

svn co https://github.com/Lienol/openwrt-packages/trunk/utils/syncthing package/utils/syncthing
