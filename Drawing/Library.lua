local drawLib = {};

-- Variables
 local cam = workspace.CurrentCamera;
 local ScreenSize = cam.ViewportSize;
 local UDim2Vector = function(udim)
  return Vector2.new((ScreenSize.X * udim.X.Scale) + udim.X.Offset,(ScreenSize.Y * udim.Y.Scale) + udim.Y.Offset)
 end;
 function mouseOver(Values)
  local X1, Y1, X2, Y2 = Values[1], Values[2], Values[3], Values[4]
  local ml = game:GetService("UserInputService"):GetMouseLocation()
  return (ml.x >= X1 and ml.x <= (X1 + (X2 - X1))) and (ml.y >= Y1 and ml.y <= (Y1 + (Y2 - Y1)))
 end
 function over(obj)
  if typeof(obj.Size) == "number" then
   return obj.Visible == true and mouseOver({obj.Position.X- obj.Size/2,obj.Position.Y,obj.Position.X + obj.Size/2,obj.Position.Y + obj.Size})
  else
   return obj.Visible == true and mouseOver({obj.Position.X,obj.Position.Y,obj.Position.X + obj.Size.X,obj.Position.Y + obj.Size.Y})
  end
 end
 function overpoint(obj)
  return obj.Visible == true and mouseOver({obj.PointB.X,obj.PointB.Y,obj.PointD.X, obj.PointD.Y})
 end
 game:GetService("RunService").RenderStepped:Connect(function()
  ScreenSize = cam.ViewportSize;
  UDim2Vector = function(udim)
   return Vector2.new((ScreenSize.X * udim.X.Scale) + udim.X.Offset,(ScreenSize.Y * udim.Y.Scale) + udim.Y.Offset)
  end;
 end)
-- Drawing
function drawLib:Line(Args)
 local line,lineObj = {}, Drawing.new("Line");
 -- Set Defaults
  lineObj.From = UDim2Vector(UDim2.new(0.5,0,0,0));
  lineObj.To = UDim2Vector(UDim2.new(0.5,0,0.5,0));
  lineObj.Color = Color3.new(1,1,1);
  lineObj.Visible = true;
  lineObj.Transparency = 0.5;
  lineObj.ZIndex = 1;
  lineObj.Thickness = 2;
 --[[ INSTRUCTIONS FOR PROPERTIES OF LINE
  From: From Point (UDim2/Vector2);
  To: To Point (UDim2/Vector2);
  Color: Color of Line (Color3);
  Visible: If Line is Shown;
  Transparency: Line's Transparency;
  ZIndex: Line's Position above screen objects;
  Thickness: Thickness in pixels of line;
 ]]
 setmetatable(line, {
  __index = function(Table, Key)
    -- Thanks synapse Source!!!
   if not rawget(lineObj, "__OBJECT_EXISTS") then error("render object destroyed") end

   if K == "Destroy" then 
    return newcclosure(function() 
     destroyrenderobject(lineObj)
     rawset(lineObj, "__OBJECT", nil) 
     rawset(lineObj, "__OBJECT_EXISTS", false)
    end) 
   end

   return getrenderproperty(lineObj, Key)
  end,
  __newindex = function(self,key,value) 
   if tostring(key):lower() == "from" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    lineObj["From"] = value;
   elseif tostring(key):lower() == "to" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    lineObj["To"] = value;
   else
    lineObj[key] = value;
   end
   return lineObj[key];
  end
 })
 -- Update Line with base properties
  for i,v in pairs(Args) do
   if table.find({"From","To","Color","Visible","Transparency","ZIndex","Thickness"},i) then
    line[i] = v;
   end
  end
 return line;
