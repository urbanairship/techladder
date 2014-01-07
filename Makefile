PANDOC:=pandoc --write=html5 --read=markdown --standalone -c style.css  --section-divs
_ORGS:=eng ops
ORG_HTML:=$(patsubst %,%.html,$(_ORGS))

index.html: README.md org_html
	$(PANDOC) --write=html5 --read=markdown --standalone -c style.css  --section-divs README.md | awk '{ split("$(_ORGS)",orgs," "); for (o in orgs) { md = sprintf("%s.md", orgs[o]); html = sprintf("%s.html", orgs[o]); sub(md, html); } print; }' > html/index.html

org_html: $(ORG_HTML)

%.html: %.md
	$(PANDOC) --toc --toc-depth=2 $^ > html/$@

clean:
	rm html/*.html
