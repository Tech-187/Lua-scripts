local pserver = false
local toggles = {
	perm = false,
	antipunish = true,
	antimesh = true,
	antiname = true,
	joinnoti = false
}

local Connections = {}

local function isParent(Object)
	local success = pcall(function()
		return Object.Parent
	end)

	if success then
		return true
	end

	return false
end

local function isService(Object)
	local success = pcall(function()
		return game:GetService(Object.Name)
	end)

	return success
end

local function hasProperty(Object, Property)
	local success = pcall(function()
		return Object[Property]
	end)

	if success then
		return true
	end

	return false
end

local function Includes(Table, Object)
	for i, v in pairs(Table) do
		if v == Object then
			return {true, i}
		end
	end
	return {false}
end

local users = {
    getname = function(self, name)
        local sel = nil
        for i,plr in pairs(game.Players:GetPlayers()) do
            if string.lower(string.sub(plr.Name, 1, #name)) == string.lower(name) or string.lower(string.sub(plr.DisplayName, 1, #name)) == string.lower(name) then
                sel = plr
            end
        end
        if sel == nil then
            return false
        else
            return sel.Name, sel.DisplayName
        end
    end,
    getID = function(self, name)
	    return game.Players:FindFirstChild(name).UserId
    end,
    getchar = function(self, user)
        if game:GetService('Players'):FindFirstChild(user) then
            return game:GetService('Players')[user].Character or game:GetService('Players')[user].CharacterAdded:Wait()
        end
    end
}

local function runCmd(msg)
    game.Players:Chat(msg)
end

-- Auto F3X giver

Connections[#Connections + 1] = game.Players.LocalPlayer.CharacterAdded:connect(function()
	task.wait(.65)
	runCmd(":f3x")
end)

getgenv().banned = { { "d", "Kaderth" }, { "d", "Build_Robber" } } -- more like Banned Robber !!!! (Add people to it like so, I didn't like the old ban system, clayton or funzy or whoever made that.)

getgenv().gpcheck = true
local userId = game.Players.LocalPlayer.UserId

--// Gamepass checker \\--

local passid = 1293677

if gpcheck == true then
    if string.match(game:HttpGet("https://inventory.roproxy.com/v1/users/" .. userId .. "/items/GamePass/" .. passid), passid) then
        print("Perm found")
        nperm = false
    else
        print("Perm not found. I recommend you to atleast have one perm account for this game")
        nperm = true
    end
end

coroutine.wrap(function()while task.wait()do if nperm then if game.Workspace.SecureParts.AdminPads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin")then task.wait(.40)else local a=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;task.wait(0.05)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(14,28,106)task.wait(1)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(10,28,107)task.wait(1)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(5,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(2,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-2,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-6,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-10,28,107)game.Players:Chat(":invisible")task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-14,28,107)task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-18,28,107)game.Players:Chat(":invisible")task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=a;game.Players:Chat(":invisible")end end end end)()

if nperm then
wait(2)
end

runCmd(":btools me | fuck") -- added the f word at the end so FE chatloggers don't pick it up

task.spawn(function()
game.StarterGui.ResetPlayerGuiOnSpawn = false

function hasGamepass(plrId, id)
	local plrData = game:HttpGet("https://inventory.roproxy.com/v1/users/" .. plrId .. "/items/GamePass/" .. id)
	local hasPerm = false
	if string.match(plrData, tostring(id)) then
		hasPerm = true
	end
	return hasPerm
end

PlayerList = Instance.new("ScreenGui")

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
			local script = Instance.new("LocalScript", ScrollingFrameContainer)

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
				for _, plr in pairs(game.Players:GetChildren()) do
					if not script.Parent:FindFirstChild(plr.Name) then
						addBox(hasGamepass(plr.UserId, 1293677), plr.Name, plr.DisplayName)
						task.wait()
					--script.Parent.Size = UDim2.new(0, 166, 0, (#script.Parent:GetChildren() - 1) * 50)
					end
				end
			end
		end
		coroutine.wrap(KTJYHGG_fake_script)()
	end
)()
end)

--// AH CUSTOM FUCTIONS \\--
local ahfuncs = {}

function ahfuncs:getencrypt(amount)
	local things = string.split("`134567890-=qwertyu[]asdfghjkl;'#zxcvbnm,./!£$%^&*()_+QWERTYUIOP{}ASDFGHJKL:@~ZXCVBNM<>?", "")
	local txt = ""
	local count = amount
	if amount == nil then count = 5 end
	for i = 1, count do
		txt = txt..things[math.random(1, #things)]
	end
	return txt
end

function ahfuncs:getadmin()
    if 1== 1 then return end -- remove this

	if pserver == true then 
		return true
	end
	local spos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	task.wait(0.05)
	repeat
		for i,v in pairs(workspace.SecureParts.AdminPads:GetChildren()) do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Head.CFrame
			wait()
		end
		wait()
	until workspace.SecureParts.AdminPads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin")
	task.wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spos
end

function ahfuncs:admincheck(plr)
	local player = game.Players.LocalPlayer.Name
	
	if plr ~= nil then
		player = users:getname(plr)
	end
	if pserver == true and player == game.Players.LocalPlayer.Name then
		return true
	end
	if workspace.SecureParts.AdminPads:FindFirstChild(player.."'s admin") then
		return true
	else
		return false
	end
end

function ahfuncs:getsecureparts()
	local parts = {}
	for i,v in pairs(game:GetService("Workspace").SecureParts:GetDescendants()) do
		table.insert(parts, v)
	end
	for i,v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Camera" or v.Name == "SecureParts" or v.Name == "BuildingBlocks" or v.Name == "Terrain" or game.Players:FindFirstChild(v.Name) or game.Players:FindFirstChild(v.Parent.Name) or v.Name == "fe2a0a6473265e5f9775fa" then
			table.insert(parts, v)
		end
	end
	return parts
end

function ahfuncs:getnonsecureparts()
	local parts = {}
	for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if not table.find(ahfuncs:getsecureparts(), v) then
			table.insert(parts, v)
		end
	end
	return parts
end

function ahfuncs:nonsecure()
	local parts = {}
	for i,v in pairs(game.Workspace:GetChildren()) do
		if not table.find(ahfuncs:getsecureparts(), v) then
			table.insert(parts, v)
		end
	end
	return parts
end

function ahfuncs:savecmd(cmd, cmdname)
	game.ReplicatedStorage.Network.CommandSaving:InvokeServer({'SAVE', cmdname, cmd})
end

function ahfuncs:runcmd(cmd)
	if not ahfuncs:admincheck() then
		ahfuncs:getadmin()
	end
	game.Players:Chat(cmd)
end

function ahfuncs:loadbuild(name)
	local thing = game:GetService("ReplicatedStorage").Network.BuildSaving:InvokeServer({"LOAD", name})
	return thing.Objects, thing.Success
end


function ahfuncs:items(Item)
	local IsItemClassAllowed = (Item:IsA 'BasePart' and not Item:IsA 'Terrain') or
		(Item:IsA 'Model' and not Item:IsA 'Workspace') or
		Item:IsA 'Folder' or
		Item:IsA 'Smoke' or
		Item:IsA 'Fire' or
		Item:IsA 'Sparkles' or
		Item:IsA 'DataModelMesh' or
		Item:IsA 'Decal' or
		Item:IsA 'Texture' or
		Item:IsA 'Light'
	if not IsItemClassAllowed then
		return false
	end
	return true
end

function ahfuncs:noti(text)
	ahfuncs:runcmd(":chatnotifyc all 255 0 0 [Chromo]: "..text)
end

function ahfuncs:deleteparts()
	local newtab = ahfuncs:getsecureparts()
	local meshes = 0
	local parts = 0
	local seats = 0
	local vehichelseats = 0
	local particles = 0
	for i,v in pairs(ahfuncs:getnonsecureparts()) do
		if v:IsA("FileMesh") then meshes = meshes + 1 end
		if v:IsA("Part") then parts = parts + 1 end
		if v:IsA("Seat") then seats = seats + 1 end
		if v:IsA("VehicleSeat") then vehichelseats = vehichelseats + 1 end
		if v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then particles = particles + 1 end
		local args = {
			[1] = "Remove",
			[2] = {v}
		}

		game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer(unpack(args))
	end

	local data = "Chromo Part Remover\n"
	if meshes ~= 0 then
		data = data.."Meshes Deleted : "..meshes
		data = data.."\n"
	end

	if parts ~= 0 then
		data = data.."Parts Deleted : "..parts
		data = data.."\n"
	end

	if seats ~= 0 then
		data = data.."Seats Deleted : "..seats
		data = data.."\n"
	end

	if vehichelseats ~= 0 then
		data = data.."Vehicle Seats Deleted : "..vehichelseats
		data = data.."\n"
	end

	if particles ~= 0 then
		data = data.."Particles Deleted : "..particles
		data = data.."\n"
	end

	ahfuncs:runcmd(":n "..data)
end

---- stuff ive added

local AdonisRemote = game:GetService("JointsService"):FindFirstChildOfClass("RemoteEvent") or game:GetService("JointsService").ChildAdded:Wait()

local function AdonisClient()
	for i, v in pairs(getreg()) do
		if type(v) == "function" then
			local UpValues = debug.getupvalues(v)
			for a, b in pairs(UpValues) do
				if type(b) == "table" then
					local AdonisClient = nil
					pcall(function()
						if b.Core and type(b.Core) == "table" then
							AdonisClient = b
						end
					end)
					if AdonisClient ~= nil then 
						return AdonisClient 
					end
				end
			end
		end
	end
end

local function getNil(ObjName, ObjClass) 
	local Target = nil

	for i, v in pairs(getnilinstances()) do 
		pcall(function()
			if v.ClassName == ObjClass and v.Name == ObjName then
				Target = v
			end 
		end)
	end

	return Target
end

ClientMover = getNil("ClientMover", "LocalScript")
AClient = getNil("Client", "ModuleScript")

local function getKey()
	local UnEncryptedKey = AdonisClient().Core.Key
	local TargetString = "ProcessCommand"
	local endStr = {}

	for i = 1, #TargetString do
		local keyPos = (i % #UnEncryptedKey) + 1
		endStr[i] = string.char(((string.byte(string.sub(TargetString, i, i)) + string.byte(string.sub(UnEncryptedKey, keyPos, keyPos))) % 126) + 1)
	end

	return table.concat(endStr)
end

local function AdonisRemoteArgs()
	return AdonisClient().Remote.Sent, AdonisClient().Remote.Received
end

local function RunCommand(NewCmd)
	local Sent, Recieved = AdonisRemoteArgs()

	if NewCmd:sub(1,1) ~= ":" and NewCmd:sub(1,1) ~= "!" then
		NewCmd = ":"..NewCmd
	end

	AdonisRemote:FireServer(
		{
			["Received"] = Recieved,
			["Loader"] = ClientMover,
			["Mode"] = "Fire",
			["Module"] = AClient,
			["Sent"] = Sent
		},
		getKey(),
		NewCmd -- .." ".."\237\190\140" anti oldlogs
	)
end

local Workspace = game:GetService("Workspace")
local PlayerService = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local StarterPackStorage = game:GetService("StarterPack")
local StarterPlayerStorage = game:GetService("StarterPlayer")
local OldChatService = game:GetService("Chat")
local SoundService = game:GetService('SoundService')
local InsertService = game:GetService("InsertService")

local pf = "#"

if not isfile('banlist.txt') then 
	writefile('banlist.txt', "funzy likes cum \n\n\n")
elseif not isfile('AHvarstartups.txt') then 
	writefile('AHvarstartups.txt', pf.."iy fuck") -- again, the f word at the end so FE chatloggers can't pick it up (so I recommend you not removing it blindly)
end

local file = readfile("banlist.txt") -- If you do not have this file then just create it, as simple as that. Anyone added to the file, per line will be added to the getgenv().gearwhitelisted table
for plr in file:gmatch("[^\r\n]+") do
    table.insert(banned, { "d", plr }) -- d standing for delete as the delete kick just deletes the target's player instance
end

local SecureParts = Workspace:WaitForChild('SecureParts')
local AdminPads = SecureParts:WaitForChild("AdminPads")

local LocalPlayer = PlayerService.LocalPlayer
local function LocalCharacter() return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() end
local function LocalBackpack() return LocalPlayer.Backpack end

local function ServerEndpoint()
	local RelevantTable = {}

	for _, v in LocalCharacter():GetChildren() do
		table.insert(RelevantTable, v)
	end

	for _, v in LocalBackpack():GetChildren() do
		table.insert(RelevantTable, v)
	end


	for i, v in pairs(RelevantTable) do
		if v:IsA('Tool') and v.Name == 'Building Tools' and #v:GetChildren() > 2 then
			return v:WaitForChild('SyncAPI'):WaitForChild('ServerEndpoint') -- this section is for regular f3x games where remotes are stored in the tool
		end
	end

	for i, v in pairs(RelevantTable) do
		if v:IsA('Folder') and v:FindFirstChild('SyncAPI') then
			return v:WaitForChild('SyncAPI'):WaitForChild('ServerEndpoint')
		end
	end

	return nil
end

local function ChangeProperty(TPart, Prop, PVal)
	local PropData = {}
	PropData[tostring(Prop) .. "\0"] = PVal

	ServerEndpoint():InvokeServer(
	"SyncSurface",
	{{
		Part = TPart,
		Surfaces = PropData
	}}
	)	
end

local function RemoveInstance(TargetInstance)
	if ServerEndpoint() == nil then
		repeat task.wait() until AdminPads:FindFirstChild(LocalPlayer.Name.."'s admin") ~= nil
		RunCommand('f3x')
		repeat task.wait() until LocalBackpack():FindFirstChild('Folder')
	end

	if _G.DelCopy == nil or _G.DelCopy:FindFirstChild("Remover") == nil then
		local ValuePart = nil
		RunCommand("gear me 253519495")

		-- if ReplicatedStorage:FindFirstChild("Network") ~= nil then
		-- 	if ReplicatedStorage.Network:FindFirstChild("BuildSaving") ~= nil then
		-- 		local NewBuild = ReplicatedStorage.Network.BuildSaving:InvokeServer({"LOAD", '(real)'})
		-- 		NewBuild = NewBuild.Objects[1]
		-- 		ValuePart = NewBuild
		-- 	end
		-- else
		-- 	task.wait(0.3)
		-- 	RunCommand("loadb (real)")
		-- 	ValuePart = Workspace:WaitForChild("Part555")
		-- end
        task.wait(0.3)
        RunCommand('gear me 21001552')
        local InsertTool = LocalBackpack():WaitForChild('BuildInsert')
        InsertTool.Parent = LocalCharacter()
        local ObjValue = InsertTool:WaitForChild('PlayerOwner')
        local otherPart = ServerEndpoint():InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(0/0,0/0,0/0)), Workspace)
        ServerEndpoint():InvokeServer('Ungroup', {InsertTool})
        ChangeProperty(ObjValue, 'Parent', otherPart)
        local allVals = (function()
            local clone2 = ServerEndpoint():InvokeServer("Clone", {otherPart}, Workspace)[1]
            local clone3 = ServerEndpoint():InvokeServer("Clone", {otherPart}, Workspace)[1]
            local ObjValue2 = clone2.PlayerOwner
            local ObjValue3 = clone3.PlayerOwner

            ServerEndpoint():InvokeServer('Ungroup', {otherPart, clone2, clone3})
            ChangeProperty(ObjValue, 'Parent', workspace)
            ChangeProperty(ObjValue2, 'Parent', workspace)
            ChangeProperty(ObjValue3, 'Parent', workspace)
            ChangeProperty(ObjValue, 'Name', 'Creator')
            ChangeProperty(ObjValue2, 'Name', 'Tool')
            ChangeProperty(ObjValue3, 'Name', 'Model')

            return {ObjValue, ObjValue2, ObjValue3}
        end)()

        task.spawn(function()
            LocalPlayer.PlayerGui:WaitForChild('InsertToolLoading'):Destroy()
        end)

		local NewPart = ServerEndpoint():InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(0/0,0/0,0/0)), Workspace)
		local Tool = LocalPlayer.Backpack:WaitForChild("DriveBloxUltimateCar")
		Tool.Parent = LocalCharacter()
		local S1 = Tool.Script
        print('before')
		local S2 = S1:WaitForChild("Remover")

        print('after remover')

		local Targetpaarts = allVals
		
        ServerEndpoint():InvokeServer('Ungroup', {Tool})
        ServerEndpoint():InvokeServer('Ungroup', {S1})
		ChangeProperty(S2, "Parent", NewPart)

        print('h')

		for i, v in pairs(Targetpaarts) do
			ChangeProperty(v, 'Parent', NewPart)
		end
		ChangeProperty(NewPart, 'Parent', Workspace.Terrain)
		_G.DelCopy = NewPart
		repeat task.wait() until NewPart.Parent == Workspace.Terrain
	end

	local NewPart = ServerEndpoint():InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(0/0,0/0,0/0)), Workspace)
	ChangeProperty(_G.DelCopy, "Parent", Workspace)
	repeat task.wait() until _G.DelCopy.Parent == Workspace
	local RemoveCopy = ServerEndpoint():InvokeServer("Clone", {_G.DelCopy}, Workspace)[1]

	local RemoverScript = RemoveCopy.Remover
	local RegChildrenCopy = {}

	for i, v in RemoveCopy:GetChildren() do
		if v.Name ~= 'Remover' then
			table.insert(RegChildrenCopy, v)
		end
	end

	ChangeProperty(_G.DelCopy, 'Parent', Workspace.Terrain)
    ServerEndpoint():InvokeServer('Ungroup', {RemoveCopy})
	ChangeProperty(RemoverScript, 'Parent', Workspace)

	for i, v in pairs(RegChildrenCopy) do
		ChangeProperty(v, 'Parent', RemoverScript)
	end

	for i, v in pairs(RegChildrenCopy) do
		if v.Name == "Creator" then
			ChangeProperty(v, 'Value', LocalPlayer)
		elseif v.Name == "Tool" then
			ChangeProperty(v, 'Value', NewPart)
		else
			ChangeProperty(v, 'Value', TargetInstance)
		end
	end
	ChangeProperty(RemoverScript, "Enabled", true)
	ServerEndpoint():InvokeServer("Remove", {NewPart})
end

local function FindPlayer(PlayerString)
	if nil == PlayerString then
		return LocalPlayer
	elseif "" == PlayerString then
		return LocalPlayer
	end

	if "all" == string.lower(PlayerString) then
		return PlayerService:GetPlayers()
	end

	if "others" == string.lower(PlayerString) then
		local PlayerTable = {}
		for i, v in pairs(PlayerService:GetPlayers()) do
			if v.Name ~= LocalPlayer.Name then
				table.insert(PlayerTable, v)
			end
		end
		return PlayerTable
	end

	if "me" == string.lower(PlayerString) then
		return LocalPlayer
	end

	if "random" == string.lower(PlayerString) then
		local RandomIndex = math.random(1, #PlayerService:GetPlayers())
		return PlayerService:GetPlayers()[RandomIndex]
	end

	for i, v in pairs(PlayerService:GetPlayers()) do
		if PlayerString:lower() == (v.Name:lower()):sub(1, #PlayerString) then
			return v
		end
	end

	return nil
end

----

--// F3X FUNCTIONS \\--
local f3x = {}
function f3x:getf3x()
	if not game.Players.LocalPlayer:WaitForChild("Backpack"):FindFirstChild("Folder") then
		ahfuncs:runcmd(":f3x")
	end
	local folder = game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder")
	return folder:WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint")
end

function f3x:changeprops(Part, Props)
	local folder = game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder")

	local PropData = {}
	for i, v in next, Props do
		PropData[tostring(i) .. "\0"] = v
	end


	folder:WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer("SyncSurface", {{
		Part = Part,
		Surfaces = PropData
	}})
end

function f3x:makepart(position, size, color, material)
	if size == nil then
		size = Vector3.new(3,3,3)
	end
	if color == nil then
		color = Color3.fromRGB(163, 162, 165)
	end
	if material == nil then
		material = Enum.Material.Plastic
	end
	local args = {
		[1] = "CreatePart",
		[2] = "Normal",
		[3] = position,
		[4] = workspace
	}

	local part = f3x:getf3x():InvokeServer(unpack(args))

	f3x:changeprops(part, {["Anchored"] = true, ["Size"] = size, ["Color"] = color, ["Material"] = material})
	return part
end

function f3x:maketext(text, pos : Vector3)
	local char = game.Players.LocalPlayer.Characetr
	local ogname = char.Name 
	local ogdisp = char.Humanoid.DisplayName
	char.Name = "Original_Character"
	local bodyparts = {"Head", "HumanoidRootPart"}
	local cloneparts = {}
	for i,v in pairs(char:GetChildren()) do
		if v:IsA("BasePart") then
			table.insert(cloneparts, v)
		end
	end
	ahfuncs:runcmd(":unlock|:dname me "..text)
	repeat
		wait()
	until char.Head.Locked == false and char.Humanoid.DisplayName ~= ogdisp

	f3x:getf3x():InvokeServer("Clone", {char}, workspace)
	local replicatechar = game.Workspace:WaitForChild(ogname)
	replicatechar.Name = "OP_Text"
	for i,v in pairs(replicatechar:GetChildren()) do
		coroutine.wrap(function()
			if not table.find(bodyparts, v.Name) then

				f3x:getf3x():InvokeServer("Remove", {v})
			else
				f3x:getf3x():InvokeServer("SyncAnchor", {{["Part"] = v, ["Anchored"] = true}})
				f3x:getf3x():InvokeServer("SyncMove", {{["Part"] = v, ["CFrame"] = CFrame.new(pos)}})
			end
		end)()
		task.wait()
	end
	char.Name = ogname
	ahfuncs:runcmd(":undname me|:lock me")
	wait(.5)
	return replicatechar
end

function f3x:getpart(startmodel, part)


	local parents = {}
	for i,v in pairs(startmodel:GetDescendants()) do
		if v == part then
			local currentpart = v.Parent
			repeat
				table.insert(parents, 1, currentpart)
				currentpart = currentpart.Parent
				wait()
			until currentpart == startmodel
			table.insert(parents, 1, currentpart)
		end
	end
	for i,v in pairs(parents) do
		local args = {
			[1] = "Ungroup",
			[2] = {
				[1] = v
			}
		}

		local starter = f3x:getf3x():InvokeServer(unpack(args))
	end

	return part


end


--// NOTIFICATION FUNCTIONS \\--
local notisystem = {}

function notisystem:noti(Heading, text)
	game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
		Text = Heading.." : "..text;
		Color = Color3.fromRGB(255,255,255);
		Font = Enum.Font.GothamBold;
		TextSize = 15
	})
end

--// PREM KICK FUNCTIONS \\--
local premkick = {}

function premkick:meshspawn()
	local ogpart = f3x:getf3x():InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(10000, 10000, 10000)), workspace)
	local mesh = f3x:getf3x():InvokeServer("CreateMeshes", {{["Part"] = ogpart}})
	local smoke = f3x:getf3x():InvokeServer("CreateDecorations", {{["Part"] = ogpart, ["DecorationType"] = "Smoke"}})
	local fire = f3x:getf3x():InvokeServer("CreateDecorations", {{["Part"] = ogpart, ["DecorationType"] = "Fire"}})
	f3x:changeprops(ogpart:WaitForChild("Smoke"), {["Name"] = "Chromo_Smoke", ["Size"] = 20, ["RiseVelocity"] = 100, ["Color"] = Color3.fromRGB(0,0,0)})
	f3x:changeprops(ogpart:WaitForChild("Fire"), {["Name"] = "Chromo_Fire", ["Size"] = 20, ["Heat"] = 100})
	f3x:changeprops(ogpart:WaitForChild("Mesh"), {["Name"] = "Chromo_Mesh", ["MeshType"] = Enum.MeshType.FileMesh, ["MeshId"] = "rbxassetid://13990280728", ["Scale"] = Vector3.new(20, 20, 20)})
	local cloning = {ogpart}
	for i = 1, 10 do

		local newclones = f3x:getf3x():InvokeServer("Clone", cloning, workspace)
		for i,v in pairs(newclones) do
			table.insert(cloning, v)
		end
		wait(.2)
	end
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 25, 0))
	wait()

	local name = "Chromo_name"
	local talk = "Chromo_talk"
	game.ReplicatedStorage.Network.CommandSaving:InvokeServer({'SAVE', name, ':displayname all '..string.rep('0', 16000)})
	game.ReplicatedStorage.Network.CommandSaving:InvokeServer({'SAVE', talk, ':talk all '..string.rep('0', 16000)})
	repeat
		wait(1)
		ahfuncs:runcmd(":runc "..name)
	until game.Players.LocalPlayer.Character.Humanoid.DisplayName ~= game.Players.LocalPlayer.DisplayName
	game.ReplicatedStorage.Network.CommandSaving:InvokeServer({'DEL', name})
	local addparts = game.Workspace.ChildAdded:Connect(function(part)
		part.Parent = game.ReplicatedStorage.AntiPartCrash
	end)
	ahfuncs:runcmd(":bring all|:fov others 10|:clone all|:bot all 10")
	for i,v in pairs(cloning) do
		coroutine.wrap(function()
			for _, child in pairs(v:GetChildren()) do
				child.Parent = game.ReplicatedStorage.AntiPartCrash
			end
			f3x:changeprops(v, {["Position"] = Vector3.new(0, 25, 0)})
		end)()
	end
	for i = 1, 10 do
		ahfuncs:runcmd(":runc "..talk)
		wait(.1)
	end
	wait(1)
	game.ReplicatedStorage.Network.CommandSaving:InvokeServer({'DEL', talk})
	addparts:Disconnect()
