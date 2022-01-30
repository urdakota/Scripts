-- Entirely in drawing lib!
local Size = workspace.CurrentCamera.ViewportSize - Vector2.new(5,30)
local lasty = 40;
local texts = {};
function List(name,enabled)
	local Lister = {}
    
    Lister.text = Drawing.new("Text");
    Lister.text.Text = name;
	Lister.text.Size = 20;
	Lister.text.Center = false;
	Lister.text.Outline = true;
	Lister.text.Color = Color3.fromRGB(170,170,170);
	Lister.text.Font = 2;
	Lister.text.Visible = enabled;
	Lister.text.Position = Vector2.new(Size.X - Lister.text.TextBounds.X, lasty + Lister.text.TextBounds.Y);
	
    Lister.side = Drawing.new("Line");
	Lister.side.Thickness = 2;
	Lister.side.From = Vector2.new(Size.X - Lister.text.TextBounds.X - 4,(lasty+(Lister.text.TextBounds.Y)) + Lister.text.TextBounds.Y);
	Lister.side.To = Vector2.new(Size.X - Lister.text.TextBounds.X - 4,(lasty+(Lister.text.TextBounds.Y)) + Lister.text.TextBounds.Y*2);
	Lister.side.Visible = enabled;
	
    Lister.bottom = Drawing.new("Line");
	Lister.bottom.Thickness = 2;
	Lister.bottom.From = Vector2.new(Size.X - Lister.text.TextBounds.X - 4,(lasty+(Lister.text.TextBounds.Y)) + Lister.text.TextBounds.Y*2);
	Lister.bottom.To = Vector2.new(Size.X,(40+(Lister.text.TextBounds.Y)) + Lister.text.TextBounds.Y*2);
	Lister.bottom.Visible = enabled;
	
	table.insert(texts,Lister);
	
	local n = {};
	
	for i,v in pairs(texts) do
	 if v.text.Visible then
	  table.insert(n,v);
	 end
	end
    
	table.sort(n,function(a,b) return game:GetService('TextService'):GetTextSize(a.text.Text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+4 > game:GetService('TextService'):GetTextSize(b.text.Text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+4 end)
    lasty = 40;
    for i,v in pairs(n) do
     v.text.Position = Vector2.new(Size.X - v.text.TextBounds.X, lasty + v.text.TextBounds.Y);
     v.side.From = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)));
	 v.side.To = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)) + v.text.TextBounds.Y);
	 v.bottom.From = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)) + v.text.TextBounds.Y);
	 if n[i+1] ~= nil then
	  v.bottom.To = Vector2.new(Size.X - n[i+1].text.TextBounds.X - 4,(lasty+v.text.TextBounds.Y) + v.text.TextBounds.Y);
     else
      v.bottom.To = Vector2.new(Size.X,(lasty+v.text.TextBounds.Y) + v.text.TextBounds.Y);
     end
     lasty = lasty + v.text.TextBounds.Y
    end
    
	function Lister:Set(arg)
		if type(arg) == "boolean" then
			Lister.text.Visible = arg;
			Lister.side.Visible = arg;
			Lister.bottom.Visible=arg;
		else
			Lister.text.Text = arg;
		end

		local n = {};
    	
    	for i,v in pairs(texts) do
    	 if v.text.Visible then
    	  table.insert(n,v);
    	 end
    	end
        
    	table.sort(n,function(a,b) return game:GetService('TextService'):GetTextSize(a.text.Text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+4 > game:GetService('TextService'):GetTextSize(b.text.Text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+4 end)
        lasty = 40;
        for i,v in pairs(n) do
         v.text.Position = Vector2.new(Size.X - v.text.TextBounds.X, lasty + v.text.TextBounds.Y);
         v.side.From = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)));
    	 v.side.To = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)) + v.text.TextBounds.Y);
    	 v.bottom.From = Vector2.new(Size.X - v.text.TextBounds.X - 4,(lasty+(v.text.TextBounds.Y)) + v.text.TextBounds.Y);
    	 if n[i+1] ~= nil then
    	  v.bottom.To = Vector2.new(Size.X - n[i+1].text.TextBounds.X - 4,(lasty+v.text.TextBounds.Y) + v.text.TextBounds.Y);
         else
          v.bottom.To = Vector2.new(Size.X,(lasty+v.text.TextBounds.Y) + v.text.TextBounds.Y);
         end
         lasty = lasty + v.text.TextBounds.Y
        end
	end

	return Lister;
end

--[[ Benchmarking IG
local list = {}; -- Put stuff in it like {"Aimbot","AimAssist","Aura"};

function RandomVariable(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

local listtbl = {}
for i,v in pairs(list) do
    listtbl[v] = List(v,true);
end  
while wait(math.random(1,3)) do
    for i,v in pairs(listtbl) do
        v:Set(RandomVariable(math.random(1,27))); -- changes name
        v:Set(math.random(1,27) % 2 == 0); -- sets on if it is even, sets off if odd
    end
end

]]-- End of benchmark
