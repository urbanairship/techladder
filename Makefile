PANDOC:=pandoc --write=html5 --read=markdown --standalone -c style.css  --section-divs
_ORGS:=eng ops
ORG_HTML:=$(patsubst %,%.html,$(_ORGS))

index.html: README.md org_html
	$(PANDOC) README.md | sed 's/\.md">/.html">/g' > html/index.html

org_html: $(ORG_HTML)

%.html: %.md
	$(PANDOC) --toc --toc-depth=2 $^ > html/$@

clean:
	rm html/*.html
