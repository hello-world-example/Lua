# OOP 面向对象



## self

- Lua 定义/调用 function 时，可以使用 `.` 或 `:`
  - `.` 类似于 Java 中的 static 静态方法 
  - `:` 定义或调用时，则隐含一个 `self` 的概念
    - 定义方法： 在方法体内可以使用 `self` 引用当前 `table`
    - 调用方法： 第一个参数会默认传递  `self` 即当前 `table`

```lua
shape = { height = 4, width = 4 }
setmetatable(shape, { __tostring = function(my)
    return "height:" .. my.height .. ",width:" .. my.width
end })

function shape.setWidth(shape, width)
    shape.width = width
end

function shape:setHeight(height)
    self.height = height
end

-- 传入自己
shape.setHeight(shape, 40)
-- 【.方式 调用 :方法】传入自己
shape.setWidth(shape, 40)
-- height:40,width:40
print(shape)

-- 【:方式 调用 .方法】无需传入自己
shape:setHeight(60)
-- 无需传入自己
shape:setWidth(60)
-- height:60,width:60
print(shape)

```





## Read More

- ❤ Github [rxi/classic](https://github.com/rxi/classic) 

- LuaRocks [emartech/classic](https://luarocks.org/modules/emartech/classic)

- [kong/plugins/base_plugin.lua](https://github.com/Kong/kong/blob/2.1.4/kong/plugins/base_plugin.lua)

- 

- [lua 中的 self](https://www.jianshu.com/p/8245b1e7c487)

- [Lua 面向对象](https://www.runoob.com/lua/lua-object-oriented.html)

  

