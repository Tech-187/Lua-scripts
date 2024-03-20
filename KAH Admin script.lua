local tempadmins = {}  
local tabby = workspace.Tabby
local server_storage = game:GetService("ServerStorage")
local p_storage = server_storage.Packages
local Adminz = game:GetService("Workspace").Terrain["_Game"].Admin
local admins = Adminz.Pads
local Pads = Adminz.Pads
local rb = Adminz:FindFirstChild("Regen")
local grids = tabby.Admin_House.Grids
local db = false
local prefix = ""
local sp = script.Parent
local insert = game:service("InsertService")
local badge = game:service("BadgeService")
local givers = {}
local lobjs = {}
local objects = {}
local logs = {}
local messageBroadcasted = false
_G.permmode = false

local function GetTime()
	local hour = math.floor((tick() % 86400) / 60 / 60)
	local min = math.floor(((tick() % 86400) / 60 / 60 - hour) * 60)
	if min < 10 then
		min = "0" .. min
	end
	return hour .. ":" .. min
end


local function ChkAdmin(str, ck)
	for i = 1, #tempadmins do
		if str:lower() == tempadmins[i]:lower() and not ck then
			return true
		end
	end
	-- return false 
end

local function GetPlr(plr, str)
	local plrz = {}
	str = str:lower()
	if str == "all" then
		plrz = game.Players:children()
	elseif str == "others" then
		for i, v in pairs(game.Players:children()) do
			if v ~= plr then
				table.insert(plrz, v)
			end
		end
	else
		local sn = {
			1
		}
		local en = {}
		for i = 1, # str do
			if str:sub(i, i) == "," then
				table.insert(sn, i + 1)
				table.insert(en, i - 1)
			end
		end
		for x = 1, # sn do
			if (sn[x] and en[x] and str:sub(sn[x], en[x]) == "me") or (sn[x] and str:sub(sn[x]) == "me") then
				table.insert(plrz, plr)
				if (# plrz >= 2) then
					break
				end
			elseif (sn[x] and en[x] and str:sub(sn[x], en[x]) == "random") or (sn[x] and str:sub(sn[x]) == "random") then
				table.insert(plrz, game.Players:children()[math.random(# game.Players:children())])
				if (# plrz >= 2) then
					break
				end
			elseif (sn[x] and en[x] and str:sub(sn[x], en[x]) == "admins") or (sn[x] and str:sub(sn[x]) == "admins") then
				if ChkAdmin(plr.Name, true) then
					for i, v in pairs(game.Players:children()) do
						if ChkAdmin(v.Name, false) then
							table.insert(plrz, v)
							if (# plrz >= 2) then
								break
							end
						end
					end
				end
			elseif (sn[x] and en[x] and str:sub(sn[x], en[x]) == "nonadmins") or (sn[x] and str:sub(sn[x]) == "nonadmins") then
				for i, v in pairs(game.Players:children()) do
					if not ChkAdmin(v.Name, false) then
						table.insert(plrz, v)
						if (# plrz >= 2) then
							break
						end
					end
				end
			elseif (sn[x] and en[x] and str:sub(sn[x], en[x]):sub(1, 4) == "team") then
				if game:findFirstChild("Teams") then
					for a, v in pairs(game.Teams:children()) do
						if v:IsA("Team") and str:sub(sn[x], en[x]):sub(6) ~= "" and v.Name:lower():find(str:sub(sn[x], en[x]):sub(6)) == 1 then
							for q, p in pairs(game.Players:children()) do
								if p.TeamColor == v.TeamColor then
									table.insert(plrz, p)
								end
							end
							break
						end
					end
				end
			elseif (sn[x] and str:sub(sn[x]):sub(1, 4):lower() == "team") then
				if game:findFirstChild("Teams") then
					for a, v in pairs(game.Teams:children()) do
						if v:IsA("Team") and str:sub(sn[x], en[x]):sub(6) ~= "" and v.Name:lower():find(str:sub(sn[x]):sub(6)) == 1 then
							for q, p in pairs(game.Players:children()) do
								if p.TeamColor == v.TeamColor then
									table.insert(plrz, p)
								end
							end
							break
						end
					end
				end
			else
				for a, plyr in pairs(game.Players:children()) do
					if (sn[x] and en[x] and str:sub(sn[x], en[x]) ~= "" and plyr.Name:lower():find(str:sub(sn[x], en[x])) == 1) or (sn[x] and str:sub(sn[x]) ~= "" and plyr.Name:lower():find(str:sub(sn[x])) == 1) or (str ~= "" and plyr.Name:lower():find(str) == 1) then
						table.insert(plrz, plyr)
						break
					end
				end
			end
		end
	end
	return plrz
end

local function Hint(str, plrz, time)
	for i, v in pairs(plrz) do
		if v and v:findFirstChild("PlayerGui") then
			coroutine.resume(coroutine.create(function()
				local scr = Instance.new("ScreenGui", v.PlayerGui)
				scr.Name = "HintGUI"
				local bg = Instance.new("Frame", scr)
				bg.Name = "bg"
				bg.BackgroundColor3 = Color3.new(0, 0, 0)
				bg.BorderSizePixel = 0
				bg.BackgroundTransparency = 1
				bg.Size = UDim2.new(1, 0, 0, 22)
				bg.Position = UDim2.new(0, 0, 0, -2)
				bg.ZIndex = 8
				local msg = Instance.new("TextLabel", bg)
				msg.BackgroundTransparency = 1
				msg.ZIndex = 9
				msg.Name = "msg"
				msg.Position = UDim2.new(0, 0, 0)
				msg.Size = UDim2.new(1, 0, 1, 0)
				msg.Font = "Arial"
				msg.Text = str
				msg.FontSize = "Size18"
				msg.TextColor3 = Color3.new(1, 1, 1)
				msg.TextStrokeColor3 = Color3.new(1, 1, 1)
				msg.TextStrokeTransparency = .8
				coroutine.resume(coroutine.create(function()
					for i = 20, 0, -1 do
						bg.BackgroundTransparency = .3 + ((.7 / 20) * i)
						msg.TextTransparency = ((0.05) * i)
						msg.TextStrokeTransparency = .8 + ((.2 / 20) * i)
						wait(0.022727272727272728)
					end
				end))
				if not time then
					wait((# str / 19) + 2.5)
				else
					wait(time)
				end
				coroutine.resume(coroutine.create(function()
					if scr.Parent == v.PlayerGui then
						for i = 0, 20 do
							msg.TextTransparency = ((0.05) * i)
							msg.TextStrokeTransparency = .8 + ((.2 / 20) * i)
							bg.BackgroundTransparency = .3 + ((.7 / 20) * i)
							wait(0.022727272727272728)
						end
						scr:Destroy()
					end
				end))
			end))
		end
	end
end

local function Message(ttl, str, scroll, plrz, time)
	for i, v in pairs(plrz) do
		if v and v:findFirstChild("PlayerGui") then
			coroutine.resume(coroutine.create(function()
				local scr = Instance.new("ScreenGui")
				scr.Name = "MessageGUI"
				local bg = Instance.new("Frame", scr)
				bg.Name = "bg"
				bg.BackgroundColor3 = Color3.new(0, 0, 0)
				bg.BorderSizePixel = 0
				bg.BackgroundTransparency = 1
				bg.Size = UDim2.new(10, 0, 10, 0)
				bg.Position = UDim2.new(-5, 0, -5, 0)
				bg.ZIndex = 8
				local title = Instance.new("TextLabel", scr)
				title.Name = "title"
				title.BackgroundTransparency = 1
				title.BorderSizePixel = 0
				title.Size = UDim2.new(1, 0, 0, 10)
				title.ZIndex = 9
				title.Font = "ArialBold"
				title.FontSize = "Size36"
				title.Text = ttl
				title.TextYAlignment = "Top"
				title.TextColor3 = Color3.new(1, 1, 1)
				title.TextStrokeColor3 = Color3.new(1, 1, 1)
				title.TextStrokeTransparency = .8
				local msg = title:clone()
				msg.Parent = scr
				msg.Name = "msg"
				msg.Position = UDim2.new(.0625, 0, 0)
				msg.Size = UDim2.new(.875, 0, 1, 0)
				msg.Font = "Arial"
				msg.Text = ""
				msg.FontSize = "Size24"
				msg.TextYAlignment = "Center"
				msg.TextWrapped = true
				scr.Parent = v.PlayerGui
				coroutine.resume(coroutine.create(function()
					for i = 20, 0, -1 do
						bg.BackgroundTransparency = .3 + ((.7 / 20) * i)
						msg.TextTransparency = ((0.05) * i)
						msg.TextStrokeTransparency = .8 + ((.2 / 20) * i)
						title.TextTransparency = ((0.05) * i)
						title.TextStrokeTransparency = .8 + ((.2 / 20) * i)
						wait(0.022727272727272728)
					end
				end))
				if scroll then
					if not time then
						for i = 1, # str do
							msg.Text = msg.Text .. str:sub(i, i)
							wait(0.05263157894736842)
						end
						wait(2.5)
					else
						for i = 1, # str do
							msg.Text = msg.Text .. str:sub(i, i)
							wait(0.05263157894736842)
						end
						wait(time - (# str / 19))
					end
				else
					if not time then
						msg.Text = str
						wait((# str / 19) + 2.5)
					else
						msg.Text = str
						wait(time)
					end
				end
				coroutine.resume(coroutine.create(function()
					if scr.Parent == v.PlayerGui then
						for i = 0, 20 do
							bg.BackgroundTransparency = .3 + ((.7 / 20) * i)
							msg.TextTransparency = ((0.05) * i)
							msg.TextStrokeTransparency = .8 + ((.2 / 20) * i)
							title.TextTransparency = ((0.05) * i)
							title.TextStrokeTransparency = .8 + ((.2 / 20) * i)
							wait(0.022727272727272728)
						end
						scr:Destroy()
					end
				end))
			end))
		end
	end
end

local function RemoveMessage()
	for i, v in pairs(game.Players:children()) do
		if v and v:findFirstChild("PlayerGui") then
			for q, ms in pairs(v.PlayerGui:children()) do
				if ms.Name == "MessageGUI" then
					coroutine.resume(coroutine.create(function()
						for i = 0, 20 do
							ms.bg.BackgroundTransparency = .3 + ((.7 / 20) * i)
							ms.msg.TextTransparency = ((0.05) * i)
							ms.msg.TextStrokeTransparency = .8 + ((.2 / 20) * i)
							ms.title.TextTransparency = ((0.05) * i)
							ms.title.TextStrokeTransparency = .8 + ((.2 / 20) * i)
							wait(0.022727272727272728)
						end
						ms:Destroy()
					end))
				elseif ms.Name == "HintGUI" then
					coroutine.resume(coroutine.create(function()
						for i = 0, 20 do
							ms.msg.TextTransparency = ((0.05) * i)
							ms.msg.TextStrokeTransparency = .8 + ((.2 / 20) * i)
							ms.bg.BackgroundTransparency = .3 + ((.7 / 20) * i)
							wait(0.022727272727272728)
						end
						ms:Destroy()
					end))
				end
			end
		end
	end
end

_G["Message"] = function(p1, p2, p3)
	Message(p1, p2, false, game.Players:children(), p3)
end
_G["RemoveMessage"] = RemoveMessage()

local function Output(str, plr)
	coroutine.resume(coroutine.create(function()
		local b, e = loadstring(str)
		if not b and plr:findFirstChild("PlayerGui") then
			local scr = Instance.new("ScreenGui", plr.PlayerGui)
			game:service("Debris"):AddItem(scr, 5)
			local main = Instance.new("Frame", scr)
			main.Size = UDim2.new(1, 0, 1, 0)
			main.BorderSizePixel = 0
			main.BackgroundTransparency = 1
			main.ZIndex = 8
			local err = Instance.new("TextLabel", main)
			err.Text = "Line " .. e:match("\:(%d+\:.*)")
			err.BackgroundColor3 = Color3.new(0, 0, 0)
			err.BackgroundTransparency = .3
			err.BorderSizePixel = 0
			err.Size = UDim2.new(1, 0, 0, 40)
			err.Position = UDim2.new(0, 0, .5, -20)
			err.ZIndex = 9
			err.Font = "ArialBold"
			err.FontSize = "Size24"
			err.TextColor3 = Color3.new(1, 1, 1)
			err.TextStrokeColor3 = Color3.new(1, 1, 1)
			err.TextStrokeTransparency = .8
			return
		end
	end))
end

local function Noobify(char)
	if char and char:findFirstChild("Torso") then
		if char:findFirstChild("Shirt") then
			char.Shirt.Parent = char.Torso
		end
		if char:findFirstChild("Pants") then
			char.Pants.Parent = char.Torso
		end
		for a, sc in pairs(char:children()) do
			if sc.Name == "ify" then
				sc:Destroy()
			end
		end
		local cl = Instance.new("StringValue", char)
		cl.Name = "ify"
		cl.Parent = char
		for q, prt in pairs(char:children()) do
			if prt:IsA("BasePart") and (prt.Name ~= "Head" or not prt.Parent:findFirstChild("NameTag", true)) then
				prt.Transparency = 0
				prt.Reflectance = 0
				prt.BrickColor = BrickColor.new("Bright yellow")
				if prt.Name:find("Leg") then
					prt.BrickColor = BrickColor.new("Br. yellowish green")
				elseif prt.Name == "Torso" then
					prt.BrickColor = BrickColor.new("Bright blue")
				end
				local tconn = prt.Touched:connect(function(hit)
					if hit and hit.Parent and game.Players:findFirstChild(hit.Parent.Name) and cl.Parent == char then
						Noobify(hit.Parent)
					elseif cl.Parent ~= char then
						tconn:disconnect()
					end
				end)
				cl.Changed:connect(function()
					if cl.Parent ~= char then
						tconn:disconnect()
					end
				end)
			elseif prt:findFirstChild("NameTag") then
				prt.Head.Transparency = 0
				prt.Head.Reflectance = 0
				prt.Head.BrickColor = BrickColor.new("Bright yellow")
			end
		end
	end
end 

local function Infect(char)
	if char and char:findFirstChild("Torso") then
		if char:findFirstChild("Shirt") then
			char.Shirt.Parent = char.Torso
		end
		if char:findFirstChild("Pants") then
			char.Pants.Parent = char.Torso
		end
		for a, sc in pairs(char:children()) do
			if sc.Name == "ify" then
				sc:Destroy()
			end
		end
		local cl = Instance.new("StringValue", char)
		cl.Name = "ify"
		cl.Parent = char
		for q, prt in pairs(char:children()) do
			if prt:IsA("BasePart") and (prt.Name ~= "Head" or not prt.Parent:findFirstChild("NameTag", true)) then
				prt.Transparency = 0
				prt.Reflectance = 0
				prt.BrickColor = BrickColor.new("Medium green")
				if prt.Name:find("Leg") or prt.Name == "Torso" then
					prt.BrickColor = BrickColor.new("Reddish brown")
				end
				local tconn = prt.Touched:connect(function(hit)
					if hit and hit.Parent and game.Players:findFirstChild(hit.Parent.Name) and cl.Parent == char then
						Infect(hit.Parent)
					elseif cl.Parent ~= char then
						tconn:disconnect()
					end
				end)
				cl.Changed:connect(function()
					if cl.Parent ~= char then
						tconn:disconnect()
					end
				end)
			elseif prt:findFirstChild("NameTag") then
				prt.Head.Transparency = 0
				prt.Head.Reflectance = 0
				prt.Head.BrickColor = BrickColor.new("Medium green")
			end
		end
	end
end

local function ScrollGui()
	local scr = Instance.new("ScreenGui")
	scr.Name = "LOGSGUI"
	local drag = Instance.new("TextButton", scr)
	drag.Draggable = true
	drag.BackgroundTransparency = 1
	drag.Size = UDim2.new(0, 385, 0, 20)
	drag.Position = UDim2.new(.5, -200, .5, -200)
	drag.AutoButtonColor = false
	drag.Text = ""
	local main = Instance.new("Frame", drag)
	main.Style = "RobloxRound"
	main.Size = UDim2.new(0, 400, 0, 400)
	main.ZIndex = 7
	main.ClipsDescendants = true
	local cmf = Instance.new("Frame", main)
	cmf.Position = UDim2.new(0, 0, 0, -9)
	cmf.ZIndex = 8
	local down = Instance.new("ImageButton", main)
	down.Image = "http://www.roblox.com/asset/?id=108326725"
	down.BackgroundTransparency = 1
	down.Size = UDim2.new(0, 25, 0, 25)
	down.Position = UDim2.new(1, -20, 1, -20)
	down.ZIndex = 9
	local up = down:Clone()
	up.Image = "http://www.roblox.com/asset/?id=108326682"
	up.Parent = main
	up.Position = UDim2.new(1, -20, 1, -50)
	local cls = Instance.new("TextButton", main)
	cls.Style = "RobloxButtonDefault"
	cls.Size = UDim2.new(0, 20, 0, 20)
	cls.Position = UDim2.new(1, -15, 0, -5)
	cls.ZIndex = 10
	cls.Font = "ArialBold"
	cls.FontSize = "Size18"
	cls.Text = "X"
	cls.TextColor3 = Color3.new(1, 1, 1)
	cls.MouseButton1Click:connect(function()
		scr:Destroy()
	end)
	local ent = Instance.new("TextLabel")
	ent.BackgroundTransparency = 1
	ent.Font = "Arial"
	ent.FontSize = "Size18"
	ent.ZIndex = 8
	ent.Text = ""
	ent.TextColor3 = Color3.new(1, 1, 1)
	ent.TextStrokeColor3 = Color3.new(0, 0, 0)
	ent.TextStrokeTransparency = .8
	ent.TextXAlignment = "Left"
	ent.TextYAlignment = "Top"
	local num = 0
	local downv = false
	local upv = false
	down.MouseButton1Down:connect(function()
		downv = true
		upv = false
		local pos = cmf.Position
		if pos.Y.Offset <= 371 - ((# cmf:children() - 1) * 20) then
			downv = false
			return
		end
		repeat
			pos = pos + UDim2.new(0, 0, 0, -6)
			if pos.Y.Offset <= 371 - ((# cmf:children() - 1) * 20) then
				pos = UDim2.new(0, 0, 0, 371 - ((# cmf:children() - 1) * 20))
				downv = false
			end
			cmf:TweenPosition(pos, "Out", "Linear", 0.05, true)
			wait(0.05)
		until downv == false
	end)
	down.MouseButton1Up:connect(function()
		downv = false
	end)
	up.MouseButton1Down:connect(function()
		upv = true
		downv = false
		local pos = cmf.Position
		if pos.Y.Offset >= -9 then
			upv = false
			return
		end
		repeat
			pos = pos + UDim2.new(0, 0, 0, 6)
			if pos.Y.Offset >= -9 then
				pos = UDim2.new(0, 0, 0, -9)
				upv = false
			end
			cmf:TweenPosition(pos, "Out", "Linear", 0.05, true)
			wait(0.05)
		until upv == false
	end)
	up.MouseButton1Up:connect(function()
		upv = false
	end)
	return scr, cmf, ent, num
end

local function Chat(msg, plr)
	coroutine.resume(coroutine.create(function()
		if msg:lower() == "clean" then
			print(1)
			for i, v in pairs(game.Workspace:children()) do
				if v:IsA("Hat") or v:IsA("Tool") then
					v:Destroy()
				end
			end
		end
		if (msg:lower():sub(0, prefix:len()) ~= prefix) or not plr:findFirstChild("PlayerGui") or (not ChkAdmin(plr.Name, false)) then
			if not _G.permmode then
				return print("It's false")
			end
		end
		msg = msg:sub(prefix:len() + 1)
		if msg:sub(1, 7):lower() == "hitler " then
			msg = msg:sub(8)
		else
			table.insert(logs, 1, {
				name = plr.Name,
				cmd = prefix .. msg,
				time = GetTime()
			})
		end
		if msg:lower():sub(1, 4) == "walk" then
			print(2)
			msg = msg:sub(5)
		end

if msg:lower():sub(1, 4) == "perm" then
    if not messageBroadcasted then
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "ServerMessage"
        billboardGui.Enabled = true
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.Adornee = game.Workspace.Terrain

        local messageLabel = Instance.new("TextLabel")
        messageLabel.Name = "MessageLabel"
        messageLabel.Text = "PERM IS ENABLED\n\n\n\n"
        messageLabel.Size = UDim2.new(1, 0, 1, 0)
        messageLabel.BackgroundTransparency = 1
        messageLabel.FontSize = Enum.FontSize.Size24
        messageLabel.TextColor3 = Color3.new(1, 1, 1)
        messageLabel.Parent = billboardGui
        billboardGui.Parent = game.Workspace
        game.Players.PlayerAdded:Connect(function(player)
            if not messageBroadcasted and player == game.Players:GetPlayers()[1] then
                billboardGui:Clone().Parent = player:WaitForChild("PlayerGui")
				_G.permmode = true
                messageBroadcasted = true
            end
        end)
    end
end

		if msg:lower():sub(1, 8) == "teleport" then
			msg = "tp" .. msg:sub(9)
		end
		if msg:lower():sub(1, 6) == "insert" then
			msg = "ins" .. msg:sub(7)
		end
		if msg:lower() == "clr" or msg:lower() == "clear" or msg:lower() == "clearscripts" then
			for i, v in pairs(objects) do
				if v:IsA("Script") or v:IsA("LocalScript") then
					v.Disabled = true
				end
				v:Destroy()
			end
			RemoveMessage()
			objects = {}
		end
		if msg:lower() == "fix" or msg:lower() == "undisco" or msg:lower() == "unflash" then
			game.Lighting.Ambient = Color3.new(0.4980392156862745, 0.4980392156862745, 0.4980392156862745)
			game.Lighting.Brightness = 1
			game.Lighting.TimeOfDay = "14:00:00"
			game.Lighting.FogColor = Color3.new(191, 191, 191)
			game.Lighting.FogEnd = 100000
			game.Lighting.FogStart = 0
			for i, v in pairs(lobjs) do
				v:Destroy()
			end
			for i, v in pairs(game.Workspace:children()) do
				if v.Name == "LightEdit" then
					v:Destroy()
				end
			end
		end
		if msg:lower():sub(1, 2) == "m " then
			Message("Message from " .. plr.Name, msg:sub(3), true, game.Players:children())
		end
		if msg:lower():sub(1, 2) == "h " then
			Hint(plr.Name .. ": " .. msg:sub(3), game.Players:children())
		end
		if msg:lower():sub(1, 3) == "pm " then
			local chk1 = msg:lower():sub(4):find(" ") + 3
			local plrz = GetPlr(plr, msg:lower():sub(4, chk1 - 1))
			Message("Private Message from " .. plr.Name, msg:sub(chk1 + 1), true, plrz)
		end
		if msg:lower():sub(1, 5) == "gear " then
			local chk1 = msg:lower():sub(6):find(" ") + 5
			local plrz = GetPlr(plr, msg:lower():sub(6, chk1 - 1))
			if tonumber(msg:sub(chk1 + 1)) == 61916137 or tonumber(msg:sub(chk1 + 1)) == 73089166 then
				return
			end
			for i, v in pairs(plrz) do
				coroutine.resume(coroutine.create(function()
					if v and v:findFirstChild("Backpack") then
						local obj = game:service("InsertService"):LoadAsset(tonumber(msg:sub(chk1 + 1)))
						for a, g in pairs(obj:children()) do
							if g:IsA("Tool") or g:IsA("HopperBin") then
								g.Parent = v.Backpack
							end
						end
						obj:Destroy()
					end
				end))
			end
		end
		if msg:lower():sub(1, 5) == "cape " then
			local chk1 = msg:lower():sub(6):find(" ")
			local plrz = GetPlr(plr, msg:lower():sub(6))
			local str = "torso.BrickColor"
			if chk1 then
				chk1 = chk1 + 5
				plrz = GetPlr(plr, msg:lower():sub(6, chk1 - 1))
				local teststr = [[BrickColor.new("]] .. msg:sub(chk1 + 1, chk1 + 1):upper() .. msg:sub(chk1 + 2):lower() .. [[")]]
				if msg:sub(chk1 + 1):lower() == "new yeller" then
					teststr = [[BrickColor.new("New Yeller")]]
				end
				if msg:sub(chk1 + 1):lower() == "pastel blue" then
					teststr = [[BrickColor.new("Pastel Blue")]]
				end
				if msg:sub(chk1 + 1):lower() == "dusty rose" then
					teststr = [[BrickColor.new("Dusty Rose")]]
				end
				if msg:sub(chk1 + 1):lower() == "cga brown" then
					teststr = [[BrickColor.new("CGA brown")]]
				end
				if msg:sub(chk1 + 1):lower() == "random" then
					teststr = [[BrickColor.random()]]
				end
				if msg:sub(chk1 + 1):lower() == "shiny" then
					teststr = [[BrickColor.new("Institutional white") p.Reflectance = 1]]
				end
				if msg:sub(chk1 + 1):lower() == "gold" then
					teststr = [[BrickColor.new("Bright yellow") p.Reflectance = .4]]
				end
				if msg:sub(chk1 + 1):lower() == "kohl" then
					teststr = [[BrickColor.new("Really black") local dec = Instance.new("Decal", p) dec.Face = 2 dec.Texture = "http://www.roblox.com/asset/?id=108597653"]]
				end
				if msg:sub(chk1 + 1):lower() == "batman" then
					teststr = [[BrickColor.new("Really black") local dec = Instance.new("Decal", p) dec.Face = 2 dec.Texture = "http://www.roblox.com/asset/?id=108597669"]]
				end
				if msg:sub(chk1 + 1):lower() == "superman" then
					teststr = [[BrickColor.new("Bright blue") local dec = Instance.new("Decal", p) dec.Face = 2 dec.Texture = "http://www.roblox.com/asset/?id=108597677"]]
				end
				if msg:sub(chk1 + 1):lower() == "swag" then
					teststr = [[BrickColor.new("Pink") local dec = Instance.new("Decal", p) dec.Face = 2 dec.Texture = "http://www.roblox.com/asset/?id=109301474"]]
				end
				if BrickColor.new(teststr) ~= nil then
					str = teststr
				end
			end
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") and v.Character and v.Character:findFirstChild("Torso") then
					for a, cp in pairs(v.Character:children()) do
						if cp.Name == "EpicCape" then
							cp:Destroy()
						end
					end
					local cl = script.LocalScriptBase:Clone()
					cl.Name = "CapeScript"
					cl.Code.Value = [[local plr = game.Players.LocalPlayer
repeat wait() until plr and plr.Character and plr.Character:findFirstChild("Torso")
local torso = plr.Character.Torso
local p = Instance.new("Part", torso.Parent) p.Name = "EpicCape" p.Anchored = false
p.CanCollide = false p.TopSurface = 0 p.BottomSurface = 0 p.BrickColor = ]] .. str .. [[ p.formFactor = "Custom"
p.Size = Vector3.new(.2,.2,.2)
local msh = Instance.new("BlockMesh", p) msh.Scale = Vector3.new(9,17.5,.5)
local motor1 = Instance.new("Motor", p)
motor1.Part0 = p
motor1.Part1 = torso
motor1.MaxVelocity = .01
motor1.C0 = CFrame.new(0,1.75,0)*CFrame.Angles(0,math.rad(90),0)
motor1.C1 = CFrame.new(0,1,.45)*CFrame.Angles(0,math.rad(90),0)
local wave = false
repeat wait(1/44)
local ang = 0.1
local oldmag = torso.Velocity.magnitude
local mv = .002
if wave then ang = ang + ((torso.Velocity.magnitude/10)*.05)+.05 wave = false else wave = true end
ang = ang + math.min(torso.Velocity.magnitude/11, .5)
motor1.MaxVelocity = math.min((torso.Velocity.magnitude/111), .04) + mv
motor1.DesiredAngle = -ang
if motor1.CurrentAngle < -.2 and motor1.DesiredAngle > -.2 then motor1.MaxVelocity = .04 end
repeat wait() until motor1.CurrentAngle == motor1.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag)  >= (torso.Velocity.magnitude/10) + 1
if torso.Velocity.magnitude < .1 then wait(.1) end
until not p or p.Parent ~= torso.Parent
script:Destroy()
]]
					cl.Parent = v.PlayerGui
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 7) == "uncape " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") and v.Character then
					for a, cp in pairs(v.Character:children()) do
						if cp.Name == "EpicCape" then
							cp:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 7) == "noclip " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") then
					local cl = script.LocalScriptBase:Clone()
					cl.Name = "NoClip"
					cl.Code.Value = [[repeat wait(1/44) until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer:GetMouse() and game.Workspace.CurrentCamera local mouse = game.Players.LocalPlayer:GetMouse() local torso = game.Players.LocalPlayer.Character.Torso local dir = {w = 0, s = 0, a = 0, d = 0} local spd = 2 mouse.KeyDown:connect(function(key) if key:lower() == "w" then dir.w = 1 elseif key:lower() == "s" then dir.s = 1 elseif key:lower() == "a" then dir.a = 1 elseif key:lower() == "d" then dir.d = 1 elseif key:lower() == "q" then spd = spd + 1 elseif key:lower() == "e" then spd = spd - 1 end end) mouse.KeyUp:connect(function(key) if key:lower() == "w" then dir.w = 0 elseif key:lower() == "s" then dir.s = 0 elseif key:lower() == "a" then dir.a = 0 elseif key:lower() == "d" then dir.d = 0 end end) torso.Anchored = true game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true game.Players.LocalPlayer.Character.Humanoid.Changed:connect(function() game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true end) repeat wait(1/44) torso.CFrame = CFrame.new(torso.Position, game.Workspace.CurrentCamera.CoordinateFrame.p) * CFrame.Angles(0,math.rad(180),0) * CFrame.new((dir.d-dir.a)*spd,0,(dir.s-dir.w)*spd) until nil]]
					cl.Parent = v.PlayerGui
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 8) == "skydive " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild('Torso') then
					v.Character.Torso.CFrame = v.Character.Torso.CFrame + Vector3.new(0, 2000)
				end
			end
		end
		if msg:lower():sub(1, 5) == "clip " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") and v.Character and v.Character:findFirstChild("Torso") and v.Character:findFirstChild("Humanoid") then
					for a, q in pairs(v.PlayerGui:children()) do
						if q.Name == "NoClip" then
							q:Destroy()
						end
					end
					v.Character.Torso.Anchored = false
					wait(.1)
					v.Character.Humanoid.PlatformStand = false
				end
			end
		end
		if msg:lower():sub(1, 6) == "sword " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("Backpack") then
					local sword = Instance.new("Tool", v.Backpack)
					sword.Name = "Sword"
					sword.TextureId = "rbxasset://Textures/Sword128.png"
					sword.GripForward = Vector3.new(-1, 0, 0)
					sword.GripPos = Vector3.new(0, 0, - 1.5)
					sword.GripRight = Vector3.new(0, 1, 0)
					sword.GripUp = Vector3.new(0, 0, 1)
					local handle = Instance.new("Part", sword)
					handle.Name = "Handle"
					handle.FormFactor = "Plate"
					handle.Size = Vector3.new(1, .8, 4)
					handle.TopSurface = 0
					handle.BottomSurface = 0
					local msh = Instance.new("SpecialMesh", handle)
					msh.MeshId = "rbxasset://fonts/sword.mesh"
					msh.TextureId = "rbxasset://textures/SwordTexture.png"
					local cl = script.LocalScriptBase:Clone()
					cl.Parent = sword
					cl.Code.Value = [[
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local Damage = 15
local SlashSound = Instance.new("Sound", script.Parent.Handle)
SlashSound.SoundId = "rbxasset://sounds\\swordslash.wav"
SlashSound.Volume = 1
local LungeSound = Instance.new("Sound", script.Parent.Handle)
LungeSound.SoundId = "rbxasset://sounds\\swordlunge.wav"
LungeSound.Volume = 1
local UnsheathSound = Instance.new("Sound", script.Parent.Handle)
UnsheathSound.SoundId = "rbxasset://sounds\\unsheath.wav"
UnsheathSound.Volume = 1
local last = 0
script.Parent.Handle.Touched:connect(function(hit)
if hit and hit.Parent and hit.Parent:findFirstChild("Humanoid") and game.Players:findFirstChild(hit.Parent.Name) and game.Players.LocalPlayer.Character.Humanoid.Health > 0 and hit.Parent.Humanoid ~= game.Players.LocalPlayer.Character.Humanoid then
local tag = Instance.new("ObjectValue", hit.Parent.Humanoid) tag.Value = plr1 tag.Name = "creator" game:service("Debris"):AddItem(tag, 3)
hit.Parent.Humanoid:TakeDamage(Damage)
end
end)
script.Parent.Activated:connect(function()
if not script.Parent.Enabled or game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then return end
script.Parent.Enabled = false
local tick = game:service("RunService").Stepped:wait()
if tick - last <= .2 then
LungeSound:play()
local lunge = Instance.new("StringValue", script.Parent) lunge.Name = "toolanim" lunge.Value = "Lunge"
local frc = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.Torso) frc.Name = "SwordForce" frc.velocity = Vector3.new(0,10,0)
wait(.2)
script.Parent.GripForward = Vector3.new(0,0,1)
script.Parent.GripRight = Vector3.new(0,-1,0)
script.Parent.GripUp = Vector3.new(-1,0,0)
wait(.3)
frc:Destroy() wait(.5)
script.Parent.GripForward = Vector3.new(-1,0,0)
script.Parent.GripRight = Vector3.new(0,1,0)
script.Parent.GripUp = Vector3.new(0,0,1)
else
SlashSound:play()
local slash = Instance.new("StringValue", script.Parent) slash.Name = "toolanim" slash.Value = "Slash"
end
last = tick
script.Parent.Enabled = true
end)
script.Parent.Equipped:connect(function(mouse)
for i,v in pairs(game.Players.LocalPlayer.Character.Torso:children()) do if v.Name == "SwordForce" then v:Destroy() end end
UnsheathSound:play()
script.Parent.Enabled = true
if not mouse then return end
mouse.Icon = "http://www.roblox.com/asset/?id=103593352"
end)]]
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 8) == "control " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v.Character.Humanoid.PlatformStand = true
					local w = Instance.new("Weld", plr.Character.Torso)
					w.Part0 = plr.Character.Torso
					w.Part1 = v.Character.Torso
					local w2 = Instance.new("Weld", plr.Character.Head)
					w2.Part0 = plr.Character.Head
					w2.Part1 = v.Character.Head
					local w3 = Instance.new("Weld", plr.Character:findFirstChild("Right Arm"))
					w3.Part0 = plr.Character:findFirstChild("Right Arm")
					w3.Part1 = v.Character:findFirstChild("Right Arm")
					local w4 = Instance.new("Weld", plr.Character:findFirstChild("Left Arm"))
					w4.Part0 = plr.Character:findFirstChild("Left Arm")
					w4.Part1 = v.Character:findFirstChild("Left Arm")
					local w5 = Instance.new("Weld", plr.Character:findFirstChild("Right Leg"))
					w5.Part0 = plr.Character:findFirstChild("Right Leg")
					w5.Part1 = v.Character:findFirstChild("Right Leg")
					local w6 = Instance.new("Weld", plr.Character:findFirstChild("Left Leg"))
					w6.Part0 = plr.Character:findFirstChild("Left Leg")
					w6.Part1 = v.Character:findFirstChild("Left Leg")
					plr.Character.Head.face:Destroy()
					for i, p in pairs(v.Character:children()) do
						if p:IsA("BasePart") then
							p.CanCollide = false
						end
					end
					for i, p in pairs(plr.Character:children()) do
						if p:IsA("BasePart") then
							p.Transparency = 1
						elseif p:IsA("Hat") then
							p:Destroy()
						end
					end
					v.Character.Parent = plr.Character
					v.Character.Humanoid.Changed:connect(function()
						v.Character.Humanoid.PlatformStand = true
					end)
				end
			end
		end
		if msg:lower():sub(1, 5) == "kill " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v.Character:BreakJoints()
				end
			end
		end
		if msg:lower():sub(1, 8) == "respawn " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v:LoadCharacter()
				end
			end
		end
		if msg:lower():sub(1, 6) == "reset " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v.Character then
					local savedCFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame
					v:LoadCharacter()
					wait(.049)
					v.Character:FindFirstChild("HumanoidRootPart").CFrame = savedCFrame
				end
			end
		end		
		if msg:lower():sub(1, 5) == "trip " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					v.Character.Torso.CFrame = v.Character.Torso.CFrame * CFrame.Angles(0, 0, math.rad(180))
				end
			end
		end
		if msg:lower():sub(1, 5) == "stun " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.PlatformStand = true
				end
			end
		end
		if msg:lower():sub(1, 7) == "unstun " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.PlatformStand = false
				end
			end
		end
		if msg:lower():sub(1, 5) == "jump " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.Jump = true
				end
			end
		end
		if msg:lower():sub(1, 4) == "sit " then
			local plrz = GetPlr(plr, msg:lower():sub(5))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.Sit = true
				end
			end
		end
		if msg:lower():sub(1, 10) == "invisible " then
			local plrz = GetPlr(plr, msg:lower():sub(11))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") then
							obj.Transparency = 1
							if obj:findFirstChild("face") then
								obj.face.Transparency = 1
							end
						elseif obj:IsA("Hat") and obj:findFirstChild("Handle") then
							obj.Handle.Transparency = 1
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 6) == "invis " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") then
							obj.Transparency = 1
							if obj:findFirstChild("face") then
								obj.face.Transparency = 1
							end
						elseif obj:IsA("Hat") and obj:findFirstChild("Handle") then
							obj.Handle.Transparency = 1
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 8) == "visible " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") then
							obj.Transparency = 0
							if obj:findFirstChild("face") then
								obj.face.Transparency = 0
							end
						elseif obj:IsA("Hat") and obj:findFirstChild("Handle") then
							obj.Handle.Transparency = 0
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 4) == "vis " then
			local plrz = GetPlr(plr, msg:lower():sub(5))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") then
							obj.Transparency = 0
							if obj:findFirstChild("face") then
								obj.face.Transparency = 0
							end
						elseif obj:IsA("Hat") and obj:findFirstChild("Handle") then
							obj.Handle.Transparency = 0
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 5) == "lock " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") then
							obj.Locked = true
						elseif obj:IsA("Hat") and obj:findFirstChild("Handle") then
							obj.Handle.Locked = true
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 7) == "unlock " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") then
							obj.Locked = false
						elseif obj:IsA("Hat") and obj:findFirstChild("Handle") then
							obj.Handle.Locked = false
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 7) == "btools " then
			if plr and plr:findFirstChild("Backpack") then
				local t1 = Instance.new("HopperBin", plr.Backpack)
				t1.Name = "Move"
				t1.BinType = "GameTool"
				local t2 = Instance.new("HopperBin", plr.Backpack)
				t2.Name = "Clone"
				t2.BinType = "Clone"
				local t3 = Instance.new("HopperBin", plr.Backpack)
				t3.Name = "Delete"
				t3.BinType = "Hammer"
				local t4 = Instance.new("HopperBin", plr.Backpack)
				t4.Name = "Resize"
				local cl4 = script.LocalScriptBase:Clone()
				cl4.Parent = t4
				cl4.Code.Value = [[
repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer:findFirstChild("PlayerGui")
local sb
local hs
local pdist

script.Parent.Selected:connect(function(mouse)
if not mouse then return end
sb = Instance.new("SelectionBox", game.Players.LocalPlayer.PlayerGui) sb.Color = BrickColor.new("Bright blue") sb.Adornee = nil
hs = Instance.new("Handles", game.Players.LocalPlayer.PlayerGui) hs.Color = BrickColor.new("Bright blue") hs.Adornee = nil
mouse.Button1Down:connect(function() if not mouse.Target or mouse.Target.Locked then sb.Adornee = nil hs.Adornee = nil else sb.Adornee = mouse.Target hs.Adornee = mouse.Target hs.Faces = mouse.Target.ResizeableFaces end end)
hs.MouseDrag:connect(function(old,dist) if hs.Adornee and math.abs(dist-pdist) >= hs.Adornee.ResizeIncrement then if hs.Adornee:Resize(old, math.floor((dist-pdist)/ hs.Adornee.ResizeIncrement + .5) * hs.Adornee.ResizeIncrement) then pdist = dist end end end)
hs.MouseButton1Down:connect(function() pdist = 0 end)
end)

script.Parent.Deselected:connect(function() sb:Destroy() hs:Destroy() end)]]
				cl4.Disabled = false
			end
		end
		if msg:lower():sub(1, 8) == "explode " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					local ex = Instance.new("Explosion", game.Workspace)
					ex.Position = v.Character.Torso.Position
				end
			end
		end
		if msg:lower():sub(1, 4) == "age " then
			local plrz = GetPlr(plr, msg:lower():sub(5))
			for i, v in pairs(plrz) do
				if v then
					Message(v.Name .. "'s age", tostring(v.AccountAge), false, {
						plr
					})
				end
			end
		end
		if msg:lower():sub(1, 5) == "fire " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					local cl = Instance.new("Fire", v.Character.Torso)
					table.insert(objects, cl)
				end
			end
		end
		if msg:lower():sub(1, 7) == "unfire " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					for z, cl in pairs(v.Character.Torso:children()) do
						if cl:IsA("Fire") then
							cl:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 6) == "smoke " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					local cl = Instance.new("Smoke", v.Character.Torso)
					table.insert(objects, cl)
				end
			end
		end
		if msg:lower():sub(1, 8) == "unsmoke " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					for z, cl in pairs(v.Character.Torso:children()) do
						if cl:IsA("Smoke") then
							cl:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 9) == "sparkles " then
			local plrz = GetPlr(plr, msg:lower():sub(10))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					local cl = Instance.new("Sparkles", v.Character.Torso)
					table.insert(objects, cl)
				end
			end
		end
		if msg:lower():sub(1, 11) == "unsparkles " then
			local plrz = GetPlr(plr, msg:lower():sub(12))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					for z, cl in pairs(v.Character.Torso:children()) do
						if cl:IsA("Sparkles") then
							cl:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 3) == "ff " then
			local plrz = GetPlr(plr, msg:lower():sub(4))
			for i, v in pairs(plrz) do
				if v and v.Character then
					Instance.new("ForceField", v.Character)
				end
			end
		end
		if msg:lower():sub(1, 4) == "hat " then
			local chk1 = msg:lower():sub(5):find(" ") + 4
			local plrz = GetPlr(plr, msg:lower():sub(5, chk1 - 1))
			for i, v in pairs(plrz) do
				coroutine.resume(coroutine.create(function()
					if v and v.Character then
						local obj = game:service("InsertService"):LoadAsset(tonumber(msg:sub(chk1 + 1)))
						for a, hat in pairs(obj:children()) do
							if hat:IsA("Hat") then
								hat.Parent = v.Character
							end
						end
						obj:Destroy()
					end
				end))
			end
		end
		if msg:lower():sub(1, 5) == "unff " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for z, cl in pairs(v.Character:children()) do
						if cl:IsA("ForceField") then
							cl:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 7) == "punish " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v.Character.Parent = game:service("Lighting")
				end
			end
		end
		if msg:lower():sub(1, 9) == "unpunish " then
			local plrz = GetPlr(plr, msg:lower():sub(10))
			for i, v in pairs(plrz) do
				coroutine.resume(coroutine.create(function()
					if v and v.Character then
						v.Character.Parent = game:service("Workspace")
						v.Character:MakeJoints()
					end
				end))
			end
		end
		if msg:lower():sub(1, 7) == "freeze " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") then
							obj.Anchored = true
						end
						v.Character.Humanoid.WalkSpeed = 0
					end
				end
			end
		end
		if msg:lower():sub(1, 5) == "thaw " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") then
							obj.Anchored = false
						end
						v.Character.Humanoid.WalkSpeed = 16
					end
				end
			end
		end
		if msg:lower():sub(1, 5) == "heal " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.Health = v.Character.Humanoid.MaxHealth
				end
			end
		end
		if msg:lower():sub(1, 4) == "god " then
			local plrz = GetPlr(plr, msg:lower():sub(5))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.MaxHealth = math.huge
					v.Character.Humanoid.Health = 9e9
				end
			end
		end
		if msg:lower():sub(1, 6) == "ungod " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.MaxHealth = 100
					v.Character.Humanoid.Health = v.Character.Humanoid.MaxHealth
				end
			end
		end
		if msg:lower():sub(1, 8) == "ambient " then
			local chk1 = msg:lower():sub(9):find(" ") + 8
			local chk2 = msg:sub(chk1 + 1):find(" ") + chk1
			game.Lighting.Ambient = Color3.new(msg:sub(9, chk1 - 1), msg:sub(chk1 + 1, chk2 - 1), msg:sub(chk2 + 1))
		end
		if msg:lower():sub(1, 11) == "brightness " then
			game.Lighting.Brightness = msg:sub(12)
		end
		if msg:lower():sub(1, 5) == "time " then
			game.Lighting.TimeOfDay = msg:sub(6)
		end
		if msg:lower():sub(1, 9) == "fogcolor " then
			local chk1 = msg:lower():sub(10):find(" ") + 9
			local chk2 = msg:sub(chk1 + 1):find(" ") + chk1
			game.Lighting.FogColor = Color3.new(msg:sub(10, chk1 - 1), msg:sub(chk1 + 1, chk2 - 1), msg:sub(chk2 + 1))
		end
		if msg:lower():sub(1, 7) == "fogend " then
			game.Lighting.FogEnd = msg:sub(8)
		end
		if msg:lower():sub(1, 9) == "fogstart " then
			game.Lighting.FogStart = msg:sub(10)
		end
		if msg:lower():sub(1, 12) == "removetools " then
			local plrz = GetPlr(plr, msg:lower():sub(13))
			for i, v in pairs(plrz) do
				if v and v.Character and v:findFirstChild("Backpack") then
					for a, tool in pairs(v.Character:children()) do
						if tool:IsA("Tool") or tool:IsA("HopperBin") then
							tool:Destroy()
						end
					end
					for a, tool in pairs(v.Backpack:children()) do
						if tool:IsA("Tool") or tool:IsA("HopperBin") then
							tool:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 5) == "rank " then
			local chk1 = msg:lower():sub(6):find(" ") + 5
			local plrz = GetPlr(plr, msg:lower():sub(6, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v:IsInGroup(msg:sub(chk1 + 1)) then
					Hint("[" .. v:GetRankInGroup(msg:sub(chk1 + 1)) .. "] " .. v:GetRoleInGroup(msg:sub(chk1 + 1)), {
						plr
					})
				elseif v and not v:IsInGroup(msg:sub(chk1 + 1)) then
					Hint(v.Name .. " is not in the group " .. msg:sub(chk1 + 1), {
						plr
					})
				end
			end
		end
		if msg:lower():sub(1, 7) == "damage " then
			local chk1 = msg:lower():sub(8):find(" ") + 7
			local plrz = GetPlr(plr, msg:lower():sub(8, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid:TakeDamage(msg:sub(chk1 + 1))
				end
			end
		end
		if msg:lower():sub(1, 5) == "grav " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					for a, frc in pairs(v.Character.Torso:children()) do
						if frc.Name == "BFRC" then
							frc:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 8) == "setgrav " then
			local chk1 = msg:lower():sub(9):find(" ") + 8
			local plrz = GetPlr(plr, msg:lower():sub(9, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					for a, frc in pairs(v.Character.Torso:children()) do
						if frc.Name == "BFRC" then
							frc:Destroy()
						end
					end
					local frc = Instance.new("BodyForce", v.Character.Torso)
					frc.Name = "BFRC"
					frc.force = Vector3.new(0, 0, 0)
					for a, prt in pairs(v.Character:children()) do
						if prt:IsA("BasePart") then
							frc.force = frc.force - Vector3.new(0, prt:GetMass() * msg:sub(chk1 + 1), 0)
						elseif prt:IsA("Hat") then
							frc.force = frc.force - Vector3.new(0, prt.Handle:GetMass() * msg:sub(chk1 + 1), 0)
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 7) == "nograv " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					for a, frc in pairs(v.Character.Torso:children()) do
						if frc.Name == "BFRC" then
							frc:Destroy()
						end
					end
					local frc = Instance.new("BodyForce", v.Character.Torso)
					frc.Name = "BFRC"
					frc.force = Vector3.new(0, 0, 0)
					for a, prt in pairs(v.Character:children()) do
						if prt:IsA("BasePart") then
							frc.force = frc.force + Vector3.new(0, prt:GetMass() * 196.25, 0)
						elseif prt:IsA("Hat") then
							frc.force = frc.force + Vector3.new(0, prt.Handle:GetMass() * 196.25, 0)
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 7) == "health " then
			local chk1 = msg:lower():sub(8):find(" ") + 7
			local plrz = GetPlr(plr, msg:lower():sub(8, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.MaxHealth = msg:sub(chk1 + 1)
					v.Character.Humanoid.Health = v.Character.Humanoid.MaxHealth
				end
			end
		end
		if msg:lower():sub(1, 6) == "speed " then
			local chk1 = msg:lower():sub(7):find(" ") + 6
			local plrz = GetPlr(plr, msg:lower():sub(7, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Humanoid") then
					v.Character.Humanoid.WalkSpeed = msg:sub(chk1 + 1)
				end
			end
		end
		if msg:lower():sub(1, 3) == "tp " then
			local chk1 = msg:lower():sub(4):find(" ") + 3
			local plrz = GetPlr(plr, msg:lower():sub(4, chk1 - 1))
			local plrz2 = GetPlr(plr, msg:lower():sub(chk1 + 1))
			for i, v in pairs(plrz) do
				for i2, v2 in pairs(plrz2) do
					if v and v2 and v.Character and v2.Character and v.Character:findFirstChild("Torso") and v2.Character:findFirstChild("Torso") then
						v.Character.Torso.CFrame = v2.Character.Torso.CFrame + Vector3.new(math.random(-1, 1), 0, math.random(-1, 1))
					end
				end
			end
		end
		if msg:lower():sub(1, 6) == "shirt " then
			local chk1 = msg:lower():sub(7):find(" ") + 6
			local plrz = GetPlr(plr, msg:lower():sub(7, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for i, v in pairs(v.Character:children()) do
						if v:IsA("Shirt") then
							local cl = v:Clone()
							cl.Parent = v.Parent
							cl.ShirtTemplate = "http://www.roblox.com/asset/?id=" .. chk1
							v:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 6) == "pants " then
			local chk1 = msg:lower():sub(7):find(" ") + 6
			local plrz = GetPlr(plr, msg:lower():sub(7, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for i, v in pairs(v.Character:children()) do
						if v:IsA("Pants") then
							local cl = v:Clone()
							cl.Parent = v.Parent
							cl.PantsTemplate = "http://www.roblox.com/asset/?id=" .. chk1
							v:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 5) == "face " then
			local chk1 = msg:lower():sub(6):find(" ") + 5
			local plrz = GetPlr(plr, msg:lower():sub(6, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Head") and v.Character.Head:findFirstChild("face") then
					v.Character.Head:findFirstChild("face").Texture = "http://www.roblox.com/asset/?id=" .. chk1
				end
			end
		end
		if msg:lower():sub(1, 8) == "swagify " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for i, v in pairs(v.Character:children()) do
						if v.Name == "Shirt" then
							local cl = v:Clone()
							cl.Parent = v.Parent
							cl.ShirtTemplate = "http://www.roblox.com/asset/?id=109163376"
							v:Destroy()
						end
						if v.Name == "Pants" then
							local cl = v:Clone()
							cl.Parent = v.Parent
							cl.PantsTemplate = "http://www.roblox.com/asset/?id=109163376"
							v:Destroy()
						end
					end
					for a, cp in pairs(v.Character:children()) do
						if cp.Name == "EpicCape" then
							cp:Destroy()
						end
					end
					local cl = script.LocalScriptBase:Clone()
					cl.Name = "CapeScript"
					cl.Code.Value = [[local plr = game.Players.LocalPlayer
repeat wait() until plr and plr.Character and plr.Character:findFirstChild("Torso")
local torso = plr.Character.Torso
local p = Instance.new("Part", torso.Parent) p.Name = "EpicCape" p.Anchored = false
p.CanCollide = false p.TopSurface = 0 p.BottomSurface = 0 p.BrickColor = BrickColor.new("Pink") local dec = Instance.new("Decal", p) dec.Face = 2 dec.Texture = "http://www.roblox.com/asset/?id=109301474" p.formFactor = "Custom"
p.Size = Vector3.new(.2,.2,.2)
local msh = Instance.new("BlockMesh", p) msh.Scale = Vector3.new(9,17.5,.5)
local motor1 = Instance.new("Motor", p)
motor1.Part0 = p
motor1.Part1 = torso
motor1.MaxVelocity = .01
motor1.C0 = CFrame.new(0,1.75,0)*CFrame.Angles(0,math.rad(90),0)
motor1.C1 = CFrame.new(0,1,.45)*CFrame.Angles(0,math.rad(90),0)
local wave = false
repeat wait(1/44)
local ang = 0.1
local oldmag = torso.Velocity.magnitude
local mv = .002
if wave then ang = ang + ((torso.Velocity.magnitude/10)*.05)+.05 wave = false else wave = true end
ang = ang + math.min(torso.Velocity.magnitude/11, .5)
motor1.MaxVelocity = math.min((torso.Velocity.magnitude/111), .04) + mv
motor1.DesiredAngle = -ang
if motor1.CurrentAngle < -.2 and motor1.DesiredAngle > -.2 then motor1.MaxVelocity = .04 end
repeat wait() until motor1.CurrentAngle == motor1.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag)  >= (torso.Velocity.magnitude/10) + 1
if torso.Velocity.magnitude < .1 then wait(.1) end
until not p or p.Parent ~= torso.Parent
script:Destroy()
]]
					cl.Parent = v.PlayerGui
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 8) == "package " then
			local chk1 = msg:lower():sub(9):find(" ") + 8
			local plrz = GetPlr(plr, msg:lower():sub(9, chk1 - 1))
			local costume = msg:lower():sub(chk1 + 1)
			if tostring(costume):lower():find("bear") then
				costume = "Bear"
			elseif tostring(costume):lower():find("2.0") then
				costume = "Robloxian"
			elseif tostring(costume):lower():find("roblox") then
				costume = "Robloxian"
			elseif tostring(costume):lower():find("mr. r") then
				costume = "Mr. Roboto"
			elseif tostring(costume):lower():find("mr r") then
				costume = "Mr. Roboto"
			elseif tostring(costume):lower():find("figure") then
				costume = "Action Figure"
			elseif tostring(costume):lower():find("action") then
				costume = "Action Figure"
			elseif tostring(costume):lower():find("sam") then
				costume = "Uncle Sam"
			elseif tostring(costume):lower():find("uncle") then
				costume = "Uncle Sam"
			elseif tostring(costume):lower():find("zomb") then
				costume = "Zombie"
			elseif tostring(costume):lower():find("bro") then
				costume = "Bro"
			elseif tostring(costume):lower():find("mumy") then
				costume = "Mummy"
			elseif tostring(costume):lower():find("mummy") then
				costume = "Mummy"
			elseif tostring(costume):lower():find("kid") then
				costume = "CoolKid McAwesome"
			elseif tostring(costume):lower():find("cool") then
				costume = "CoolKid McAwesome"
			elseif tostring(costume):lower():find("mcawesome") then
				costume = "CoolKid McAwesome"
			elseif tostring(costume):lower():find("foot") then
				costume = "Football Player"
			elseif tostring(costume):lower():find("katana") then
				costume = "The Katana Kid"
			elseif tostring(costume):lower():find("the k") then
				costume = "The Katana Kid"
			elseif tostring(costume):lower():find("gun") then
				costume = "Gunslinger"
			elseif tostring(costume):lower():find("lord g") then
				costume = "Lord Griswold"
			elseif tostring(costume):lower():find("lord j") then
				costume = "Lord Jahrfyre the Grim"
			elseif tostring(costume):lower():find("magna") then
				costume = "Magnabot"
			elseif tostring(costume):lower():find("pirate s") then
				costume = "Pirate Swashbuckler"
			elseif tostring(costume):lower():find("skel") then
				costume = "Skeleton"
			elseif tostring(costume):lower():find("supe") then
				costume = "Superhero"
			elseif tostring(costume):lower():find("hero") then
				costume = "Superhero"
			elseif tostring(costume):lower():find("tenta") then
				costume = "Tentacled Alien"
			elseif tostring(costume):lower():find("alien") then
				costume = "Tentacled Alien"
			elseif tostring(costume):lower():find("vam") then
				costume = "Vampire"
			elseif tostring(costume):lower():find("than") then
				costume = "Thane of the Fen"
			elseif tostring(costume):lower():find("were") then
				costume = "Werewolf"
			elseif tostring(costume):lower():find("wolf") then
				costume = "Werewolf"
			elseif tostring(costume):lower():find("bun") then
				costume = "Bunny"
			elseif tostring(costume):lower():find("ging") then
				costume = "Gingerbread"
			elseif tostring(costume):lower():find("bread") then
				costume = "Gingerbread"
			elseif tostring(costume):lower():find("esk") then
				costume = "Eskimo"
			elseif tostring(costume):lower():find("imo") then
				costume = "Eskimo"
			elseif tostring(costume):lower():find("pen") then
				costume = "Penguin"
			elseif tostring(costume):lower():find("trol") then
				costume = "Mr. Trololololo"
			elseif tostring(costume):lower():find("mr t") then
				costume = "Mr. Trololololo"
			elseif tostring(costume):lower():find("mr. t") then
				costume = "Mr. Trololololo"
			elseif tostring(costume):lower():find("off") then
				costume = "Officer Blox"
			elseif tostring(costume):lower():find("pol") then
				costume = "Officer Blox"
			elseif tostring(costume):lower():find("cop") then
				costume = "Officer Blox"
			elseif tostring(costume):lower():find("girl") then
				costume = "ROBLOX Girl"
			elseif tostring(costume):lower():find("fem") then
				costume = "ROBLOX Girl"
			elseif tostring(costume):lower():find("santa b") then
				costume = "Santa Bot V12.25"
			elseif tostring(costume):lower():find("santa") then
				costume = "Santa"
			elseif tostring(costume):lower():find("skar") then
				costume = "Skarra, the DragonKeeper"
			elseif tostring(costume):lower():find("dragon") then
				costume = "Skarra, the DragonKeeper"
			elseif tostring(costume):lower():find("elf") then
				costume = "Elf"
			elseif tostring(costume):lower():find("stone") then
				costume = "Stonetroid Warrior"
			elseif tostring(costume):lower():find("agent") then
				costume = "Agent 53"
			elseif tostring(costume):lower():find("pump") then
				costume = "Pumpkin Trick or Treater"
			elseif tostring(costume):lower():find("man") then
				costume = "Man"
			elseif tostring(costume):lower():find("knight o") then
				costume = "Knight of the Splintered Sky"
			elseif tostring(costume):lower():find("sky") then
				costume = "Knight of the Splintered Sky"
			elseif tostring(costume):lower():find("woman") then
				costume = "Woman"
			elseif tostring(costume):lower():find("ice") then
				costume = "Ice Golem"
			elseif tostring(costume):lower():find("gol") then
				costume = "Ice Golem"
			elseif tostring(costume):lower():find("great") then
				costume = "The Great Bloxini"
			elseif tostring(costume):lower():find("bloxini") then
				costume = "The Great Bloxini"
			elseif tostring(costume):lower():find("gentle") then
				costume = "Gentleman Robot"
			elseif tostring(costume):lower():find("h-bot") then
				costume = "H-Bot 1031"
			elseif tostring(costume):lower():find("ibot") then
				costume = "iBot"
			elseif tostring(costume):lower():find("crook") then
				costume = "The Crook"
			elseif tostring(costume):lower():find("the c") then
				costume = "The Crook"
			elseif tostring(costume):lower():find("mys") then
				costume = "Mystic Vizier"
			elseif tostring(costume):lower():find("general b") then
				costume = "General Badblox"
			elseif tostring(costume):lower():find("badblox") then
				costume = "General Badblox"
			elseif tostring(costume):lower():find("under") then
				costume = "Undercover Superhero"
			elseif tostring(costume):lower():find("dark") then
				costume = "Darkest Assassin"
			elseif tostring(costume):lower():find("assa") then
				costume = "Darkest Assassin"
			elseif tostring(costume):lower():find("red") then
				costume = "Redcliff Elite Commander"
			elseif tostring(costume):lower():find("comm") then
				costume = "Redcliff Elite Commander"
			elseif tostring(costume):lower():find("korblox g") then
				costume = "Korblox General"
			elseif tostring(costume):lower():find("knightm") then
				costume = "Knightmare"
			elseif tostring(costume):lower():find("fun") then
				costume = "Fundroid"
			elseif tostring(costume):lower():find("droid") then
				costume = "Fundroid"
			elseif tostring(costume):lower():find("frank") then
				costume = "Frankenstein"
			elseif tostring(costume):lower():find("stein") then
				costume = "Frankenstein"
			elseif tostring(costume):lower():find("snow") then
				costume = "Snowman"
			elseif tostring(costume):lower():find("the o") then
				costume = "The OverSeer"
			elseif tostring(costume):lower():find("over") then
				costume = "The OverSeer"
			elseif tostring(costume):lower():find("the d") then
				costume = "The Doombringer"
			elseif tostring(costume):lower():find("doom") then
				costume = "The Doombringer"
			elseif tostring(costume):lower():find("captain c") then
				costume = "Captain Crimson Jack"
			elseif tostring(costume):lower():find("crim") then
				costume = "Captain Crimson Jack"
			elseif tostring(costume):lower():find("jack") then
				costume = "Captain Crimson Jack"
			elseif tostring(costume):lower():find("captain z") then
				costume = "Captain Zombie"
			elseif tostring(costume):lower():find("ench") then
				costume = "Enchanted Knight of Redcliff"
			elseif tostring(costume):lower():find("korblox w") then
				costume = "Korblox Warrior"
			elseif tostring(costume):lower():find("korblox s") then
				costume = "Korblox Sketelon"
			elseif tostring(costume):lower():find("korblox m") then
				costume = "Korblox Mage"
			elseif tostring(costume):lower():find("phoe") then
				costume = "Phoenixgarde Knight"
			elseif tostring(costume):lower():find("pt") then
				costume = "PT-ST4 Mobile Armor Unit"
			elseif tostring(costume):lower():find("mob") then
				costume = "PT-ST4 Mobile Armor Unit"
			elseif tostring(costume):lower():find("dil") then
				costume = "Dilophosaurus"
			elseif tostring(costume):lower():find("dark") then
				costume = "Darkage Master"
			elseif tostring(costume):lower():find("master") then
				costume = "Darkage Master"
			elseif tostring(costume):lower():find("aph") then
				costume = "Aphelion"
			elseif tostring(costume):lower():find("lead") then
				costume = "Leader of the Pack"
			elseif tostring(costume):lower():find("pack") then
				costume = "Leader of the Pack"
			elseif tostring(costume):lower():find("zach") then
				costume = "Zachary Elloit Dencourt, III"
			elseif tostring(costume):lower():find("the f") then
				costume = "The Finnster"
			elseif tostring(costume):lower():find("finn") then
				costume = "The Finnster"
			elseif tostring(costume):lower():find("the ca") then
				costume = "The Captain"
			elseif tostring(costume):lower():find("spir") then
				costume = "Spiral Knight"
			elseif tostring(costume):lower():find("space t") then
				costume = "Space Trooper"
			elseif tostring(costume):lower():find("spacem") then
				costume = "Spaceman"
			elseif tostring(costume):lower():find("ruby") then
				costume = "Rubyhorde the Rapacious"
			elseif tostring(costume):lower():find("mech") then
				costume = "Mechabloxxer"
			elseif tostring(costume):lower():find("redsteel") then
				costume = "Redsteel Ranger - A Gamestop Exclusive!"
			elseif tostring(costume):lower():find("redcliff") then
				costume = "Redcliff Knight"
			elseif tostring(costume):lower():find("red f") then
				costume = "Red Futurion"
			elseif tostring(costume):lower():find("pil") then
				costume = "Pilgrim"
			elseif tostring(costume):lower():find("grim") then
				costume = "Pilgrim"
			elseif tostring(costume):lower():find("ori") then
				costume = "Orinthian Soldier"
			elseif tostring(costume):lower():find("soldier") then
				costume = "Orinthian Soldier"
			elseif tostring(costume):lower():find("madc") then
				costume = "Madcap Adventurer"
			elseif tostring(costume):lower():find("adv") then
				costume = "Madcap Adventurer"
			elseif tostring(costume):lower():find("iron") then
				costume = "Iron Armor"
			elseif tostring(costume):lower():find("holi") then
				costume = "Holiday Ninja"
			elseif tostring(costume):lower():find("ninja") then
				costume = "Holiday Ninja"
			elseif tostring(costume):lower():find("holiday l") then
				costume = "Holiday Lights"
			elseif tostring(costume):lower():find("cursed") then
				costume = "Cursed Mummy of Ramses II"
			elseif tostring(costume):lower():find("bounty") then
				costume = "Bounty Hunter"
			elseif tostring(costume):lower():find("hunter") then
				costume = "Bounty Hunter"
			elseif tostring(costume):lower():find("awesome") then
				costume = "Awesomesaurus Rex"
			elseif tostring(costume):lower():find("pirate") then
				costume = "Pirate"
			else
				costume = "Random"
			end
			for i, v in pairs(plrz) do
				if v and v.Character then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("CharacterMesh") then
							obj:Destroy()
						end
					end
					if costume == "Random" then
						for a, obj in pairs(p_storage:children()[math.random(# p_storage:children())]:children()) do
							obj:Clone().Parent = v.Character
						end
					else
						for a, obj in pairs(p_storage[costume]:children()) do
							obj:Clone().Parent = v.Character
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 6) == "music " then
			for i, v in pairs(game.Workspace:children()) do
				if v:IsA("Sound") then
					v:Destroy()
				end
			end
			local id = msg:sub(7)
			local pitch = 1
			if tostring(id):lower():find("caramell") then
				id = 2303479
			end
			if tostring(id):find("epic") then
				id = 27697743
				pitch = 2.5
			end
			if tostring(id):find("rick") then
				id = 2027611
			end
			if tostring(id):find("halo") then
				id = 1034065
			end
			if tostring(id):find("pokemon") then
				id = 1372261
			end
			if tostring(id):find("cursed") then
				id = 1372257
			end
			if tostring(id):find("extreme") then
				id = 11420933
			end
			if tostring(id):find("awaken") then
				id = 27697277
			end
			if tostring(id):find("alone") then
				id = 27697392
			end
			if tostring(id):find("mario") then
				id = 1280470
			end
			if tostring(id):find("choir") then
				id = 1372258
			end
			if tostring(id):find("chrono") then
				id = 1280463
			end
			if tostring(id):find("dotr") then
				id = 11420922
			end
			if tostring(id):find("entertain") then
				id = 27697267
			end
			if tostring(id):find("fantasy") then
				id = 1280473
			end
			if tostring(id):find("final") then
				id = 1280414
			end
			if tostring(id):find("emblem") then
				id = 1372259
			end
			if tostring(id):find("flight") then
				id = 27697719
			end
			if tostring(id):find("banjo") then
				id = 27697298
			end
			if tostring(id):find("gothic") then
				id = 27697743
			end
			if tostring(id):find("hiphop") then
				id = 27697735
			end
			if tostring(id):find("intro") then
				id = 27697707
			end
			if tostring(id):find("mule") then
				id = 1077604
			end
			if tostring(id):find("film") then
				id = 27697713
			end
			if tostring(id):find("nezz") then
				id = 8610025
			end
			if tostring(id):find("angel") then
				id = 1372260
			end
			if tostring(id):find("resist") then
				id = 27697234
			end
			if tostring(id):find("schala") then
				id = 5985787
			end
			if tostring(id):find("organ") then
				id = 11231513
			end
			if tostring(id):find("tunnel") then
				id = 9650822
			end
			if tostring(id):find("spanish") then
				id = 5982975
			end
			if tostring(id):find("venom") then
				id = 1372262
			end
			if tostring(id):find("wind") then
				id = 1015394
			end
			if tostring(id):find("guitar") then
				id = 5986151
			end
			local s = Instance.new("Sound", game.Workspace)
			s.SoundId = "http://www.roblox.com/asset/?id=" .. id
			s.Volume = 1
			s.Pitch = pitch
			s.Looped = true
			s.archivable = false
			repeat
				s:Play()
				wait(2.5)
				s:Stop()
				wait(.5)
				s:Play()
			until s.IsPlaying
		end
		if msg:lower() == "stopmusic" then
			for i, v in pairs(game.Workspace:children()) do
				if v:IsA("Sound") then
					v:Destroy()
				end
			end
		end
		if msg:lower() == "musiclist" then
			if plr.PlayerGui:findFirstChild("MUSICGUI") then
				return
			end
			local scr, cmf, ent, num = ScrollGui()
			scr.Name = "MUSICGUI"
			scr.Parent = plr.PlayerGui
			local list = {
				"caramell",
				"epic",
				"rick",
				"halo",
				"pokemon",
				"cursed",
				"extreme",
				"awaken",
				"alone",
				"mario",
				"choir",
				"chrono",
				"dotr",
				"entertain",
				"fantasy",
				"final",
				"emblem",
				"flight",
				"banjo",
				"gothic",
				"hiphop",
				"intro",
				"mule",
				"film",
				"nezz",
				"angel",
				"resist",
				"schala",
				"organ",
				"tunnel",
				"spanish",
				"venom",
				"wind",
				"guitar"
			}
			for i, v in pairs(list) do
				local cl = ent:Clone()
				cl.Parent = cmf
				cl.Text = v
				cl.Position = UDim2.new(0, 0, 0, num * 20)
				num = num + 1
			end
		end
		if msg:lower() == "cmds" then
			if plr.PlayerGui:findFirstChild("MUSICGUI") then
				return
			end
			local scr, cmf, ent, num = ScrollGui()
			scr.Name = "MUSICGUI"
			scr.Parent = plr.PlayerGui
			local list = {
				"btools works",
				"btools works",
				"perm enables perm mode ",
				"game is for testing purposes",	
				"fly does not work",	
				"a lot of other commands do work",
				"figure the commands out yourself"
			}
			for i, v in pairs(list) do
				local cl = ent:Clone()
				cl.Parent = cmf
				cl.Text = v
				cl.Position = UDim2.new(0, 0, 0, num * 20)
				num = num + 1
			end
		end
		if msg:lower():sub(1, 4) == "fly " then
			local plrz = GetPlr(plr, msg:lower():sub(5))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") then
					local cl = script.LocalScriptBase:Clone()
					cl.Name = "FlyScript"
					cl.Code.Value = [[repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.Torso 
local flying = true
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 50 
local speed = 0 
function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "e" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()]]
					cl.Parent = v.PlayerGui
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 6) == "unfly " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") and v.Character and v.Character:findFirstChild("Torso") and v.Character:findFirstChild("Humanoid") then
					for a, q in pairs(v.PlayerGui:children()) do
						if q.Name == "FlyScript" then
							q:Destroy()
						end
					end
					for a, q in pairs(v.Character.Torso:children()) do
						if q.Name == "BodyGyro" or q.Name == "BodyVelocity" then
							q:Destroy()
						end
					end
					wait(.1)
					v.Character.Humanoid.PlatformStand = false
				end
			end
		end
		if msg:lower() == "disco" then
			for i, v in pairs(lobjs) do
				v:Destroy()
			end
			local cl = script.ScriptBase:Clone()
			cl.Name = "LightEdit"
			cl.Code.Value = [[repeat wait(.1) local color = Color3.new(math.random(255)/255,math.random(255)/255,math.random(255)/255)
game.Lighting.Ambient = color
game.Lighting.FogColor = color
until nil]]
			table.insert(lobjs, cl)
			cl.Parent = game.Workspace
			cl.Disabled = false
		end
		if msg:lower() == "flash" then
			for i, v in pairs(lobjs) do
				v:Destroy()
			end
			local cl = script.ScriptBase:Clone()
			cl.Name = "LightEdit"
			cl.Code.Value = [[repeat wait(.1) 
game.Lighting.Ambient = Color3.new(1,1,1)
game.Lighting.FogColor = Color3.new(1,1,1)
game.Lighting.Brightness = 1
game.Lighting.TimeOfDay = 14
wait(.1) 
game.Lighting.Ambient = Color3.new(0,0,0)
game.Lighting.FogColor = Color3.new(0,0,0)
game.Lighting.Brightness = 0
game.Lighting.TimeOfDay = 0
until nil]]
			table.insert(lobjs, cl)
			cl.Parent = game.Workspace
			cl.Disabled = false
		end
		if msg:lower():sub(1, 5) == "spin " then
			local plrz = GetPlr(plr, msg:lower():sub(6))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					for i, v in pairs(v.Character.Torso:children()) do
						if v.Name == "SPINNER" then
							v:Destroy()
						end
					end
					local torso = v.Character:findFirstChild("Torso")
					local bg = Instance.new("BodyGyro", torso)
					bg.Name = "SPINNER"
					bg.maxTorque = Vector3.new(0, math.huge, 0)
					bg.P = 11111
					bg.cframe = torso.CFrame
					table.insert(objects, bg)
					repeat
						wait(0.022727272727272728)
						bg.cframe = bg.cframe * CFrame.Angles(0, math.rad(30), 0)
					until not bg or bg.Parent ~= torso
				end
			end
		end
		if msg:lower():sub(1, 7) == "unspin " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					for a, q in pairs(v.Character.Torso:children()) do
						if q.Name == "SPINNER" then
							q:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 4) == "dog " then
			local plrz = GetPlr(plr, msg:lower():sub(5))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character:findFirstChild("Shirt") then
						v.Character.Shirt.Parent = v.Character.Torso
					end
					if v.Character:findFirstChild("Pants") then
						v.Character.Pants.Parent = v.Character.Torso
					end
					v.Character.Torso.Transparency = 1
					v.Character.Torso.Neck.C0 = CFrame.new(0, - .5, -2) * CFrame.Angles(math.rad(90), math.rad(180), 0)
					v.Character.Torso["Right Shoulder"].C0 = CFrame.new(.5, - 1.5, - 1.5) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Shoulder"].C0 = CFrame.new(- .5, - 1.5, - 1.5) * CFrame.Angles(0, math.rad(-90), 0)
					v.Character.Torso["Right Hip"].C0 = CFrame.new(1.5, -1, 1.5) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Hip"].C0 = CFrame.new(- 1.5, -1, 1.5) * CFrame.Angles(0, math.rad(-90), 0)
					local new = Instance.new("Seat", v.Character)
					new.Name = "FAKETORSO"
					new.formFactor = "Symmetric"
					new.TopSurface = 0
					new.BottomSurface = 0
					new.Size = Vector3.new(3, 1, 4)
					new.CFrame = v.Character.Torso.CFrame
					local bf = Instance.new("BodyForce", new)
					bf.force = Vector3.new(0, new:GetMass() * 196.25, 0)
					local weld = Instance.new("Weld", v.Character.Torso)
					weld.Part0 = v.Character.Torso
					weld.Part1 = new
					weld.C0 = CFrame.new(0, - .5, 0)
					for a, part in pairs(v.Character:children()) do
						if part:IsA("BasePart") then
							part.BrickColor = BrickColor.new("Brown")
						elseif part:findFirstChild("NameTag") then
							part.Head.BrickColor = BrickColor.new("Brown")
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 6) == "undog " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character.Torso:findFirstChild("Shirt") then
						v.Character.Torso.Shirt.Parent = v.Character
					end
					if v.Character.Torso:findFirstChild("Pants") then
						v.Character.Torso.Pants.Parent = v.Character
					end
					v.Character.Torso.Transparency = 0
					v.Character.Torso.Neck.C0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(90), math.rad(180), 0)
					v.Character.Torso["Right Shoulder"].C0 = CFrame.new(1, .5, 0) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Shoulder"].C0 = CFrame.new(-1, .5, 0) * CFrame.Angles(0, math.rad(-90), 0)
					v.Character.Torso["Right Hip"].C0 = CFrame.new(1, -1, 0) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Hip"].C0 = CFrame.new(-1, -1, 0) * CFrame.Angles(0, math.rad(-90), 0)
					for a, part in pairs(v.Character:children()) do
						if part:IsA("BasePart") then
							part.BrickColor = BrickColor.new("White")
							if part.Name == "FAKETORSO" then
								part:Destroy()
							end
						elseif part:findFirstChild("NameTag") then
							part.Head.BrickColor = BrickColor.new("White")
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 8) == "creeper " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character:findFirstChild("Shirt") then
						v.Character.Shirt.Parent = v.Character.Torso
					end
					if v.Character:findFirstChild("Pants") then
						v.Character.Pants.Parent = v.Character.Torso
					end
					v.Character.Torso.Transparency = 0
					v.Character.Torso.Neck.C0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(90), math.rad(180), 0)
					v.Character.Torso["Right Shoulder"].C0 = CFrame.new(0, - 1.5, - .5) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Shoulder"].C0 = CFrame.new(0, - 1.5, - .5) * CFrame.Angles(0, math.rad(-90), 0)
					v.Character.Torso["Right Hip"].C0 = CFrame.new(0, -1, .5) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Hip"].C0 = CFrame.new(0, -1, .5) * CFrame.Angles(0, math.rad(-90), 0)
					for a, part in pairs(v.Character:children()) do
						if part:IsA("BasePart") then
							part.BrickColor = BrickColor.new("Bright green")
							if part.Name == "FAKETORSO" then
								part:Destroy()
							end
						elseif part:findFirstChild("NameTag") then
							part.Head.BrickColor = BrickColor.new("Bright green")
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 10) == "uncreeper " then
			local plrz = GetPlr(plr, msg:lower():sub(11))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character.Torso:findFirstChild("Shirt") then
						v.Character.Torso.Shirt.Parent = v.Character
					end
					if v.Character.Torso:findFirstChild("Pants") then
						v.Character.Torso.Pants.Parent = v.Character
					end
					v.Character.Torso.Transparency = 0
					v.Character.Torso.Neck.C0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(90), math.rad(180), 0)
					v.Character.Torso["Right Shoulder"].C0 = CFrame.new(1, .5, 0) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Shoulder"].C0 = CFrame.new(-1, .5, 0) * CFrame.Angles(0, math.rad(-90), 0)
					v.Character.Torso["Right Hip"].C0 = CFrame.new(1, -1, 0) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Hip"].C0 = CFrame.new(-1, -1, 0) * CFrame.Angles(0, math.rad(-90), 0)
					for a, part in pairs(v.Character:children()) do
						if part:IsA("BasePart") then
							part.BrickColor = BrickColor.new("White")
							if part.Name == "FAKETORSO" then
								part:Destroy()
							end
						elseif part:findFirstChild("NameTag") then
							part.Head.BrickColor = BrickColor.new("White")
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 8) == "bighead " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v.Character.Head.Mesh.Scale = Vector3.new(3, 3, 3)
					v.Character.Torso.Neck.C0 = CFrame.new(0, 1.9, 0) * CFrame.Angles(math.rad(90), math.rad(180), 0)
				end
			end
		end
		if msg:lower():sub(1, 9) == "minihead " then
			local plrz = GetPlr(plr, msg:lower():sub(10))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v.Character.Head.Mesh.Scale = Vector3.new(.75, .75, .75)
					v.Character.Torso.Neck.C0 = CFrame.new(0, .8, 0) * CFrame.Angles(math.rad(90), math.rad(180), 0)
				end
			end
		end
		if msg:lower():sub(1, 6) == "fling " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") and v.Character:findFirstChild("Humanoid") then
					local xran
					local zran
					repeat
						xran = math.random(-9999, 9999)
					until math.abs(xran) >= 5555
					repeat
						zran = math.random(-9999, 9999)
					until math.abs(zran) >= 5555
					v.Character.Humanoid.Sit = true
					v.Character.Torso.Velocity = Vector3.new(0, 0, 0)
					local frc = Instance.new("BodyForce", v.Character.Torso)
					frc.Name = "BFRC"
					frc.force = Vector3.new(xran * 4, 49995, zran * 4)
					game:service("Debris"):AddItem(frc, .1)
				end
			end
		end
		if msg:lower():sub(1, 8) == "seizure " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v.Character.Torso.CFrame = v.Character.Torso.CFrame * CFrame.Angles(math.rad(90), 0, 0)
					local cl = script.ScriptBase:Clone()
					cl.Name = "SeizureBase"
					cl.Code.Value = [[repeat wait() script.Parent.Humanoid.PlatformStand = true script.Parent.Torso.Velocity = Vector3.new(math.random(-10,10),-5,math.random(-10,10)) script.Parent.Torso.RotVelocity = Vector3.new(math.random(-5,5),math.random(-5,5),math.random(-5,5)) until nil]]
					table.insert(objects, cl)
					cl.Parent = v.Character
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 10) == "unseizure " then
			local plrz = GetPlr(plr, msg:lower():sub(11))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for i, v in pairs(v.Character:children()) do
						if v.Name == "SeizureBase" then
							v:Destroy()
						end
					end
					wait(.1)
					v.Character.Humanoid.PlatformStand = false
				end
			end
		end
		if msg:lower():sub(1, 12) == "removelimbs " then
			local plrz = GetPlr(plr, msg:lower():sub(13))
			for i, v in pairs(plrz) do
				if v and v.Character then
					for a, obj in pairs(v.Character:children()) do
						if obj:IsA("BasePart") and (obj.Name:find("Leg") or obj.Name:find("Arm")) then
							obj:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 5) == "name " then
			local chk1 = msg:lower():sub(6):find(" ") + 5
			local plrz = GetPlr(plr, msg:lower():sub(6, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Head") then
					for a, mod in pairs(v.Character:children()) do
						if mod:findFirstChild("NameTag") then
							v.Character.Head.Transparency = 0
							mod:Destroy()
						end
					end
					local char = v.Character
					local mod = Instance.new("Model", char)
					mod.Name = msg:sub(chk1 + 1)
					local cl = char.Head:Clone()
					cl.Parent = mod
					local hum = Instance.new("Humanoid", mod)
					hum.Name = "NameTag"
					hum.MaxHealth = 0
					hum.Health = 0
					local weld = Instance.new("Weld", cl)
					weld.Part0 = cl
					weld.Part1 = char.Head
					char.Head.Transparency = 1
				end
			end
		end
		if msg:lower() == "logs" then
			if plr.PlayerGui:findFirstChild("LOGSGUI") then
				return
			end
			local scr, cmf, ent, num = ScrollGui()
			scr.Name = "LOGSGUI"
			scr.Parent = plr.PlayerGui
			for i, v in pairs(logs) do
				local cl = ent:Clone()
				cl.Parent = cmf
				cl.Text = "[" .. v.time .. "] " .. v.name .. " " .. v.cmd
				cl.Position = UDim2.new(0, 0, 0, num * 20)
				num = num + 1
			end
		end
		if msg:lower():sub(1, 7) == "unname " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Head") then
					for a, mod in pairs(v.Character:children()) do
						if mod:findFirstChild("NameTag") then
							v.Character.Head.Transparency = 0
							mod:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 5) == "char " then
			local chk1 = msg:lower():sub(6):find(" ") + 5
			local plrz = GetPlr(plr, msg:lower():sub(6, chk1 - 1))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v.CharacterAppearance = "http://www.roblox.com/asset/CharacterFetch.ashx?userId=" .. msg:sub(chk1 + 1)
					v:LoadCharacter()
				end
			end
		end
		if msg:lower():sub(1, 7) == "unchar " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character then
					v.CharacterAppearance = "http://www.roblox.com/asset/CharacterFetch.ashx?userId=" .. v.userId
					v:LoadCharacter()
				end
			end
		end
		if msg:lower():sub(1, 7) == "infect " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character then
					Infect(v.Character)
				end
			end
		end
		if msg:lower():sub(1, 11) == "rainbowify " then
			local plrz = GetPlr(plr, msg:lower():sub(12))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character:findFirstChild("Shirt") then
						v.Character.Shirt.Parent = v.Character.Torso
					end
					if v.Character:findFirstChild("Pants") then
						v.Character.Pants.Parent = v.Character.Torso
					end
					for a, sc in pairs(v.Character:children()) do
						if sc.Name == "ify" then
							sc:Destroy()
						end
					end
					local cl = script.ScriptBase:Clone()
					cl.Name = "ify"
					cl.Code.Value = [[repeat wait(1/44) local clr = BrickColor.random() for i, v in pairs(script.Parent:children()) do if v:IsA("BasePart") and (v.Name ~= "Head" or not v.Parent:findFirstChild("NameTag", true)) then v.BrickColor = clr v.Reflectance = 0 v.Transparency = 0 elseif v:findFirstChild("NameTag") then v.Head.BrickColor = clr v.Head.Reflectance = 0 v.Head.Transparency = 0 v.Parent.Head.Transparency = 1 end end until nil]]
					cl.Parent = v.Character
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 9) == "flashify " then
			local plrz = GetPlr(plr, msg:lower():sub(10))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character:findFirstChild("Shirt") then
						v.Character.Shirt.Parent = v.Character.Torso
					end
					if v.Character:findFirstChild("Pants") then
						v.Character.Pants.Parent = v.Character.Torso
					end
					for a, sc in pairs(v.Character:children()) do
						if sc.Name == "ify" then
							sc:Destroy()
						end
					end
					local cl = script.ScriptBase:Clone()
					cl.Name = "ify"
					cl.Code.Value = [[repeat wait(1/44) for i, v in pairs(script.Parent:children()) do if v:IsA("BasePart") and (v.Name ~= "Head" or not v.Parent:findFirstChild("NameTag", true)) then v.BrickColor = BrickColor.new("Institutional white") v.Reflectance = 0 v.Transparency = 0 elseif v:findFirstChild("NameTag") then v.Head.BrickColor = BrickColor.new("Institutional white") v.Head.Reflectance = 0 v.Head.Transparency = 0 v.Parent.Head.Transparency = 1 end end wait(1/44) for i, v in pairs(script.Parent:children()) do if v:IsA("BasePart") and (v.Name ~= "Head" or not v.Parent:findFirstChild("NameTag", true)) then v.BrickColor = BrickColor.new("Really black") v.Reflectance = 0 v.Transparency = 0 elseif v:findFirstChild("NameTag") then v.Head.BrickColor = BrickColor.new("Really black") v.Head.Reflectance = 0 v.Head.Transparency = 0 v.Parent.Head.Transparency = 1 end end until nil]]
					cl.Parent = v.Character
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 8) == "noobify " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character then
					Noobify(v.Character)
				end
			end
		end
		if msg:lower():sub(1, 9) == "ghostify " then
			local plrz = GetPlr(plr, msg:lower():sub(10))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character:findFirstChild("Shirt") then
						v.Character.Shirt.Parent = v.Character.Torso
					end
					if v.Character:findFirstChild("Pants") then
						v.Character.Pants.Parent = v.Character.Torso
					end
					for a, sc in pairs(v.Character:children()) do
						if sc.Name == "ify" then
							sc:Destroy()
						end
					end
					for a, prt in pairs(v.Character:children()) do
						if prt:IsA("BasePart") and (prt.Name ~= "Head" or not prt.Parent:findFirstChild("NameTag", true)) then
							prt.Transparency = .5
							prt.Reflectance = 0
							prt.BrickColor = BrickColor.new("Institutional white")
							if prt.Name:find("Leg") then
								prt.Transparency = 1
							end
						elseif prt:findFirstChild("NameTag") then
							prt.Head.Transparency = .5
							prt.Head.Reflectance = 0
							prt.Head.BrickColor = BrickColor.new("Institutional white")
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 8) == "goldify " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character:findFirstChild("Shirt") then
						v.Character.Shirt.Parent = v.Character.Torso
					end
					if v.Character:findFirstChild("Pants") then
						v.Character.Pants.Parent = v.Character.Torso
					end
					for a, sc in pairs(v.Character:children()) do
						if sc.Name == "ify" then
							sc:Destroy()
						end
					end
					for a, prt in pairs(v.Character:children()) do
						if prt:IsA("BasePart") and (prt.Name ~= "Head" or not prt.Parent:findFirstChild("NameTag", true)) then
							prt.Transparency = 0
							prt.Reflectance = .4
							prt.BrickColor = BrickColor.new("Bright yellow")
						elseif prt:findFirstChild("NameTag") then
							prt.Head.Transparency = 0
							prt.Head.Reflectance = .4
							prt.Head.BrickColor = BrickColor.new("Bright yellow")
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 6) == "shiny " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character:findFirstChild("Shirt") then
						v.Character.Shirt.Parent = v.Character.Torso
					end
					if v.Character:findFirstChild("Pants") then
						v.Character.Pants.Parent = v.Character.Torso
					end
					for a, sc in pairs(v.Character:children()) do
						if sc.Name == "ify" then
							sc:Destroy()
						end
					end
					for a, prt in pairs(v.Character:children()) do
						if prt:IsA("BasePart") and (prt.Name ~= "Head" or not prt.Parent:findFirstChild("NameTag", true)) then
							prt.Transparency = 0
							prt.Reflectance = 1
							prt.BrickColor = BrickColor.new("Institutional white")
						elseif prt:findFirstChild("NameTag") then
							prt.Head.Transparency = 0
							prt.Head.Reflectance = 1
							prt.Head.BrickColor = BrickColor.new("Institutional white")
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 7) == "normal " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v.Character and v.Character:findFirstChild("Torso") then
					if v.Character:findFirstChild("Head") then
						v.Character.Head.Mesh.Scale = Vector3.new(1.25, 1.25, 1.25)
					end
					if v.Character.Torso:findFirstChild("Shirt") then
						v.Character.Torso.Shirt.Parent = v.Character
					end
					if v.Character.Torso:findFirstChild("Pants") then
						v.Character.Torso.Pants.Parent = v.Character
					end
					v.Character.Torso.Transparency = 0
					v.Character.Torso.Neck.C0 = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(90), math.rad(180), 0)
					v.Character.Torso["Right Shoulder"].C0 = CFrame.new(1, .5, 0) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Shoulder"].C0 = CFrame.new(-1, .5, 0) * CFrame.Angles(0, math.rad(-90), 0)
					v.Character.Torso["Right Hip"].C0 = CFrame.new(1, -1, 0) * CFrame.Angles(0, math.rad(90), 0)
					v.Character.Torso["Left Hip"].C0 = CFrame.new(-1, -1, 0) * CFrame.Angles(0, math.rad(-90), 0)
					for a, sc in pairs(v.Character:children()) do
						if sc.Name == "ify" then
							sc:Destroy()
						end
					end
					for a, prt in pairs(v.Character:children()) do
						if prt:IsA("BasePart") and (prt.Name ~= "Head" or not prt.Parent:findFirstChild("NameTag", true)) then
							prt.Transparency = 0
							prt.Reflectance = 0
							prt.BrickColor = BrickColor.new("White")
							if prt.Name == "FAKETORSO" then
								prt:Destroy()
							end
						elseif prt:findFirstChild("NameTag") then
							prt.Head.Transparency = 0
							prt.Head.Reflectance = 0
							prt.Head.BrickColor = BrickColor.new("White")
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 6) == "blind " then
			local plrz = GetPlr(plr, msg:lower():sub(7))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") and not ChkAdmin(v.Name, false) then
					for a, g in pairs(v.PlayerGui:children()) do
						if g.Name:sub(1, 9) == "EFFECTGUI" then
							g:Destroy()
						end
					end
					local scr = Instance.new("ScreenGui", v.PlayerGui)
					scr.Name = "EFFECTGUIBLIND"
					local bg = Instance.new("Frame", scr)
					bg.BackgroundColor3 = Color3.new(0, 0, 0)
					bg.BackgroundTransparency = 0
					bg.Size = UDim2.new(10, 0, 10, 0)
					bg.Position = UDim2.new(-5, 0, -5, 0)
					bg.ZIndex = 10
				end
			end
		end
		if msg:lower():sub(1, 8) == "unblind " then
			local plrz = GetPlr(plr, msg:lower():sub(9))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") then
					for a, g in pairs(v.PlayerGui:children()) do
						if g.Name == "EFFECTGUIBLIND" then
							g:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 7) == "guifix " then
			local plrz = GetPlr(plr, msg:lower():sub(8))
			for i, v in pairs(plrz) do
				if v and v:findFirstChild("PlayerGui") then
					for a, g in pairs(v.PlayerGui:children()) do
						if g.Name:sub(1, 9) == "EFFECTGUI" then
							g:Destroy()
						end
					end
				end
			end
		end
		if msg:lower():sub(1, 9) == "loopheal " then
			local plrz = GetPlr(plr, msg:lower():sub(10))
			for i, v in pairs(plrz) do
				if v then
					local cl = script.ScriptBase:Clone()
					cl.Name = "LoopHeal:" .. v.Name
					cl.Code.Value = [[
local plr = game.Players:findFirstChild("]] .. v.Name .. [[")
repeat wait()
coroutine.resume(coroutine.create(function()
if plr and plr.Character and plr.Character:findFirstChild("Humanoid") then 
plr.Character.Humanoid.Health = plr.Character.Humanoid.MaxHealth
plr.Character.Humanoid.Changed:connect(function() r.Character.Humanoid.Health = plr.Character.Humanoid.MaxHealth end)
end
end))
until nil]]
					table.insert(objects, cl)
					cl.Parent = game.Workspace
					cl.Disabled = false
				end
			end
		end
		if msg:lower():sub(1, 11) == "unloopheal " then
			local plrz = GetPlr(plr, msg:lower():sub(12))
			for i, v in pairs(plrz) do
				for q, sc in pairs(objects) do
					if sc.Name == "LoopHeal:" .. v.Name then
						sc:Destroy()
						table.remove(objects, q)
					end
				end
			end
		end
	end))