end

--// KICK FUNCTIONS \\--
local kicksystem = {}

function kicksystem:meshspawn()
	local ogpart = f3x:getf3x():InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(10000, 10000, 10000)), workspace)
	local mesh = f3x:getf3x():InvokeServer("CreateMeshes", {{["Part"] = ogpart}})
	local smoke = f3x:getf3x():InvokeServer("CreateDecorations", {{["Part"] = ogpart, ["DecorationType"] = "Smoke"}})
	local fire = f3x:getf3x():InvokeServer("CreateDecorations", {{["Part"] = ogpart, ["DecorationType"] = "Fire"}})
	f3x:changeprops(ogpart:WaitForChild("Smoke"), {["Name"] = "Chromo_Smoke", ["Size"] = 100, ["RiseVelocity"] = 100, ["Color"] = Color3.fromRGB(0,0,0)})
	f3x:changeprops(ogpart:WaitForChild("Fire"), {["Name"] = "Chromo_Fire", ["Size"] = 100, ["Heat"] = 100})
	f3x:changeprops(ogpart:WaitForChild("Mesh"), {["Name"] = "Chromo_Mesh", ["MeshType"] = Enum.MeshType.FileMesh, ["MeshId"] = "rbxassetid://13990280728", ["Scale"] = Vector3.new(100, 100, 100)})
	local cloning = {ogpart}
	for i = 1, 10 do

		local newclones = f3x:getf3x():InvokeServer("Clone", cloning, workspace)
		for i,v in pairs(newclones) do
			table.insert(cloning, v)
		end
		wait(.2)
	end
	for i,v in pairs(cloning) do
		coroutine.wrap(function()
			for _, child in pairs(v:GetChildren()) do
				child.Parent = game.ReplicatedStorage.AntiPartCrash
			end
			f3x:changeprops(v, {["Position"] = Vector3.new(0, 25, 0)})
		end)()
	end
