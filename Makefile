# Requires AsciiDoc and dos2unix to be installed.

ASCIIDOC=asciidoc

# In order to make sure that web pages are well formed it's possible to replace
# the "html5" backend with "xhtml11" in order to generate XHTML 1.1 and then
# verify that the output produced is valid XML:
#   for h in *.html; do xmllint -noout $h; done
#
# The "mint" theme is not a true AsciiDoc theme in the sense that it's not
# found in /etc/asciidoc/themes. Instead, it's file "mint.css" in this
# directory that is referenced. Consequently the following warning can be
# safely ignored:
#   asciidoc: WARNING: missing theme: mint
ADOCOPTS=--backend=html5 --conf-file=freedoom-layout.conf --theme=mint

# A marker that indicates that this build was attempted at least once.
BUILT=.built

DOS2UNIX=dos2unix

# This builds a list of HTML files based on the text files. For each text file
# there will be a HTML file with the same basename.
PAGES=$(patsubst %.txt,%.html,$(wildcard *.txt))

.SUFFIXES: .txt .html

# This is assure that everything is built when freshly checked out since the
# HTML files may be newer than the text files. When that happens the HTML files
# are not updated.
$(BUILT):
	@echo "Creating $(BUILT) for a new build."
	@touch $(BUILT)

# Build the HTML files from the text and configuration files.
%.html: %.txt freedoom-layout.conf $(BUILT)
	$(ASCIIDOC) $(ADOCOPTS) $<
	$(DOS2UNIX) $@

# The default build target.
all: $(PAGES)
