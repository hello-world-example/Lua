# 时间相关



## os.date

> [os.date()](https://www.runoob.com/manual/lua53doc/manual.html#pdf-os.date)

```lua
-- Mon Sep 21 00:36:54 2020，
print(os.date())

local timeTable = os.date("*t")
for k, v in pairs(timeTable) do
    print(k, v)
end
```





## Read More

- 
- [os.time()](https://www.runoob.com/manual/lua53doc/manual.html#pdf-os.time)
- [os.difftime()](https://www.runoob.com/manual/lua53doc/manual.html#pdf-os.difftime)
- [os.clock()](https://www.runoob.com/manual/lua53doc/manual.html#pdf-os.clock)

