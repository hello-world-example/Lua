# 正则查找



- 替换： `str, count = string.gsub(str, pattern, target [,num])`
- 查找：`startI, endI = string.find(str, pattern, [init, [end]])`
- 匹配：`str = string.match(str, pattern [, start])`
- 匹配：`fun = string.gmatch(str, pattern)`



## Pattern

|    符号     |                                     |                              |
| :---------: | ----------------------------------- | ---------------------------- |
|     `·`     | 字符                                |                              |
| `%a`、`%A`  | 字母、非字母                        |                              |
| `%l`、`%u`  | 小写字母、大写字母                  |                              |
|    `%d`     | 数字                                |                              |
|    `%s`     | 空白                                |                              |
|    `%w`     | 字符\|数字                          |                              |
|   `%转义`   | 转义                                | `%%` 匹配 `%`，`%.` 匹配 `.` |
|   `%bxy`    | 平衡匹配                            | `%b()`匹配`()` 内的内容      |
|             |                                     |                              |
| `[]`、`[^]` | 包含\|不包含 中括号中的字符         |                              |
|     `*`     | 【数量】0 ~ n                       |                              |
|     `+`     | 【数量】1 ~ n                       |                              |
|     `-`     | 【数量】0 ~ n，**匹配尽可能短的串** |                              |
|     `?`     | 【数量】0 ~ 1                       |                              |
|             |                                     |                              |
|    `%p`     | 标点符号                            |                              |
|    `%x`     | 16 进制                             |                              |



## 平衡匹配

```lua
html = [[
<!DOCTYPE html>
<html>
  <head>
    <title>tttt</title>
  </head>
  <body>
  </body>
<html>
]]

for word in string.gmatch(html, "%b<>") do
    print(word)
end

-- > 所有的标签

log = [[
 127.0.0.1 - - [07/Jun/2020:00:28:06 +0800] "GET / HTTP/1.1" 200 2277 "http://bbs.sdbeta.com/read-htm-tid-572414.html" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36 Edg/83.0.478.45"
]]

for word in string.gmatch(log, "%b[]") do
    print(word)
end

-- > [07/Jun/2020:00:28:06 +0800]
```







## Read More

- [Lua 的字符串匹配与正则表达式](https://www.cnblogs.com/meamin9/p/4502461.html)
- [OpenResty最佳实践](https://legacy.gitbook.com/book/moonbingbing/openresty-best-practices) > [正则表达式](https://moonbingbing.gitbooks.io/openresty-best-practices/content/lua/re.html)