end
function drawLib:Text(Args)
 local text,textObj = {}, Drawing.new("Text");
 -- Set Defaults
  textObj.Text = "TextLabel";
  textObj.Size = 20;
  textObj.Position = UDim2Vector(UDim2.new(0.5,0,0.5,0));
  textObj.Font = 0;
  textObj.Center = false;
  textObj.Outline = true;
  textObj.OutlineColor = Color3.new(0,0,0);
  textObj.Color = Color3.new(1,1,1);
  textObj.Visible = true;
  textObj.Transparency = 0.5;
  textObj.ZIndex = 1;
 --[[ INSTRUCTIONS FOR PROPERTIES OF TEXT
  Text: Text of Text Drawing;
  Size: TextSize
  Position: Position of TextL (UDim2/Vector2);
  Font: Font of text (0-3);
  Center: If Text is centered;
  Outline: If Text is outlined;
  OutlineColor: Color of Outline (Color3);
  Color: Color of Text (Color3);
  Visible: If Text is Shown;
  Transparency: Text's Transparency;
  ZIndex: Text's Position above screen objects;
 ]]
 setmetatable(text, {
  __index = function(Table, Key)
    -- Thanks synapse Source!!!
   if not rawget(textObj, "__OBJECT_EXISTS") then error("render object destroyed") end

   if tostring(k):lower() == "destroy" then 
    return newcclosure(function() 
     destroyrenderobject(textObj)
     rawset(textObj, "__OBJECT", nil) 
     rawset(textObj, "__OBJECT_EXISTS", false)
    end) 
   end

   return getrenderproperty(textObj, Key)
  end,
  __newindex = function(self,key,value) 
   if tostring(key):lower() == "position" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    textObj["Position"] = value;
   elseif tostring(key):lower() == "textbounds" then
    return textObj["TextBounds"]
   else
    textObj[key] = value;
   end
   return textObj[key];
  end
 })
 -- Update Text with base properties
  for i,v in pairs(Args) do
   if table.find({"Text","Size","Position","Font","Center","Outline","OutlineColor","Color","Visible","Transparency","ZIndex"},i) then
    text[i] = v;
   end
  end
 -- Remove Text
 local texttbl = {};
 local overobj = false;
 local 1downobj = false;
 local 1upobj = false;
 local 2downobj = false;
 local 2upobj = false;
 local enterfunc = function() end;
 local leavefunc = function() end;
 local 1downfunc = function() end;
 local 2downfunc = function() end;
 local 1upfunc = function() end;
 local 2upfunc = function() end;
 local 1clickfunc = function() end;
 local 2clickfunc = function() end;
 game:GetService("RunService").RenderStepped:Connect(function()
  if over(textObj) then
   if overobj == false then enterfunc() end
   overobj = true;
  else
   if overobj == true then leavefunc() end
   overobj = false;
  end
 end)
 uis.InputBegan:Connect(function(input) 
  if input.UserInputType.Name == 'MouseButton1' then 
   if over(textObj) then 
    1downobj = true; 
    1upobj = false; 
    1downfunc(); 
   end 
  end 
  if input.UserInputType.Name == 'MouseButton2' then 
   if over(textObj) then 
    2downobj = true; 
    2upobj = false; 
    2downfunc(); 
   end 
  end 
 end)
 uis.InputEnded:Connect(function(input) 
  if input.UserInputType.Name == 'MouseButton1' then 
   if over(textObj) then 
    if 1downobj then 1clickfunc() end
    1downobj = false;
    1upobj = true; 
    1upfunc(); 
   end 
  end 
  if input.UserInputType.Name == 'MouseButton2' then 
   if over(textObj) then 
    if 2downobj then 2clickfunc() end
    2downobj = false;
    2upobj = true; 
    2upfunc(); 
   end 
  end 
 end)
 function texttbl:MouseEnter(callback)
  enterfunc = callback;
 end
 function texttbl:MouseLeave(callback)
  leavefunc = callback;
 end
 function texttbl:MouseButton1Down(callback)
  1downfunc = callback;
 end
 function texttbl:MouseButton1Up(callback)
  1upfunc = callback;
 end
 function texttbl:MouseButton1Click(callback)
  1clickfunc = callback;
 end
 function texttbl:MouseButton2Down(callback)
  2downfunc = callback;
 end
 function texttbl:MouseButton2Up(callback)
  2upfunc = callback;
 end
 function texttbl:MouseButton2Click(callback)
  2clickfunc = callback;
 end
 return text,texttbl;
