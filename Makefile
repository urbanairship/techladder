PANDOC:=pandoc --write=html5 --read=markdown --standalone -c style.css  --section-divs 
ENG_HTML:=html/eng.html

index.html: README.md $(ENG_HTML)
	$(PANDOC) --output=html/index.html README.md 

$(ENG_HTML): eng.md
	$(PANDOC) --output=$(ENG_HTML) --toc --toc-depth=2 eng.md 

clean:
	rm html/*.html
