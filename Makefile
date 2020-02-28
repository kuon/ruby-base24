MDCAT:=$(firstword $(shell which mdcat cat 2>/dev/null))
VERSION:=$(shell cat lib/base24/version.rb |grep VERSION |awk '{gsub(/"/,"",$$3); print $$3}')

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

"base24-${VERSION}.gem":
	gem build base24.gemspec

.PHONY: publish
publish: "base24-${VERSION}.gem"
	gem push "base24-${VERSION}.gem"