end
function drawLib:Image(Args)
 local image,imageObj = {}, Drawing.new("Image");
 -- Set Defaults
  imageObj.Position = UDim2Vector(UDim2.new(0.5,0,0,0));
  imageObj.Size = UDim2Vector(UDim2.new(0.5,0,0.5,0));
  imageObj.Visible = true;
  imageObj.Data = "";
  imageObj.Rounding = 32;
  imageObj.Transparency = 0.5;
  imageObj.ZIndex = 1;
 --[[ INSTRUCTIONS FOR PROPERTIES OF IMAGE
  Position: Center of Image (UDim2/Vector2);
  Size: Size of Image (UDim2/Vector2);
  Visible: If Image is Shown;
  Transparency: Image's Transparency;
  Rounding: Image's Rounding of edges;
  Data: Image through game:HttpGet;
  Color: Color from RGB;
  ZIndex: Image's Position above screen objects;
 ]]
 setmetatable(image, {
  __index = function(Table, Key)
    -- Thanks synapse Source!!!
   if not rawget(imageObj, "__OBJECT_EXISTS") then error("render object destroyed") end

   if tostring(k):lower() == "destroy" then 
    return newcclosure(function() 
     destroyrenderobject(imageObj)
     rawset(imageObj, "__OBJECT", nil) 
     rawset(imageObj, "__OBJECT_EXISTS", false)
    end) 
   end

   return getrenderproperty(imageObj, Key)
  end,
  __newindex = function(self,key,value) 
   if tostring(key):lower() == "position" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    imageObj["Position"] = value;
   elseif tostring(key):lower() == "size" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    imageObj["Size"] = value;
   elseif tostring(key):lower() == "color" then
    imageObj["Data"] = game:HttpGet('https://www.htmlcsscolor.com/preview/gallery/'..tostring(value.R)..tostring(value.G)..tostring(value.B)..'.png')
   else
    imageObj[key] = value;
   end
   return imageObj[key];
  end
 })
 -- Update Image with base properties
  for i,v in pairs(Args) do
   if table.find({"Position","Size","Visible","Transparency","ZIndex","Rounding","Data"},i) then
    image[i] = v;
   end
  end
 local imagefnc = {};
 local overobj = false;
 local 1downobj = false;
 local 1upobj = false;
 local 2downobj = false;
 local 2upobj = false;
 local enterfunc = function() end;
 local leavefunc = function() end;
 local 1downfunc = function() end;
 local 2downfunc = function() end;
 local 1upfunc = function() end;
 local 2upfunc = function() end;
 local 1clickfunc = function() end;
 local 2clickfunc = function() end;
 game:GetService("RunService").RenderStepped:Connect(function()
  if over(imageObj) then
   if overobj == false then enterfunc() end
   overobj = true;
  else
   if overobj == true then leavefunc() end
   overobj = false;
  end
 end)
 uis.InputBegan:Connect(function(input) 
  if input.UserInputType.Name == 'MouseButton1' then 
   if over(imageObj) then 
    1downobj = true; 
    1upobj = false; 
    1downfunc(); 
   end 
  end 
  if input.UserInputType.Name == 'MouseButton2' then 
   if over(imageObj) then 
    2downobj = true; 
    2upobj = false; 
    2downfunc(); 
   end 
  end 
 end)
 uis.InputEnded:Connect(function(input) 
  if input.UserInputType.Name == 'MouseButton1' then 
   if over(imageObj) then 
    if 1downobj then 1clickfunc() end
    1downobj = false;
    1upobj = true; 
    1upfunc(); 
   end 
  end 
  if input.UserInputType.Name == 'MouseButton2' then 
   if over(imageObj) then 
    if 2downobj then 2clickfunc() end
    2downobj = false;
    2upobj = true; 
    2upfunc(); 
   end 
  end 
 end)
 function imagefnc:MouseEnter(callback)
  enterfunc = callback;
 end
 function imagefnc:MouseLeave(callback)
  leavefunc = callback;
 end
 function imagefnc:MouseButton1Down(callback)
  1downfunc = callback;
 end
 function imagefnc:MouseButton1Up(callback)
  1upfunc = callback;
 end
 function imagefnc:MouseButton1Click(callback)
  1clickfunc = callback;
 end
 function imagefnc:MouseButton2Down(callback)
  2downfunc = callback;
 end
 function imagefnc:MouseButton2Up(callback)
  2upfunc = callback;
 end
 function imagefnc:MouseButton2Click(callback)
  2clickfunc = callback;
 end
 return image,imagefnc;
