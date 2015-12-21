
GEM_NAME = id3dit

include Makefile.common

.PHONY: test
test:
	$(BUNDLER) exec ./bin/id3dit; [ $$? -eq 3 ]
