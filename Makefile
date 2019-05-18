PREFIX?=/usr/local
INSTALL_NAME = spawn

.PHONY: install
install: build install_bin

.PHONY: build
build:
	swift package update
	swift build -c release

.PHONY: install_bin
install_bin:
	mkdir -p $(PREFIX)/bin
	install .build/Release/$(INSTALL_NAME) $(PREFIX)/bin

.PHONY: uninstall
uninstall:
	rm -f $(PREFIX)/bin/$(INSTALL_NAME)