end
function drawLib:Circle(Args)
 local circle,circleObj = {}, Drawing.new("Circle");
 -- Set Defaults
  circleObj.Position = UDim2Vector(UDim2.new(0.5,0,0.5,0));
  circleObj.Radius = 90;
  circleObj.Color = Color3.new(1,1,1);
  circleObj.Visible = true;
  circleObj.Transparency = 0.5;
  circleObj.ZIndex = 1;
  circleObj.NumSides = 999;
  circleObj.Thickness = 2;
  circleObj.Filled = false;
 --[[ INSTRUCTIONS FOR PROPERTIES OF CIRCLE
  Positon: Center of Circle (UDim2/Vector2);
  Size: Size of Circle (Radius);
  Color: Color of Circle (Color3);
  Visible: If Circle is Shown;
  Transparency: Circle's Transparency;
  ZIndex: Circle's Position above screen objects;
  Sides: Circle's Number of sides (Default: 999);
  Filled: If Circle is filled or not;
  Thickness: Thickness in pixels of cricle;
 ]]
 setmetatable(circle, {
  __index = function(Table, Key)
    -- Thanks synapse Source!!!
   if not rawget(circleObj, "__OBJECT_EXISTS") then error("render object destroyed") end

   if K == "Destroy" then 
    return newcclosure(function() 
     destroyrenderobject(circleObj)
     rawset(circleObj, "__OBJECT", nil) 
     rawset(circleObj, "__OBJECT_EXISTS", false)
    end) 
   end

   return getrenderproperty(circleObj, Key)
  end,
  __newindex = function(self,key,value) 
   if tostring(key):lower() == "position" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    circleObj["Position"] = value;
   elseif tostring(key):lower() == "size" then
    circleObj["Radius"] = value;
   elseif tostring(key):lower() == "sides" then
    circleObj["NumSides"] = value;
   else
    circleObj[key] = value;
   end
   return 
  end 
 })
 -- Update Circle with base properties
  for i,v in pairs(Args) do
   if table.find({"Position","Size","Color","Visible","Transparency","ZIndex","Sides","Filled","Thickness"},i) then
    circle[i] = v;
   end
  end
 return circle;
end
function drawLib:Square(Args)
 local square,squareObj = {}, Drawing.new("Square");
 -- Set Defaults
  squareObj.Position = UDim2Vector(UDim2.new(0.5,0,0,0));
  squareObj.Size = UDim2Vector(UDim2.new(0.5,0,0.5,0));
  squareObj.Color = Color3.new(1,1,1);
  squareObj.Visible = true;
  squareObj.Transparency = 0.5;
  squareObj.ZIndex = 1;
  squareObj.Thickness = 2;
 --[[ INSTRUCTIONS FOR PROPERTIES OF SQUARE
  Position: Center of Square (UDim2/Vector2);
  Size: Size of Square (UDim2/Vector2);
  Color: Color of Square (Color3);
  Visible: If Square is Shown;
  Transparency: Square's Transparency;
  ZIndex: Square's Position above screen objects;
  Filled: If Square is filled;
  Thickness: Thickness in pixels of Square;
 ]]
 setmetatable(square, {
  __index = function(Table, Key)
    -- Thanks synapse Source!!!
   if not rawget(squareObj, "__OBJECT_EXISTS") then error("render object destroyed") end

   if tostring(K):lower() == "destroy" then 
    return newcclosure(function() 
     destroyrenderobject(squareObj)
     rawset(squareObj, "__OBJECT", nil) 
     rawset(squareObj, "__OBJECT_EXISTS", false)
    end) 
   end

   return getrenderproperty(squareObj, Key)
  end,
  __newindex = function(self,key,value) 
   if tostring(key):lower() == "position" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    squareObj["Position"] = value;
   elseif tostring(key):lower() == "size" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    squareObj["Size"] = value;
   else
    squareObj[key] = value;
   end
   return squareObj[key];
  end
 })
 -- Update Square with base properties
  for i,v in pairs(Args) do
   if table.find({"Position","Size","Color","Visible","Transparency","ZIndex","Filled","Thickness"},i) then
    square[i] = v;
   end
  end
 
  local squarefnc = {};
  local overobj = false;
  local 1downobj = false;
  local 1upobj = false;
  local 2downobj = false;
  local 2upobj = false;
  local enterfunc = function() end;
  local leavefunc = function() end;
  local 1downfunc = function() end;
  local 2downfunc = function() end;
  local 1upfunc = function() end;
  local 2upfunc = function() end;
  local 1clickfunc = function() end;
  local 2clickfunc = function() end;
  game:GetService("RunService").RenderStepped:Connect(function()
   if over(squareObj) then
    if overobj == false then enterfunc() end
    overobj = true;
   else
    if overobj == true then leavefunc() end
    overobj = false;
   end
  end)
  uis.InputBegan:Connect(function(input) 
   if input.UserInputType.Name == 'MouseButton1' then 
    if over(squareObj) then 
     1downobj = true; 
     1upobj = false; 
     1downfunc(); 
    end 
   end 
   if input.UserInputType.Name == 'MouseButton2' then 
    if over(squareObj) then 
     2downobj = true; 
     2upobj = false; 
     2downfunc(); 
    end 
   end 
  end)
  uis.InputEnded:Connect(function(input) 
   if input.UserInputType.Name == 'MouseButton1' then 
    if over(squareObj) then 
     if 1downobj then 1clickfunc() end
     1downobj = false;
     1upobj = true; 
     1upfunc(); 
    end 
   end 
   if input.UserInputType.Name == 'MouseButton2' then 
    if over(squareObj) then 
     if 2downobj then 2clickfunc() end
     2downobj = false;
     2upobj = true; 
     2upfunc(); 
    end 
   end 
  end)
  function squarefnc:MouseEnter(callback)
   enterfunc = callback;
  end
  function squarefnc:MouseLeave(callback)
   leavefunc = callback;
  end
  function squarefnc:MouseButton1Down(callback)
   1downfunc = callback;
  end
  function squarefnc:MouseButton1Up(callback)
   1upfunc = callback;
  end
  function squarefnc:MouseButton1Click(callback)
   1clickfunc = callback;
  end
  function squarefnc:MouseButton2Down(callback)
   2downfunc = callback;
  end
  function squarefnc:MouseButton2Up(callback)
   2upfunc = callback;
  end
  function squarefnc:MouseButton2Click(callback)
   2clickfunc = callback;
  end
 return square,squarefnc;
