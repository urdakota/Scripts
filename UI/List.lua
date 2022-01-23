-- This is a module by SlaxxF / Dakota(urDakota)

function create(class, properties)
	local inst = Instance.new(class)
	for property, value in pairs(properties) do
		inst[property] = value
	end
	return inst
end
  
  local base = create("ScreenGui",{
    Parent = game.CoreGui
  })
	List1 = create("Frame",{
		Name = "List";
		Parent = base;
		BackgroundTransparency = 0.9;
		Position = UDim2.new(1,-200,0,40);
		Size = UDim2.new(0,200,0,460)
	})
	List2 = create("UIListLayout",{
		Name = "UIListLayout";
		Parent = List1;
		FillDirection = "Vertical";
		HorizontalAlignment = "Right";
		SortOrder = "LayoutOrder"
	})
  
function List(name,enabled)
	local Lister = {}

	local text = create("TextLabel",{
		Parent = List1;
		BackgroundTransparency = 1;
		BorderSizePixel = 0;
		TextColor3 = Color3.fromRGB(170,170,170);
		Size = UDim2.new(0,game:GetService('TextService'):GetTextSize(name, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+8,0,20);
		Text = name;
		Name = name;
		TextSize = 20;
		TextXAlignment = "Right";
		Visible = enabled;
		Font = Enum.Font.SourceSansSemibold
	})
	local side = create("Frame",{
		Parent = text;
		Name = "side";
		BorderSizePixel = 0;
		Position = UDim2.new(0,0,0,0);
		BackgroundColor3 = Color3.fromRGB(170,0,0);
		Size = UDim2.new(0,2,1,0)
	})
	local bottom = create("Frame",{
		Parent = text;
		Name = "bottom";
		BackgroundColor3 = Color3.fromRGB(170,0,0);
		Size = UDim2.new(0,0,0,2);
		BorderSizePixel = 0;
		Position = UDim2.new(0,0,1,0)
	})

	local l = {}
	for i,v in pairs(List1:GetChildren()) do
		if v:IsA("TextLabel") and v.Visible then
			table.insert(l,v)
		end
	end

	table.sort(l,function(a,b) return game:GetService('TextService'):GetTextSize(a.Text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+8 > game:GetService('TextService'):GetTextSize(b.Text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+8 end)


	for i,v in pairs(l) do
		v.LayoutOrder = i
		if l[i+1] == nil then
			v.bottom.Size = UDim2.new(1,0,0,2)
		else
			v.bottom.Size = UDim2.new(0,v.Size.X.Offset-l[i+1].Size.X.Offset,0,2)
		end
	end

	function Lister:Set(arg)
		if type(arg) == "boolean" then
			text.Visible = arg;
		else
			text.Text = arg;
			text.Size = UDim2.new(0,game:GetService('TextService'):GetTextSize(arg, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+8,0,20);
			text.Name = arg;
		end

		local l = {}
		for i,v in pairs(List1:GetChildren()) do
			if v:IsA("TextLabel") and v.Visible then
				table.insert(l,v)
			end
		end

		table.sort(l,function(a,b) return game:GetService('TextService'):GetTextSize(a.Text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+8 > game:GetService('TextService'):GetTextSize(b.Text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, math.huge)).X+8 end)


		for i,v in pairs(l) do
			v.LayoutOrder = i
			if l[i+1] == nil then
				v.bottom.Size = UDim2.new(1,0,0,2)
			else
				v.bottom.Size = UDim2.new(0,v.Size.X.Offset-l[i+1].Size.X.Offset,0,2)
			end
		end
	end

	return Lister;
end
