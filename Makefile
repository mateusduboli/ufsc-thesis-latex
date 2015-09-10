# ./Makefile

ECHOCMD:=/bin/echo -e
#LATEX:=lualatex --time-statistics --shell-escape -interaction=batchmode
#LATEX:=pdflatex --time-statistics --shell-escape -interaction=batchmode
#LATEX:=pdflatex --time-statistics --synctex=1 -interaction=nonstopmode 
LATEX:=pdflatex --time-statistics --shell-escape --synctex=1 --interaction=batchmode 



TEST_SRCS:=$(wildcard *.tex)
TEST_PDFS:=$(TEST_SRCS:.tex=.pdf)

default: $(TEST_PDFS)

%.pdf: %.tex
	@$(LATEX) $<

.PHONY: clean

clean:
	rm -f *.aux \
		*.log \
		*.pdf

distclean: clean
	rm -f *.tex 