end
function drawLib:Rect(Args)
 local rect,rectObj = {}, Drawing.new("Quad");
 -- Set Defaults
  rectObj.PointA = UDim2Vector(UDim2.new(0.25,0,0.25,0));
  rectObj.PointB = UDim2Vector(UDim2.new(0.5,0,0.25,0));
  rectObj.PointC = UDim2Vector(UDim2.new(0.25,0,0.5,0));
  rectObj.PointD = UDim2Vector(UDim2.new(0.5,0,0.5,0));
  rectObj.Color = Color3.new(1,1,1);
  rectObj.Visible = true;
  rectObj.Transparency = 0.5;
  rectObj.ZIndex = 1;
  rectObj.Thickness = 2;
 --[[ INSTRUCTIONS FOR PROPERTIES OF SQUARE
  PointA: Top Right of Rect (UDim2/Vector2);
  PointB: Top Left of Rect (UDim2/Vector2);
  PointC: Bottom Left of Rect (UDim2/Vector2);
  PointD: Bottom Right of Rect (UDim2/Vector2);
  Color: Color of Rect (Color3);
  Visible: If Rect is Shown;
  Transparency: Rect's Transparency;
  ZIndex: Rect's Position above screen objects;
  Filled: If Rect is filled;
  Thickness: Thickness in pixels of Rect;
 ]]
 setmetatable(rect, {
  __index = function(Table, Key)
    -- Thanks synapse Source!!!
   if not rawget(rectObj, "__OBJECT_EXISTS") then error("render object destroyed") end

   if tostring(K):lower() == "destroy" then 
    return newcclosure(function() 
     destroyrenderobject(rectObj)
     rawset(rectObj, "__OBJECT", nil) 
     rawset(rectObj, "__OBJECT_EXISTS", false)
    end) 
   end

   return getrenderproperty(rectObj, Key)
  end,
  __newindex = function(self,key,value) 
   if tostring(key):lower() == "pointa" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    rectObj["PointA"] = value;
   elseif tostring(key):lower() == "pointb" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    rectObj["PointB"] = value;
   elseif tostring(key):lower() == "pointc" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    rectObj["PointC"] = value;
   elseif tostring(key):lower() == "pointd" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    rectObj["PointD"] = value;
   else
    rectObj[key] = value;
   end
   return rectObj[key];
  end
 })
 -- Update Rect with base properties
  for i,v in pairs(Args) do
   if table.find({"PointA","PointB","PointC","PointD","Color","Visible","Transparency","ZIndex","Filled","Thickness"},i) then
    rect[i] = v;
   end
  end
 
  local recttbl = {};
  local overobj = false;
  local 1downobj = false;
  local 1upobj = false;
  local 2downobj = false;
  local 2upobj = false;
  local enterfunc = function() end;
  local leavefunc = function() end;
  local 1downfunc = function() end;
  local 2downfunc = function() end;
  local 1upfunc = function() end;
  local 2upfunc = function() end;
  local 1clickfunc = function() end;
  local 2clickfunc = function() end;
  game:GetService("RunService").RenderStepped:Connect(function()
   if overpoint(rectObj) then
    if overobj == false then enterfunc() end
    overobj = true;
   else
    if overobj == true then leavefunc() end
    overobj = false;
   end
  end)
  uis.InputBegan:Connect(function(input) 
   if input.UserInputType.Name == 'MouseButton1' then 
    if overpoint(rectObj) then 
     1downobj = true; 
     1upobj = false; 
     1downfunc(); 
    end 
   end 
   if input.UserInputType.Name == 'MouseButton2' then 
    if overpoint(rectObj) then 
     2downobj = true; 
     2upobj = false; 
     2downfunc(); 
    end 
   end 
  end)
  uis.InputEnded:Connect(function(input) 
   if input.UserInputType.Name == 'MouseButton1' then 
    if overpoint(rectObj) then 
     if 1downobj then 1clickfunc() end
     1downobj = false;
     1upobj = true; 
     1upfunc(); 
    end 
   end 
   if input.UserInputType.Name == 'MouseButton2' then 
    if overpoint(rectObj) then 
     if 2downobj then 2clickfunc() end
     2downobj = false;
     2upobj = true; 
     2upfunc(); 
    end 
   end 
  end)
  function recttbl:MouseEnter(callback)
   enterfunc = callback;
  end
  function recttbl:MouseLeave(callback)
   leavefunc = callback;
  end
  function recttbl:MouseButton1Down(callback)
   1downfunc = callback;
  end
  function recttbl:MouseButton1Up(callback)
   1upfunc = callback;
  end
  function recttbl:MouseButton1Click(callback)
   1clickfunc = callback;
  end
  function recttbl:MouseButton2Down(callback)
   2downfunc = callback;
  end
  function recttbl:MouseButton2Up(callback)
   2upfunc = callback;
  end
  function recttbl:MouseButton2Click(callback)
   2clickfunc = callback;
  end
 return rect,recttbl;
