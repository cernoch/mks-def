.PHONY: all clean mrproper

TEX_FLAGS += -shell-escape
TEX_FLAGS += -halt-on-error
TEX_FLAGS += -interaction=nonstopmode

IMAGES += Definitions1.pdf
IMAGES += Definitions2.pdf
IMAGES += Definitions3.pdf
IMAGES += DiagonalLockChart.pdf
IMAGES += KeyToDifferLockChart.pdf
IMAGES += EuropePolitical.png
IMAGES += LockKeyways.jpg
IMAGES += IWantYou.jpg
IMAGES += MiniSatLogo.png
IMAGES += LockChartNonGreedy.pdf
IMAGES += LockChartNonGreedy.pdf
IMAGES += RCMWrong1.pdf
IMAGES += RCMWrong2.pdf
IMAGES += IndependentKeysLockChart.pdf
IMAGES += LockChartHierarchy.pdf
IMAGES += TumblerLock.pdf
IMAGES += SagExactSkew.tex
IMAGES += UpperBoundIllustration.pdf

.SECONDARY: $(IMAGES)

all: Prezentace.pdf Handout.pdf
	acroread $< &

%.aux: %.tex Content.tex $(IMAGES)
	xelatex $(TEX_FLAGS) $<

%.bbl: %.aux References.bib
	bibtex $<

%.pdf: %.tex %.aux %.bbl
	xelatex $(TEX_FLAGS) $<
	xelatex $(TEX_FLAGS) $<

%.pdf: %.ipe
	ipetoipe -pdf $< $@

clean:
	rm -f *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc
#	rm -f Prezentace.pdf Handout.pdf

mrproper: clean
	rm -f *.pdf
