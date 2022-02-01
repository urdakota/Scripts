for i,v in pairs(workspace:GetChildren()) do

 if(v:IsA("Model") and game.Players:FindFirstChild(v.Name) and game.Players:FindFirstChild(v.Name) ~= game.Players.LocalPlayer then

  local camera = workspace.CurrentCamera

  local toview = camera:WorldToViewPortpoint

  local name = Drawing.new("Text")  name.Text = v.Name;

  spawn(function() while wait() do pcall(function() 

   if v:FindFirstChild("Head") == nil or v == nil then

    name:remove();

   end

   name.Position = toview(camera,v.Head.Position)

  end) end end)  

 end

end
