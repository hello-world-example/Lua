# Metatable 



- Lua table 中我们可以 通过 Key 访问到对应的 Value，但是却无法对两个 table 进行操作。
- 元表(Metatable)，允许我们改变 table 的行为，每个行为关联了对应的元方法
- setmetatable 时 metatable 中不能存在 `__metatable` 键



## 元表示例

```lua
-- metatable
local my_parent_metatable = {
    name = "new",
    nick = "kailbin",
    getAge = function()
        return 28
    end
}

-- 原始 table
local my_table = {
    name = "kai",
}

-- 给 my_table 增减 元表
setmetatable(my_table, my_parent_metatable)

-- 获取 元表
local parent = getmetatable(my_table)
-- 打印元表信息
print(parent.name)
print(parent.nick)
print(parent.getAge())

-- 获取 my_table
print(my_table.name)
--print(my_table.nick)      -- 这里会报错，my_table 和 my_parent_metatable 目前没有继承关系
--print(my_table.getAge())  -- 这里会报错，

-- name	kai
for k, v in pairs(my_table) do
    print(k, v)
end
```

- metatable 元表是  table 的隐藏属性
- 通过 `setmetatable` / `getmetatable` 设置和获取 元表
- 如果想通过 元表 实现继承的效果，需要用到 `__index` 原方法



## 元方法

### __index  继承

- 通过 Key 访问 table 时，如果这个 Key 没有值，会寻找该 `table` 的 `metatable` 中的 `__index` 键
- ❤ 如果 `__index` 是一个 `table` ，Lua 会在 table 中查找相应的键
- ❤  如果 `__index` 是一个 `function` ，Lua 会调用那个 `function` ，**并把 table 和 Key 作为参数传入**



#### __index = table 设置父类

```lua
-- metatable
local my_parent_metatable = {
    name = "new",
    nick = "kailbin",
    getAge = function()
        return 28
    end
}

-- 原始 table
local my_table = {
    name = "kai",
}

-- 指定 元表 包含 __index， 类似于设置 父类
setmetatable(my_table, { __index = my_parent_metatable })

print(my_table.name)     -- kai
print(my_table.nick)     -- kailbin
print(my_table.getAge()) -- 28
```



#### __index = function

```lua
-- metatable function
local my_invoker = function(target, methodKey)
    if methodKey == "getAge" then
        return 28
    else
        return methodKey
    end
end

-- 原始 table
local my_table = {
    name = "kai",
}

-- 指定 元表 包含 __index， 类型 function
setmetatable(my_table, { __index = my_invoker })

print(my_table.name)     -- kai
print(my_table.getAge)   -- 28
print(my_table.getAge1)  -- getAge1 (未实现，返回 key 本身)
print(my_table.getAge()) -- 这里报错，不支持 function
```



### __newindex 拦截 set

- `__index` 用来对表访问， `__newindex` 则用来对表更新
- 给 table 的 不存在的 Key 赋值，就会查找 `__newindex` 元方法
- ❤ 如果 `__newindex` 是一个 `table` ，Lua 会对 table 赋值
- ❤  如果 `__newindex` 是一个 `function` ，Lua 会调用那个 `function` ，**并把 table 、Key、Value 作为参数传入**



#### __newindex = table 

```lua
local my_table = { name = "kai" }
local new_table = {}
setmetatable(my_table, { __newindex = new_table })

my_table.nick = "kailbin"
print(my_table.nick, new_table.nick) -- nil	kailbin （虽然给 my_table 赋值，但是通过 my_table 获取不到）

my_table.name = "Kail"
print(my_table.name, new_table.name) -- Kail	nil （name 本身存在，可以正常赋值）
```



#### __newindex = function

```lua
my_table = { name = "kai" }
meta_filter_table = {
  __newindex = function(my_tab, key, value)
    -- my_tab[key] = value .. "!"
    -- 【注意】这里只能使用 rawset 方式，上面的方式会 stack overflow
    rawset(my_table, key, value .. "!")
  end
}
-- 
setmetatable(my_table, meta_filter_table)

my_table.nick = "kailbin"
print(my_table.nick)      -- kailbin!

my_table.name = "Kail"
print(my_table.name)      -- Kail （已经存在的字段，不受 meta_filter_table 影响）
```





### 重写操作符

#### 对应关系

|     元方法 | 操作符 |
| ---------: | :--- |
|    `__add` | `+`  |
|    `__sub` | `-`  |
|    `__mul` | `*`  |
|    `__div` | `/`  |
|    `__mod` | `%`  |
|    `__unm` | `-`  |
| `__concat` | `..` |
|     `__eq` | `==` |
|     `__lt` | `<`  |
|     `__le` | `<=` |

#### 两表拼接

```lua
-- 拼接函数
local concat_func = function(my_tab, new_tab)
    for i, v in pairs(new_tab) do
        my_tab[#my_tab + 1] = v
    end
    return my_tab
end

-- 原始表
local my_table = { 1, 2, 3 }
-- 增加元表，重新 `..` 操作符
setmetatable(my_table, { __concat = concat_func })
-- 
local second_table = { "a", "b", "c" }

-- 两表拼接
my_table = my_table .. second_table

-- 打印：1,2,3,a,b,c
print(table.concat(my_table, ","))
```



### __call，table() 调用

```lua
-- metatable
local def_init = {
    __call = function(my_table, new_table)
        if not new_table then
            return my_table
        end
        my_table.name = new_table.name
        return my_table;
    end
}

-- 原始 table
local my_table = { name = "kai" }
--
setmetatable(my_table, def_init)

-- 
local t1 = my_table()
print(t1.name) -- 输出 kai

local t2 = my_table({ name = "kkk" })
print(t1.name) -- 输出 kkk
print(t2.name) -- 输出 kkk
```



### __tostring

- 修改表的输出行为

```lua
local meta_tostring = {
    __tostring = function(my_table)
        local tostring = "{"
        for k, v in pairs(my_table) do
            tostring = tostring .. k .. "=" .. v .. ", "
        end
        return tostring .. "}";
    end
}

-- 原始 table
local my_table = { name = "kai", nick = "kailbin" }

print(my_table) -- table: 0x7fe1b9d04430

-- 重新输出方式
setmetatable(my_table, meta_tostring)

print(my_table) -- {name=kai, nick=kailbin, }
```





## Read More

- [Lua 元表(Metatable)](https://www.runoob.com/lua/lua-metatables.html)
- 
- [setmetatable (table, metatable)](https://www.runoob.com/manual/lua53doc/manual.html#pdf-setmetatable)
- [getmetatable (object)](https://www.runoob.com/manual/lua53doc/manual.html#pdf-getmetatable)





