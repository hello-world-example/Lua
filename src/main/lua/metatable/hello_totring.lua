---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by kail.
--- DateTime: 2020/12/1 10:58
---

-- metatable
local meta_tostring = {
    __tostring = function(my_table)
        local tostring = "{"
        for k, v in pairs(my_table) do
            tostring = tostring .. k .. "=" .. v .. ", "
        end
        return tostring .. "}";
    end
}

-- 原始 table
local my_table = { name = "kai", nick = "kailbin" }
print(my_table)

setmetatable(my_table, meta_tostring)
print(my_table)