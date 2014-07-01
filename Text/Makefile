default: pdf

bakalarka.dvi: *.tex *.bib Makefile
	rm -f *.toc
	latex bakalarka
	bibtex bakalarka
	latex bakalarka
	latex bakalarka

bakalarka.ps: bakalarka.dvi
	dvips bakalarka.dvi

bakalarka.pdf: *.tex *.bib Makefile
	rm -f *.toc
	pdflatex bakalarka
	bibtex bakalarka
	pdflatex bakalarka
	pdflatex bakalarka

dvi: bakalarka.dvi

ps: bakalarka.ps

pdf: bakalarka.pdf

all: ps pdf

clean: 
	rm -f *.{log,aux,dvi,toc,bbl,blg,slo,srs,lot,lof,lol,out,backup} *~

dist-clean: clean
	rm -f bakalarka.ps bakalarka.pdf

booklet: bakalarka.ps
	cat bakalarka.ps | psbook | psnup -2 >bakalarka-booklet.ps

