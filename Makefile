COMMONMARK=node_modules/.bin/commonmark

index.html: index.md _before.html _after.html | $(COMMONMARK)
	cat _before.html > $@
	$(COMMONMARK) < index.md >> $@
	cat _after.html >> $@

$(COMMONMARK):
	npm ci
