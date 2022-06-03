getgenv().BuyFuel = (...)

for ib,car in pairs(workspace:GetChildren()) do
   if string.find(car.Name,"Car_") then
      if car:FindFirstChild("Lid") and car:FindFirstChild("Lid"):FindFirstChild("Refuel") then
         if (tonumber(string.sub(car.Root.Pump.Value.Screen.FuelUI.Storage.Text, 1, -2)) > tonumber(string.sub(car.Lid:FindFirstChild("Refuel").ObjectText,7,-2))) then
            fireproximityprompt(car.Lid:FindFirstChild("Refuel"))
        end
      end
   end
end
