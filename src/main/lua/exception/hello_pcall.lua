function fun(a, b)
    if b == 0 then
        error("错误原因 " .. a .. "/0")
    end
    return a / b
end

print(pcall(fun, 1, 1))
print(pcall(fun, 1, 0))
