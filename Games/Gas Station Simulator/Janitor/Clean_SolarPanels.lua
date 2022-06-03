if workspace.Solar:FindFirstChild("Panels") and #workspace.Solar.Panels:GetChildren() > 0 then
  for i,v in pairs(workspace.Solar.Panels:GetChildren()) do
      if v.Stand.CleanPosition.Clean.Enabled then
         fireproximityprompt(v.Stand.CleanPosition.Clean)
      end
   end
end
