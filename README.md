MacOS Lib via GObject Introspection

* Disables zoom button
* Forces foreground level
* Sets dock badge label
* Sets process name

## Build

```
% make
```

## Install

```
% make install [PREFIX=/usr/local]
```

## Test

```
% export DYLD_LIBRARY_PATH=`pwd` GI_TYPELIB_PATH=`pwd`
% gjs test-gjs.js
% gjs test-gjs-gtk.js
```

## License

The project is licensed under the 2-Clause BSD License.<br>
See [LICENSE](LICENSE) or
https://spdx.org/licenses/BSD-2-Clause.html
for full license information.
