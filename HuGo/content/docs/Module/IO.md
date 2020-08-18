# I/O 模块



## 概述

- `io.xxx` 隐式文件句柄
- `file:xxx` 操作文件句柄
- `local file = io.open(filename [, mode])` 会返回一个文件句柄
- 预定义文件句柄： `io.stdin`， `io.stdout`、 `io.stderr`
- 返回值
  - [1]： 出错时为 `nil`
  - [2]： 错误消息
  - [3]： 系统相关的错误码



## API

|                                       |                                                              |      |
| ------------------------------------- | ------------------------------------------------------------ | ---- |
| `file = io.open(filename [, mode])`   | - `r` 读<br />- `w` 写<br />- `a` 追加<br />- `r+` 更新模式，保留数据<br />- `w+` 更新模式，删除数据<br />- `a+` 追加，只允许在末尾追加<br />- `b` 以二进制方式打开文件 |      |
| `file = io.tmpfile()`                 | 临时文集句柄，程序结束时会自动删除                           |      |
|                                       |                                                              |      |
| `file:write(...)`                     | 写入文件                                                     |      |
| `file:flush ()`                       | flush 写入内容                                               |      |
| `file:close ()` / `io.close ([file])` | 关闭 file                                                    |      |
|                                       |                                                              |      |
| `io.type (file)`                      | 检查文件句柄状态<br />- `"file"` 是打开的文件句柄<br />- `"closed file"` 文件句柄已关闭<br />- `nil` 不是文件句柄 |      |
| `io.write (···)`                      | 类似于 `print(...)`                                          |      |
| `io.read (···)`                       | 读取控制台上输入                                             |      |
|                                       |                                                              |      |
| `io.lines([filename ···])`            | 按行读取文件                                                 |      |



## Read More

- [6.8 – 输入输出库](https://www.runoob.com/manual/lua53doc/manual.html#6.8)

