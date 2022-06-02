getgenv().walkSpeed = 36

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local W, A, S, D, Space
local xVelo, yVelo

RS.RenderStepped:Connect(function()
   local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
   local C = game.Workspace.CurrentCamera
   local LV = C.CFrame.LookVector
   for i,v in pairs(UIS:GetKeysPressed()) do
       if v.KeyCode == Enum.KeyCode.W then
           W = true
       end
       if v.KeyCode == Enum.KeyCode.A then
           A = true
       end
       if v.KeyCode == Enum.KeyCode.S then
           S = true
       end
       if v.KeyCode == Enum.KeyCode.D then
           D = true
       end
       if v.KeyCode == Enum.KeyCode.Space then
           Space = true
       end
   end

   if W == true and S == true then
       yVelo = false
       W,S = nil
   end

   if A == true and D == true then
       xVelo = false
       A,D = nil
   end

   if yVelo ~= false then
       if W == true then
           if xVelo ~= false then
               if A == true then
                   local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                   HRP.Velocity = Vector3.new((LeftLV.X * getgenv().walkSpeed), HRP.Velocity.Y, (LeftLV.Z * getgenv().walkSpeed))
                   W,A = nil
               else
                   if D == true then
                       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                       HRP.Velocity = Vector3.new((RightLV.X * getgenv().walkSpeed), HRP.Velocity.Y, (RightLV.Z * getgenv().walkSpeed))
                       W,D = nil
                   end
               end
           end
       else
           if S == true then
               if xVelo ~= false then
                   if A == true then
                       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                       HRP.Velocity = Vector3.new((LeftLV.X * getgenv().walkSpeed), HRP.Velocity.Y, (LeftLV.Z * getgenv().walkSpeed))
                       S,A = nil
                   else
                       if D == true then
                           local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                           HRP.Velocity = Vector3.new((RightLV.X * getgenv().walkSpeed), HRP.Velocity.Y, (RightLV.Z * getgenv().walkSpeed))
                           S,D = nil
                       end
                   end
               end
           end
       end
   end

   if W == true then
        HRP.Velocity = Vector3.new((LV.X * getgenv().walkSpeed), HRP.Velocity.Y, (LV.Z * getgenv().walkSpeed))
        HRP.Anchored = false;
   end
   if S == true then
        HRP.Velocity = Vector3.new(-(LV.X * getgenv().walkSpeed), HRP.Velocity.Y, -(LV.Z * getgenv().walkSpeed))
        HRP.Anchored = false;
   end
   if A == true then
        local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
        HRP.Velocity = Vector3.new((LeftLV.X * getgenv().walkSpeed), HRP.Velocity.Y, (LeftLV.Z * getgenv().walkSpeed))
        HRP.Anchored = false;
   end
   if D == true then
        local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
        HRP.Velocity = Vector3.new((RightLV.X * getgenv().walkSpeed), HRP.Velocity.Y, (RightLV.Z * getgenv().walkSpeed))
        HRP.Anchored = false;
   end
   if Space == true then
       HRP.Velocity = Vector3.new(HRP.Velocity.X,20,HRP.Velocity.Z)
       Space = false;
   end
   if W == false and A == false and S == false and D == false then
        HRP.Velocity = Vector3.new(0,0,0)
        HRP.RotVelocity = Vector3.new(0,0,0)
   end

   xVelo, yVelo, W, A, S, D = nil
end)
