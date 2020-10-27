MATHEMATICA_FILES := $(wildcard *.wls)
BUILD_WHEN_NEEDED := $(addprefix .mod_,$(MATHEMATICA_FILES))

IMG_OUTPUT = images/

LATEX_SRC  = Homework-special-1.tex
PDF_OUTPUT = Homework-special-1



LATEX_SRC  = Homework-1.tex
PDF_OUTPUT = Homework-1


run: $(BUILD_WHEN_NEEDED)
	@mkdir -p $(IMG_OUTPUT)

$(BUILD_WHEN_NEEDED): .mod_% : %
	@echo "Running $^"
	@math -script $^
	@touch $@

pdf: $(LATEX_SRC)
	@echo "Making $(PDF_OUTPUT).pdf"
	@pdflatex -jobname $(PDF_OUTPUT) $(LATEX_SRC)

clean:
	@echo "Cleaning output files"
	@rm -rf $(BUILD_WHEN_NEEDED) $(IMG_OUTPUT)/* $(PDF_OUTPUT).pdf *.aux *.log &2> /dev/null || true

all: run pdf
