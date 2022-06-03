
for i,v in pairs(game:GetService("Workspace").Windows:GetChildren()) do
    if v:FindFirstChild("Attachment") and v:FindFirstChild("Attachment"):FindFirstChild("Clean") and v.Sand.Transparency < 0.9 then
        local ohString1 = "Clean"
        local ohInstance2 = v:FindFirstChild("Attachment"):FindFirstChild("Clean")
        
        game:GetService("ReplicatedStorage").Remote:FireServer(ohString1, ohInstance2)
    end
end
