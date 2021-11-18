include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-eqos
PKG_VERSION:=1
PKG_RELEASE:=3-20211118

PKG_MAINTAINER:=Jianhui Zhao <jianhuizhao329@gmail.com>

LUCI_TITLE:=LuCI support for EQOS
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+luci-base +tc +kmod-sched-core +kmod-ifb

define Package/$(PKG_NAME)/conffiles
/etc/config/eqos
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
