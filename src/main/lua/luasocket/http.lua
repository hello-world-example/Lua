local http = require("socket.http")
local ltn12 = require("ltn12")

local response_body = {  }
local resp, status, headers, line = http.request {
    method = "POST",
    url = "http://httpbin.org/anything",
    sink = ltn12.sink.table(response_body)
}

print(status)
print(line)
for name, value in pairs(headers) do
    print(name, value)
end
print(resp)
print(response_body[1])

--
--
--
--local resp_body, status, headers, line = http.request("http://httpbin.org/anything")
--print(status)
--print(line)
--for name, value in pairs(headers) do
--    print(name, value)
--end
--print()
--print(resp_body)




