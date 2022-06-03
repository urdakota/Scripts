if workspace:FindFirstChild("Spot") then
    for i,v in pairs(workspace:GetChildren()) do
        if v.Name == "Spot" then
            local ohString1 = "Clean"
            local ohInstance2 = v.Clean
            game:GetService("ReplicatedStorage").Remote:FireServer(ohString1, ohInstance2)
        end
    end
end
