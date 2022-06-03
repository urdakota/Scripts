local cooldown = false;
for i,v in pairs(workspace.Checkouts:GetChildren()) do
   if #v.Items:GetChildren() > 0 then
     for x,d in pairs(v.Items:GetChildren()) do
        if d:FindFirstChild("Root") and d.Root:FindFirstChild("Scan") and d.Root:FindFirstChild("Scan").Enabled then 
           fireproximityprompt(d.Root.Scan);
           wait(1);
           wait(2.5);
        end
     end
   end
end
