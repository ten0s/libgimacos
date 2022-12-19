MacOS Lib via GObject Introspection

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
% DYLD_LIBRARY_PATH=`pwd` GI_TYPELIB_PATH=`pwd` gjs test-gjs.js
```

## License

The project is licensed under the 2-Clause BSD License.<br>
See [LICENSE](LICENSE) or
https://spdx.org/licenses/BSD-2-Clause.html
for full license information.
