local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
holder.Name = "ESPHolder"
holder.Parent = game.CoreGui

local Objectivesholder = game.CoreGui:FindFirstChild("Objectivesholder") or Instance.new("Folder")
local Downedholder = game.CoreGui:FindFirstChild("Downedholder") or Instance.new("Folder")
Objectivesholder.Name = "Objectivesholder"
Objectivesholder.Parent = game.CoreGui
Downedholder.Name = "Downedholder"
Downedholder.Parent = game.CoreGui

game:GetService("RunService").RenderStepped:Connect(function()
    if game:GetService("Workspace").Game.Map and game:GetService("Workspace").Game.Map:FindFirstChild("Parts") and game:GetService("Workspace").Game.Map.Parts:FindFirstChild("Objectives") and not ((#Objectivesholder:GetChildren()) > 0) then
        for i,v in pairs(game:GetService("Workspace").Game.Map.Parts.Objectives:GetChildren()) do
            if v.Name ~= "Opener" then
                local esp = Instance.new("Highlight")
                esp.Name = v.Name .. "esp"
                esp.Parent = Objectivesholder
                esp.FillColor = Color3.fromRGB(255,125,125)
                esp.OutlineColor = Color3.fromRGB(255,255,255)    
                esp.FillTransparency = 0
                esp.OutlineTransparency = 0.5
                esp.Adornee = v.PrimaryPart
                esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            end
        end
    end
end)
