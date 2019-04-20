PREFIX?=/usr/local
BINARY_DIRECTORY = $(PREFIX)/bin
BINARY_NAME = spawn

install: build install_bin

build:
	swift package update
	swift build -c release --disable-sandbox

install_bin:
	install ".build/release/$(BINARY_NAME)" "$(BINARY_DIRECTORY)"

uninstall:
	rm -f $(PREFIX)/bin/$(BINARY_NAME)

clean:
	rm -rf .build

.PHONY: build install uninstall clean
