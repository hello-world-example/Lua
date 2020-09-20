function fun(a, b)
    if b == 0 then
        error("错误原因 " .. a .. "/0")
    end
    return a / b
end

function catch(errorMsg)
    print("catch " .. errorMsg)
    print(debug.traceback())
    return "new" .. errorMsg
end

print(xpcall(fun, catch, 1, 1))
print(xpcall(fun, catch, 1, 0))
