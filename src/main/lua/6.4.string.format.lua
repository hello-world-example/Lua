---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by kail.
--- DateTime: 2020/8/9 17:25
---


print(string.format("%+5i,%+5i", 1, -1))   --    +1,   -1
print(string.format("%05i,%05i", 1, -1))   -- 00001,-0001
print(string.format("%+05i,%+05i", 1, -1)) -- +0001,-0001
print(string.format("%5s:%5s", 1, 2))      --     1:    2
print(string.format("%-5s:%5s", 1, 2))     -- 1    :    2