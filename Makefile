PANDOC:=pandoc --write=html5 --read=markdown --standalone -c style.css  --section-divs
ENG_HTML:=html/eng.html

index.html: README.md $(ENG_HTML)
	$(PANDOC) README.md | awk '{ sub(/eng\.md/, "eng.html"); print }' > html/index.html

$(ENG_HTML): eng.md
	$(PANDOC) --toc --toc-depth=2 eng.md > html/eng.html

clean:
	rm html/*.html
