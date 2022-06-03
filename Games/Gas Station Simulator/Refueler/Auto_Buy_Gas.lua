for ib,car in pairs(workspace:GetChildren()) do
   if string.find(car.Name,"Car_") then
      if car:FindFirstChild("Lid") and car:FindFirstChild("Lid"):FindFirstChild("Refuel") then
         if (tonumber(string.sub(car.Root.Pump.Value.Screen.FuelUI.Storage.Text, 1, -2)) < tonumber(string.sub(car.Lid:FindFirstChild("Refuel").ObjectText,7,-2))) then
            game:GetService("ReplicatedStorage").Remote:FireServer("BuyItem", "Syntin Petrol Co", "Gasoline 87", 1, "Station")
           end
        end
      end
    end
  end
