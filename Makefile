# ADD YOUR MARKDOWN FILE(S) HERE!
# Use relative paths.
# Multiple files will be appendend in the given order.
# If using a wildcard, matching files are organized in lexicographic order
SOURCE=file1.md \
	   src/file2.md \
       src/path-to/*.md # Picks all markdown files in directory


# YOUR BIBLIOGRAPHY FILE GOES HERE!
# Use bibtex of biblatex formats.
# This are not rendered if no citations are made within the document.
# If you remove this file, comment this and remove the corresponding flg
# in PANDOC below
BIBLIO=references.bib

# REMEMBER: Modify the metadata file with your document information
METADATA=metadata.yaml

# Calling `make` without arguments builds all document types
TARGET=letter article thesis

# Base command
PANDOC=pandoc $(SOURCE) --bibliography=$(BIBLIO) --metadata-file=$(METADATA) \
              --defaults=templates/common-defaults.yaml

article: $(SOURCE)
	$(PANDOC) --output=article.pdf --defaults=templates/article.yaml

letter: $(SOURCE)
	$(PANDOC) --output=letter.pdf --defaults=templates/letter.yaml

thesis: $(SOURCE)
	$(PANDOC) --output=thesis.pdf --defaults=templates/thesis.yaml


all: $(TARGET)

clean:
	rm -rf article.pdf letter.pdf thesis.pdf

.PHONY: all clean $(TARGET)
.DEFAULT_GOAL := all