end

function kicksystem:mesh(user)
	local crashparts = {}
	local char = game.Players:FindFirstChild(user).Character
	local charcf = char.HumanoidRootPart.CFrame
	local endpoint = f3x:getf3x()
	local position = {charcf * CFrame.new(0, 10, 0), charcf * CFrame.new(10, 0, 0), charcf * CFrame.new(0, 0, 10), charcf * CFrame.new(0, -10, 0), charcf * CFrame.new(-10, 0, 0), charcf * CFrame.new(0, 0, -10)}
	for i,v in pairs(position) do
		coroutine.wrap(function()
			local args = {
				[1] = "CreatePart",
				[2] = "Normal",
				[3] = v,
				[4] = workspace
			}
			local part = endpoint:InvokeServer(unpack(args))

			args = {
				[1] = "SyncResize",
				[2] = {
					[1] = {
						["Part"] = part,
						["CFrame"] = v,
						["Size"] = Vector3.new(10, 10, 10)
					}
				}
			}

			endpoint:InvokeServer(unpack(args))
			table.insert(crashparts, part)
		end)()
	end
	--[[if files.data.builds.meshcrash == false then
		for i = 1, 50 do
			coroutine.wrap(function()
				local part = endpoint:InvokeServer("CreatePart", "Normal", charcf, workspace)
				local mesh = endpoint:InvokeServer("CreateMeshes", {{["Part"] = part}})
				f3x:changeprops(part:WaitForChild("Mesh"), {["Name"] = "Chromo_Mesh", ["MeshType"] = Enum.MeshType.FileMesh, ["MeshId"] = "rbxassetid://13990280728", ["Scale"] = Vector3.new(5, 5, 5)})
				part:WaitForChild("Chromo_Mesh"):Destroy()
				table.insert(crashparts, part)
			end)()
		end
		wait(.5)
		
	else
		local objects, succes = ahfuncs:loadbuild()
		for i,v in pairs(objects) do
			coroutine.wrap(function()
				if v:IsA("SpecialMesh") then
					f3x:changeprops(v, {["Name"] = "Chromo_Mesh", ["MeshType"] = Enum.MeshType.FileMesh, ["MeshId"] = "rbxassetid://13990280728", ["Scale"] = Vector3.new(5, 5, 5)})
					v:Destroy()
				else
					f3x:changeprops(v, {["Position"] = charcf})
					table.insert(crashparts, v)
				end
			end)()
		end
	end]]
	for i = 1, 50 do
		coroutine.wrap(function()
			local part = endpoint:InvokeServer("CreatePart", "Normal", charcf, workspace)
			local mesh = endpoint:InvokeServer("CreateMeshes", {{["Part"] = part}})
			f3x:changeprops(part:WaitForChild("Mesh"), {["Name"] = "Chromo_Mesh", ["MeshType"] = Enum.MeshType.FileMesh, ["MeshId"] = "rbxassetid://13990280728", ["Scale"] = Vector3.new(5, 5, 5)})
			part:WaitForChild("Chromo_Mesh"):Destroy()
			table.insert(crashparts, part)
		end)()
	end


	spawn(function()
		for i = 1, 5 do
			notisystem:noti("Timer", "Removing Meshes in "..tostring(i))
			wait(1)
		end
	end)
	wait(5)

	for i,v in pairs(crashparts) do
		coroutine.wrap(function()
			endpoint:InvokeServer("Remove", {v})
		end)()
	end

end

local buildapi = {}

function buildapi:changeprops(Part, Props)
	local folder = game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder")
	
	local PropData = {}
	for i, v in next, Props do
		PropData[tostring(i) .. "\0"] = v
	end


	folder:WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer("SyncSurface", {{
		Part = Part,
		Surfaces = PropData
	}})
end

function buildapi:loadbuild(name)
	local thing = game:GetService("ReplicatedStorage").Network.BuildSaving:InvokeServer( {"LOAD", name} )
	return thing.Objects, thing.Success
end

