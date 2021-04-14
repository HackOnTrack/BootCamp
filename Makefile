.PHONY: all clean repl ide

default: all

PS_SRC = src
OUTPUT = output
PS_SOURCEFILES = $(shell find -L  ${PS_SRC} -type f -name \*.purs)
PS_ERL_FFI = $(shell find -L ${PS_SRC} -type f -name \*.erl)
COMPILED_PS = ../src/compiled_ps

all: $(COMPILED_PS)

$(COMPILED_PS): output
	mkdir -p $(COMPILED_PS)
	cp -r output/* $(COMPILED_PS)
	@touch $(COMPILED_PS)

output: $(PS_SOURCEFILES) $(PS_ERL_FFI) spago.dhall packages.dhall
	spago build
	@touch output

ide: $(PS_SOURCEFILES) $(PS_ERL_FFI) spago.dhall packages.dhall
	spago build -u '--json-errors'


clean:
	rm -rf $(OUTPUT)

ifneq ($(wildcard IHP/.*),)
IHP = IHP/lib/IHP
else
IHP = $(shell dirname $$(which RunDevServer))/../lib/IHP
endif

CSS_FILES += ${IHP}/static/vendor/bootstrap.min.css
CSS_FILES += ${IHP}/static/vendor/flatpickr.min.css
CSS_FILES += static/app.css

JS_FILES += ${IHP}/static/vendor/jquery-3.2.1.slim.min.js
JS_FILES += ${IHP}/static/vendor/timeago.js
JS_FILES += ${IHP}/static/vendor/popper.min.js
JS_FILES += ${IHP}/static/vendor/bootstrap.min.js
JS_FILES += ${IHP}/static/vendor/flatpickr.js
JS_FILES += ${IHP}/static/helpers.js
JS_FILES += ${IHP}/static/vendor/morphdom-umd.min.js
JS_FILES += ${IHP}/static/vendor/turbolinks.js
JS_FILES += ${IHP}/static/vendor/turbolinksInstantClick.js
JS_FILES += ${IHP}/static/vendor/turbolinksMorphdom.js
JS_FILES += static/halogen/index.js

include ${IHP}/Makefile.dist
