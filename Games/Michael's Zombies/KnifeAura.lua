while true do
   pcall(function()
   wait()
for i,v in next, game:GetService("Workspace").Ignore.Zombies:GetChildren() do
game:GetService("ReplicatedStorage").Framework.Remotes.KnifeHitbox:FireServer(v.Humanoid)
end
end)
end
