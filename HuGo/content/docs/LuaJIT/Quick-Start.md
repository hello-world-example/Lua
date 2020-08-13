# LuaJIT 快速开始



## 编译安装

``` bash
# 下载解压
$ curl -R -O http://luajit.org/download/LuaJIT-2.0.5.tar.gz
$ tar zxvf LuaJIT-2.0.5.tar.gz

$ cd LuaJIT-2.0.5
# 查看文档
$ open doc/install.html

# Undefined symbols for architecture x86_64:
# ld: symbol(s) not found for architecture x86_64
$ vim src/Makefile
# BUILDMODE=mixed # 注释掉
BUILDMODE=dynamic # 打开此行


# 安装
$ sudo make install PREFIX=/usr/local/luajit

# 创建链接
$ ln -s /usr/local/luajit/bin/luajit-2.0.5 /usr/local/bin/luajit

$ luajit -h
usage: luajit [options]... [script [args]...].
Available options are:
  -e chunk  Execute string 'chunk'.
  -l name   Require library 'name'.
  -b ...    Save or list bytecode.
  -j cmd    Perform LuaJIT control command.
  -O[opt]   Control LuaJIT optimizations.
  -i        Enter interactive mode after executing 'script'.
  -v        Show version information.
  -E        Ignore environment variables.
  --        Stop handling options.
  -         Execute stdin and stop handling options.
```

> - [Mac luajit 源码编译 问题](https://www.cnblogs.com/uinique/p/10371941.html)
> - [mac编译nginx lua模块报 ld: symbol(s) not found for architecture x86_64](http://www.aymoo.com/?p=42)





## luajit.lua

```lua
local ffi = require("ffi")

ffi.cdef [[
    int printf(const char *fmt, ...);
]]

ffi.C.printf("Hello %s!", "world")
```

运行

```bash
$ luajit luajit.lua 
Hello world!

# lua 方式运行，找不到 ffi 库
$ lua luajit.lua 
lua: luajit.lua:2: module 'ffi' not found:
        no field package.preload['ffi']
        ...
```



## Read More

- [LuaJIT Download](http://luajit.org/download.html)
- [LuaJIT Installation](http://luajit.org/install.html)
- [Running LuaJIT](http://luajit.org/running.html)