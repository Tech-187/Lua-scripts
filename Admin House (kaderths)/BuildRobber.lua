--Ideas
--[[
 Add a watch command that checks how many times a player abuses
 Add acheck that checks for a antipunish/antikill
 Add crash (noclip, size nan, gear anything)
]]

local players = game:GetService("Players")
local userinput = game:GetService("UserInputService")
local stargergui = game:GetService("StarterGui")
local functions = {}
local whitelisted = {}
local highranks = {}
local topranks = {}
local banned = {}
local annoying = ""
local hspawn = false
local setspawn = nil
local pf = "!"
local loops = {}
local function say(i) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(i,"ALL") end
local ChatBar = game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
local function chat(msg)
	ChatBar:SetTextFromInput(msg)
	game.Players:Chat(msg)
	ChatBar.Text = ""
end
local function noti(Heading, text)
	stargergui:SetCore("ChatMakeSystemMessage", {
		Text = Heading.." : "..text;
		Color = Color3.fromRGB(255,255,255);
		Font = Enum.Font.GothamBold;
		TextSize = 15
	})
end
if _G.disconnect ~= nil then
	noti("Loader", "It Seems The Script Has Already Been Inject It Is Restarting Now")
	_G.disconnect()
end
local function cwait(a1)
	--[[if a1 == nil or a1 <= 0 then
		a1 = 1
	end
	local a2 = os.clock()
	a1 = a1 * 0.0001
	repeat
		if true then
		end
	until a2+ a1 <= os.clock()]]
	if a1 == nil or a1 <= 0 then
		a1 = 1
	end
	local a2 = os.clock()
	a1 = a1 * 0.0001

	local delta = 0
	repeat
		delta = task.wait()
	until os.clock() + delta >= a2+ a1
	repeat
		if true then
		end
	until a2+ a1 <= os.clock()
