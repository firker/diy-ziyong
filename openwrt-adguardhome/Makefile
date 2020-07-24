
# Copyright (C) 2019 OpenWrt.org
#
# KFERMercer <KFER.Mercer@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=AdGuardHome
PROJECT_NAME:=AdGuardHome
PKG_VERSION:=v0.103.4
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Network-wide ads & trackers blocking DNS server
	URL:=https://www.adguard.com/
endef


define Package/$(PKG_NAME)/description
Network-wide ads & trackers blocking DNS server
endef




UNTAR_DIR:=$(PKG_NAME)-$(PKG_VERSION)




define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin/AdGuardHome
	$(INSTALL_DIR) $(1)/etc
	$(CP) -r ./files/etc $(1)/etc
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
