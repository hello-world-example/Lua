# LuaFileSystem（lfs）



## 安装

``` bash
$ sudo luarocks install luafilesystem
```



## Example

### 遍历文件与属性

``` lua
local lfs = require("lfs")

local path = "/Users/kail/Documents/crt"
for file in lfs.dir(path) do
  -- print(type(file)) -- string
  if file ~= "." and file ~= ".." then
    local f = path .. '/' .. file
    print(f)

    local attr = lfs.attributes(f)
    for name, value in pairs(attr) do
      print(string.format("%-15s %-10s", name, value))
    end
  end
end

```





## Read More

- [LuaFileSystem](http://keplerproject.github.io/luafilesystem/index.html) File System Library for the Lua Programming Language
  - [Reference](http://keplerproject.github.io/luafilesystem/manual.html#reference)