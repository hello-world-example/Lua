local t1 = { 1, 2, 3 }
local t2 = { "a", 2, 3, 7 }

for i, v in pairs(t2) do
    t1[#t1 + 1] = v
end

for i, v in pairs(t1) do
    print(i, v)
end

