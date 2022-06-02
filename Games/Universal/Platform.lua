getgenv().RiseKeyBind = Enum.KeyCode.C
getgenv().StayKeyBind = Enum.KeyCode.X
getgenv().FallKeyBind = Enum.KeyCode.Z
getgenv().offset = -0.179; --[[-0.179 default]]

--[[ DONT EDIT ]]
local speed = 0;
local distance = 0;
local held = false;
local fall = false;
local rise = false;
local char = game.Players.LocalPlayer.Character
function calcdistance()
    local char = game.Players.LocalPlayer.Character
    if char:FindFirstChild("Humanoid").RigType == Enum.HumanoidRigType.R15 then
        if char:FindFirstChild("LeftFoot") then
            distance = (char:FindFirstChild("HumanoidRootPart").Position.Y - char:FindFirstChild("LeftFoot").Position.Y) + char:FindFirstChild("LeftFoot").Size.Y
        elseif char:FindFirstChild("RightFoot") then
            distance = (char:FindFirstChild("HumanoidRootPart").Position.Y - char:FindFirstChild("RightFoot").Position.Y) + char:FindFirstChild("RightFoot").Size.Y
        elseif char:FindFirstChild("LeftLowerLeg") then
            distance = (char:FindFirstChild("HumanoidRootPart").Position.Y - char:FindFirstChild("LeftLowerLeg").Position.Y) + char:FindFirstChild("LeftLowerLeg").Size.Y
        elseif char:FindFirstChild("RightLowerLeg") then
            distance = (char:FindFirstChild("HumanoidRootPart").Position.Y - char:FindFirstChild("RightLowerLeg").Position.Y) + char:FindFirstChild("LeftLowerLeg").Size.Y
        elseif char:FindFirstChild("LeftUpperLeg") then
            distance = (char:FindFirstChild("HumanoidRootPart").Position.Y - char:FindFirstChild("LeftUpperLeg").Position.Y) + char:FindFirstChild("LeftUpperLeg").Size.Y
        elseif char:FindFirstChild("RightUpperLeg") then
            distance = (char:FindFirstChild("HumanoidRootPart").Position.Y - char:FindFirstChild("RightUpperLeg").Position.Y) + char:FindFirstChild("RightUpperLeg").Size.Y
        end
    else
        if char:FindFirstChild("Left Leg") then
            distance = (char:FindFirstChild("HumanoidRootPart").Position.Y - char:FindFirstChild("Left Leg").Position.Y)+ char:FindFirstChild("Left Leg").Size.Y*0.6575
        elseif char:FindFirstChild("Right Leg") then
            distance = (char:FindFirstChild("HumanoidRootPart").Position.Y - char:FindFirstChild("Right Leg").Position.Y)+ char:FindFirstChild("Right Leg").Size.Y*0.6575
        end
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(key,chatting)
    if not chatting and key.KeyCode == StayKeyBind then
        held = true;
        if game.Players.LocalPlayer.Character then
            calcdistance()
        end
    elseif not chatting and key.KeyCode == FallKeyBind then
        fall = true;
        if game.Players.LocalPlayer.Character then
            calcdistance()
        end
    elseif not chatting and key.KeyCode == RiseKeyBind then
        rise = true;
        if game.Players.LocalPlayer.Character then
            calcdistance()
        end
    elseif not chattting and key.KeyCode == Enum.KeyCode.Minus then
        speed = speed - 0.02
    elseif not chatting and key.KeyCode == Enum.KeyCode.Equals then
        speed = speed + 0.02
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(key,chatting)
    if not chatting and key.KeyCode == StayKeyBind then
        held = false;
    elseif not chatting and key.KeyCode == FallKeyBind then
        fall = false;
    elseif not chatting and key.KeyCode == RiseKeyBind then
        rise = false;
    elseif not chatting and (key.KeyCode ~= StayKeyBind and key.KeyCode ~= FallKeyBind and key.KeyCode ~= RiseKeyBind) then
        if workspace:FindFirstChild("platform") ~= nil then
            workspace:FindFirstChild("platform").Position = Vector3.new(0,2500,0)
        end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        char = game.Players.LocalPlayer.Character
        if workspace:FindFirstChild("platform") == nil then
            local platform = Instance.new("Part")
            platform.Name = "platform"
            platform.Parent = workspace;
            platform.Anchored = true;
            platform.CanCollide = true;
            platform.Material = "ForceField";
            platform.Color = Color3.new(1,0,0);
            platform.Size = Vector3.new(5,1,5);
            if held then
                platform.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,(-distance+offset),0)
            elseif rise then
                platform.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,(-distance+offset)*(0.9-speed),0)
            elseif fall then
                platform.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0,(distance-offset)*(1.05+speed),0)
            end
        else
            if held then
                workspace:FindFirstChild("platform").Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,(-distance+offset),0)
            elseif rise then
                workspace:FindFirstChild("platform").Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,(-distance+offset)*(0.9-speed),0)
            elseif fall then
                workspace:FindFirstChild("platform").Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0,(distance-offset)*(1.05+speed),0)
            end
            workspace:FindFirstChild("platform").Velocity = Vector3.new(0,0,0);
            workspace:FindFirstChild("platform").RotVelocity = Vector3.new(0,0,0);
        end
    end
end)