function buildapi:saveparts(name, partdata)
	local parts = {}
	for i,v in pairs(game:GetService("Workspace").SecureParts:GetDescendants()) do
		table.insert(parts, v)
	end
	for i,v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Camera" or v.Name == "SecureParts" or v.Name == "BuildingBlocks" or v.Name == "Terrain" or game.Players:FindFirstChild(v.Name) or game.Players:FindFirstChild(v.Parent.Name) or v.Name == "fe2a0a6473265e5f9775fa" then
			table.insert(parts, v)
		end
	end
	for i, v in pairs(partdata) do
		if table.find(parts, v) then
			table.remove(partdata, i)
		end
	end
	game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("BuildSaving"):InvokeServer({"SAVE", name, partdata})
end

function buildapi:createpart(position, size, name, colour, material)

	local part = f3x:getf3x():InvokeServer("CreatePart", "Normal", CFrame.new(0, 0, 0), workspace)
	local data = {part}

	function data:name(args)
		buildapi:changeprops(part, {["Name"] = args})
	end
	function data:position(args)
		buildapi:changeprops(part, {["CFrame"] = args})
	end
	function data:size(args)
		buildapi:changeprops(part, {["Size"] = args})
	end
	function data:color(args)
		buildapi:changeprops(part, {["Color"] = args})
	end
	function data:material(args)
		buildapi:changeprops(part, {["Material"] = args})
	end
	function data:parent(args)
		buildapi:changeprops(part, {["Material"] = args})
	end
	function data:lock()
		buildapi:changeprops(part, {["Locked"] = true})
	end
	function data:lvelocity(args)
		buildapi:changeprops(part, {["AssemblyLinearVelocity"] = args})
	end
	function data:avelocity(args)
		buildapi:changeprops(part, {["AssemblyAngularVelocity"] = args})
	end
	function data:transparency(args)
		buildapi:changeprops(part, {["Transparency"] = args})
	end
	function data:anchored(args)
		buildapi:changeprops(part, {["Anchored"] = args})
	end
	function data:collision(args)
		buildapi:changeprops(part, {["CanCollide"] = args})
	end
	function data:reflectance(args)
		buildapi:changeprops(part, {["Reflectance"] = args})
	end
	function data:shadow(args)
		buildapi:changeprops(part, {["CastShadow"] = args})
	end
	function data:createmesh(args)
		local folder = game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder")
		local meshh = folder:WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer("CreateMeshes", {{["Part"] = part}})
		local mesh = part:WaitForChild("Mesh")
		buildapi:changeprops(mesh, {["MeshType"] = Enum.MeshType.FileMesh})
		local meshdata = {mesh}
		function meshdata:meshid(args)
			buildapi:changeprops(mesh, {["MeshId"] = args})
		end
		function meshdata:scale(args)
			buildapi:changeprops(mesh, {["Scale"] = args})
		end
		function meshdata:textureid(args)
			buildapi:changeprops(mesh, {["TextureId"] = args})
		end
		function meshdata:vertexcolor(args)
			buildapi:changeprops(mesh, {["VertexColor"] = args})
		end
		function meshdata:name(args)
			buildapi:changeprops(mesh, {["Name"] = args})
		end
		function meshdata:offset(args)
			buildapi:changeprops(mesh, {["Offset"] = args})
		end

		return meshdata
	end

	return data
end

function buildapi:spawnchar()
	local charapi = {}
	local f3xx = f3x:getf3x()
	local customsizes = false
	ahfuncs:runcmd(":unlock me")
	function charapi:setcharacter(ID)
		if ID ~= nil then
			ahfuncs:runcmd(":char me "..ID)
		end
		local mychar = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
		local mycharname = mychar.Name
		mychar.Name = "ogchar"
		ahfuncs:runcmd(":clone me")
		local clone = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
		clone.Name = "Chromo_clone"
		f3x:changeprops(clone, {["Name"] = "StarterCharacter"})
		wait(.6)
		f3x:changeprops(clone, {["Parent"] = game.StarterPlayer})
		mychar.Name = mycharname
		if game.StarterPlayer:FindFirstChild("StarterCharacter") then
			notisystem:noti("Game Editor", "Successfully Made Your Character To The Starter Character")
		else
			notisystem:noti("Game Editor", "Failed To Made Your Character To The Starter Character")
		end
	end
	function charapi:loadpreview()
		ahfuncs:runcmd(":clone me")
	end
	function charapi:name(name)
		ahfuncs:runcmd(":name me "..name)
	end
	local lc = game.Players.LocalPlayer.Character
	function charapi:bodysize(size)
		ahfuncs:runcmd(":size me "..tostring(size))
	end
	function charapi:bodypartsize(part, size)
		spawn(function()
			customsizes = true
			repeat
				wait(.1)
			until game.Workspace:FindFirstChild("StarterCharacter")
			wait(.1)
			buildapi:changeprops(game.Workspace:FindFirstChild("StarterCharacter"):FindFirstChild(part), {["Size"] = size})
		end)
	end
	function charapi:getbody()
		local parts = {}
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("BasePart") or v:IsA("Part") then
				table.insert(parts, v.Name)
			end
		end
		return parts
	end
	return charapi
end
function buildapi:stealbuildv2(savename)
	local partcount = 0
	local partdata = {}
	local savetab = {}


	for i,v in pairs(ahfuncs:getnonsecureparts()) do
		if not v:IsA("Part") or game.Players:FindFirstChild(v.Parent.Name) or v.Parent == workspace.BuildingBlocks then continue end
		coroutine.wrap(function()
			local blockpart = f3x:getf3x():InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(0,0,0)), workspace)
			f3x:changeprops(blockpart, {["CastShadow"] = tostring(v.CastShadow), ["Color"] = v.Color, ["Material"] = v.Material, ["Reflectance"] = v.Reflectance, ["Transparency"] = v.Transparency, ["Name"] = v.Name, ["Size"] = v.Size, ["CFrame"] = v.CFrame, ["CanCollide"] = v.CanCollide, ["CanTouch"] = v.CanTouch, ["Anchored"] = v.Anchored, ["Shape"] = v.Shape, ["AssemblyLinearVelocity"] = v.AssemblyLinearVelocity, ["AssemblyAngularVelocity"] = v.AssemblyAngularVelocity})
			partcount = partcount + 1
			if v:FindFirstChildWhichIsA("FileMesh") then
				local mesh = v:FindFirstChildWhichIsA("FileMesh")
				if mesh then
					local newmesh = f3x:getf3x():InvokeServer("CreateMeshes", {{["Part"] = blockpart}})
					f3x:changeprops(newmesh, {["MeshId"] = v.Mesh.MeshId, ["Name"] = mesh.Name, ["Offset"] = mesh.Offset, ["Scale"] = mesh.Scale, ["TextureId"] = mesh.TextureId, ["VertexColor"] = mesh.VertexColor})
					partcount = partcount + 1
				end
			end
			if v:FindFirstChildWhichIsA("Fire") then		
				local fire = game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer("CreateDecorations", {{["Part"] = blockpart, ["DecorationType"] = "Fire"}})
				f3x:changeprops(fire, {["Color"] = v.Fire.Color, ["Enabled"] = v.Fire.Enabled, ["Heat"] = v.Fire.Heat, ["Name"] = v.Fire.Name, ["SecondaryColor"] = v.Fire.SecondaryColor, ["Size"] = v.Fire.Size, ["TimeScale"] = v.Fire.TimeScale})
			end
			f3x:changeprops(blockpart, {["Parent"] = game.ReplicatedStorage})
			table.insert(savetab, blockpart)
		end)()

	end

	wait(3)
	repeat
		wait()
	until #game.ReplicatedStorage:GetChildren() >= partcount
	notisystem:noti("Loader", "Saving Parts Now")
	game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("BuildSaving"):InvokeServer({"SAVE", savename, savetab})
	notisystem:noti("Saver", "Saved Build As "..savename)
	wait(.5)
	for i, v in pairs(savetab) do
		v:Destroy()
	end
