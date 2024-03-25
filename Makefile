PACKAGENAME=rdf
COLLECTS=$(PACKAGENAME)

all: link setup

clean:
	find . -name compiled -type d | xargs rm -rf
	rm -rf htmldocs
	rm $(PACKAGENAME).zip
	rm $(PACKAGENAME).zip.CHECKSUM

setup:
	raco setup --tidy $(COLLECTS)

link:
	raco pkg install --link -n $(PACKAGENAME) $$(pwd)

unlink:
	raco pkg remove $(PACKAGENAME)

package:
	raco pkg create $(PACKAGENAME)
