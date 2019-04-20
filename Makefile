PREFIX?=/usr/local
BINARY_NAME = spawn

install: build install_bin

build:
	swift package update
	swift build -c release

install_bin:
	mkdir -p $(PREFIX)/bin
	mv .build/Release/$(BINARY_NAME) .build/Release/$(BINARY_NAME)
	install .build/Release/$(BINARY_NAME) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/$(BINARY_NAME)
