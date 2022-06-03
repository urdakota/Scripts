for i,v in pairs(game:GetService("Workspace").Interior:GetChildren()) do
    if v:FindFirstChild("monitor02") and v:FindFirstChild("monitor02"):FindFirstChild("OpenShop") then
        fireproximityprompt(v.monitor02.OpenShop)
    end
end
