shape = { height = 4, width = 4 }
setmetatable(shape, { __tostring = function(my)
    return "height:" .. my.height .. ",width:" .. my.width
end })

function shape.setWidth(shape, width)
    shape.width = width
end

function shape:setHeight(height)
    self.height = height
end

-- 传入自己
shape.setHeight(shape, 40)
-- 【.方式 调用 :方法】传入自己
shape.setWidth(shape, 40)
-- height:40,width:40
print(shape)

-- 【:方式 调用 .方法】无需传入自己
shape:setHeight(60)
-- 无需传入自己
shape:setWidth(60)
-- height:60,width:60
print(shape)
