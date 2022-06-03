for ib,car in pairs(workspace:GetChildren()) do
   if string.find(car.Name,"Car_") then
      if car:FindFirstChild("Lid") and car.Lid:FindFirstChild("FinishFuel") then
        fireproximityprompt(car.Lid:FindFirstChild("FinishFuel"))
      end
   end
end