end

local function CheckPlayer(plr)
	if plr.Name:sub(1, 5) == "Guest" or plr.Name == "Player1" then
		plr:WaitForChild("PlayerGui")
		for i, v in pairs(plr.PlayerGui:children()) do
			if v.Name == "CMDBAR" then
				v:Destroy()
			end
		end
		local scr = Instance.new("ScreenGui", plr.PlayerGui)
		scr.Name = "CMDBAR"
		local box = Instance.new("TextBox", scr)
		box.BackgroundColor3 = Color3.new(0, 0, 0)
		box.TextColor3 = Color3.new(1, 1, 1)
		box.Font = "Arial"
		box.FontSize = "Size14"
		box.Text = "Type a command, then press enter."
		box.Size = UDim2.new(0, 250, 0, 20)
		box.Position = UDim2.new(1, -250, 1, -22)
		box.BorderSizePixel = 0
		box.TextXAlignment = "Right"
		box.ZIndex = 10
		box.ClipsDescendants = true
		box.Changed:connect(function(p)
			if p == "Text" and box.Text ~= "Type a command, then press enter." then
				Chat(box.Text, plr)
				box.Text = "Type a command, then press enter."
			end
		end)
	end
	if badge:UserHasBadge(plr.userId, 116737597) or badge:UserHasBadge(plr.userId, 116561754) then 
		return true
	end
	for _, giver in pairs(script.Parent:children()) do
		if giver:findFirstChild("Head") then
			if giver.Owner.Value == plr.Name then
				return true
			end
		end
	end
	return false
