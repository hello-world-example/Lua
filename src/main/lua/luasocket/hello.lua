local socket = require("socket")
print(socket._VERSION)

for i, v in pairs(socket) do
    print(i, v)
end

print()
print("    SMTP    ")

local smtp = require("socket.smtp")
for i, v in pairs(smtp) do
    print(i, v)
end