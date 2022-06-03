while wait(1) do
    local sit = game:GetService("Workspace").Ceilings.Sofa.Seat
    if sit:FindFirstChild("SeatWeld") == nil and tonumber(string.sub(game.Players.LocalPlayer.PlayerGui.GameUI.Stamina.Bar.Amount.Text,1,-2)) < 35 then
        local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
        local oldseat = sit.CFrame
        repeat 
            sit.CFrame = old
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = sit.CFrame
            wait(0.2)
        until game.Players.LocalPlayer.Character.Humanoid.SeatPart == sit
        wait(0.1)
        repeat
            wait()
        until tonumber(string.sub(game.Players.LocalPlayer.PlayerGui.GameUI.Stamina.Bar.Amount.Text,1,-2)) > 80
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
        sit.CFrame = oldseat;
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame  = old;
    end
end
