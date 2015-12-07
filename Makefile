
MV = mv -nv
RM = rm -rf
MKDIR = mkdir -p
BUNDLER = bundle
GEM_NAME = id3dit
GEMSPEC_FILE = $(GEM_NAME).gemspec


.PHONY: all
all: setup

.PHONY: setup
setup: .setup

.setup:
	$(BUNDLER) install
	touch $@

.PHONY: install
install:
	gem_file=$$(gem build $(GEMSPEC_FILE) | grep 'File:' | tail -1 | awk '{ print $$2 }'); \
	sudo gem install $$gem_file; \
	$(RM) $$gem_file

.PHONY: uninstall
uninstall:
	sudo gem uninstall $(GEM_NAME)

.PHONY: update
update:
	$(BUNDLER) update

.PHONY: clean
clean:
	$(RM) .setup
	$(RM) Gemfile.lock

.PHONY: release
release: | releases
	set -e; \
	gem_file=$$(gem build $(GEMSPEC_FILE) | grep 'File:' | tail -1 | awk '{ print $$2 }'); \
	dst="releases/$$gem_file"; \
	[ ! -f $$dst ]; \
	$(MV) $$gem_file releases; \
	gem push $$dst; \
	echo 'done'

releases:
	$(MKDIR) $@
