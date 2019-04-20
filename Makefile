prefix?=/usr/local
binary_dir = $(prefix)/bin
binary_name = spawn

install: build install_bin

build:
	swift package update
	swift build -c release

install_bin:
	mkdir -p $(binary_dir)
	install .build/Release/$(binary_name) $(binary_dir)

uninstall:
	rm -f $(binary_dir)/$(binary_name)