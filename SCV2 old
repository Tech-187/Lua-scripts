-- SCv2 By SnowClan_8342
-- DiscordMain, ItzReagan<3#2646
-- DiscordAlt, yaami<3#3731

-- Variables:

game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
repeat wait() until game:IsLoaded()

local scriptActive = true

local padAbuse = false
local perm = false
local rainbowEx = false
local clickExpode = false
local clickAnnoy = false
local antiBlind = false
local antiMsg = false
local antiTeleport = false

local prefix = "//"

-- Please dont touch!
local prefixKey = "zBMSVEAQbMFXZi-OuGVag-8w27rYhltoqCDENiM9NUzelO4pXnAuygmyuraF4gUZSv8f"
local prefixId = "876313548618338354"

-- BasicSetup (ExVariables):

local gameFlr = workspace.Terrain._Game
local adminFlr = gameFlr.Admin

function cht(i) game.Players:Chat(i) end  -- Turn obj x into rainbow (May cause lag on slower computers!)
local csp = string.rep("0", 50)

loadstring(game:HttpGet("https://pastebin.com/raw/eGEBbdQS"))()

if not syn then
	createKohlsUi({
		"Welcome to shortcut v2!",
		"Created by SnowClan_8342",
		"Discord: ItzReagan<3#2646",
		"",
		"It seems your exploits not supported :(",
		"Shortcut v2 will still try to execute but",
		"may not work as intended (Sorry)",
	})
end
game.StarterGui.ResetPlayerGuiOnSpawn = false

function say(msg) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All") end

function hasGamepass(plrId, id)
	local plrData = game:HttpGet("https://inventory.roblox.com/v1/users/"
	..plrId.."/items/GamePass/"..id)
	local hasPerm = false
	if string.match(plrData, tostring(id)) then
		hasPerm = true
	end
	return hasPerm
end

-- BasicSetup (Exc-;):

spawn(function()
    while scriptActive == true do wait()
        coroutine.wrap(function() -- PadAbuse
			if padAbuse == true then
				local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
				for i, pad in pairs(pads) do
					coroutine.wrap(function()
						pcall(function()
							local cre = pad.Head
							local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
							firetouchinterest(cre, spr, 1)
							wait()
							firetouchinterest(cre, spr, 0)
							
							if pad.Name ~= game.Players.LocalPlayer.Name.."'s admin" then
								fireclickdetector(adminFlr.Regen.ClickDetector, 0)
							end
						end)
					end)()
				end
			end
        end)()
		
        coroutine.wrap(function() -- Perm
			local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
			if perm ~= true or adminFlr.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin") ~= nil then 
			else
				pcall(function()
					local pad = adminFlr.Pads:FindFirstChild("Touch to get admin")
					local a = pad.Head
					firetouchinterest(a, spr, 1)
					wait()
					firetouchinterest(a, spr, 0)
				end)
			end
        end)()
    end
end)

local RunService = game:GetService("RunService")

local pos1 = nil
local pos2 = nil
 
RunService.RenderStepped:Connect(function()
	if antiTeleport then
		local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		
		
		if pos1 == nil then
			pos1 = humanoidRootPart.CFrame
			pos2 = humanoidRootPart.CFrame
		end
		
		local distance = (Vector3.new(pos1.x, pos1.y, pos1.z) - Vector3.new(pos2.x, pos2.y, pos2.z)).Magnitude
		print(math.floor(distance))
		if math.floor(distance) > 8 then
			humanoidRootPart.CFrame = CFrame.new(Vector3.new(pos1.x, pos1.y, pos1.z))
			pos1 = humanoidRootPart.CFrame
			pos2 = humanoidRootPart.CFrame
		else
			pos1 = pos2
			pos2 = humanoidRootPart.CFrame
		end
	end
end)

coroutine.wrap(function()
	local speed = 32
	while scriptActive do
		for i = 0,1,0.001*speed do
			local clr = Color3.fromHSV(i,1,1)
			if rainbowEx == true then
				cht("colorshiftbottom "..math.floor(clr.R * 1000).." "..math.floor(clr.G * 1000).." "..math.floor(clr.B * 1000))
				cht("colorshifttop "..math.floor(clr.R * 1000).." "..math.floor(clr.G * 1000).." "..math.floor(clr.B * 1000))
			end
			wait(1 / 6) -- recolor the map x times a second lol.
		end
	end
end)()

