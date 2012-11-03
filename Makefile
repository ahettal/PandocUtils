PANDOC=pandoc
PANDOCOPTS=-s -S -c pandoc.css 
#PANDOCOPTS=-s -S --toc -c pandoc.css 

DIRS	= 

.SUFFIXES:
.SUFFIXES: .html .txt

sources := $(patsubst %.txt,%.html,$(wildcard *.txt))
all : $(sources)

#all : index.docx subs

.txt.html :
	$(PANDOC) $(PANDOCOPTS) $< -o $@

subs : 
	for d in $(DIRS); do echo "looking into: $$d";(cd $$d; make ); done

clean:
	rm -f *.html
	for d in $(DIRS); do echo "looking into: $$d";(cd $$d; make clean ); done
