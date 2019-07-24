(echo --- && type templates\settings.yml && echo ---) > _combined.md
for /F "tokens=*" %%f in (toc.txt) do (echo. && echo. && type "%%f") >> _combined.md
pandoc --from=markdown+hard_line_breaks+backtick_code_blocks+abbreviations --top-level-division=chapter --template=templates\eisvogel.tex --pdf-engine=lualatex --filter=pandoc-crossref --filter=pandoc-citeproc --listings _combined.md -o BAMedicalImaging.tex
start BAMedicalImaging.tex