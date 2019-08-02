index.html: index.md _before.html _after.html
	cat _before.html > $@
	npx commonmark < index.md >> $@
	cat _after.html >> $@
