local concat_func = function(my_tab, new_tab)
    for i, v in pairs(new_tab) do
        my_tab[#my_tab + 1] = v
    end
    return my_tab
end

local my_table = { 1, 2, 3 }
setmetatable(my_table, { __concat = concat_func })
local second_table = { "a", "b", "c" }

my_table = my_table .. second_table

print(table.concat(my_table, ","))
