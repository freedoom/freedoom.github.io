# Requires AsciiDoc to be installed.

ASCIIDOC=asciidoc

PAGES=$(patsubst %.txt,%.html,$(wildcard *.txt))

.SUFFIXES: .txt .html

.txt.html:
	$(ASCIIDOC) $*.txt

all: $(PAGES)
