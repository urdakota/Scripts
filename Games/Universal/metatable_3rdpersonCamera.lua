local distance = 8

local mt = getrawmetatable(game)
local newindex = mt.__newindex
local camera = game:GetService("Workspace").CurrentCamera

setreadonly(mt, false)

mt.__newindex = newcclosure(function(obj, prop, val)
if prop == "CoordinateFrame" and obj == camera then
val = val + val.LookVector * -distance
end

return newindex(obj, prop, val)
end)
