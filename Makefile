# Requires AsciiDoc to be installed.

ASCIIDOC=asciidoc --conf-file=freedoom-layout.conf --theme=mint

PAGES=$(patsubst %.txt,%.html,$(wildcard *.txt))

.SUFFIXES: .txt .html

.txt.html:
	$(ASCIIDOC) $*.txt

all: $(PAGES)
