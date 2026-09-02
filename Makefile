PROJECT_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BUILD_DIR := $(PROJECT_DIR)/.makepkg
PKGDEST := $(PROJECT_DIR)/pkg
MAKEPKG ?= makepkg
PKGVER := $(shell sed -nE 's/^[[:space:]]*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/p' $(PROJECT_DIR)/cli/package.json | head -n 1)

.PHONY: build clean

build:
	cd "$(PROJECT_DIR)" && bun install
	cd "$(PROJECT_DIR)/cli" && bun install
	cd "$(PROJECT_DIR)/cli" && bun run build
	mkdir -p "$(BUILD_DIR)" "$(PKGDEST)"
	cd "$(PROJECT_DIR)" && PKGVER="$(PKGVER)" BUILDDIR="$(BUILD_DIR)" PKGDEST="$(PKGDEST)" $(MAKEPKG) --force --nodeps --noconfirm -p PKGBUILD

clean:
	rm -rf "$(BUILD_DIR)" "$(PKGDEST)"
