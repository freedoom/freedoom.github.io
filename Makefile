# Requires AsciiDoc and dos2unix to be installed.

ASCIIDOC=asciidoc
ADOCOPTS=--backend=html5 --conf-file=freedoom-layout.conf --theme=mint
DOS2UNIX=dos2unix

PAGES=$(patsubst %.txt,%.html,$(wildcard *.txt))

.SUFFIXES: .txt .html

%.html: %.txt freedoom-layout.conf
	$(ASCIIDOC) $(ADOCOPTS) $<
	$(DOS2UNIX) $@

all: $(PAGES)
