---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by kail.
--- DateTime: 2020/8/9 18:06
---

local html = [[
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

local log = [[
 127.0.0.1 - - [07/Jun/2020:00:28:06 +0800] "GET / HTTP/1.1" 200 2277 "http://bbs.sdbeta.com/read-htm-tid-572414.html" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36 Edg/83.0.478.45"
]]

for word in string.gmatch(log, "%b[]") do
    print(word)
end

print("string.match")
print(string.match("[07/Jun/2020:00:28:06 +0800]", "%[(.+)/(.+)%]"))
