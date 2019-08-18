COMMONMARK=node_modules/.bin/commonmark
GRAPHS=$(wildcard *.dot)

all: index.html $(GRAPHS:.dot=.svg)

index.html: index.md _before.html _after.html | $(COMMONMARK)
	cat _before.html > $@
	$(COMMONMARK) < index.md >> $@
	cat _after.html >> $@

%.svg: %.dot
	dot -Tsvg $< > $@

$(COMMONMARK):
	npm ci
