---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by kail.
--- DateTime: 2020/8/12 11:09
---


local ignore_keys = "((SYSTEM)|(ALPINA)|(ARCFOX))"

local source = " asdad sfd ARCFOX fasdfdsf "
local marchString = string.gsub(source, ignore_keys, "")

print(source)
print(marchString)