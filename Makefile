prefix ?= /usr/local
bindir = $(prefix)/bin
bin_name = spawn

install: build
	install ".build/release/$(bin_name)" "$(bindir)"

build:
	swift package --disable-sandbox update
	swift build -c release --disable-sandbox

uninstall:
	rm -f $(prefix)/bin/$(bin_name)

clean:
	rm -rf .build

.PHONY: build install uninstall clean