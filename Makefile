MDCAT:=$(firstword $(shell which mdcat cat 2>/dev/null))

.PHONY: help
help:
	$(MDCAT) MAKE.md

.PHONY: readme
readme:
	$(MDCAT) README.md

.PHONY: test
test:
	rake test

.PHONY: clean
clean:
	rm -fr build


.PHONY: publish
publish:
	gradle bintrayUpload

