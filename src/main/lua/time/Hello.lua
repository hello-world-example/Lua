-- Mon Sep 21 00:34:34 CST 2020
-- Mon Sep 21 00:34:42 2020
print(os.date())

local timeTable = os.date("*t")
for k, v in pairs(timeTable) do
    print(k, v)
end