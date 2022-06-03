for i,v in pairs(workspace.Checkouts:GetChildren()) do
    if #v.Items:GetChildren() > 0 then
        for x,d in pairs(v.Items:GetChildren()) do
            if d:WaitForChild("Root") and d:FindFirstChild("Root"):WaitForChild("Scan") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = d.Root.CFrame + Vector3.new(0,2.5,0)
                wait(2.5)
                repeat wait() until d == nil or d.Root.Scan.Enabled
                fireproximityprompt(d.Root.Scan);
                wait(1.8)
            end
        end
    end
    v.Items.ChildAdded:Connect(function(item)
        if item:WaitForChild("Root") and item:FindFirstChild("Root"):WaitForChild("Scan") then
            repeat 
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = item.Root.CFrame + Vector3.new(0,2.5,0)
                wait(2.5)
                if item and item:WaitForChild("Root") and item:FindFirstChild("Root"):WaitForChild("Scan") and item.Root.Scan.Enabled then
                    fireproximityprompt(item:FindFirstChild("Root"):WaitForChild("Scan"))
                    wait(1.8)
                end
            until item == nil 
        end
   end)
end
