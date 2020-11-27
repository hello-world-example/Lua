# 基础语法



## 注释

``` lua
-- 单行注释

--- 单行注释（IDEA 中会自动生成注释）

--[[
多行注释
--]]
```



## 变量

```lua
-- 全局变量
var = 10
print(var)

-- 删除变量
var = nil
print(var)

-- 局部变量
local b = 5

do
    local a = 6     -- 局部变量
    var = 6         -- 全局变量
    print(a, var);  -- 6 6
end

-- 变量赋值
a, b = 10, 2 * x
```



## 类型

``` lua
print(type(nil))                --> nil
print(type(true))               --> boolean
print(type(10.4 * 3))           --> number
print(type('Hello world'))      --> string
print(type("Hello world"))      --> string
print(type(type(X)))            --> string
print(type(print))              --> function
print(type(type))               --> function
print(type({ k1=v1, k2=v2 }))   --> table


-- userdata	表示任意存储在变量中的C数据结构
-- thread	表示执行的独立线路，用于执行协同程序
```



## 字符串

```lua
s1 = "this is string1"
s2 = 'this is string2'

s3 = [[这是
多行字符串
]]


-- 字符串拼接
print("a" .. 'b')

-- + 操作会被转为 number 相加
print("1" + 2)

-- 计算字符串长度
print(#s3)             -- 23
print(string.len(s3))  -- 23
print(utf8.len(s3))    -- 9
```



## 数组（table）

``` lua
local array = { "apple", "pear", "orange", "grape" }

-- 0 下标是 nil
print(array[0])

-- 下标从 1 开始
print(array[1])
print(array[4])

-- 遍历
for i, v in ipairs(array) do
    print(i .. " " .. v)
end
-- 1 apple
-- 2 pear
-- 3 orange
-- 4 grape


array[7] = "seven"
for k, v in pairs(array) do
    print(k .. " " .. v)
end
-- 1 apple
-- 2 pear
-- 3 orange
-- 4 grape
-- 7 seven

array[1] = nil
for k, v in pairs(array) do
    print(k .. " " .. v)
end
-- 2 pear
-- 3 orange
-- 4 grape
-- 7 seven

for	 i, v in ipairs(array) do
    print(i .. " " .. v)
end
-- 2 pear
-- 3 orange
-- 4 grape
-- 7 seven
```



## 字典（table）

``` lua
local dict = {
    key1 = "value1",
    key2 = "value2",
}

print(dict.key1)

print(dict['key1'])

for k, v in pairs(dict) do
    print(k .. " : " .. v)
end
```



## 条件

``` lua
i = 1
if i == 0 then
    print("零")
elseif i == 1 then
    print("壹")
else
    print("-")
end
```

## 关系运算

```lua
a = false
b = true
c = false
if not (a and b) or c then
    print("not (a and b) or c -->", true)
end

-- a and b --> false
-- not (a and b) --> not(false) --> true
-- true or c --> true
```



## 循环

```lua
-- while 循环
local i = 0
while (i < 10) do
    i = i + 1
end

-- for 循环（初始值0，到 10 结束，步长为 1）
for i = 0, 10, 1 do
    print(i)
end

-- for 循环（初始值 10，到 0 结束，步长为 -1）
for i = 10, 1, -1 do
    print(i)
end

-- repeat 循环
a = 0
repeat
    a = a + 1
until (a > 15)

-- break 语句
while (true) do
    i = i + 1
    if (i > 10) then
        break
    end
end

-- goto（continue）
for i = 0, 10 do
    if i % 2 == 0 then
        goto continue
    end
    print(i)
    -- label 的定义
    :: continue ::
end

```

## 函数（function）

``` lua
function fun1(n)
    if n == 0 then
        return 0
    else
        return n + fun1(n - 1)
    end
end

print(fun1(5))

-- function 赋值
fun2 = fun1
print(fun2(5))

-- 返回多值
function return2()
    return 1, 2
end

a, b = return2()
print(a, b)


-- 可变参数
function average(...)
    local arg = { ... }

    result = 0
    for i, v in pairs(arg) do
        result = result + v
    end
    return result / #arg
end

print("平均值", average(1, 2, 3))

-- 获取可变参数
function foo(...)
    -- select('#', ...) 获取可变参数长度
    for i = 1, select('#', ...) do
        -- 读取可变参数索引
        local arg = select(i, ...);
        print("arg", arg);
    end
end

foo(1, "2", nil, 4);
-- arg	1
-- arg	2
-- arg	nil
-- arg	4
```







