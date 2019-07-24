BASEDIR=$(CURDIR)
INPUTDIR=content
OUTPUTDIR=$(BASEDIR)/output
STYLESDIR = styles
TEMPLATEDIR=$(BASEDIR)/templates
ADS=$(BASEDIR)/ads
YAMLMETA = $(ADS)/metadata.yaml
TEXTSOURCES=$(INPUTDIR)/1chapter.md $(INPUTDIR)/2chapter.md $(INPUTDIR)/3chapter.md $(INPUTDIR)/4chapter.md $(INPUTDIR)/5chapter.md $(ADS)/appendix.md

help:	
	@echo ' '
	@echo 'Makefile for '
	@echo ' ┌─────────────────────────────────────────────────────────────────────────────────┐ '
	@echo ' │																				  │ '
	@echo ' │ 															                      │ '
	@echo ' │ Bachelor Thesis - Pascal Schröder                                               │ '
	@echo ' │ Abgabedatum:                         23. September 2019                         │ '
	@echo ' │                                                                                 │ '
	@echo ' │ Bearbeitungszeitraum:                12 Wochen                                  │ '
	@echo ' │ Matrikelnummer, Kurs:                5501463, TINF16AI-BC                       │ '
	@echo ' │ Ausbildungsfirma:                    IBM Deutschland GmbH, Mannheim             │ '
	@echo ' │ Betreuer der Ausbildungsfirma:       Steffen Krause                             │ '
	@echo ' │ Gutachter der Dualen Hochschule:     Prof. Dr. Holger Hofmann				      │ '
	@echo ' └─────────────────────────────────────────────────────────────────────────────────┘ '
	@echo ' '	
	@echo 'USAGE:'
	@echo '───────────────────────────────────────────────────────────────────────────────────'
	@echo 'make latex: Creates latex file of the thesis'
	@echo 'make pdf :  Creates pdf file of the book using'
	@echo '            the modified Eisvogel template'
	@echo 'make html: Creates html file of the thesis'
	@echo ' '
	@echo 'REQUIRES:'
	@echo '───────────────────────────────────────────────────────────────────────────────────'
	@echo 'pandoc (https://pandoc.org/)'
	@echo 'pandoc-citeproc'
	@echo 'pandoc-crossref'
	@echo ' '

latex:
	@pandoc --from=markdown+hard_line_breaks+backtick_code_blocks+abbreviations --top-level-division=chapter --template=templates/eisvogel.tex -V --pdf-engine=lualatex --filter=pandoc-crossref --filter=pandoc-citeproc --listings ads/metadata.yaml content/1chapter.md content/2chapter.md content/3chapter.md content/4chapter.md content/5chapter.md ads/appendix.md -s -o output/Bachelor_Thesis_Pascal_Schroeder_TINF16AI-BC.tex  --number-sections
	@echo 'Successfully created latex file (./output/)'
pdf:
	@pandoc --from=markdown+hard_line_breaks+backtick_code_blocks+abbreviations --top-level-division=chapter --template=templates/eisvogel.tex -V --pdf-engine=xelatex --filter=pandoc-crossref --filter=pandoc-citeproc --listings ads/metadata.yaml content/1chapter.md content/2chapter.md content/3chapter.md content/4chapter.md content/5chapter.md ads/appendix.md -s -o output/Bachelor_Thesis_Pascal_Schroeder_TINF16AI-BC.pdf  --number-sections
	@echo 'Successfully created pdf file (./output/)'
	@start ./output/Bachelor_Thesis_Pascal_Schroeder_TINF16AI-BC.pdf
html:
	@pandoc --filter=pandoc-crossref --filter=pandoc-citeproc --listings ads/metadata.yaml content/1chapter.md content/2chapter.md content/3chapter.md content/4chapter.md content/5chapter.md ads/appendix.md -s -o output/Bachelor_Thesis_Pascal_Schroeder_TINF16AI-BC.html  --number-sections
	@echo 'Successfully created html file (./output/)'

.PHONY: latex pdf
