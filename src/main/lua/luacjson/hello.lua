---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by kail.
--- DateTime: 2020/8/17 19:07
---

local cjson = require("cjson")

-- http://www.httpbin.org/anything?a=hello
local jsonStr = [[

{
    "args":{
        "a":[
            "hello",
            "world"
        ]
    },
    "data":"",
    "files":{

    },
    "form":{

    },
    "headers":{
        "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "Accept-Encoding":"gzip, deflate",
        "Accept-Language":"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,en-GB;q=0.6",
        "Host":"www.httpbin.org",
        "Upgrade-Insecure-Requests":"1",
        "User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36 Edg/84.0.522.52",
        "X-Amzn-Trace-Id":"Root=1-5f3b3468-38fb294e59c498c75f604824"
    },
    "json":null,
    "method":"GET",
    "origin":"180.169.35.130",
    "url":"http://www.httpbin.org/anything?a=hello&a=world"
}

]]
---
---
--- 反序列化
local jsonTable = cjson.decode(jsonStr)
print(jsonTable["method"])
print(jsonTable.url)
print(jsonTable.headers.Host)
if "table" == type(jsonTable.args.a) then
    for i, v in pairs(jsonTable.args.a) do
        print("a=" .. v)
    end
else
    print("a=" .. jsonTable.args.a)
end

---
---
--- 序列化
local json = cjson.encode(jsonTable)
print(json)