end
local function randomsim()
	local tablesim = {"|", "<", ".", ">", "/", "?", ";", ":", "@", "'", "~", "#", "]", "}", "[", "{", "=", "+", "-", "_", ")", "(", "*", "&", "^", "%", "$", "!"}
	return tablesim[math.random(1, #tablesim)]..tablesim[math.random(1, #tablesim)]..tablesim[math.random(1, #tablesim)]..tablesim[math.random(1, #tablesim)]..tablesim[math.random(1, #tablesim)]..tablesim[math.random(1, #tablesim)]..tablesim[math.random(1, #tablesim)]
end
local function givegear(ID)
	chat("gear me "..string.rep("0", math.random(25,50))..ID)
end
local function retname(user)
	local target = nil
	for i, v in pairs(players:GetChildren()) do
		if string.sub(string.lower(v.Name), 1, #user) == string.lower(user) or string.sub(string.lower(v.DisplayName), 1, #user) == string.lower(user) then
			target = v.Name
		end
	end
	if target == nil then
		return false, noti("Name System", "We Can Not Find A UserName Begining With \""..user.."\"")
	else
		return target
	end
end
local function savebuild()
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
		if string.find(v.Parent.Parent.Name, "ADONIS") then continue end
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
	[4] = workspace
}


game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
game.workspace.Part.Name = "Part]]..tostring(num)..[["
		]]
			if v.Shape == Enum.PartType.Ball then
				inst = "Ball"
				instinfo = [[
			coroutine.wrap(function()
	args = {
	[1] = "CreatePart",
	[2] = "]]..inst..[[",
	[3] = CFrame.new(]]..tostring(v.Position)..[[) * CFrame.Angles(math.rad(]]..tostring(v.Rotation.X)..[[),math.rad(]]..tostring(v.Rotation.Y)..[[),math.rad(]]..tostring(v.Rotation.Z)..[[)),
	[4] = workspace
}


game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
game.workspace.Part.Name = "Part]]..tostring(num)..[["
		]]
			elseif v.Shape == Enum.PartType.Cylinder then
				inst = "Cylinder"
				instinfo = [[
			coroutine.wrap(function()
	args = {
	[1] = "CreatePart",
	[2] = "]]..inst..[[",
	[3] = CFrame.new(]]..tostring(v.Position)..[[) * CFrame.Angles(math.rad(]]..tostring(v.Rotation.X)..[[),math.rad(]]..tostring(v.Rotation.Y)..[[),math.rad(]]..tostring(v.Rotation.Z)..[[)),
	[4] = workspace
}


game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
game.workspace.Part.Name = "Part]]..tostring(num)..[["
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
	[4] = workspace
}


game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
game.workspace.Seat.Name = "Part]]..tostring(num)..[["
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

		if inst == nil or partfound == true or game.Players:FindFirstChild(v.Name) then continue end
		infonum = infonum +1
		local info = [[
	
	]]..instinfo..[[
	
args = {
    [1] = "SyncResize",
    [2] = {
        [1] = {
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
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
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
            ["CanCollide"] = ]]..collision..[[
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

args = {
    [1] = "SyncColor",
    [2] = {
        [1] = {
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
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
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
            ["Material"] = Enum.Material["]]..tostring(string.split(tostring(v.Material), ".")[3])..[["]
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
args = {
    [1] = "SyncMaterial",
    [2] = {
        [1] = {
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
            ["Transparency"] = ]]..tostring(v.Transparency)..[[
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
args = {
    [1] = "SyncMaterial",
    [2] = {
        [1] = {
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
            ["Reflectance"] = ]]..tostring(v.Reflectance)..[[
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
]]
		if v:FindFirstChild("Mesh") and meshes == true then
			info = [[
		]]..info..[[
		args = {
    [1] = "CreateMeshes",
    [2] = {
        [1] = {
            ["Part"] = game.workspace:WaitForChild("Part]]..tostring(num)..[[")
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))
args = {
    [1] = "SyncMesh",
    [2] = {
        [1] = {
            ["MeshType"] = Enum.MeshType.FileMesh,
            ["Part"] = game.workspace.Part]]..tostring(num)..[[
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

args = {
    [1] = "SyncMesh",
    [2] = {
        [1] = {
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
            ["MeshId"] = "]]..v:FindFirstChild("Mesh").MeshId..[["
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

args = {
    [1] = "SyncMesh",
    [2] = {
        [1] = {
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
            ["Scale"] = Vector3.new(]]..tostring(v:FindFirstChild("Mesh").Scale)..[[)
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

args = {
    [1] = "SyncMesh",
    [2] = {
        [1] = {
            ["Part"] = game.workspace.Part]]..tostring(num)..[[,
            ["Offset"] = Vector3.new(]]..tostring(v:FindFirstChild("Mesh").Offset)..[[)
        }
    }
}

game:GetService("Players").LocalPlayer.Backpack.Folder.SyncAPI.ServerEndpoint:InvokeServer(unpack(args))

		]]
		end
		info = [[

]]..info..[[

end)()
]]
		table.insert(tab, info)
	end
	return "--There Are "..infonum.." Parts In This Build\ntime = function() wait(0.01) end \n\n"..table.concat(tab, "\n time() \n").."\n\nprint(\"BuildLoaded\")\nprint(\""..infonum.." Parts Loaded\")\n--There Are "..infonum.." Parts In This Build"
end
local function getpos(part)
	local inst = false
	local str = false
	local target = nil
	local found = false
	local pos
	if typeof(part) == "string" then
		str = true
		for i, v in pairs(players:GetChildren()) do
			if string.sub(string.lower(v.Name), 1, #part) == string.lower(part) or string.sub(string.lower(v.DisplayName), 1, #part) == string.lower(part) then
				if not game.Workspace:FindFirstChild(v.Name) then continue end
				target = v.Character:FindFirstChild("HumanoidRootPart") 
			end
		end
		if target == nil then
			for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if string.sub(string.lower(v.Name), 1, #part) == string.lower(part) then
					target = v
				end
			end
		end
		if target ~= nil then
			pos = target.Position
			str = true
			found = true
		end
	elseif typeof(part) == "Instance" then
		found = true
		pos = part.Position
		inst = true
	end
	if found == true then
		return pos
	elseif str == true then
		return false, noti("Workspace", "Sorry But \""..part.."\" Was Not Found In The Workspace")
	end
end

local loops = {}
local function togloop(name, state)
	if loops[name] ~= state then
		loops[name] = state
		noti("Toggle System", "Toggled "..name.." To "..tostring(state))
	end
end
local function htogloop(name, state)
	if loops[name] ~= state then
		loops[name] = state
	end
end
local function addloop(name, state, func)
	table.insert(loops, {name = state})
	coroutine.wrap(function()
		while true do
			coroutine.wrap(function()
				if loops[name] == true then
					func()
				end
			end)()
			cwait()
		end
	end)()
	task.wait(.1)
	togloop(name, state)
end
local function haddloop(name, state, func)
	table.insert(loops, {name = state})
	coroutine.wrap(function()
		while true do
			coroutine.wrap(function()
				if loops[name] == true then
					func()
				end
			end)()
			cwait(1)
		end
	end)()
	task.wait(.1)
	htogloop(name, state)
end
local function ctog(name)
	if loops[name] == true then

		return true
	else

		return false
	end
end
local function haddtog(name, state)
	table.insert(loops, {name = state})

	htogloop(name, state)
end
haddloop("anticrash", false, function()
	for _, v in pairs(game.Workspace:GetDescendants()) do
		partfound = nil
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
		if game.Players:FindFirstChild(v.Parent.Name) or partfound == nil then continue end
		if v:IsA("MeshPart") or v:IsA("FileMesh") or v.Name == "Grass" then
			print(v.Name)
			v:Destroy()
		end
	end
end)
local function chatsystem(plr)
	plr.Chatted:Connect(function(msg)
		local splitmsg = msg:split(" ")
		local target = splitmsg[2]
		local command = string.sub(splitmsg[1], 1 + #pf)
		local secondtarget = splitmsg[3]
		if table.find(whitelisted, plr.Name) then
		end
	end)
end
table.insert(functions, players.LocalPlayer.Chatted:Connect(function(msg)
	local splitmsg = msg:split(" ")
	local target = splitmsg[2]
	if string.sub(splitmsg[1], 1, #pf) ~= pf then
		return
	end
	local command = string.sub(splitmsg[1], 1 + #pf)
	local secondtarget = splitmsg[3]
	if command == "cmds" then
		noti("Commands", "Press F9 For A List Of Commands")
		local function cmd(name, info)
			print("\""..pf..name.."\" - "..info)
		end
		cmd("getname", "Copys The Name Of Another Player")
		cmd("getid", "Copys The Character ID Of Another Player")
		cmd("getpos", "Copys The Position Of A Part Or A Player")
		cmd("goto", "Teleports To A Part Or Player")
		cmd("bsave", "Steals All The Builds In The Server And Saves Them")
		cmd("bload", "Loads A Build")
		cmd("bcopy", "Sets The Build Save Data To The Clipboard")
		cmd("anticrash", "Toggles anticrash To True")
		cmd("noanticrash", "Toggles anticrash To Talse")
	end
	if command == "goto" then
		local pos =  getpos(target)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(pos.X, pos.Y + 5, pos.Z))
		noti("Teleport", "Teleporting To \""..target.."\"")
	end
	if command == "getpos" then
		setclipboard(tostring(getpos(target)))
		noti("Clipboard", "\""..target.."\" Position Has Now Been Set To Clipboard")
	end
	if command == "getname" then
		setclipboard(retname(target))
		noti("Clipboard", "\""..retname(target).."\" Has Now Been Set To Clipboard")
	end
	if command == "getid" then
		setclipboard(game:GetService("Players"):FindFirstChild(retname(target)).UserId)
		noti("Clipboard", "\""..retname(target).."\" User ID Has Now Been Set To Clipboard")
	end
	if command == "bcopy" then
	
		setclipboard(savebuild())
		noti("Builder", "All The Building Parts Have Been Turned Into Data And Set To Clipboard")
		--Mesh ID rbxassetid://5143242800
		-- shift g for model
	end
	if command == "bsave" then
		writefile(target..".lua", savebuild())
		noti("Builder", "All Parts Have Been Saved To \""..target.."\" As A Build")
	end
	if command == "bload" then
		if isfile(target..".lua") then
			loadstring(readfile(target..".lua"))()
		else
			noti("Builder", "There Is No File Name Saved Under \""..target.."\"")
		end
	end
	if command == "anticrash" then
		togloop("anticrash", true)
	end
	if command == "noanticrash" then
		togloop("anticrash", false)
	end
end))

_G.disconnect = function()
	for i, v in pairs(functions) do
		v:Disconnect()
	end
	loops = nil
	_G.disconnect = nil
end
noti("Loader", "Script Successfully Loaded")
noti("Loader", "Prefix Is \""..pf.."\" Type \""..pf.."cmds\" For A List Of Commands")
task.wait(1)
if isfile("Startupcmds.lua") then
	for i, v in pairs(string.split(readfile("Startupcmds.lua"))) do
		chat(v)
	end
end
