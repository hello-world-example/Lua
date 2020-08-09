---
--- local StringUtil = require("StringUtil")
--- Created by kail.
--- DateTime: 2020/8/9 22:21
---

local StringUtil = {}

---
--- 字符串切割
---
function StringUtil.split(str, reps)
    local result = {}
    string.gsub(str, '[^' .. reps .. ']+',
            function(w)
                table.insert(result, w)
            end
    )
    return result
end

---
---
return StringUtil