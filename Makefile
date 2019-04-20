prefix ?= /usr/local
bindir = $(prefix)/bin
bin_name = spawn

build:
	swift build -c release --disable-sandbox

install: build
	install ".build/release/$(spawn)" "$(bindir)"

uninstall:
	rm -rf "$(bindir)/swift-syntax-highlight"

clean:
	rm -rf .build

.PHONY: build install uninstall clean