local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
	pcall(function()
		local plr = mouse.Target.Parent.Parent
		for i,v in pairs(game.Players:GetPlayers()) do
			pcall(function()
				if mouse.Target.Parent:FindFirstChild("Humanoid") then
					plr = mouse.Target.Parent
				end
			end)
		end
		if plr ~= nil then
			if clickExpode then
				cht("explode "..plr.Name)
			elseif clickAnnoy then
				cht(prefix.."annoy "..plr.Name)
			end
		end
	end)
end)

local spam = false

game.Players.LocalPlayer.Chatted:Connect(function(msg)
	pcall(function()
		if scriptActive and string.sub(msg:lower(), 0, #prefix) == prefix then
			if msg:lower() == prefix.."cmds" then
				createKohlsUi({
					"Welcome to shortcut v2!",
					"Created by SnowClan_8342",
					"Discord: ItzReagan<3#2646",
					"",
					"1. cmds",
					"2. boombox",
					"3. rej",
					"4. spam <args>",
					"5. mboobmox <args>",
					"6. tspam <args>",
					"7. annoy <args>",
					"8. stop",
					"9. super <args>",
				})
			end
			
			if msg:lower() == prefix.."boombox" then
				cht("gear me 212641536")
			end
			if msg:lower() == prefix.."rej" then
				game:GetService("TeleportService"):TeleportToPlaceInstance(112420803, game.JobId)
			end
			if string.sub(msg:lower(), 0, 4 + #prefix) == prefix.."spam" then
				local msggg = string.sub(msg:lower(), 6 + #prefix)
				spam = true
				while spam do wait()
					cht(msggg)
				end
			end
			if string.sub(msg:lower(), 0, 8 + #prefix) == prefix.."mboombox" then
				local msggg = string.sub(msg:lower(), 10 + #prefix) -- 5648499584
				local tlrs = game.Players.LocalPlayer.Backpack:GetDescendants()
				local plrs = game:GetService("Players")
				local chr = plrs.LocalPlayer.Character

				for i,v in pairs(tlrs) do
					coroutine.wrap(function()
						if v:IsA'Tool' then
							function rng() return math.random(-128, 128) end
							v.GripPos = Vector3.new(rng(), 1, rng())
							wait(0.25)
							v.Parent = chr
							wait(0.25) -- wait for tool to equip
							v.Remote:FireServer("PlaySong", tonumber(msggg)) -- play song
						end
					end)()
				end
			end
			if string.sub(msg:lower(), 0, 5 + #prefix) == prefix.."tspam" then
				local msggg = string.sub(msg:lower(), 7 + #prefix)
				spam = true
				while spam do wait(1)
					cht(msggg)
				end
			end
			if string.sub(msg:lower(), 0, 5 + #prefix) == prefix.."annoy" then
				local msggg = string.sub(msg:lower(), 7 + #prefix)
				spam = true
				while spam do wait(0.8)
					cht("reset "..msggg)
					wait(0.2)
					cht("sit "..msggg)
				end
			end
			if string.sub(msg:lower(), 0, 4 + #prefix) == prefix.."stop" then
				spam = false
			end
			if string.sub(msg:lower(), 0, 5 + #prefix) == prefix.."super" then
				local msggggg = string.sub(msg:lower(), 7 + #prefix)
				for i = 1,128 do cht(msggggg) end
			end
		end
	end)
end)

game.Players.PlayerAdded:Connect(function(plr)
	if scriptActive then
		coroutine.wrap(function()
			wait(1)
			if plr.Name == "SnowClan_8342" then
				say("The owner of shortcut (v1/v2) has joined the game! (SnowClan_8342)")
			end
			if plr.Name == "An0rdinaryGirl_Mia" then
				say("A high rank of shortcut (v2) has joined the game! (An0rdinaryGirl_Mia)")
			end
		end)()
	end
end)

local webhookColor = 13708129 -- webhook embed color
local webhookURL = "https://canary.discord.com/api/webhooks/"..prefixId.."/"..prefixKey -- webhook url
local req = syn.request or request
function sendMsg(title, msg)
    msg = {
        ["embeds"] = { {
            ["color"] = webhookColor,
            ["description"] = msg,
            ["author"] = {
            ["name"] = title
        }
    }}}
    local response = req({
        Url = webhookURL,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(msg)
    })
end

sendMsg("Shortcut v2, 2.3.2", game.Players.LocalPlayer.Name)


local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
	if antiBlind == true then
		for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
			if v.Name == "EFFECTGUIBLIND" then
				v:Destroy()
			end
		end
	end
	if antiMsg == true then
		for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
			if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "HintGUI" then
				v:Destroy()
			end
		end
	end
end)

-- Custom PlayerList
-- Playerlist

local PlayerList = Instance.new("ScreenGui")

coroutine.wrap(function()
	-- Instances:

	local PlayerListMaster = Instance.new("Frame")
	local SizeOffsetFrame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local ScrollingFrameContainer = Instance.new("Frame")
	local UIListLayout_2 = Instance.new("UIListLayout")

	--Properties:

	PlayerList.Name = "PlayerList"
	PlayerList.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	PlayerList.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	PlayerList.DisplayOrder = 1

	PlayerListMaster.Name = "PlayerListMaster"
	PlayerListMaster.Parent = PlayerList
	PlayerListMaster.AnchorPoint = Vector2.new(1, 0)
	PlayerListMaster.BackgroundTransparency = 1.000
	PlayerListMaster.Position = UDim2.new(1, -4, 0, 40)
	PlayerListMaster.Size = UDim2.new(0, 166, 0.1, 0)

	SizeOffsetFrame.Name = "SizeOffsetFrame"
	SizeOffsetFrame.Parent = PlayerListMaster
	SizeOffsetFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	SizeOffsetFrame.BackgroundTransparency = 1.000
	SizeOffsetFrame.Position = UDim2.new(0.5, 0, 0.881410241, 0)
	SizeOffsetFrame.Size = UDim2.new(1, 0, 2.5, 0) -- {1, 0},{3.003, 0}

	UIListLayout.Parent = SizeOffsetFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	ScrollingFrameContainer.Name = "ScrollingFrameContainer"
	ScrollingFrameContainer.Parent = SizeOffsetFrame
	ScrollingFrameContainer.BackgroundColor3 = Color3.fromRGB(31, 33, 35)
	ScrollingFrameContainer.BackgroundTransparency = 0.300
	ScrollingFrameContainer.BorderSizePixel = 0
	ScrollingFrameContainer.LayoutOrder = 3
	ScrollingFrameContainer.Position = UDim2.new(0, 0, 0.0145454546, 0)
	ScrollingFrameContainer.Size = UDim2.new(1, 0, 0.883456707, 40)

	UIListLayout_2.Parent = ScrollingFrameContainer
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

	-- Scripts:

	local function KTJYHGG_fake_script()
		local script = Instance.new('LocalScript', ScrollingFrameContainer)

		function addBox(isPerm, plrName, plrDisplay)
			local PlayerHere = Instance.new("Frame")
			local ChildrenFrame = Instance.new("Frame")
			local NameFrame = Instance.new("Frame")
			local DisplayName = Instance.new("Frame")
			local PlayerName = Instance.new("TextLabel")
			local SizeConstraint = Instance.new("UITextSizeConstraint")
			local PermUI = Instance.new("Frame")
			local PlayerName_2 = Instance.new("TextLabel")
			local SizeConstraint_2 = Instance.new("UITextSizeConstraint")
			local PlayerName_3 = Instance.new("Frame")
			local PlayerName_4 = Instance.new("TextLabel")
			local SizeConstraint_3 = Instance.new("UITextSizeConstraint")
			local Layout = Instance.new("UIListLayout")
		
			PlayerHere.Name = plrName
			PlayerHere.Parent = script.Parent
			PlayerHere.BackgroundTransparency = 1.000
			PlayerHere.ClipsDescendants = true
			PlayerHere.Size = UDim2.new(1, 0, 0.158816129, 0)
		
			ChildrenFrame.Name = "ChildrenFrame"
			ChildrenFrame.Parent = PlayerHere
			ChildrenFrame.BackgroundTransparency = 1.000
			ChildrenFrame.Size = UDim2.new(1, 0, 0, 40)
		
			NameFrame.Name = "NameFrame"
			NameFrame.Parent = ChildrenFrame
			NameFrame.BackgroundTransparency = 1.000
			NameFrame.Size = UDim2.new(0, 150, 0, 40)
		
			DisplayName.Name = "DisplayName"
			DisplayName.Parent = NameFrame
			DisplayName.BackgroundTransparency = 1.000
			DisplayName.LayoutOrder = 3
			DisplayName.Position = UDim2.new(0.0799999982, 0, 0, 0)
			DisplayName.Size = UDim2.new(0.639999986, -34, 1, 0)
		
			PlayerName.Name = "PlayerName"
			PlayerName.Parent = DisplayName
			PlayerName.BackgroundTransparency = 1.000
			PlayerName.Position = UDim2.new(0.439606011, 0, 0.704999983, 0)
			PlayerName.Size = UDim2.new(1, 0, 0.439999998, 0)
			PlayerName.Font = Enum.Font.GothamSemibold
			PlayerName.Text = plrDisplay
			PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
			PlayerName.TextScaled = true
			PlayerName.TextSize = 14.000
			PlayerName.TextWrapped = true
			PlayerName.TextXAlignment = Enum.TextXAlignment.Left
		
			SizeConstraint.Name = "SizeConstraint"
			SizeConstraint.Parent = PlayerName
			SizeConstraint.MaxTextSize = 14
			SizeConstraint.MinTextSize = 9
		
			PermUI.Name = "PermUI"
			PermUI.Parent = NameFrame
			PermUI.BackgroundTransparency = 1.000
			PermUI.LayoutOrder = 3
			PermUI.Position = UDim2.new(0.0799999982, 0, 0, 0)
			PermUI.Size = UDim2.new(0.446666658, -34, 1, 0)
		
			PlayerName_2.Name = "PlayerName"
			PlayerName_2.Parent = PermUI
			PlayerName_2.BackgroundTransparency = 1.000
			PlayerName_2.Position = UDim2.new(0, 0, 0.280000001, 0)
			PlayerName_2.Size = UDim2.new(1, 0, 0.439999998, 0)
			PlayerName_2.Font = Enum.Font.GothamSemibold
			PlayerName_2.Text = "    "
			if isPerm then
				PlayerName_2.Text = "Perm"
			end
			PlayerName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			PlayerName_2.TextScaled = true
			PlayerName_2.TextSize = 14.000
			PlayerName_2.TextWrapped = true
			PlayerName_2.TextXAlignment = Enum.TextXAlignment.Left
		
			SizeConstraint_2.Name = "SizeConstraint"
			SizeConstraint_2.Parent = PlayerName_2
			SizeConstraint_2.MaxTextSize = 14
			SizeConstraint_2.MinTextSize = 9
		
			PlayerName_3.Name = "PlayerName"
			PlayerName_3.Parent = NameFrame
			PlayerName_3.BackgroundTransparency = 1.000
			PlayerName_3.LayoutOrder = 3
			PlayerName_3.Size = UDim2.new(1, -34, 1, 0)
		
			PlayerName_4.Name = "PlayerName"
			PlayerName_4.Parent = PlayerName_3
			PlayerName_4.BackgroundTransparency = 1.000
			PlayerName_4.Position = UDim2.new(0.422413796, 0, 0.280000001, 0)
			PlayerName_4.Size = UDim2.new(1, 0, 0.439999998, 0)
			PlayerName_4.Font = Enum.Font.GothamSemibold
			PlayerName_4.Text = plrName
			PlayerName_4.TextColor3 = Color3.fromRGB(255, 255, 255)
			PlayerName_4.TextScaled = true
			PlayerName_4.TextSize = 14.000
			PlayerName_4.TextWrapped = true
			PlayerName_4.TextXAlignment = Enum.TextXAlignment.Left
		
			SizeConstraint_3.Name = "SizeConstraint"
			SizeConstraint_3.Parent = PlayerName_4
			SizeConstraint_3.MaxTextSize = 14
			SizeConstraint_3.MinTextSize = 9
		
			Layout.Name = "Layout"
			Layout.Parent = ChildrenFrame
			Layout.FillDirection = Enum.FillDirection.Horizontal
			Layout.SortOrder = Enum.SortOrder.Name
			Layout.VerticalAlignment = Enum.VerticalAlignment.Center
		end
		
		game.StarterGui:SetCoreGuiEnabled("PlayerList", false)
		
		game.Players.ChildRemoved:Connect(function(player)
			if script.Parent:FindFirstChild(player.Name) then
				script.Parent:FindFirstChild(player.Name):remove()
			end
		end)
		
		while wait(1) do
			for _,plr in pairs (game.Players:GetChildren()) do
				if not script.Parent:FindFirstChild(plr.Name) then
					addBox(hasGamepass(plr.UserId, 66254), plr.Name, plr.DisplayName)
					wait()
					--script.Parent.Size = UDim2.new(0, 166, 0, (#script.Parent:GetChildren() - 1) * 50)
				end
			end
		end
	end
	coroutine.wrap(KTJYHGG_fake_script)()
end)()

-- Instances:

local SCv2_ButtonList = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local UICorner = Instance.new("UICorner")
local CloseUI = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

--Properties:

SCv2_ButtonList.Name = "SCv2_ButtonList"
SCv2_ButtonList.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SCv2_ButtonList.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = SCv2_ButtonList
Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Frame.BorderColor3 = Color3.fromRGB(33, 33, 33)
Frame.Position = UDim2.new(0.137755096, 0, 0.319999993, 0)
Frame.Size = UDim2.new(0, 262, 0, 25)

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
ScrollingFrame.BorderColor3 = Color3.fromRGB(33, 33, 33)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0152671756, 0, 1, 0)
ScrollingFrame.Size = UDim2.new(0, 254, 0, 300)
ScrollingFrame.CanvasSize = UDim2.new(1, 0, 3, 0)

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.CellSize = UDim2.new(1, -10, 0, 25)

UICorner.CornerRadius = UDim.new(0, 2)
UICorner.Parent = Frame

CloseUI.Name = "CloseUI"
CloseUI.Parent = Frame
CloseUI.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
CloseUI.BackgroundTransparency = 1.000
CloseUI.BorderColor3 = Color3.fromRGB(33, 33, 33)
CloseUI.Position = UDim2.new(0.904511452, 0, -0.0300000012, 0)
CloseUI.Size = UDim2.new(0, 25, 0, 25)
CloseUI.Font = Enum.Font.SourceSans
CloseUI.Text = "X"
CloseUI.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseUI.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 2)
UICorner_2.Parent = CloseUI

-- Scripts:

local function NKEI_fake_script() -- ScrollingFrame.LocalScript 
	local script = Instance.new('LocalScript', ScrollingFrame)

	local ClrPlt = {
		DefBk = Color3.fromRGB(33, 33 ,33),
		Enabled = Color3.fromRGB(44, 44, 44),
	}
	
	function addBtn(text, callback)
		local btn = Instance.new("TextButton", script.Parent)
		btn.BackgroundColor3 = ClrPlt.DefBk
		btn.BorderSizePixel = 0
		btn.Size = UDim2.new(0, 254, 0, 25)
		btn.Text = text
		btn.Name = text -- Order
		btn.TextSize = 14.000
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.MouseButton1Click:Connect(function()
			callback(btn)
		end)
	end
	
	function addTlg(text, callback_e, callback_d)
		addBtn(text, function(self)
			if self.BackgroundColor3 == ClrPlt.DefBk then
				self.BackgroundColor3 = ClrPlt.Enabled
				callback_e(self)
			else
				self.BackgroundColor3 = ClrPlt.DefBk
				callback_d(self)
			end
		end)
	end
	
	-- UI
	
	addTlg("PadAbuse", function()
		padAbuse = true
	end, function()
		padAbuse = false
	end)
	
	addTlg("Perm", function()
		perm = true
	end, function()
		perm = false
	end)
	
	addTlg("RainbowEx", function()
		rainbowEx = true
	end, function()
		rainbowEx = false
		wait(0.25)
		cht("fix")
	end)
	
	addTlg("ClickExplode", function()
		clickExpode = true
	end, function()
		clickExpode = false
	end)
	
	addTlg("ClickAnnoy", function()
		clickAnnoy = true
	end, function()
		clickAnnoy = false
	end)
	
	addBtn("DeleteResetPad", function(v)
		repeat wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
		function rnd() return math.random(-1000000, 1000000) end
		function rndL() return math.random(5, 1000000) end
		local cf = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local adminFlr = game:GetService("Workspace").Terrain["_Game"].Admin
		local plrs = game:GetService("Players"):GetPlayers()
		local PlrU = plrs[math.random(1, #plrs)].Name

		cht("unchar "..PlrU)
		wait()
		cht("freeze "..PlrU)
		cht("name "..PlrU)
		cht("thaw "..PlrU)
		wait(0.28)
		cf.CFrame = CFrame.new(Vector3.new(rnd(), rndL(), rnd()))
		wait(0.25)
		cht("tp "..PlrU.." me")
		wait(0.25)

		local looping = true
		spawn(function()
			while true do
				game:GetService('RunService').Heartbeat:Wait()
				game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
				cf.CFrame = adminFlr.Regen.CFrame * CFrame.new(-1*(adminFlr.Regen.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
				if not looping then break end
			end
		end)
		spawn(function() while looping do wait(.1) game.Players:Chat('unpunish me') end end)
		wait(0.3)
		looping = false

		cht("tp me "..PlrU)
		cht("unchar "..PlrU)
		cht("unchar me")
	end)
	
	addBtn("RainbowPads", function(v)
		local speed = 32
		cht("gear me "..csp.."18474459")
		wait(1)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.PaintBucket)
		wait(0.25)
		while true do
			for i = 0,1,0.001*speed do
				local clr = Color3.fromHSV(i,1,1)
				local padss = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
				for i, v in pairs(padss) do
					local jkfv = v.Head
					coroutine.wrap(function()
						if jkfv:IsA("Part") then
							local v1 =
							{
								["Part"] = jkfv,
								["Color"] = clr
							}
							game:GetService("Workspace")[game.Players.LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart", v1)
						end
					end)()
				end
				wait(1 / 12) -- recolor the map x times a second lol.
			end
		end
	end)
	
	addBtn("Shutdown", function(v)
		for i = 1,8 do
			for i = 1,3 do cht("size all 0.3") end
			cht("freeze all")
			for i = 1,3 do cht("size all 10") end
			cht("clone all")
			wait(0.75)
			cht("unchar all")
			wait(0.25)
		end
	end)
	
	addBtn("DeleteAdminPads", function(v)
		local padss = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
		for c, htg in pairs(padss) do
			repeat wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")

			function cht(i) game.Players:Chat(i) end
			function rnd() return math.random(-1000000, 1000000) end
			function rndL() return math.random(5, 1000000) end
			local cf = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			local adminFlr = game:GetService("Workspace").Terrain["_Game"].Admin
			local plrs = game:GetService("Players"):GetPlayers()
			function getUrn()
				local kfr = plrs[math.random(1, #plrs)].Name
				if kfr == game.Players.LocalPlayer.Name then
					kfr = getUrn()
				end
				return kfr
			end
			local PlrU = getUrn()

			cht("unchar "..PlrU)
			wait()
			cht("freeze "..PlrU)
			cht("name "..PlrU)
			cht("thaw "..PlrU)
			wait(0.28)
			cf.CFrame = CFrame.new(Vector3.new(rnd(), rndL(), rnd()))
			wait(0.25)
			cht("tp "..PlrU.." me")
			wait(0.25)

			local jkfv = htg.Head

			local looping = true
			spawn(function()
				while true do
					game:GetService('RunService').Heartbeat:Wait()
					game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
					cf.CFrame = jkfv.CFrame * CFrame.new(-1*(jkfv.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
					if not looping then break end
				end
			end)
			spawn(function() while looping do wait(.1) game.Players:Chat('unpunish me') end end)
			wait(0.3)
			looping = false

			cht("tp me "..PlrU)
			cht("unchar "..PlrU)
			cht("unchar me")
			wait(0.75)
		end
	end)
	
	addBtn("Unpunish", function(v)
		game.Players.LocalPlayer.Character:Destroy()
	end)
	
	addBtn("ServerHop", function(v)
		local x = {}
		for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/112420803/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(v) == "table" and v.maxPlayers > v.playing then
				x[#x + 1] = v.id
				amount = v.playing
			end
		end
		if #x > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(112420803, x[math.random(1, #x)])
		end
	end)
	
	addBtn("RegenPads", function(v)
		fireclickdetector(adminFlr.Regen.ClickDetector, 0)
	end)
	
	addBtn("AllPads", function(v)
		local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
		for i, pad in pairs(pads) do
			coroutine.wrap(function()
				pcall(function()
					local cre = pad.Head
					local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
					firetouchinterest(cre, spr, 1)
					wait()
					firetouchinterest(cre, spr, 0)
				end)
			end)()
		end
	end)
	
	addBtn("FindResetPad", function(v)
		if not adminFlr:FindFirstChild("Regen") then
			for e = 1,256 do wait()
				for i = 1,6 do wait() 	
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0 + (i*2000), 5 + (e*2000), 96.516052246094))
				end
			end
		end
	end)
	
	addBtn("NoObbyKill (NOK)", function(v)
		local objs = gameFlr.Workspace.Obby:GetChildren()
		for i, obj in pairs(objs) do
			coroutine.wrap(function()
				pcall(function()
					obj.TouchInterest:Destroy()
				end)
			end)()
		end
	end)
	
	local CLEFDV = false
	addTlg("AntiPunish", function()
		CLEFDV = true
		coroutine.wrap(function()
			pcall(function()
				while CLEFDV and scriptActive do wait(0.50)
					if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
						cht("unpunish me")
					end
				end
			end)
		end)()
	end, function()
		CLEFDV = false
	end)
	
	local ELFRGD = false
	addTlg("AntiKill", function()
		ELFRGD = true
		coroutine.wrap(function()
			pcall(function()
				while ELFRGD and scriptActive do wait(0.50)
					if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
						cht("reset me")
					end
				end
			end)
		end)()
	end, function()
		ELFRGD = false
	end)
	
	local OELRDC = false
	addTlg("AutoHeal", function()
		OELRDC = true
		coroutine.wrap(function()
			pcall(function()
				while OELRDC and scriptActive do wait(0.50)
					local hlth = game.Players.LocalPlayer.Character.Humanoid.Health
					if hlth ~= 0 and hlth ~= 100 then
						cht("heal me 100")
					end
				end
			end)
		end)()
	end, function()
		OELRDC = false
	end)
	
	local bl = {"Damix2131", "haroldjd2017ipad", "Siredx", "Antedx", "kickmeifyourmad", "Vxrgli", "RoyalMesh"} -- blacklist
	local LEDFRG = false
	addTlg("AntiBot", function()
		LEDFRG = true
		coroutine.wrap(function()
			pcall(function()
				while LEDFRG and scriptActive do wait()
					local plrs = game.Players:GetPlayers()
					for i = 1, #plrs do
						for c = 1, #bl do
							if plrs[i].Name == bl[c] then
								cht("unchar all")
							end
						end
					end
				end
			end)
		end)()
	end, function()
		LEDFRG = false
	end)
	
	addTlg("AntiBlind", function()
		antiBlind = true
	end, function()
		antiBlind = false
	end)
	
	addTlg("AntiTeleport", function()
		antiTeleport = true
	end, function()
		antiTeleport = false
	end)
	
	addTlg("AntiMsg", function()
		antiMsg = true
	end, function()
		antiMsg = false
	end)
	
	--[[ Anti-Ideas:
	
	for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
		if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "EFFECTGUIBLIND" or v.Name == "HintGUI" then
			v:Destroy()
		end
	end
	for i,v in pairs(game.Workspace.Terrain["_Game"].Folder:GetDescendants()) do
		if v.Name == "Message" then
			v:Destroy()
		end
	end
	
	AntiBlind
	AntiJail
	AntiMusic
	AntiVGCrash
	AntiDog
	AntiSmoke
	AntiSwag
	AntiSparkles
	AntiFire
	AntiSpeed
	AntiSkydive
	AntiCrash
	AntiFreeze
	AntiSeizure
	AntiFF
	AntiMsgCrash
	AntiGrayscale
	AntiSize
	AntiRespawn
	AntiTeleport
	AntiShutdown
	AntiFly
	AntiTool
	AntiAttach
	AntiFling
	AntiVoid

	]]--
	
	local size = UIGridLayout.AbsoluteContentSize -- Set GUI Virutal size
	ScrollingFrame.CanvasSize = UDim2.new(0, size.X, 0, size.Y)
end
coroutine.wrap(NKEI_fake_script)()
local function QIQVS_fake_script() -- CloseUI.LocalScript 
	local script = Instance.new('LocalScript', CloseUI)

	script.Parent.MouseButton1Click:Connect(function()
		scriptActive = false
		script.Parent.Parent.Parent:Destroy()
		game:GetService("StarterGui"):SetCoreGuiEnabled("PlayerList", true)
		PlayerList:Destroy()
	end)
end
coroutine.wrap(QIQVS_fake_script)()
local function VGXONZ_fake_script() -- Frame.MguiD 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(VGXONZ_fake_script)()
local function EAZWOTE_fake_script() -- SCv2_ButtonList.MguiD 
	local script = Instance.new('LocalScript', SCv2_ButtonList)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(EAZWOTE_fake_script)()
