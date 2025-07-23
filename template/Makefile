MAIN = report

LATEX = xelatex
LATEXFLAGS = -interaction=nonstopmode -halt-on-error

BIBTEX = bibtex

TEX_FILES = $(MAIN).tex $(wildcard body/*.tex)
BIB_FILES = $(wildcard bibliography/*.bib)
FIG_FILES = $(wildcard figures/*.tex) $(wildcard figures/*.tikz) $(wildcard figures/*.pdf)

all: $(MAIN).pdf

# main compilation rule
$(MAIN).pdf: $(TEX_FILES) $(BIB_FILES) $(FIG_FILES)
	latexmk -pdf -pdflatex="$(LATEX) $(LATEXFLAGS)" -use-make $(MAIN).tex

# quick compilation (no bibliography)
quick:
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

# full compilation with bibliography
full:
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

# watch for changes and recompile
watch:
	latexmk -pdf -pvc -pdflatex="$(LATEX) $(LATEXFLAGS)" $(MAIN).tex

# clean auxiliary files
clean:
	latexmk -c
	rm -f *.bbl *.bcf *.blg *.run.xml *.nav *.snm *.vrb *.cut *.tdo

# clean everything including PDF
distclean: clean
	rm -f $(MAIN).pdf

# open PDF (cross-platform)
view: $(MAIN).pdf
	@if [ "$$(uname)" = "Darwin" ]; then \
		open $(MAIN).pdf; \
	elif [ "$$(uname)" = "Linux" ]; then \
		xdg-open $(MAIN).pdf; \
	else \
		echo "Please open $(MAIN).pdf manually"; \
	fi

.PHONY: all quick full watch clean distclean view
