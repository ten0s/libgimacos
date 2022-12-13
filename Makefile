CFLAGS=-Wall -g `pkg-config --cflags glib-2.0`
LIBS=`pkg-config --libs glib-2.0` -framework AppKit

NAMESPACE=MacOSLib
NSVERSION=1.0
LIB_NAME=gimacos
SYM_PREFIX=gi_macos_lib
LIB_FILE=lib$(LIB_NAME).dylib
GIR_FILE=$(NAMESPACE)-$(NSVERSION).gir
TYPELIB_FILE=$(NAMESPACE)-$(NSVERSION).typelib

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

clean:
	rm -rf *.o *.dylib *.gir *.typelib tmp-introspect*
