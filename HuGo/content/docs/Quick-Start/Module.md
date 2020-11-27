# 模块



## module.lua

```lua
-- 定义一个名为 module 的模块
module = {}
 
-- 定义一个常量
module.constant = "这是一个常量"
 
-- 定义一个函数
function module.func1()
    io.write("这是一个公有函数！\n")
end
 
local function func2()
    print("这是一个私有函数！")
end
 
function module.func3()
    func2()
end
 
return module
```

## test_module.lua

``` lua
-- 默认扫描路径
print(package.path)

-- 修改默认操作路径
package.path = package.path .. ";/Users/kail/IdeaProjects/github/hello-world-example/Lua/src/main/lua/module/?.lua"
-- print(package.path)

-- 加载模块
local module = require("module")

-- 使用模块
print(module.constant)
module.func3()
```

## 加载机制

- 在启动时，Lua 用环境变量 `LUA_PATH` 来初始化 `package.path` ，环境变脸用 `;` 分割
- 默认扫描路径
  - `package.path`
    - /usr/local/share/lua/5.3/?.lua;
    - /usr/local/share/lua/5.3/?/init.lua;
    - /usr/local/lib/lua/5.3/?.lua;
    - /usr/local/lib/lua/5.3/?/init.lua;
    - **./?.lua;**
    - **./?/init.lua**
  - `package.cpath`
    - /usr/local/lib/lua/5.3/?.so;
    - /usr/local/lib/lua/5.3/loadall.so;
    - ./?.so



## Read More

- [6.3 – 模块](https://www.runoob.com/manual/lua53doc/manual.html#6.3)

- [Lua 模块化的最佳实践](http://www.dahouduan.com/2017/12/07/lua-module-best-practice/)

