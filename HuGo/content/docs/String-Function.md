# string



## function

| function                                       | 概述                                                         |
| :--------------------------------------------- | :----------------------------------------------------------- |
| `..`                                           | 字符串拼接                                                   |
| `string.upper(argument)`                       | 转大写                                                       |
| `string.lower(argument)`                       | 转小写                                                       |
| `string.format(...)`                           | 格式化，`string.format("the %s is : %d", "value", 4)`        |
| `string.rep(string, n)`                        | 字符串 repeat，`string.rep("abc", 2)  --> abcabc`            |
| **`string.gsub(str,pattern,target[,num])`**    | 替换，`str, count = string.gsub("燕燕燕", "燕", "子")`       |
| **`string.find(str, pattern, [init, [end]])`** | 字符串查找，`startI, endI = string.find("大闹天宫", "闹天")`，未找到返回 `nil` |
| `string.len(arg)`                              | 【不支持中文】英文字符串长度，**建议通过 `utf8.len(arg)` 代替** |
| `string.reverse(arg)`                          | 【不支持中文】反转                                           |
| `string.char(...int)`                          | 【不支持中文】ASCII 转 字符，`string.char(97, 98, 99) --> abc` |
| `string.byte(arg[,int])`                       | 【不支持中文】字符 转 ASCII，`string.byte("abc", 2) --> 98`  |
| **`string.sub(str, start [,end])`**            | 【不支持中文】字符串切割，配合 `string.find` 获取中文字符的位置 |
|                                                |                                                              |
| **`string.match(str, pattern[, start])`**      | 搜索匹配的第一个字符，未找到返回 `nil`<br />`string.match("I have 2 questions", "%d+ %a+") --> 2 questions ` |
| **`string.gmatch(str, pattern)`**              | 返回一个迭代器函数，每一次调用这个函数，返回一个在字符串 str 找到的下一个符合 pattern 描述的子串<br />`for word in string.gmatch("Hello Lua user", "%a+") do print(word) end` |



## string.format

|   format   | 简介                                          |      |
| :--------: | --------------------------------------------- | ---- |
|    `%q`    | 将 字符串 转化为可安全被 Lua 编译器读入的格式 |      |
|    `%s`    | 字符串                                        |      |
| `%d`, `%i` | 数字                                          |      |
|            |                                               |      |
|    `%c`    | 数字 转 ASCII 字符                            |      |
|    `%o`    | 8 进制                                        |      |
| `%x`，`%x` | 16 进制                                       |      |
|    `%u`    | 去符号                                        |      |
|            |                                               |      |
|   `%num`   | 指定宽度                                      |      |
|    `%+`    | 正数显示正号，负数显示负号                    |      |
|    `%-`    | 指定宽度时靠左对齐                            |      |
|  `%0num`   | 数字以 0 补全                                 |      |

``` lua
print(string.format("%+5i,%+5i", 1, -1))   --    +1,   -1
print(string.format("%05i,%05i", 1, -1))   -- 00001,-0001
print(string.format("%+05i,%+05i", 1, -1)) -- +0001,-0001
print(string.format("%5s:%5s", 1, 2))      --     1:    2
print(string.format("%-5s:%5s", 1, 2))     -- 1    :    2
```



## Pattern 匹配模式

详见： [正则匹配]({{< relref "/docs/String-Regex.md" >}})



## Read More

- [6.4 – String Manipulation](https://www.lua.org/manual/5.4/manual.html#6.4)
- [字符串处理](https://www.runoob.com/manual/lua53doc/manual.html#6.4)