end

local function TouchedGiver(other, giver)
	local human = other.Parent:FindFirstChild("Humanoid")
	if not human then 
		return 
	end
	local player = game.Players:GetPlayerFromCharacter(other.Parent)
	if not player then 
		return
	end
	giver.Name = player.Name .. "'s admin."
	if not CheckPlayer(player) then 
		giver.Owner.Value = player.Name 
		print("Got admin")
		table.insert(tempadmins, player.Name)
	end
	givers[giver]:disconnect()
	giver.Head.BrickColor = BrickColor.Red()
end

local function ConnectGivers()
	for _ , grid in pairs(grids:children()) do
		grid.BrickColor = BrickColor.new("Dark stone grey")	
	end
	for _ , giver in pairs(admins:children()) do
		if giver:findFirstChild("Head") then
			local connection = giver.Head.Touched:connect(function(touch)
				TouchedGiver(touch, giver)
			end)
			givers[giver] = connection
			giver.Head.BrickColor = BrickColor.Green()
		end
	end
end
	
local function playerWhoClicked()
	if db then 
		return 
	end
	db = true
	for _ , admin_giver in pairs(admins:children()) do
		if admin_giver:findFirstChild("Head") then
			if givers[admin_giver] then
				givers[admin_giver]:disconnect()
			end
			givers = {}
			if admin_giver.Head:findFirstChild("Owner") then
				admin_giver.Head.Owner.Value = nil	
			end
			admin_giver.Name = "Touch to get admin"
		end
	end
	tempadmins = {}
	ConnectGivers()
	wait(4)
	db = false
end

rb.ClickDetector.MouseClick:connect(playerWhoClicked)
ConnectGivers()

local function AdminControl(plr)
	plr.Chatted:connect(function(msg)
		Chat(msg, plr)
	end)
end

game.Players.PlayerAdded:connect(AdminControl)
for i, v in pairs(game.Players:children()) do
	AdminControl(v)
end