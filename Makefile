THESIS_NAME=thesis
TEXT_FILES=introduction.md background.md solution.md related-work.md conclusion.md
REFERENCES=sources.bib

all: thesis.pdf

$(REFERENCES):
	# delete if not generated (also remove rm from target "clean")
	wget http://localhost:23119/better-bibtex/collection?/0/Q8Q4SITI.biblatex -O $@

$(THESIS_NAME).html: $(REFERENCES) $(TEXT_FILES)
	scholdoc \
		$(TEXT_FILES) metadata.yml \
		-s \
		-S \
		--chapters \
		--template=templates/template \
		-o $@ \
		-t html5 \
		--toc \
		--section-divs \
		--number-sections \
		--bibliography=$< \
		--csl=bibliography-styles/springer-lecture-notes-in-computer-science-alphabetical.csl

$(THESIS_NAME).epub: $(REFERENCES) $(TEXT_FILES)
	pandoc \
		$(TEXT_FILES) epub-metadata.yml \
		-s \
		-S \
		-o $@ \
		-t epub \
		--filter ./scholdoc2pandocfigures.py \
		--bibliography=$< \
		--csl=bibliography-styles/springer-lecture-notes-in-computer-science-alphabetical.csl

$(THESIS_NAME).tex: $(TEXT_FILES)
	scholdoc \
		$(TEXT_FILES) metadata.yml \
		-s \
		-S \
		--chapters \
		--template=templates/template \
		-o $@ \
		-t latex \
		--biblatex

$(THESIS_NAME).pdf: $(THESIS_NAME).tex sources.bib
	TEXINPUTS="./swathesis:./titlepage:" pdflatex $<
	biber $(THESIS_NAME)
	TEXINPUTS="./swathesis:./titlepage:" pdflatex $<
	TEXINPUTS="./swathesis:./titlepage:" pdflatex $<
	@./word-count

$(THESIS_NAME).docx: sources.bib $(TEXT_FILES)
	pandoc \
		$(TEXT_FILES) metadata.yml \
		-s \
		-S \
		-o $@ \
		-t docx \
		--toc \
		--bibliography=$< \
		--csl=bibliography-styles/springer-lecture-notes-in-computer-science-alphabetical.csl

clean-auxiliaries:
	@rm -f $(THESIS_NAME).{aux,bbl,bcf,blg,loa,lof,log,lol,lot,mw,out,pgs,run.xml,tdo,toc}

.PHONY: clean

clean:
	rm -rf $(THESIS_NAME).*
	rm -f $(REFERENCES)
