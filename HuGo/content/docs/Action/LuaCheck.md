# LuaCheck 代码静态分析



## 安装

```bash
$ sudo luarocks install luacheck

$ luacheck -h
...
Links:

   Luacheck on GitHub: https://github.com/mpeterv/luacheck
   Luacheck documentation: https://luacheck.readthedocs.org
```



## 使用

```bash
$ luacheck test.lua

test.lua:18:27: accessing undefined variable html
test.lua:22:1: setting non-standard global variable log
test.lua:23:121: line is too long (257 > 120)
test.lua:26:27: accessing undefined variable log
```



## IDEA LuaCheck

- 安装 `EmmyLua` 时自带 LuaCheck 插件
- 配置 LuaCheck 地址 `/usr/local/bin/luacheck`
- 右键 Lua 文件，执行 `Run LuaCheck`  查看结果



## Read More

- [mpeterv/luacheck](https://github.com/mpeterv/luacheck)
- [Luacheck documentation](https://luacheck.readthedocs.io/en/stable/index.html)





























