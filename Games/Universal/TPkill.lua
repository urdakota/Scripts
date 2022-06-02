--[ Settings ]
local target = "DisplayName (CAN BE SHORTENED)"
getgenv().Anchored = true; --[ IF the target should be anchored ]
getgenv().Stop = false; --[ Cancel the script ]

--[ SCRIPT ]
local save = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
repeat
        local attack = nil
        for i,v in pairs(game.Players:GetPlayers()) do
            if string.find(v.DisplayName, target) then
                attack = v
            end
        end
        if attack and attack.Character then
            if getgenv().Anchored then
                attack.Character.HumanoidRootPart.Anchored = true;
            end
            attack.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2.5
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = attack.Character.HumanoidRootPart.CFrame + attack.Character.HumanoidRootPart.CFrame.LookVector * -2.5
        end
        game:GetService("RunService").RenderStepped:Wait()
until getgenv().Stop or attack == nil or attack.Character == nil or attack.Character.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or game.Players.LocalPlayer.Character == nil
if attack.Character and attack.Character:FindFirstChild("HumanoidRootPart") ~= nil then
    attack.Character.HumanoidRootPart.Anchored = false;
end
if game.Players.LocalPlayer.Character ~= nil then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = save
end
