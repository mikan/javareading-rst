# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = python3 -msphinx
SPHINXPROJ    = javareading
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[34m%-11s\033[0m %s\n", $$1, $$2}'

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: zip
zip: clean html ## 議事録提出可能な zip を生成します (rst=<RST_FILE> を指定してください)
ifdef rst
	$(eval HTML := _build/html/$(subst .rst,.html,${rst}))
	$(eval BOOK := $(shell echo ${rst} | sed -r 's/[^a-z]*([a-z]+).*$$/\1/'))
	$(eval TOP_BEFORE := <div class="body" role="main">)
	$(eval TOP_TAG := <p align="right"><b>[</b><a href="index.html\#${BOOK}">戻る</a><b>]</b></p>)
	$(eval BOTTOM_TAG := <p align="center"><b>[</b><a href="index.html\#${BOOK}">戻る</a><b>]</b></p>)
	$(eval BOTTOM_AFTER := <div class="clearer"></div>)
	sed -r -i -e 's|${TOP_BEFORE}|${TOP_BEFORE}\n${TOP_TAG}|' ${HTML}
	sed -r -i -e 's|${BOTTOM_AFTER}|${BOTTOM_TAG}\n${BOTTOM_AFTER}|' ${HTML}
	zip -j $(subst .rst,.zip,${rst}) ${HTML} ${rst}
else
	@echo "\033[31mERROR: rst=<RST_FILE> を指定してください\033[0m"
endif
