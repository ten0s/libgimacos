Build

```
% make
```

Install

```
% make install [PREFIX=/usr/local]
```

Test

```
% DYLD_LIBRARY_PATH=`pwd` GI_TYPELIB_PATH=`pwd` gjs test-gjs.js
```
