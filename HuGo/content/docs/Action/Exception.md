# 异常处理



## error 抛出异常

- 格式 `error (message [, level])`

```lua
error("错误原因")
```

- `level` 默认是 `1` ，代表 抛出错误消息 所在的代码行数
- `level` 是 `2` ，代表 抛出错误消息 方法的上一层方法
- `level`  的数字大小，代表抛出异常时，显示的方法调用层级所在的位置
- `level` 是 `0` ，代 则不显示错误位置

**示例程序**

```lua
function fun(a, b)
    error("错误原因", 2)
end

fun(1, 2)
```

**异常信息**

```bash
# 当 level 为 0 时的错误信息
/usr/local/bin/lua: 错误原因
stack traceback:
	[C]: in function 'error'
	...world-example/Lua/src/main/lua/exception/hello_pcall.lua:2: in function 'fun'
	...world-example/Lua/src/main/lua/exception/hello_pcall.lua:5: in main chunk
	[C]: in ?

# 当 level 为 1 时的错误信息
/usr/local/bin/lua: ...world-example/Lua/src/main/lua/exception/hello_pcall.lua:2: 错误原因
stack traceback:
	.. 堆栈信息都一样

# 当 level 为 2 时的错误信息
/usr/local/bin/lua: ...world-example/Lua/src/main/lua/exception/hello_pcall.lua:5: 错误原因
stack traceback:
	.. 堆栈信息都一样

```



## pcall 捕获异常

**格式**

```lua
-- 第一个参数是需要调用方法的 方法名，后续参数为 方法的参数列表
pcall (f [, arg1, ···])
```



**示例代码**

```lua
function fun(a, b)
    if b == 0 then
        error("错误原因 " .. a .. "/0")
    end
    return a / b
end

-- 正确时输出： true	1.0
print(pcall(fun, 1, 1))

-- 错误时输出： false	...world-example/Lua/src/main/lua/exception/hello_pcall.lua:3: 错误原因 1/0
print(pcall(fun, 1, 0))
```



## xpcall

**格式**

```lua
-- 与 pcall 类似，多了一个 msgh 参数，可以用来处理
xpcall (f, msgh [, arg1, ···])
```

**示例代码**

```lua
function fun(a, b)
    if b == 0 then
        error("错误原因 " .. a .. "/0")
    end
    return a / b
end

function catch(errorMsg)
    print("catch " .. errorMsg)
    print(debug.traceback())
    return "new" .. errorMsg
end

-- 正确时输出： true	1.0
print(xpcall(fun, catch, 1, 1))

-- 【catch 方法内打印】
-- catch ...orld-example/Lua/src/main/lua/exception/hello_xpcall.lua:3: 错误原因 1/0
-- stack traceback:
-- 	...orld-example/Lua/src/main/lua/exception/hello_xpcall.lua:10: in function 'catch'
-- 	[C]: in function 'error'
-- 	...orld-example/Lua/src/main/lua/exception/hello_xpcall.lua:3: in function 'fun'
-- 	[C]: in function 'xpcall'
-- 	...orld-example/Lua/src/main/lua/exception/hello_xpcall.lua:15: in main chunk
-- 	[C]: in ?

-- false	new...orld-example/Lua/src/main/lua/exception/hello_xpcall.lua:3: 错误原因 1/0
print(xpcall(fun, catch, 1, 0))
```



## 实现 try-catch 异常捕捉

> - [使用lua实现try-catch异常捕获](https://tboox.org/cn/2016/12/14/try-catch/)
> - lua 函数调用语法特性： 在只有一个参数传递的情况下，lua 可以直接传递一个 table 类型，并且省略 `()`

### 特性示例

```lua
function fun(t)
    return t.data * t.data
end
-- 调用 fun 方式，参数类型是 table
local result = fun { data = 3 }
-- 输出 9
print(result)
```







## Read More

- [2.3 – 错误处理](https://www.runoob.com/manual/lua53doc/manual.html#2.3)

