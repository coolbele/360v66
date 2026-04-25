#!/bin/bash

# 1. 修改插件源 (直接修改配置文件)
sed -i '/passwall/d' feeds.conf.default
sed -i '/kenzok8/d' feeds.conf.default
sed -i '/packages_news/d' feeds.conf.default

echo 'src-git packages_news https://github.com/coolbele/small2.git;master' >> feeds.conf.default
#echo 'src-git passwall https://github.com/coolbele/openwrt-passwall.git;main' >> feeds.conf.default
#echo 'src-git passwall_packages https://github.com/coolbele/openwrt-passwall-packages-2025-02-12.git;main' >> feeds.conf.default

