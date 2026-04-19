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
#git clone https://github.com/wukibaka/openwrt-packages wukibaka/openwrt-packages



echo 'src-git passwall_packages https://github.com/yuyu913gzs/openwrt-passwall-packages.git;main' >>feeds.conf.default
echo 'src-git passwall https://github.com/jenna-aspecta/openwrt-passwall-main;main' >>feeds.conf.default

#echo 'src-git OpenWrt_Build_x64_Packages https://github.com/coolbele/OpenWrt_Build_x64_Packages.git;master' >>feeds.conf.default
#git clone ttps://github.com/coolbele/OpenWrt_Build_x64_Packages coolbele/OpenWrt_Build_x64_Packages
#echo 'src-git openwrt-packages https://github.com/coolbele/OpenWrt_Build_x64_Packages.git;main' >>feeds.conf.default
#echo 'src-git kenzo https://github.com/wukibaka/openwrt-packages.git;master' >>feeds.conf.default


#echo 'src-git passwall_packages https://github.com/coolbele/openwrt-123-packages.git;main' >>feeds.conf.default
#echo 'src-git passwall_luci https://github.com/coolbele/luci-app-123.git;main' >>feeds.conf.default
#echo 'src-git helloworld https://github.com/fw876/helloworld.git' >> feeds.conf.default
git clone https://github.com/laipeng668/luci-app-gecoosac.git package/luci-app-gecoosac
# 如果之前没加过，执行这一行
#git clone https://github.com/gdy666/luci-app-lucky.git package/luci-app-lucky




#echo 'src-git MyPackages https://github.com/wwz09/MyPackages.git;main' >>feeds.conf.default
#echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' >>feeds.conf.default
#echo 'src-git mosdns https://github.com/sbwml/luci-app-mosdns;v5' >>feeds.conf.default
#echo 'src-git adguardhome https://github.com/xiaoxiao29/luci-app-adguardhome;master' >>feeds.conf.default
#echo 'src-git 360v6 https://github.com/wwz09/360v6-packages' >>feeds.conf.default
