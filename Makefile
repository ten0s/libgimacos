CFLAGS=-Wall -g `pkg-config --cflags glib-2.0`
LIBS=`pkg-config --libs glib-2.0` -framework AppKit

NAMESPACE=MacOSLib
NSVERSION=1.0
LIB_NAME=gimacos
SYM_PREFIX=gi_macos_lib
LIB_FILE=lib$(LIB_NAME).dylib
GIR_FILE=$(NAMESPACE)-$(NSVERSION).gir
TYPELIB_FILE=$(NAMESPACE)-$(NSVERSION).typelib
LIB_DIR=lib
SHARE_DIR=share
GIR_DIR=$(SHARE_DIR)/gir-1.0
TYPELIB_DIR=$(LIB_DIR)/girepository-1.0
PREFIX ?= `pwd`

all: $(TYPELIB_FILE)

%.o: %.c %.m
	gcc -c $< $(CFLAGS) -o $@

gi-macos-lib.o: gi-macos-lib.h macos.o

macos.o: macos.h

$(LIB_FILE): gi-macos-lib.o macos.o
	gcc -shared $^ $(CFLAGS) $(LIBS) -o $@

$(GIR_FILE): $(LIB_FILE)
	g-ir-scanner gi-macos-lib.[ch]       \
		--warn-all                       \
		--library-path=`pwd`             \
		--library=$(LIB_NAME)            \
		--namespace=$(NAMESPACE)         \
		--nsversion=$(NSVERSION)         \
		--symbol-prefix=$(SYM_PREFIX)    \
		--identifier-prefix=$(NAMESPACE) \
		--include=GLib-2.0               \
		--output=$@

$(TYPELIB_FILE): $(GIR_FILE)
	g-ir-compiler $^ --output=$@

install:
	mkdir -p $(PREFIX)/$(LIB_DIR)
	mkdir -p $(PREFIX)/$(GIR_DIR)
	mkdir -p $(PREFIX)/$(TYPELIB_DIR)
	mv $(LIB_FILE) $(PREFIX)/$(LIB_DIR)
	mv $(GIR_FILE) $(PREFIX)/$(GIR_DIR)
	mv $(TYPELIB_FILE) $(PREFIX)/$(TYPELIB_DIR)

clean:
	rm -f *.o *.dylib *.gir *.typelib
	rm -rf $(PREFIX)/$(LIB_DIR) $(PREFIX)/$(SHARE_DIR)
	rm -rf tmp-introspect*
