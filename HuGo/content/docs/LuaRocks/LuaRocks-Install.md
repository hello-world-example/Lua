# LuaRocks

>  **LuaRocks** is the package manager for Lua modules.



## 安装

``` bash
$ wget https://luarocks.org/releases/luarocks-3.3.1.tar.gz

$ tar zxvf luarocks-3.3.1.tar.gz

$ cd luarocks-3.3.1

# ./configure -h
$ ./configure --prefix=/usr/local/luarocks --rocks-tree=/usr/local

# $ sudo make bootstrap
$ make
$ sudo make install

# 
$ /usr/local/luarocks/bin/luarocks config
...

# 创建链接
$ ln -s /usr/local/luarocks/bin/luarocks /usr/local/bin/luarocks
$ ln -s /usr/local/luarocks/bin/luarocks-admin /usr/local/bin/luarocks-admin
```

> - [luarocks](https://github.com/luarocks/luarocks/wiki/luarocks) - The LuaRocks command-line interface.
> - [luarocks-admin](https://github.com/luarocks/luarocks/wiki/luarocks-admin) - The repository management tool.



## 使用

``` bash
# 不要在 luarocks-3.3.1 的 编译目录执行以下操作
$ cd ~

$ sudo luarocks install luautf8 

$ luarocks list

Rocks installed for Lua 5.3
---------------------------

luautf8
   0.1.3-1 (installed) - /opt/package/luarocks-3.3.1/./lua_modules/lib/luarocks/rocks-5.3

# 查看信息
$ luarocks show luautf8

# lua-utf8.so
$ ll /usr/local/lib/lua/5.3/

# 尝试 require
$ lua
> lutf8 = require('lua-utf8')
```



## 卸载

``` bash
$ sudo rm -rf /opt/package/luarocks-3.3.1
$ sudo rm -rf /usr/local/luarocks
$ sudo rm -rf /usr/local/bin/luarocks*
```



## Read More

- http://www.luarocks.org/
- [luarocks / luarocks](https://github.com/luarocks/luarocks)
- [Lua 包管理工具 Luarocks 详解](https://segmentfault.com/a/1190000003920034)

