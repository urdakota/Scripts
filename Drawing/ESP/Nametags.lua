for i,v in pairs(game.Players:GetChildren()) do
 if v ~= game.Players.LocalPlayer then
  local name = Drawing.new("Text")name.Text = v.Name; name.Center = true;
  game:GetService("RunService").RenderStepped:Connect(function()
   if v  == nil or v.Character == nil or v.Character:FindFirstChild("Head") == nil then
    name:remove();
   end
   local p,v = workspace.CurrentCamera:WorldToScreenPoint(v.Character:FindFirstChild("Head").CFrame.p)
   name.Visible = v;
   name.Position = Vector2.new(p.X,p.Y)
  end)
 end
end