end
function buildapi:savebuild(par)
	local pparent = "workspace"
	if par ~= nil then
		pparent = par
	end
	--[[args = {
	[1] = "CreatePart",
	[2] = "Normal",
	[3] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.Angles(math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation.X),math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation.Y),math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation.Z)),
	[4] = workspace
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))]]
	local tab = {}
	local instparts = {"Part", "Cylinder", "FlexSphere", "Truss", "VehicleSeat", "Seat", "Wedge"}
	local num = 0
	local meshes = true
	local infonum = 0
	for i, v in pairs(workspace:GetDescendants()) do
		num = num +1
		--if string.find(v.Parent.Parent.Name, "ADONIS") or string.find(v.Parent.Name, "ADONIS")  or string.find(v.Parent.Parent.Parent.Name, "ADONIS")  then continue end
		local inst = nil
		local mod = nil
		local instinfo
		for _, part in pairs(instparts) do
			if v:IsA(part) then
				inst = part
			end
		end
		local collision = "true"
		if v:IsA("Part") then
			inst = "Normal"
			instinfo = [[
			coroutine.wrap(function()
	args = {
	[1] = "CreatePart",
	[2] = "]]..inst..[[",
	[3] = CFrame.new(]]..tostring(v.Position)..[[) * CFrame.Angles(math.rad(]]..tostring(v.Rotation.X)..[[),math.rad(]]..tostring(v.Rotation.Y)..[[),math.rad(]]..tostring(v.Rotation.Z)..[[)),
	[4] = ]]..pparent..[[
}


game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]..pparent..[[.Part.Name = "Part]]..tostring(num)..[["
		]]
			if v.Shape == Enum.PartType.Ball then
				inst = "Ball"
				instinfo = [[
			coroutine.wrap(function()
	args = {
	[1] = "CreatePart",
	[2] = "]]..inst..[[",
	[3] = CFrame.new(]]..tostring(v.Position)..[[) * CFrame.Angles(math.rad(]]..tostring(v.Rotation.X)..[[),math.rad(]]..tostring(v.Rotation.Y)..[[),math.rad(]]..tostring(v.Rotation.Z)..[[)),
	[4] = ]]..pparent..[[
	
}


game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]..pparent..[[.Part.Name = "Part]]..tostring(num)..[["
		]]
			elseif v.Shape == Enum.PartType.Cylinder then
				inst = "Cylinder"
				instinfo = [[
			coroutine.wrap(function()
	args = {
	[1] = "CreatePart",
	[2] = "]]..inst..[[",
	[3] = CFrame.new(]]..tostring(v.Position)..[[) * CFrame.Angles(math.rad(]]..tostring(v.Rotation.X)..[[),math.rad(]]..tostring(v.Rotation.Y)..[[),math.rad(]]..tostring(v.Rotation.Z)..[[)),
	[4] = ]]..pparent..[[
	
}


game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]..pparent..[[.Part.Name = "Part]]..tostring(num)..[["
		]]
			end
			if v:IsA("Seat") then
				inst = "Seat"
				instinfo = [[
				coroutine.wrap(function()
	args = {
	[1] = "CreatePart",
	[2] = "]]..inst..[[",
	[3] = CFrame.new(]]..tostring(v.Position)..[[) * CFrame.Angles(math.rad(]]..tostring(v.Rotation.X)..[[),math.rad(]]..tostring(v.Rotation.Y)..[[),math.rad(]]..tostring(v.Rotation.Z)..[[)),
	[4] = ]]..pparent..[[
	
}


game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]..pparent..[[.Seat.Name = "Part]]..tostring(num)..[["
			]]
			end
			if v.CanCollide == true then
				collision = "true"
			else
				collision = "false"
			end
		else
			continue
		end
		partfound = nil
		if game.GameId == 123497871 then
			for Partnum, part in pairs(game:GetService("Workspace").SecureParts:GetDescendants()) do
				if v == part then
					partfound = true
				end
			end
			for Partnum, part in pairs(game:GetService("Workspace").BuildingBlocks:GetDescendants()) do
				if v == part then
					partfound = true
				end
			end

		end

		if inst == nil or partfound == true or game.Players:FindFirstChild(v.Name) then continue end
		infonum = infonum +1
		local info = [[
	
	]]..instinfo..[[
	
args = {
    [1] = "SyncResize",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["CFrame"] = CFrame.new(]]..tostring(v.CFrame)..[[),
            ["Size"] = Vector3.new(]]..tostring(v.Size)..[[)
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
args = {
    [1] = "SyncCollision",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["CanCollide"] = ]]..collision..[[
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

args = {
    [1] = "SyncColor",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["Color"] = Color3.new(]]..tostring(v.Color)..[[),
            ["UnionColoring"] = true
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
args = {
    [1] = "SyncMaterial",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["Material"] = Enum.Material["]]..tostring(string.split(tostring(v.Material), ".")[3])..[["]
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
args = {
    [1] = "SyncMaterial",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["Transparency"] = ]]..tostring(v.Transparency)..[[
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
args = {
    [1] = "SyncMaterial",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["Reflectance"] = ]]..tostring(v.Reflectance)..[[
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]
		if v:FindFirstChildWhichIsA("FileMesh") and not v:IsA("MeshPart") and v:FindFirstChild("Mesh") and v:FindFirstChildWhichIsA("FileMesh").ClassName ~= "BlockMesh" and meshes == true then
			info = [[
		]]..info..[[
		args = {
    [1] = "CreateMeshes",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[:WaitForChild("Part]]..tostring(num)..[[")
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
args = {
    [1] = "SyncMesh",
    [2] = {
        [1] = {
            ["MeshType"] = Enum.MeshType.FileMesh,
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

args = {
    [1] = "SyncMesh",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["MeshId"] = "]]..v:FindFirstChild("Mesh").MeshId..[["
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

args = {
    [1] = "SyncMesh",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["Scale"] = Vector3.new(]]..tostring(v:FindFirstChild("Mesh").Scale)..[[)
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

args = {
    [1] = "SyncMesh",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["Offset"] = Vector3.new(]]..tostring(v:FindFirstChild("Mesh").Offset)..[[)
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

		]]

		end
		if v:FindFirstChild("Smoke") then
			info = [[
		]]..info..[[

args = {
    [1] = "CreateDecorations",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["DecorationType"] = "Smoke"
        }
    }
}
game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]
		end
		if v:FindFirstChild("Sparkles") then
			info = [[
		]]..info..[[

args = {
    [1] = "CreateDecorations",
    [2] = {
        [1] = {
           ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["DecorationType"] = "Sparkles"
        }
    }
}
game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]
		end
		if v:FindFirstChild("Fire") then
			info = [[
		]]..info..[[

args = {
    [1] = "CreateDecorations",
    [2] = {
        [1] = {
            ["Part"] = ]]..pparent..[[.Part]]..tostring(num)..[[,
            ["DecorationType"] = "Fire"
        }
    }
}
game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]
		end
		info = [[

]]..info..[[

game:GetService("Players"):WaitForChild("Build_Robber"):WaitForChild("Backpack"):WaitForChild("Folder"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer("SetName", {]]..pparent..[[.Part]]..tostring(num)..[[}, "]]..v.name..[[")

end)()
]]
		table.insert(tab, info)
	end
	return "--There Are "..infonum.." Parts In This Build\ntime = function() wait(0.01) end \n\n"..table.concat(tab, "\n time() \n").."\n\nprint(\"BuildLoaded\")\nprint(\""..infonum.." Parts Loaded\")\n--There Are "..infonum.." Parts In This Build"
end

function buildapi:maketext(text, sz)
	local letters = {["V"] = "rbxassetid://3255273311",["O"] = "rbxassetid://3255268343",["H"] = "rbxassetid://3255273871",["A"] = "rbxassetid://3255274385",["P"] = "rbxassetid://3255273740",["J"] = "rbxassetid://3255268738",["t"] = "rbxassetid://3255272028",["N"] = "rbxassetid://3255268429",["M"] = "rbxassetid://3255268515",["W"] = "rbxassetid://3255273234",["x"] = "rbxassetid://3255271755",["q"] = "rbxassetid://3255272233",["L"] = "rbxassetid://3255268592",["U"] = "rbxassetid://3255273397",["Y"] = "rbxassetid://3255273087",["l"] = "rbxassetid://3255266778",["Z"] = "rbxassetid://3255267779",["K"] = "rbxassetid://3255268668",["p"] = "rbxassetid://3255272297",["j"] = "rbxassetid://3255266921",["k"] = "rbxassetid://3255266841",["s"] = "rbxassetid://3255272100",["o"] = "rbxassetid://3255266550",["g"] = "rbxassetid://3255272520",["R"] = "rbxassetid://3255273618",["m"] = "rbxassetid://3255266697",["I"] = "rbxassetid://3255273815",["S"] = "rbxassetid://3255273537",["h"] = "rbxassetid://3255272444",["w"] = "rbxassetid://3255271820",["n"] = "rbxassetid://3255266625",["v"] = "rbxassetid://3255271899",["r"] = "rbxassetid://3255272168",["y"] = "rbxassetid://3255271675",["z"] = "rbxassetid://3255265947",["X"] = "rbxassetid://3255273169",["T"] = "rbxassetid://3255273463",["i"] = "rbxassetid://3255272374",["u"] = "rbxassetid://3255271964",["Q"] = "rbxassetid://3255273680",["e"] = "rbxassetid://3255272664",["E"] = "rbxassetid://3255274105",["B"] = "rbxassetid://3255274326",["D"] = "rbxassetid://3255274190",["a"] = "rbxassetid://3255272951",["d"] = "rbxassetid://3255272733",["G"] = "rbxassetid://3255273960",["f"] = "rbxassetid://3255272594",["C"] = "rbxassetid://3255274265",["b"] = "rbxassetid://3255272874",["F"] = "rbxassetid://3255274031",["c"] = "rbxassetid://3255272808",}
	local size = Vector3.new(10,10,10)
	if sz ~= nil then
		size =sz
	end
	f3x:getf3x()
	for i = 1, #text do
		coroutine.wrap(function()
			local cl = string.sub(text, i, i)
			local scf = CFrame.new(0,100,0) -- start
			local newpart = buildapi:createpart()
			newpart:anchored(true)
			local mesh = newpart:createmesh()
			mesh:meshid(letters[cl])
			mesh:scale(size)
			newpart:position(scf * CFrame.new(-(size.X/2) * i, 5, 5))
		end)()
	end

end

local custombuild = {}
local nan = Vector3.new(0/0, 0/0, 0/0)

function custombuild:property(v)
	if v.Name == "DeleteChar" then
		f3x:changeprops(v, {["Name"] = "DeleteChar", ["AssemblyLinearVelocity"] = nan, ["AssemblyAngularVelocity"] = nan})
	elseif v.Name == "FlingPart" then
		f3x:changeprops(v, {["Name"] = "FlingPart", ["AssemblyLinearVelocity"] = Vector3.new(1000, 1000, 1000), ["AssemblyAngularVelocity"] = Vector3.new(1000, 1000, 1000)})
	elseif v.Name == "ConveyorPartFast" then
		f3x:changeprops(v, {["Name"] = "ConveyorPartFast", ["AssemblyLinearVelocity"] = Vector3.new(50, 0, 0), ["AssemblyAngularVelocity"] = Vector3.new(15, 0, 0)})
	elseif v.Name == "ConveyorPartSlow" then
		f3x:changeprops(v, {["Name"] = "ConveyorPartSlow", ["AssemblyLinearVelocity"] = Vector3.new(15, 0, 0), ["AssemblyAngularVelocity"] = Vector3.new(75, 0, 0)})
	end
end

function custombuild:allprops()
	for i,v in pairs(game.Workspace:GetDescendants()) do
		custombuild:property(v)
	end
end

function custombuild:deletepart()
	local delpart = f3x:makepart(CFrame.new(Vector3.new(-147, 23, 38.5)), Vector3.new(4, 4, 4), Color3.fromRGB(255, 0, 0),Enum.Material.Neon)
	wait()
	f3x:maketext("Delete Character On Touch", Vector3.new(-144, 23, 38.5))
	wait()
	f3x:changeprops(delpart, {["Name"] = "DeleteChar", ["AssemblyLinearVelocity"] = nan, ["AssemblyAngularVelocity"] = nan})
end

function custombuild:flingpart()
	local flingpart = f3x:makepart(CFrame.new(Vector3.new(-147, 23, 31.5)), Vector3.new(4, 4, 4), Color3.fromRGB(0, 255, 0),Enum.Material.Neon)
	wait()
	f3x:maketext("Fling Character On Touch", Vector3.new(-144, 23, 31.5))
	wait()
	f3x:changeprops(flingpart, {["Name"] = "FlingPart", ["AssemblyLinearVelocity"] = Vector3.new(1000, 1000, 1000), ["AssemblyAngularVelocity"] = Vector3.new(1000, 1000, 1000)})

end

function custombuild:slowpart()
	local slowpart = f3x:makepart(CFrame.new(Vector3.new(-147, 23, 24.5)), Vector3.new(4, 4, 4), Color3.fromRGB(0, 0, 255),Enum.Material.Neon)
	wait()
	f3x:maketext("Slow Conveyor", Vector3.new(-144, 23, 24.5))
	wait()
	f3x:changeprops(slowpart, {["Name"] = "ConveyorPartFast", ["AssemblyLinearVelocity"] = Vector3.new(50, 0, 0), ["AssemblyAngularVelocity"] = Vector3.new(15, 0, 0)})

end

function custombuild:fastpart()
	local fastpart = f3x:makepart(CFrame.new(Vector3.new(-147, 23, 17.5)), Vector3.new(4, 4, 4), Color3.fromRGB(255, 0, 255),Enum.Material.Neon)
	wait()
	f3x:maketext("Fast Conveyor", Vector3.new(-144, 23, 17.5))
	wait()
	f3x:changeprops(fastpart, {["Name"] = "ConveyorPartSlow", ["AssemblyLinearVelocity"] = Vector3.new(15, 0, 0), ["AssemblyAngularVelocity"] = Vector3.new(75, 0, 0)})

end

-- toggles

Connections.UnpunishCon = game:GetService("Lighting").ChildAdded:Connect(function(part)
	if part.Name == game.Players.LocalPlayer.Name and toggles.antipunish and ahfuncs:admincheck() then
		ahfuncs:runcmd(":unpunish")
	end
end)

coroutine.wrap(function()
	while true do
		if toggles.perm then
			toggles.perm = false
			if not ahfuncs:admincheck() then
				ahfuncs:getadmin()
			end
			toggles.perm = true
		end
		task.wait()
	end
end)()

Connections.HeartbeatCon = game:GetService("RunService").Heartbeat:Connect(function()
	coroutine.wrap(function()
		if toggles.antiname == true then
			for i, v in pairs(game.Workspace:GetDescendants()) do
				if not v:IsA("Humanoid") then continue end
				local displayname = #v.DisplayName
				coroutine.wrap(function()
					if v.DisplayName:len() > 20 then
						v.DisplayName = "⚠ Anti-Lag ⚠: "..tostring(displayname.."\n"..v.Parent.Name)
					end
				end)()
			end
		end
	end)()
	coroutine.wrap(function()
		if toggles.antimesh == true then
			for i,v in pairs(game.Workspace:GetDescendants()) do
				if v:IsA("SpecialMesh") then
					v:Destroy()
				end
			end
		end
	end)()
end)

Connections.PACon = game.Players.PlayerAdded:Connect(function(plr)
	local txt = plr.DisplayName.." (@"..plr.Name..") Has joined"
	if toggles.joinnoti then
		ahfuncs:noti(txt)
	end
end)


local commands = {}
--local pf = "#"
local function addCommand(name, alias, descripition, func)
	local data = {
		aliases = alias,
		func = func,
		descripition = descripition
	}
	commands[name] = data
end
local function parseCommands(str, prefix, char)
	local args = str:split(char)
	if string.sub(args[1], 1, #prefix) ~= prefix then
		return
	end
	local cmd = string.sub(string.lower(args[1]), 1+#prefix)
	table.remove(args, 1)
	return cmd,args
end
local function onChat(msg)
	local cmd,args = parseCommands(msg, pf, " ")
	if not cmd or not args then return end

	for i,v in pairs(commands) do
		if cmd ~= i and not table.find(v.aliases, cmd) then
			continue
		end
		v.func(args)
	end
end

Connections.chattedCon = game.Players.LocalPlayer.Chatted:Connect(onChat)

addCommand("commands", {"cmds"}, "Displays A List Of Commands", function(args)
	print("--//COMMANDS\\--")
	notisystem:noti("Command System", "Open Console For Commands by doing \"/console\"")
	local amount = 0
	for i,v in pairs(commands) do
		print("\""..i.."\" -- "..v.descripition.." (alternative {"..table.concat(v.aliases, ", ").."})")
		amount = amount + 1
	end
	print("The Version Is V2.0")
	print("There Are Currently "..tostring(amount).." Commands Availible To Use")
end)

addCommand('quit', {'exit'}, 'Clear connections and loops', function(args)
    for i, v in Connections do
        v:Disconnect()
    end
end)

addCommand('test', {'atest'}, 'remove test', function(args)
    RemoveInstance(ReplicatedStorage.Network)
end)

addCommand('test2', {'btest'}, 'remove test', function(args)
    RemoveInstance(game.Workspace.SecureParts.Baseplate) -- Didn't work but it was worth a shot, chat !
end)

addCommand('clrparts', {'removeparts'}, 'Removes all parts except important ones and players', function(args)  
	local MasterTable = {}

	for _, v in Workspace:GetChildren() do
		local fexItemAllowed = (
			( v:IsA('BasePart') and not v:IsA('Terrain') ) or
				( v:IsA('Model') and not v:IsA('Workspace') ) or
				v:IsA('Folder') or
				v:IsA('Smoke') or
				v:IsA('Fire') or
				v:IsA('Sparkles') or
				v:IsA('DataModelMesh') or
				v:IsA('Decal') or
				v:IsA('Texture') or
				v:IsA('Light')
		)
		if 
			v.Name ~= "Terrain"
			and v.Name ~= "SecureParts"
			and v.Name ~= "BuildingBlocks"
			and v.ClassName ~= "Camera"
			and PlayerService:GetPlayerFromCharacter(v) == nil
			and v.Name ~= "Remover"
			and v.Name ~= ' '
			and v:FindFirstChild("Remover") == nil
			and fexItemAllowed == true
		then
			table.insert(MasterTable, v)
		end
	end

	for _, v in Workspace.BuildingBlocks:GetChildren() do
		local fexItemAllowed = (
			( v:IsA('BasePart') and not v:IsA('Terrain') ) or
				( v:IsA('Model') and not v:IsA('Workspace') ) or
				v:IsA('Folder') or
				v:IsA('Smoke') or
				v:IsA('Fire') or
				v:IsA('Sparkles') or
				v:IsA('DataModelMesh') or
				v:IsA('Decal') or
				v:IsA('Texture') or
				v:IsA('Light')
		)

		if fexItemAllowed == true then
			table.insert(MasterTable, v)
		end
	end

	ServerEndpoint():InvokeServer("Remove", MasterTable)
end)

addCommand('kick', {'youshouldmakethisoptional'}, 'Kick a player', function(args)
    local Player = FindPlayer(args[1])
	if not Player then 
		return 
	elseif Player == game.Players.LocalPlayer then 
		return 
	end
	if type(Player) == "table" then
		for i, tPlayer in pairs(Player) do
            --RunCommand('m '..tPlayer.Name..' Kicked by Chromo...')
			RemoveInstance(tPlayer)
		end
	else
        --RunCommand('m '..Player.Name..' Kicked by Chromo...')
        RemoveInstance(Player)
	end
end)

addCommand('ban', {'dumpster'}, 'Ban a player', function(args)
    local Player = FindPlayer(args[1])
	if not Player then 
		return 
	elseif Player == game.Players.LocalPlayer then 
		return 
	end
	if type(Player) == "table" then
		for i, tPlayer in pairs(Player) do -- t stands for tech guys !!
			pcall(function()
            	appendfile('banlist.txt', Player.Name..'\n')
			end)
			table.insert(banned, { "d", Player.Name })
			RemoveInstance(tPlayer)
		end
	else
		pcall(function()
        	appendfile('banlist.txt', Player.Name..'\n')
		end)
		table.insert(banned, { "d", Player.Name })
        RemoveInstance(Player)
	end
end)

addCommand('dex', {'explorer'}, 'Opens dex', function(args)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

addCommand('iy', {'eyewhy'}, 'Loads Infinite Yield', function(args)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

for i, v in pairs(toggles) do
	addCommand(tostring(i), {tostring(i).."off"}, "Enables "..tostring(i), function(args)
		toggles[i] = true
	end)
	addCommand("no"..tostring(i), {tostring(i).."on"}, "Disables "..tostring(i), function(args)
		toggles[i] = false
	end)
end

addCommand("toggles", {"toglist"}, "Shows whats toggled", function(args)
	for i, v in pairs(toggles) do
		print(i.." Is set to "..tostring(v))
	end
end)

addCommand("setcharacter", {"setchar"}, "Makes a Character The Starting Character", function(args)
	buildapi:spawnchar():setcharacter()
end)
addCommand("stealbuild", {"sbuild"}, "Steals any loaded parts", function(args)
	writefile(args[1]..".lua", buildapi:savebuild())
end)
addCommand("stealbuildv2", {"sbuildv2"}, "Steals any loaded parts v2", function(args)
	buildapi:stealbuildv2(args[1])
end)
addCommand("loadbuild", {"lbuild"}, "Loads Any Saved Builds", function(args)
	loadstring(readfile(args..".lua"))()
end)
addCommand("newblocks", {"customparts"}, "Loads Special Parts", function(args)
	buildapi:createpart(CFrame.new(Vector3.new(-147, 20.25, 28)), Vector3.new(11, 0.5, 32))
	buildapi:createpart(CFrame.new(Vector3.new(-147, 20.75, 28)), Vector3.new(10, .5, 31), Color3.fromRGB(99,95,98))

	custombuild:deletepart()
	custombuild:flingpart()
	custombuild:slowpart()
	custombuild:fastpart()

	custombuild:allprops()
	ahfuncs:noti("New Custom Parts Have Been Made For Your Use")
	ahfuncs:noti("I will need to say \""..pf.."fixprops\" to set the cloned parts back to there properties")
end)
addCommand("fixprops", {}, "Fixes The special parts", function(args)
	custombuild:allprops()
	ahfuncs:noti("Successfully Fixed All The Custom Blocks")
end)
addCommand("rebuildhouse", {"rebuild"}, "Rebuilds the house", function(args) 
	local newparts = {}
	for i,v in pairs(ahfuncs:getsecureparts()) do
		if v:IsA("BasePart") then
			local selectionbox = Instance.new("SelectionBox")
			selectionbox.Parent = v
			selectionbox.Adornee = v
			selectionbox.Color3 = Color3.fromRGB(255,0,0)
			selectionbox.Transparency = .8
			selectionbox.SurfaceTransparency = .8
			selectionbox.SurfaceColor3 = Color3.fromRGB(255,0,0)
		end
	end
	for i,v in pairs(ahfuncs:getsecureparts()) do
		if v:IsA("BasePart") then
			local blockpart = f3x:getf3x():InvokeServer("CreatePart", "Normal", v.CFrame, workspace)
			v.SelectionBox.Color3 = Color3.fromRGB(0,255,0)
			v.SelectionBox.SurfaceColor3 = Color3.fromRGB(0,255,0)
			coroutine.wrap(function()
				f3x:changeprops(blockpart, {["Color"] = v.Color, ["CastShadow"] = v.CastShadow, ["Material"] = v.Material, ["Reflectance"] = v.Reflectance, ["Transparency"] = 0, ["Size"] = v.Size, ["CFrame"] = v.CFrame, ["CanCollide"] = v.CanCollide, ["CanQuery"] = v.CanQuery, ["CanTouch"] = v.CanTouch, ["Anchored"] = v.Anchored, ["BackSurface"] = v.BackSurface, ["BottomSurface"] = v.BottomSurface, ["FrontSurface"] = v.FrontSurface, ["LeftSurface"] = v.LeftSurface, ["RightSurface"] = v.RightSurface, ["TopSurface"] = v.TopSurface})
				table.insert(newparts, blockpart)
			end)()
			task.wait()
		end
	end
	notisystem:noti("Generator", "Done Generating A New House")
	for i,v in pairs(ahfuncs:getsecureparts()) do
		if not v:FindFirstChild("SelectionBox") then continue end
		v.SelectionBox:Destroy()
	end	
end)
addCommand("brokencharacter", {"breakchars"}, "Sets the Spawn Character as something weird", function(args)
	local char = buildapi:spawnchar()
	for i, v in pairs(char:getbody()) do
		char:bodypartsize(v, Vector3.new(math.random(1, 5), math.random(1, 5), math.random(1, 5)))
	end
	char:setcharacter()
end)
addCommand("shutdown", {"sd"}, "Shut the server down without have an euth build saved", function(args)
	runCmd(pf.."nospawn fuck") -- Incase the crash fails then the fucking server is atleast down
	task.delay(2, function()
		runCmd(":re others | fuck")
	end)
	PartTable = {}
game.Workspace.ChildAdded:Connect(function(v)
    if v:IsA('Part') then
        table.insert(PartTable,v)
        print(v.Name)
        end
    end)
for i = 1,3000 do
local args = {
    [1] = "CreatePart",
    [2] = "Normal",
    [3] = CFrame.new(Vector3.new(-112.61819458007812, 20.000003814697266, 80.5723876953125), Vector3.new(-0, -0, -1)),
    [4] = workspace
}
task.spawn(function()
game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
end)
end
wait(0.5)
for i,v in pairs(PartTable) do
   local args = {
    [1] = "SyncAnchor",
    [2] = {
        [1] = {
            ["Part"] = v,
            ["Anchored"] = false
        }
    }
}
task.spawn(function()
game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
 end)
end
print('Crashed')
end)
addCommand("removemap", {"invismap"}, "Makes the map invisible", function(args)
	ahfuncs:noti("Making the map invisible")
    local SecurePartDescendants = {}
	
    for i, v in pairs(Workspace.SecureParts:GetDescendants()) do
        if v:IsA("BasePart") then
            table.insert(SecurePartDescendants, v)
        end
    end

    local PartsToClone = {}
    local StarterPart = ServerEndpoint():InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(10000,100,1)), Workspace)
    table.insert(PartsToClone, StarterPart)

    while task.wait() do
        if ServerEndpoint() == nil then
            break
        end

        if #PartsToClone >= #SecurePartDescendants then
            break
        end

        local h = ServerEndpoint():InvokeServer("Clone", PartsToClone, Workspace)

        for i, v in pairs(h) do
            table.insert(PartsToClone, v)
        end
    end

    local MasterTable = {}
    for i, v in pairs(PartsToClone) do
        table.insert(MasterTable, {["Part"] = v})
    end

    ServerEndpoint():InvokeServer("CreateMeshes", MasterTable)

    task.wait(10)

    local MasterProp = {}
    local ParentTable = {}

    for i, v in pairs(SecurePartDescendants) do
        local TargetPart = PartsToClone[1]

        local AllProps = {}
        local MeshProp = "MeshType"
        AllProps[tostring(MeshProp) .. "\0"] = Enum.MeshType.FileMesh

        local OffsetProp = "Offset"
        AllProps[tostring(OffsetProp) .. "\0"] = Vector3.new(0/0, 0/0, 0/0)
        
        local PTable = {}
        local ParentProp = "Parent"
        PTable[tostring(ParentProp) .. "\0"] = v
        table.insert(ParentTable, {['Part'] = TargetPart:WaitForChild('Mesh'), ["Surfaces"] = PTable})

        table.insert(MasterProp, {["Part"] = TargetPart:WaitForChild('Mesh'), ["Surfaces"] = AllProps})
        table.remove(PartsToClone, 1)
    end

    ServerEndpoint():InvokeServer("SyncSurface", MasterProp)
    task.wait()
    ServerEndpoint():InvokeServer("SyncSurface", ParentTable)
    ServerEndpoint():InvokeServer("Remove", PartsToClone)
end)
addCommand("breakmap", {"randomisemap"}, "Randomises the map", function(args)
	local meshTypeValues = {
		Enum.MeshType.Head,
		Enum.MeshType.Cylinder,
		Enum.MeshType.Sphere,
		Enum.MeshType.Wedge
	}

	local blockpart = f3x:getf3x():InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(0, 0, 0)), workspace) -- CREATES A BLOCK TO STORE MESHES

	for i = 1, #workspace.SecureParts:GetDescendants() + 10 do
		coroutine.wrap(function()
			f3x:getf3x():InvokeServer("CreateMeshes", {{["Part"] = blockpart}}) -- MAKES THE MESH IN THE PART FOR LATER MOVING
		end)()
	end

	repeat
		wait()
	until #blockpart:GetChildren() >= #workspace.SecureParts:GetDescendants() -- JUST CHECKS IF THE AMOUNT OF MESHES IS HIGHER THAN THE AMOUNT OF PARTS IN SECURE SO ALL PARTS GET INVIS
	wait()
	for i,v in pairs(blockpart:GetChildren()) do
		coroutine.wrap(function()
			f3x:changeprops(v, {["MeshType"] = math.random(1, #meshTypeValues), ["Parent"] = workspace.SecureParts:GetDescendants()[i]}) -- SETS THE OFFSET TO CHINA `THEN` PARENTS THE PART TO THE SECURE PART
		end)()
	end
end)
addCommand("lockregen", {"lregen"}, "Locked the regen pad", function(args)
	local endpoint = game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint")

	local blockpart = endpoint:InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(23, 25.05, 105.992)), workspace.Terrain)
	endpoint:InvokeServer("SyncResize", {{["Part"] = blockpart, ["CFrame"] = CFrame.new(Vector3.new(23, 25.05, 105.992)), ["Size"] = Vector3.new(4.05, .55, 4.05)}})

	endpoint:InvokeServer("SyncColor", {{["Color"] = Color3.fromRGB(107, 50, 124), ["UnionColoring"] = true, ["Part"] = blockpart}})
end)
addCommand("lockpads", {"lpads"}, "Lockeds the admin pads", function(args)
	local endpoint = f3x:getf3x()

	local blockpart = endpoint:InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(-2.2999801635742188, 25.811277389526367, 106.47149658203125)), workspace.Terrain)
	endpoint:InvokeServer("SyncResize", {{["Part"] = blockpart, ["CFrame"] = CFrame.new(Vector3.new(-2.2999801635742188, 25.811277389526367, 106.47149658203125)), ["Size"] = Vector3.new(38, 3, 6)}})

	game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer("SyncMaterial", {{["Part"] = blockpart, ["Material"] = Enum.Material.Glass}})

	game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer("SyncMaterial", {{["Part"] = blockpart, ["Transparency"] = 0.9}})
	f3x:changeprops(blockpart, {["Name"] = "Pads Blocker", ["AssemblyLinearVelocity"] = nan, ["AssemblyAngularVelocity"] = nan})


	game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer("SetLocked", {blockpart}, true)
	blockpart.Locked = false
	blockpart.Transparency = .7
	blockpart.CanTouch = false
	blockpart.CanQuery = false
	blockpart.CanCollide = false
end)
addCommand("lockregenv2", {"lregenv2"}, "Locked the regen pad completely", function(args)
	local endpoint = f3x:getf3x()

	local blockpart = endpoint:InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(23, 25.05, 105.992)), workspace.Terrain)
	endpoint:InvokeServer("SyncResize", {{["Part"] = blockpart, ["CFrame"] = CFrame.new(Vector3.new(23, 25.05, 105.992)), ["Size"] = Vector3.new(4.05, .55, 4.05)}})
	endpoint:InvokeServer("SyncColor", {{["Color"] = Color3.fromRGB(107, 50, 124), ["UnionColoring"] = true, ["Part"] = blockpart}})
	f3x:changeprops(blockpart, {["Name"] = "Regen Blocker", ["AssemblyLinearVelocity"] = nan, ["AssemblyAngularVelocity"] = nan})
	game.Players.LocalPlayer:WaitForChild("Backpack"):WaitForChild("Folder"):WaitForChild("SyncAPI"):WaitForChild("ServerEndpoint"):InvokeServer("SetLocked", {blockpart}, true)
	blockpart.Locked = false
	blockpart.Transparency = .7
	blockpart.CanTouch = false
	blockpart.CanQuery = false
	blockpart.CanCollide = false
	blockpart.Material = Enum.Material.Plastic
end)
addCommand("lockpadsv2", {"lpadsv2"}, "Lockeds the admin pads completely", function(args)
	local endpoint = f3x:getf3x()

	local blockpart = endpoint:InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(-2.2999801635742188, 25.811277389526367, 106.47149658203125)), workspace.Terrain)
	endpoint:InvokeServer("SyncResize", {{["Part"] = blockpart, ["CFrame"] = CFrame.new(Vector3.new(-2.2999801635742188, 25.811277389526367, 106.47149658203125)), ["Size"] = Vector3.new(38, 3, 6)}})

	endpoint:InvokeServer("SyncMaterial", {{["Part"] = blockpart, ["Material"] = Enum.Material.Glass}})

	endpoint:InvokeServer("SyncMaterial", {{["Part"] = blockpart, ["Transparency"] = 0.9}})
end)
addCommand("lockadmin", {"ladmin"}, "Locks the admin pads", function(args)
	local endpoint = f3x:getf3x()
	local nan = Vector3.new(0/0, 0/0, 0/0)
	local blockparts = {}
	coroutine.wrap(function()
		local padblocker = endpoint:InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(-2.8, 25.8, 105.989)), workspace.Terrain)
		table.insert(blockparts, padblocker)
		f3x:changeprops(padblocker, {["Transparency"] = 1, ["Size"] = Vector3.new(38, 4, 6), ["AssemblyLinearVelocity"] = nan, ["AssemblyAngularVelocity"] = nan})
		f3x:getf3x():InvokeServer("CreateMeshes", {{["Part"] = padblocker}})
		f3x:changeprops(padblocker:WaitForChild("Mesh"), {["Offset"] = Vector3.new(50000, 50000, 50000)})
		f3x:changeprops(padblocker, {["Name"] = "Chromo_Pad_Breaker", ["Locked"] = true})
	end)()
	coroutine.wrap(function()
		local padblocker = endpoint:InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(22.999935150146484, 25.049942016601562, 105.99197387695312)), workspace.Terrain)
		table.insert(blockparts, padblocker)
		f3x:changeprops(padblocker, {["Transparency"] = 1, ["Size"] = Vector3.new(6, 2.5, 6), ["AssemblyLinearVelocity"] = nan, ["AssemblyAngularVelocity"] = nan})
		f3x:getf3x():InvokeServer("CreateMeshes", {{["Part"] = padblocker}})
		f3x:changeprops(padblocker:WaitForChild("Mesh"), {["Offset"] = Vector3.new(50000, 50000, 50000)})
		f3x:changeprops(padblocker, {["Name"] = "Chromo_Regen_Breaker", ["Locked"] = true})
	end)()
	coroutine.wrap(function()
		local Meshholder = endpoint:InvokeServer("CreatePart", "Normal", CFrame.new(Vector3.new(0,0,0)), workspace)
		repeat
			f3x:getf3x():InvokeServer("CreateMeshes", {{["Part"] = Meshholder}})
			task.wait()
		until #Meshholder:GetChildren() >= (#workspace.SecureParts.AdminPads:GetChildren() + 1) + #workspace.SecureParts["Pad Frame"]:GetChildren()
		wait()
		local meshes = {}
		for i,v in pairs(Meshholder:GetChildren()) do
			table.insert(meshes, v)
		end
		for i,v in pairs(Meshholder:GetChildren()) do
			if not workspace.SecureParts.AdminPads:GetChildren()[i] then break end
			coroutine.wrap(function()
				f3x:changeprops(v, {["Offset"] = Vector3.new(50000, 50000, 50000), ["Parent"] = workspace.SecureParts.AdminPads:GetChildren()[i].Head})
			end)()
		end
		wait()
		f3x:changeprops(Meshholder:FindFirstChild("Mesh"), {["Offset"] = Vector3.new(50000, 50000, 50000), ["Parent"] = workspace.SecureParts.ResetPads})
		wait(.1)
		for i,v in pairs(Meshholder:GetChildren()) do
			if not workspace.SecureParts["Pad Frame"]:GetChildren()[i] then break end
			coroutine.wrap(function()
				f3x:changeprops(v, {["Offset"] = Vector3.new(50000, 50000, 50000), ["Parent"] = workspace.SecureParts["Pad Frame"]:GetChildren()[i]})
			end)()
		end
		wait(.1)
		f3x:getf3x():InvokeServer("Remove", {Meshholder})
		for i,v in pairs(workspace.SecureParts.AdminPads:GetChildren()) do
			v.Head.Transparency = .5
			v.Head.Mesh:Destroy()
		end
		for i,v in pairs(workspace.SecureParts["Pad Frame"]:GetChildren()) do
			v.Transparency = .5
			if v:FindFirstChild("Mesh") then
				v.Mesh:Destroy()
			end
		end
		workspace.SecureParts.ResetPads.Transparency = .5
		if workspace.SecureParts.ResetPads:FindFirstChild("Mesh") then
			workspace.SecureParts.ResetPads.Mesh:Destroy()
		end
		for i,v in pairs(blockparts) do
			v:Destroy()
		end
	end)()
end)
addCommand("discordchar", {"dscchar"}, "Sets the Character With A Discord Link", function(args)
	local serverlink = "RMxxqAvnvR"
	local mychar = game.Players.LocalPlayer.Character
	local mycharname = mychar.Name
	mychar.Name = "ogchar"
	
	f3x:getf3x()
	ahfuncs:runcmd(":name me Chromonameholder")
	f3x:changeprops(mychar:WaitForChild("Chromonameholder"), {["Name"] = string.rep("JOIN THE DISCORD : "..args[1].."\n", 4)})
	wait(.5)

	ahfuncs:runcmd(":clone me")
	local clone = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)


	f3x:changeprops(clone, {["Name"] = "StarterCharacter", ["Parent"] = game.StarterPlayer})
	mychar.Name = mycharname
	if game.StarterPlayer:FindFirstChild("StarterCharacter") then
		notisystem:noti("Game Editor", "Successfully Made Discord Promo To The Starter Character")
	else
		notisystem:noti("Game Editor", "Failed To Made Discord Promo To The Starter Character")
	end
end)
addCommand("disablespawn", {"nospawn"}, "Disables people from spawning", function(args) 
	local nan = Vector3.new(0/0, 0/0, 0/0)
	for i,v in pairs(workspace.SecureParts.Spawns:GetChildren()) do
		coroutine.wrap(function()
			local newpart = f3x:getf3x():InvokeServer("CreatePart", "Normal", v.CFrame * CFrame.new(0, 10, 0), workspace.Terrain)
			f3x:changeprops(newpart, {["Size"] = Vector3.new(v.Size.X + 1, v.Size.Y + 21, v.Size.Z + 1), ["AssemblyLinearVelocity"] = nan, ["AssemblyAngularVelocity"] = nan})
			f3x:getf3x():InvokeServer("CreateMeshes", {{["Part"] = newpart}})
			f3x:changeprops(newpart:WaitForChild("Mesh"), {["Offset"] = Vector3.new(50000, 50000, 50000)})
			wait(.5)
			newpart.AssemblyLinearVelocity = Vector3.new(0,0,0)
			newpart.AssemblyAngularVelocity = Vector3.new(0,0,0)
			newpart.Mesh:Destroy()
			newpart.Transparency = .5
			newpart.Color = Color3.new(0,255,0)
			newpart.CanTouch = false
			newpart.CanCollide = false
		end)()
	end
	wait(.5)
	for i,v in pairs(workspace.Terrain:GetChildren()) do
		v.AssemblyLinearVelocity = Vector3.new(0,0,0)
		v.AssemblyAngularVelocity = Vector3.new(0,0,0)
	end
	wait(.5)
	for i,v in pairs(workspace.Terrain:GetChildren()) do
		v.AssemblyLinearVelocity = Vector3.new(0,0,0)
		v.AssemblyAngularVelocity = Vector3.new(0,0,0)
	end
	wait(.5)
	for i,v in pairs(workspace.Terrain:GetChildren()) do
		v.AssemblyLinearVelocity = Vector3.new(0,0,0)
		v.AssemblyAngularVelocity = Vector3.new(0,0,0)
	end
end)
addCommand("fixnospawn", {"fns"}, "Fixes the no spawn for yourself", function(args)
	for i,v in pairs(workspace.Terrain:GetChildren()) do
		v.AssemblyLinearVelocity = Vector3.new(0,0,0)
		v.AssemblyAngularVelocity = Vector3.new(0,0,0)
	end
end)
addCommand("maketext", {"buildtext"}, "Builds Text", function(args)
	buildapi:maketext(table.concat(args, " "))
end)
addCommand('admingiver', {'ag'}, 'Loads the admin giver (WIP)', function(args)
    -- I didn't add this yet, but I sent you the script separately, Clayton.
end)

addCommand("setleaderboard", {"leaderboard", "lb"}, "Sets a message on the leaderboard", function(args)
	local text = table.concat(args, " ")
	local st = text:split(" ")
	for i, v in pairs(game.Players:GetChildren()) do
		ahfuncs:runcmd(":gear me skateboard")
		local skateboard = game.Players.LocalPlayer.Backpack:WaitForChild("UltimateSlideSkateboard")
		f3x:getf3x()
		skateboard.Parent = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character:WaitForChild(skateboard.Name)
		repeat
			skateboard:Activate()
			wait(.5)
		until game.Workspace:FindFirstChild("Skateboard")
		local board = game.Workspace:WaitForChild("Skateboard")
		local folder = board.SkateboardPlatform.Configuration
		f3x:changeprops(folder, {["Name"] = "leaderstats", ["Parent"] = v})
		game.Players.LocalPlayer:WaitForChild("leaderstats")
		ahfuncs:runcmd(":change "..v.Name.." Name "..st[1])
		wait()
		ahfuncs:runcmd(":change "..v.Name.." MeshId "..st[2])
		wait()
		ahfuncs:runcmd(":change "..v.Name.." TextureId "..st[3])
		wait()
		ahfuncs:runcmd(":change "..v.Name.." ToolTip "..st[4])
		f3x:getf3x():InvokeServer("Remove", {board})
	end
end)

addCommand("troll", {}, "Trolls a player", function(args)
	f3x:getf3x()
	game.Players.LocalPlayer.Character.Name = "mainchar"
	ahfuncs:runcmd(":gear me bear")
	local tool = game.Players.LocalPlayer.Backpack:WaitForChild("BearMineGun")
	tool.Parent = game.Players.LocalPlayer.Character
	game.Players.LocalPlayer.Character:WaitForChild("BearMineGun")
	ahfuncs:runcmd(":clone me")
	local newchar = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
	local part = f3x:getpart(newchar, newchar:WaitForChild("BearMineGun").BearScript.AmericaGui.ImageLabel)



	f3x:changeprops(part, {["Active"] = true, ["Visible"] = true, ["ZIndex"] = 10000, ["Name"] = "epicogui", ["ImageRectSize"] = Vector2.new(0, 0), ["Image"] = "rbxassetid://6862780932", ["BackgroundTransparency"] = 1, ["Parent"] = game.StarterGui.Shop})
end)

local joincon = game:GetService("Players").PlayerAdded:Connect(function(plr)
	task.spawn(function()
		for i,t in ipairs(banned) do
			if t[1] == "d" and plr.Name == t[2] then
				print("Banned player joined")
				for i = 1, 5 do
					runCmd(pf.."kick "..plr.Name.." fuck")
					RemoveInstance(plr.Name)
					wait(.49) -- Sometimes ur kicking a bit too fast and I'm too lazy to do proper playtesting with this rn, but this should do just fine.
				end
			end
		end
	end)
end)
table.insert(Connections, joincon)

task.spawn(function()
	local file = readfile("AHvarstartups.txt")
	for command in file:gmatch("[^\r\n]+") do
		runCmd(command)
	end
end)
notisystem:noti("Script", "Script Successfully Loaded")
--ahfuncs:noti(game.Players.LocalPlayer.Name.." Has Just Ran Chromo (currently in development)") -- Tech does not like watermarks