while wait(1) do
    if workspace:FindFirstChild("Game") and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and workspace:FindFirstChild("Game"):FindFirstChild("Effects") and workspace:FindFirstChild("Game"):FindFirstChild("Effects"):FindFirstChild("Tickets") then
        for i,v in pairs(workspace:FindFirstChild("Game"):FindFirstChild("Effects"):FindFirstChild("Tickets"):GetChildren()) do
            if v.PrimaryPart then
                local esp = v:FindFirstChild("ESP") or Instance.new("Highlight")
                esp.Name = "ESP"
                esp.Parent = v
                esp.FillColor = Color3.fromRGB(255,125,125)
                esp.OutlineColor = Color3.fromRGB(255,255,255)    
                esp.FillTransparency = 0.5
                esp.OutlineTransparency = 0.5
                esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                local save = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                local oldve = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Velocity
                repeat
                save = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
                oldve = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Velocity
                if v and v.PrimaryPart then 
                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = v.PrimaryPart.CFrame
                else
                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = save
                end 
                task.wait() 
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = save
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Velocity = oldve
                until v == nil or (v and v.PrimaryPart == nil) or game.Players.LocalPlayer.Character == nil or game.Players.LocalPlayer.Character:FindFirstChild("StatChanges") == nil or (game.Players.LocalPlayer.Character:FindFirstChild("StatChanges"):FindFirstChild("Speed") and  game.Players.LocalPlayer.Character:FindFirstChild("StatChanges"):FindFirstChild("Speed"):FindFirstChild("Downed"))
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = save
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Velocity = oldve
            end
        end
    end
    wait()
end
