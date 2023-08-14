local a = game.Players.LocalPlayer
local b = a:GetMouse()
local c = Instance.new("ScreenGui")
c.Parent = a.PlayerGui
local d = Instance.new("Frame")

d.Size = UDim2.new(0, 200, 0, 100)
d.Position = UDim2.new(0, 50, 0, 50)
d.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
d.BorderColor3 = Color3.new(0, 0, 0)
d.BorderSizePixel = 2
d.Active = true
d.Draggable = true
d.Parent = c
local e = Instance.new("TextButton")
e.Size = UDim2.new(0, 20, 0, 20)
e.Position = UDim2.new(1, -20, 0, 0)
e.BackgroundColor3 = Color3.new(0.8, 0, 0)
e.Text = "X"
e.Font = Enum.Font.SourceSansBold
e.TextSize = 14
e.TextColor3 = Color3.new(1, 1, 1)
e.Parent = d
local f = Instance.new("TextButton")
f.Size = UDim2.new(0.4, -10, 0, 30)
f.Position = UDim2.new(0, 10, 0.5, -15)
f.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
f.Text = "Current pads"
f.Font = Enum.Font.SourceSans
f.TextSize = 14
f.TextColor3 = Color3.new(0, 0, 0)
f.Parent = d
local g = Instance.new("TextButton")
g.Size = UDim2.new(0.4, -10, 0, 30)
g.Position = UDim2.new(0.6, 5, 0.5, -15)
g.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
g.Text = "Actual pads"
g.Font = Enum.Font.SourceSans
g.TextSize = 14
g.TextColor3 = Color3.new(0, 0, 0)
g.Parent = d

e.MouseButton1Click:Connect(function()
	c:Destroy()
end)
f.MouseButton1Click:Connect(function()
	local h = "Touch to get admin"
	local i = game.Workspace.Terrain._Game.Admin.Pads

	local j = Vector3.new(1, 1, 1)
	local k = 0.1

	local l = 1

	for m, n in i:GetDescendants() do
		if n:IsA("Model") and n.Name == h then
			local o = n:GetPivot()
			print("Placing part at CFrame:")
			pcall(function()
				setclipboard(o)
			end)
			game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(o)
			task.wait(k)
			local p = Instance.new("Part")
			p.Size = j
		
			p.Position = o.Position
		
			p.Anchored = true
		
			p.BrickColor = BrickColor.new("Bright red")
			p.Material = Enum.Material.SmoothPlastic
		
			p.Transparency = 0.5
		
			p.Parent = game.Workspace
		
			local q = Instance.new("BillboardGui")
			q.Adornee = p
		
			q.Size = UDim2.new(3, 0, 2, 0)
			q.StudsOffset = Vector3.new(0, j.Y / 2 + 0.5, 0)
			q.Parent = p
		
			local r = Instance.new("TextLabel")
			r.Size = UDim2.new(1, 0, 0.7, 0)
			r.Position = UDim2.new(0, 0, 0.15, 0)
			r.BackgroundTransparency = 1
		
			r.TextColor3 = Color3.new(1, 1, 1)
			r.TextStrokeTransparency = 0.5
		
			r.FontSize = Enum.FontSize.Size18
		
			r.Text = tostring(l)
			r.Parent = q
		
			l = l + 1
		end
	end

	i.DescendantAdded:Connect(function(n)
		if n:IsA("Model") and n.Name == h then
			local o = n:GetPivot()
			print("Placing part at CFrame:")
			pcall(function()
				setclipboard(o)
			end)
			game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(o)
			task.wait(k)
			local p = Instance.new("Part")
			p.Size = j
		
			p.Position = o.Position
		
			p.Anchored = true
		
			p.BrickColor = BrickColor.new("Bright red")
			p.Material = Enum.Material.SmoothPlastic
		
			p.Transparency = 0.5
		
			p.Parent = game.Workspace
		
			local q = Instance.new("BillboardGui")
			q.Adornee = p
		
			q.Size = UDim2.new(3, 0, 2, 0)
			q.StudsOffset = Vector3.new(0, j.Y / 2 + 0.5, 0)
			q.Parent = p
		
			local r = Instance.new("TextLabel")
			r.Size = UDim2.new(1, 0, 0.7, 0)
			r.Position = UDim2.new(0, 0, 0.15, 0)
			r.BackgroundTransparency = 1
		
			r.TextColor3 = Color3.new(1, 1, 1)
			r.TextStrokeTransparency = 0.5
		
			r.FontSize = Enum.FontSize.Size18
		
			r.Text = tostring(l)
			r.Parent = q
		
			l = l + 1
		end
	end)
end)
g.MouseButton1Click:Connect(function()
local s = {
    {-41, 9, 94},
    {-37, 9, 93},
    {-33, 9, 94},
    {-21, 9, 95},
    {-45, 9, 95},
    {-13, 9, 93},
    {-29, 9, 93},
    {-17, 9, 93},
    {-24, 9, 93}
}

local j = Vector3.new(1, 1, 1)
local k = 0.1

local l = 1

for m, t in ipairs(s) do
    local u = CFrame.new(unpack(t))
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(u)
    task.wait(k)
    local p = Instance.new("Part")
    p.Size = j

    p.Position = u.Position

    p.Anchored = true

    p.BrickColor = BrickColor.new("Bright red")
    p.Material = Enum.Material.SmoothPlastic

    p.Transparency = 0.5

    p.Parent = game.Workspace

    local q = Instance.new("BillboardGui")
    q.Adornee = p

    q.Size = UDim2.new(3, 0, 2, 0)
    q.StudsOffset = Vector3.new(0, j.Y / 2 + 0.5, 0)
    q.Parent = p

    local r = Instance.new("TextLabel")
    r.Size = UDim2.new(1, 0, 0.7, 0)
    r.Position = UDim2.new(0, 0, 0.15, 0)
    r.BackgroundTransparency = 1

    r.TextColor3 = Color3.new(1, 1, 1)
    r.TextStrokeTransparency = 0.5

    r.FontSize = Enum.FontSize.Size18

    r.Text = "Actual pad " .. tostring(l)
    r.Parent = q

    l = l + 1
end

end)
