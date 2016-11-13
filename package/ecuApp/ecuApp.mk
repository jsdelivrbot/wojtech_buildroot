ECUAPP_SITE = https://github.com/pawelwojtowicz/ecuApp.git
ECUAPP_SITE_METHOD = git
ECUAPP_VERSION = v1.16.01
ECUAPP_SOURCE = ecuApp-$(ECUAPP_VERSION).tar.gz
ECUAPP_INSTALL_STAGING = YES
ECUAPP_INSTALL_TARGET = YES
ECUAPP_DEPENDENCIES = flite

define ECUAPP_POST_INSTALL_TARGET_HOOKS
	mkdir -p $(TARGET_DIR)/etc/opt
	mkdir -p $(TARGET_DIR)/srv/www/cgi-bin
	$(INSTALL) -D -m 0755 $(@D)/Configuration/* $(TARGET_DIR)/etc/opt
	cp -r $(@D)/HTMLSource/* $(TARGET_DIR)/srv/www
	rm -rf $(TARGET_DIR)/srv/www/cgi-bin/controller
	ln -s '/usr/bin/cgiprocessor' $(TARGET_DIR)/srv/www/cgi-bin/controller
endef

$(eval $(cmake-package))