end
function drawLib:Triangle(Args)
 local tri,triObj = {}, Drawing.new("Triangle");
 -- Set Defaults
  triObj.PointA = UDim2Vector(UDim2.new(0.25,0,0.25,0));
  triObj.PointB = UDim2Vector(UDim2.new(0.5,0,0.25,0));
  triObj.PointC = UDim2Vector(UDim2.new(0.25,0,0.5,0));
  triObj.Color = Color3.new(1,1,1);
  triObj.Visible = true;
  triObj.Transparency = 0.5;
  triObj.ZIndex = 1;
  triObj.Thickness = 2;
 --[[ INSTRUCTIONS FOR PROPERTIES OF TRIANGLE
  PointA: Top of Triangle (UDim2/Vector2);
  PointB: Bottom Left of Triangle (UDim2/Vector2);
  PointC: Bottom Right of Triangle (UDim2/Vector2);
  Color: Color of Triangle (Color3);
  Visible: If Triangle is Shown;
  Transparency: Triangle's Transparency;
  ZIndex: Triangle's Position above screen objects;
  Filled: If Triangle is filled;
  Thickness: Thickness in pixels of Triangle;
 ]]
 setmetatable(tri, {
  __index = function(Table, Key)
    -- Thanks synapse Source!!!
   if not rawget(triObj, "__OBJECT_EXISTS") then error("render object destroyed") end

   if K == "Destroy" then 
    return newcclosure(function() 
     destroyrenderobject(triObj)
     rawset(triObj, "__OBJECT", nil) 
     rawset(triObj, "__OBJECT_EXISTS", false)
    end) 
   end

   return getrenderproperty(triObj, Key)
  end,
  __newindex = function(self,key,value) 
   if tostring(key):lower() == "pointa" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    triObj["PointA"] = value;
   elseif tostring(key):lower() == "pointb" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    triObj["PointB"] = value;
   elseif tostring(key):lower() == "pointc" then
    if typeof(value) == "UDim2" then value = UDim2Vector(value) end
    if typeof(value) == "CFrame" then value = Vector2.new(cam:WorldToScreenPoint(value.p).X,cam:WorldToScreenPoint(value.p).Y) end
    if typeof(value) == "Vector3" then value =  Vector2.new(cam:WorldToScreenPoint(value).X,cam:WorldToScreenPoint(value).Y) end
    triObj["PointC"] = value;
   else
    triObj[key] = value;
   end
   return triObj[key];
  end
 })
 -- Update Triangle with base properties
  for i,v in pairs(Args) do
   if table.find({"PointA","PointB","PointC","Color","Visible","Transparency","ZIndex","Filled","Thickness"},i) then
    tri[i] = v;
   end
  end
 return tri;
end

return drawLib;
