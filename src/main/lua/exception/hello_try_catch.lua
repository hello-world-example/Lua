function fun(t)
    return t.data * t.data
end

local result = fun { data = 3 }

print(result)