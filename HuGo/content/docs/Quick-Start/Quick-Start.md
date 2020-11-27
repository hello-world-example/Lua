# 快速开始



## 安装

如果是在 Linux 或 Mac 下，Lua 大部分情况下已经安装

``` bash
# 查看版本
$ lua -v
Lua 5.2.4  Copyright (C) 1994-2015 Lua.org, PUC-Rio

# 卸载原来安装的版本
$ which lua
/usr/local/bin/lua
# 发现是通过 brew 安装的
$ ll /usr/local/bin/lua
/usr/local/bin/lua -> ../Cellar/lua/5.2.4_4/bin/lua
# 卸载
$ brew uninstall lua
```

### 编译安装

``` bash
# 下载解压
$ curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
$ tar zxvf lua-5.3.5.tar.gz

$ cd lua-5.3.5
# 查看文档
$ open doc/contents.html

# 编译
$ make
Please do 'make PLATFORM' where PLATFORM is one of these:
   aix bsd c89 freebsd generic linux macosx mingw posix solaris
See doc/readme.html for complete instructions.
$ make macosx

# 安装
$ sudo make install
# 记录安装位置
cd src && mkdir -p /usr/local/bin /usr/local/include /usr/local/lib /usr/local/man/man1 /usr/local/share/lua/5.3 /usr/local/lib/lua/5.3
cd src && install -p -m 0755 lua luac /usr/local/bin
cd src && install -p -m 0644 lua.h luaconf.h lualib.h lauxlib.h lua.hpp /usr/local/include
cd src && install -p -m 0644 liblua.a /usr/local/lib
cd doc && install -p -m 0644 lua.1 luac.1 /usr/local/man/man1

$ lua -v
Lua 5.3.5  Copyright (C) 1994-2018 Lua.org, PUC-Rio
```

> @see [Installing Lua](http://www.lua.org/manual/5.4/readme.html)



## Hello World

### lua

``` bash
$ lua
Lua 5.3.5  Copyright (C) 1994-2018 Lua.org, PUC-Rio

> print("Hello World!")
Hello World!

> # Ctrl + C 退出
```



### helloworld.lua

```lua
world = "World"
print("Hello " .. world)
```

运行 `helloworld.lua` 脚本

```bash
$ lua helloworld.lua
```



### helloworld.lua.sh

``` lua
#!/usr/local/bin/lua

-- 获取文件参数
print("Hello "..arg[1])
```

运行 `helloworld.lua` 脚本

```bash
$ ./helloworld.lua.sh World
Hello World
```



## Read More

- IDEA 插件 [EmmyLua](https://plugins.jetbrains.com/plugin/9768-emmylua)