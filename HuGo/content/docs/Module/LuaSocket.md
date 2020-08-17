# LuaSocket 网络工具



## 安装

```bash
$ sudo luarocks install luasocket

$ /usr/local/lib/lua/5.3/socket
core.so
serial.so
unix.so
```



## SMTP 邮件

### 简单文本邮件

```lua
local smtp = require("socket.smtp")

local from = "noreply@kail.xyz"
result, ex = smtp.send {
    server = "smtp.exmail.qq.com",
    user = from,
    password = "xxxx",

    from = from,
    rcpt = { "admin@kail.xyz" },

    source = smtp.message({
        headers = {
            from = "发件人信息 <" .. from .. ">",
            to = "admin@kail.xyz",
            cc = "假的抄送<假的邮箱@example.com>",
            subject = "My first message"
        },
        body = "If it does, <span style='color:red'>I can send you another 1000 copies.<span>"
    })
}

if not result then
    print("error ", ex)
else
    print("send ok!", result)
end
```

### HTML 邮件

```lua
source = smtp.message({
    headers = { ...  },
    body = {
      [1] = {
        headers = {
          ["content-type"] = 'text/html; charset="UTF-8"',
        },
        body = "If it does, <span style='color:red'>I can send you another 1000 copies.<span>"
      }
    }
  })
```



## HTTP 请求

### Simple Get

```lua
local http = require("socket.http")

local resp_body, status, headers, line = http.request("http://httpbin.org/anything")
print(status)
print(line)
for name, value in pairs(headers) do
    print(name, value)
end
print()
print(resp_body)
```

## POST

```lua
local http = require("socket.http")
local ltn12 = require("ltn12")

local response_body = {  }
local resp, status, headers, line = http.request {
    method = "POST",
    url = "http://httpbin.org/anything",
    sink = ltn12.sink.table(response_body)
}

print(status)
print(line)
for name, value in pairs(headers) do
    print(name, value)
end
print(resp)
print(response_body[1])
```





## Read More

- [LuaSocket 官网](http://w3.impa.br/~diego/software/luasocket/)
- [LuaSocket Reference](http://w3.impa.br/~diego/software/luasocket/reference.html)
  - [HTTP](http://w3.impa.br/~diego/software/luasocket/http.html) / [TCP](http://w3.impa.br/~diego/software/luasocket/tcp.html) / [SMTP](http://w3.impa.br/~diego/software/luasocket/smtp.html) / [DNS](http://w3.impa.br/~diego/software/luasocket/dns.html) / [URL](http://w3.impa.br/~diego/software/luasocket/url.html)
- [diegonehab / luasocket](https://github.com/diegonehab/luasocket)