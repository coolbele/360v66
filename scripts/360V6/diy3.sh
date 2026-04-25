#!/bin/bash

# 1. 修改插件源 (直接修改配置文件)
sed -i '/passwall/d' feeds.conf.default
sed -i '/kenzok8/d' feeds.conf.default
sed -i '/packages_news/d' feeds.conf.default

echo 'src-git packages_news https://github.com/kenzok8/small.git;master' >> feeds.conf.default
#echo 'src-git passwall https://github.com/coolbele/openwrt-passwall.git;main' >> feeds.conf.default
#echo 'src-git passwall_packages https://github.com/coolbele/openwrt-passwall-packages-2025-02-12.git;main' >> feeds.conf.default

# 2. 更新 Feeds (同步刚才修改的源)
./scripts/feeds update -a

# 3. 【核心操作】强制回滚 packages_news 到特定 Commit
if [ -d "feeds/packages_news" ]; then
    echo "Force rolling back packages_news to cdc9feb..."
    pushd feeds/packages_news
    git reset --hard cdc9feb265640dd6bc5dc6141b347c7516a3b940
    popd
fi

# 4. 安装 Feeds
./scripts/feeds install -a

# 5. 克隆独立插件 (lucky, gecoosac 等)
[ -d "package/luci-app-gecoosac" ] || git clone https://github.com/laipeng668/luci-app-gecoosac.git package/luci-app-gecoosac
[ -d "package/luci-app-lucky" ] || git clone https://github.com/gdy666/luci-app-lucky.git package/luci-app-lucky

# 6. 统一 Go 环境 (回滚/升级 Go 版本)
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang



# 8. 自动化配置修正 (预防 Error 255)
if [ -f .config ]; then
    # 强制剔除基础版 dnsmasq，确保 dnsmasq-full 顺利安装
    sed -i 's/CONFIG_PACKAGE_dnsmasq=y/# CONFIG_PACKAGE_dnsmasq is not set/g' .config
    # 启用你要的插件
    echo "CONFIG_PACKAGE_luci-app-lucky=y" >> .config
fi
