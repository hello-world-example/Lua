-- 定义一个名为 module 的模块
module = {}
 
-- 
local function module.sayHello()
    print("Hello World")
end
 
--
function module.say(some)
    print(some)
end
 
return module
