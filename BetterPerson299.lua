-- JUST HAVING PERSON299'S ADMIN IS WAY BETTER THAN JUST HAVING PERM

repeat task.wait() until game:IsLoaded()

--[[
    So you may be wondering what the whole point of this script is.
    You may already know that KAH has two gamepasses. We got Perm Admin which is by far the most purchased gamepass of KAH
    and then we got Person299's admin which is arguably considered a letdown for a huge majority of the playerbase.

    Most people have bought both gamepasses which just gives you a few extra commands but not everyone wants to buy both
    Some just want either one of the two, either Perm or Persons. 
    
    I bought just Person299's Admin on one of my accounts and it just doesn't feel that useful at all, 
    since a lot of the commands that could make it obsolete perm are just not present.

    This mod is there for just the few amount of people that bought just Person299's Admin, 
    but of course you can use it without the gamepass if you like some of the FE functions that the script comes with.

    This script/mod is completely open source and you can use anything in your own script if you like, 
    though credit would be appreciated ;)


    Type "cmds" (no prefix) after running this script. It's recommended to put this in autoexec. (This script is literally made for autoexec) 
    This script should be compatible with all other scripts. Just please check for updates on the github page (https://github.com/Tech-187/Lua-scripts/blob/main/BetterPerson299.lua)
]]

local uniquemodstring = "BetterPerson299Command" -- Change this to whatever, just don't add any spaces or it may break the commands
local antilog = string.rep("0", 32)
local lplayer = game.Players.LocalPlayer
local userId = game.Players.LocalPlayer.UserId
local antivg = true
local connections = {} -- If you're gonna alter the script then please add any connections that you add to a table so it can be closed with the !closemod command
local BlacklistedGear = {"VampireVanquisher","IvoryPeriastron","PaintBucket","SubspaceTripmine","Transmorpher","LaserFingerPointers","SeaThemedCrossbow","RageTable","IceStaff"} -- You can find the tool names using this script https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/Inventory%20tool%20checker
local gearwhitelisted = {"Master0fSouIs","ScaleneSoap9803","t_echr","Humangas","ovicaI"} -- Players that are in this table won't get ungeared.
local mousee = game.Players.LocalPlayer:GetMouse()
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end

-- CONFIGURE ANYTHING BELOW

shared.mod = true -- Turn this off and re-run the script to disable the mod (or just use !closemod)
shared.gpcheck = true -- Only boot if you have the gamepass (recommended for autoexec). Cannot be altered after the script ran obviously
shared.p2p = false -- This will enable perm to persons. Re-run the script and turn this off to disable the mod (or just use !s to switch)
shared.padgrab = true -- Set this to true if your account has no perm
shared.displayon = false -- Display name converter. It has downsides when it's active
shared.autoswitch = true -- This will automatically switch with !s if you can't get real admin in a server, use this if your acc only has Person299 and not perm
local allowkeybinds = false
local displaynameswitch_keybind = "v"
local person299switch_keybind = "b" -- Remove this one if you have both perm and person299 on ur acc instead of just person299

if p299running then
    return
end
getgenv().p299running = true -- Don't touch

mousee.KeyDown:connect(function(key)
    if key:lower() == displaynameswitch_keybind then
    if not allowkeybinds then return end
        if not shared.mod then return end
            if togg then return end
                wait()
                game.Players:Chat("# #")
                if shared.displayon == true then
                    wait()
                    shared.displayon = false
                    print("Display name support is now false")
                    togg = true
                    wait(1)
                    togg = false
                else
                    shared.displayon = true
                    print("Display name support is now true")
                    togg = true
                    wait(1)
                    togg = false
                end
    elseif key:lower() == person299switch_keybind then
        if not allowkeybinds then return end
        if not shared.mod then return end
            if togg then return end
                if shared.p2p == true then
                    wait()
                    shared.p2p = false
                    print("Perm to person is now false")
                    togg = true
                    wait(1)
                    togg = false
                else
                    shared.p2p = true
                    print("Perm to person is now true")
                    togg = true
                    wait(1)
                    togg = false
                    -- It has a cooldown system because of p2p overlapping commands
                end
            end
end)

--// Perm to Persons \\--

lplayer.Chatted:Connect(function(message)
    if shared.p2p == true then
        if msgg then return end
        msgg = true
        game.Players:Chat(string.gsub(message, " ", "/"));wait(.35) -- Spam cooldown.
        msgg = false
    end
end)

--// Gamepass checker \\--

local passid = 35748 or 37127

if shared.gpcheck == true then
    if string.match(game:HttpGet("https://inventory.roblox.com/v1/users/" .. userId .. "/items/GamePass/" .. passid), passid) then
        print("Person299 found. Booting BetterPerson299")
    else
        print("Person299 pass not found\n Therefore BetterPerson299 didn't load.")
        return
    end
end

--// Display Name Converter \\--

if displayrunning then
    return
end
getgenv().displayrunning = true -- Don't touch

local wordvar = nil

table.insert(connections, lplayer.Chatted:Connect(function(message)
    local words = message:split(" ")
    local firstarg = words[2]
    pcall(function()
        local wordLength = firstarg:len()
        wordvar = wordLength
        local returnmsg = ""
        for i, word in pairs(words) do
            local search = word:sub(1, 2):lower()
            local returnplr = nil
            for _, v in pairs(game.Players:GetPlayers()) do
                if v.DisplayName:lower():sub(1, 2) == search then
                    returnplr = v
                    break
                end
            end
            if returnplr then
                wait()
                returnmsg = returnmsg .. returnplr.Name:sub(1, wordvar) .. " "
            else
                wait()
                returnmsg = returnmsg .. word .. " "
            end
        end
        if msgg then return end
        msgg = true
        if shared.displayon then
            game.Players:Chat(returnmsg)
            wait(0.35)
        end
        msgg = false
    end)
end))

--// Anti rejoin crash for crashifbrokenparts --\\
queueteleport("getgenv().cibp = true")

--// BetterPerson299 \\--

connections[#connections + 1] = game:GetService("RunService").RenderStepped:Connect(function()
    task.spawn(function()
        if antivg == true then
            for i, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= lplayer.Name and not table.find(gearwhitelisted, player.Name) then
                if player.Character then
			for i, gear in ipairs(BlacklistedGear) do
  			   if player.Backpack:FindFirstChild(gear) or player.Character:FindFirstChild(gear) then
                        local plrname = player.Name
                        game.Players:Chat("ungear/"..plrname.."                                                                                                                                                                                                                                others fuck "..math.random(1,1000));wait(.35)
                     end
		     end
                end
                end
            end
        end
    end)
end) -- My indenting is terrible here because I made many mistakes and I'm too lazy to fix the indenting

function createKohlsUi(textTable)
	local kohlsUI = Instance.new("ScreenGui")
	local TextButton = Instance.new("TextButton")
	local Frame = Instance.new("Frame")
	local closeUi = Instance.new("TextButton")
	local Frame_2 = Instance.new("Frame")
	local a = Instance.new("TextLabel")
	local UIGridLayout = Instance.new("UIGridLayout")
	local clearUi = Instance.new("TextButton")

	--Properties:

	kohlsUI.Name = "kohlsUI"
	kohlsUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	kohlsUI.ResetOnSpawn = false

	TextButton.Parent = kohlsUI
	TextButton.BackgroundTransparency = 1.000
	TextButton.Draggable = true
	TextButton.Position = UDim2.new(0.5, -548, 0.5, -94)
	TextButton.Size = UDim2.new(0, 385, 0, 20)
	TextButton.AutoButtonColor = false
	TextButton.Text = ""

	Frame.Parent = TextButton
	Frame.ClipsDescendants = true
	Frame.Size = UDim2.new(0, 400, 0, 400)
	Frame.ZIndex = 7
	Frame.Style = Enum.FrameStyle.RobloxRound

	closeUi.Name = "closeUi"
	closeUi.Parent = Frame
	closeUi.Position = UDim2.new(1, -15, 0, -5)
	closeUi.Size = UDim2.new(0, 20, 0, 20)
	closeUi.ZIndex = 10
	closeUi.Style = Enum.ButtonStyle.RobloxButtonDefault
	closeUi.Font = Enum.Font.ArialBold
	closeUi.Text = "X"
	closeUi.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeUi.TextSize = 18.000

	Frame_2.Parent = Frame
	Frame_2.Position = UDim2.new(0, 0, 0, -9)
	Frame_2.ZIndex = 8

	a.Name = "a"
	a.Parent = Frame_2
	a.BackgroundTransparency = 1.000
	a.Position = UDim2.new(NAN, 0, NAN, 0)
	a.Size = UDim2.new(200, 18, 200, 18)
	a.ZIndex = 8
	a.Font = Enum.Font.Arial
	a.Text = ""
	a.TextColor3 = Color3.fromRGB(255, 255, 255)
	a.TextSize = 18.000
	a.TextStrokeTransparency = 0.800
	a.TextXAlignment = Enum.TextXAlignment.Left
	a.TextYAlignment = Enum.TextYAlignment.Top

	UIGridLayout.Parent = Frame_2
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(0, 100, 0, 18)

	clearUi.Name = "clearUi"
	clearUi.Parent = Frame
	clearUi.Position = UDim2.new(0.944999993, -15, 0, -5)
	clearUi.Size = UDim2.new(0, 20, 0, 20)
	clearUi.ZIndex = 10
	clearUi.Style = Enum.ButtonStyle.RobloxButtonDefault
	clearUi.Font = Enum.Font.ArialBold
	clearUi.Text = "C"
	clearUi.TextColor3 = Color3.fromRGB(255, 255, 255)
	clearUi.TextSize = 18.000

	-- Scripts:

	local function NNQOKB_fake_script() -- Frame_2.LocalScript 
		local script = Instance.new('LocalScript', Frame_2)

		function addLabel(txt)
			local newLb = script.Parent.a:Clone()
			newLb.Name = "TextLabel"
			newLb.Text = txt
			newLb.Parent = script.Parent
		end
		
		function addLabelWCheck(txt)
			local cnt = 0
			for i,v in pairs(script.Parent:GetChildren()) do
				if v.Name == "TextLabel" then
					cnt = cnt + 1
				end
			end
			if cnt >= 16 then
				clearLabels()
			end
			addLabel(txt)
		end
		
		function clearLabels()
			for i,v in pairs(script.Parent:GetChildren()) do
				if v.Name == "TextLabel" then
					v:Destroy()
				end
			end
		end
		
		script.Parent.Parent.closeUi.MouseButton1Click:Connect(function()
			script.Parent.Parent.Parent.Parent:Destroy()
		end)
		
		script.Parent.Parent.clearUi.MouseButton1Click:Connect(clearLabels)
		
		for _, text in ipairs(textTable) do
			addLabelWCheck(text)
		end
	end
	coroutine.wrap(NNQOKB_fake_script)()
end

function logn(message)
    game.StarterGui:SetCore("SendNotification",
        {
            Title = "BetterPerson299",
            Text = message,
            Duration = 5.5
        })
end

function fullplr(plr) -- Get someones entire playername
    for i, v in pairs(game.Players:GetPlayers()) do
        if string.sub(v.Name:lower(), 1, #plr) == plr then
            playr = v.Name
            end
        end
    end

local function GetPad(msg)
    while PadCheck == true do
        task.wait(0)
        if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
            if shared.autoswitch == true then
                shared.p2p = true
            end
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
                if shared.autoswitch == true then
                    shared.p2p = false
                end
            else
                fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
                if shared.autoswitch == true then
                    shared.p2p = false
                end
            end
        end
    end
end

lplayer.Chatted:Connect(function(msg)
    if string.sub(msg:lower(), 0, 5) == "logs/" then -- Renamed from logs to logs/ because it kept interfering
        if not shared.mod then return end
            if loga then return end
            loadstring(game:HttpGet(('https://pastebin.com/raw/EthjHsJ7'),true))()
            loadstring(game:HttpGet(('https://pastebin.com/raw/stggPUBM'),true))()
            loga = true
            pcall(function()
                execCmd("logs") -- if IY is loaded through this script (add IY loadstring at the very top)
            end)
            -- https://v3rmillion.net/showthread.php?tid=709709
		-- \104\116\116\112\115\58\47\47\109\101\103\97\46\110\122\47\102\105\108\101\47\87\79\52\48\120\97\67\75\35\98\69\75\84\100\45\113\119\81\89\99\100\95\105\84\54\109\107\75\74\51\99\117\51\85\49\87\79\117\68\100\105\48\78\98\116\66\99\87\107\87\76\119 also type "savetofile" to save the chatlogs to a file. Bypasses the full chat GUI limit
    elseif string.sub(msg:lower(), 0, 0) == "foryou" then 
        local player = string.sub(msg:lower(), 1)
        if not shared.mod then return end
            -- Hey there. So if you're gonna edit this and add your own commands then copy this area pretty much.
    elseif string.sub(msg:lower(), 0, 8) == "reset/me" or string.sub(msg:lower(), 0, 9) == "reload/me" or string.sub(msg:lower(), 0, 10) == "refresh/me" then 
        if not shared.mod then return end
            local spos = lplayer.Character.HumanoidRootPart.CFrame -- Creds. Vecko
            task.wait(.05)
            game.Players:Chat("respawn/"..uniquemodstring.."/me")
            game.Players:Chat("invis/"..uniquemodstring.."/me")
            for i = 1, 12 do
                wait()
                lplayer.Character.HumanoidRootPart.CFrame = spos
            end
            game.Players:Chat("vis/"..uniquemodstring.."/me")
            wait(.75) -- High ping affects this command, making it nil too fast will simply not make it teleport :/
            local spos = nil
    elseif string.sub(msg:lower(), 0, 9) == "reset/all" or string.sub(msg:lower(), 0, 10) == "reload/all" or string.sub(msg:lower(), 0, 11) == "refresh/all" then 
        -- This will obviously only teleport you back. But people do this cus it's faster to type than respawn
        if not shared.mod then return end
            local spos = lplayer.Character.HumanoidRootPart.CFrame -- Creds. Vecko
            task.wait(.05)
            game.Players:Chat("respawn/"..uniquemodstring.."/all")
            game.Players:Chat("invis/"..uniquemodstring.."/me")
            for i = 1, 2 do
                wait()
                lplayer.Character.HumanoidRootPart.CFrame = spos
            end
            wait(1)
            local spos = nil
    elseif string.sub(msg:lower(), 0, 12) == "reset/others" or string.sub(msg:lower(), 0, 13) == "reload/others" or string.sub(msg:lower(), 0, 14) == "refresh/others" then
        -- Faster to type than respawn
        if not shared.mod then return end
            game.Players:Chat("respawn/"..uniquemodstring.."/others")
    elseif string.sub(msg:lower(), 0, 8) == "skydive/" then 
        local player = string.sub(msg:lower(), 9)
        if not shared.mod then return end
            lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(
            lplayer.Character.HumanoidRootPart.CFrame.X,
            lplayer.Character.HumanoidRootPart.CFrame.Y + 2500,
            lplayer.Character.HumanoidRootPart.CFrame.Z))
            wait(.35)
            game.Players:Chat("tp/"..player.."/me")
    elseif string.sub(msg:lower(), 0, 5) == "rlag/" then -- Discovered by Antedx. Buy SCV3-NM and use "rkick plr" for a way better version
        if not shared.mod then return end
        shared.spam2 = false
        shared.spam = false
        shared.spam1 = false
        local player = string.sub(msg:lower(), 6)
        logn("Enter shiftlock and make your rocket touch the target(s)")
        game.Players:Chat("invis/"..uniquemodstring.." me");wait(.35)
        game.Players:Chat("speed/"..player.." 0")
        for i = 1, 5 do
            for i = 1, 350 do
                game.Players:Chat("rocket/all all all")
            end
            wait(1.35)
        end
    elseif string.sub(msg:lower(), 0, 7) == "unsize/" then 
        local player = string.sub(msg:lower(), 8)
        if not shared.mod then return end
            game.Players:Chat("undog/"..player)
    elseif string.sub(msg:lower(), 0, 3) == "clr" then 
        if not shared.mod then return end
            game.Players:Chat("removejails")
            game.Players:Chat("removeclones")
            game.Players:Chat("clear")
            for i, v in pairs(game:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Stop()
                end
            end            
    elseif string.sub(msg:lower(), 0, 9) == "stopmusic" then 
        if not shared.mod then return end
            for i, v in pairs(game:GetDescendants()) do
                if v:IsA("Sound") then
                    v:Stop()
                end
            end            
    elseif string.sub(msg:lower(), 0, 6) == "system" then 
        if not shared.mod then return end
            logn("This stays, even after you close the script")
            local invisGUIS = {} --- From IY, ty LegHat for actually making it readable ffs
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
    elseif string.sub(msg:lower(), 0, 6) == "house/" then 
        local player = string.sub(msg:lower(), 7)
        if not shared.mod then return end
            game.Players:Chat("invis/"..uniquemodstring.."/me");task.wait(.35)
            lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-28.6829948, 8.2299995, 66.4913253));task.wait(.65)
            wait(.35)
            game.Players:Chat("tp/"..player.."/me")
            game.Players:Chat("vis/"..uniquemodstring.."/me")
    elseif string.sub(msg, 0, 12) == "!crashonjoin" then
        if not shared.mod then return end
		writefile('bp299startups.txt', 'emr\nhop')
    elseif string.sub(msg, 0, 19) == "!crashifbrokenparts" then
        if not shared.mod then return end
		writefile('bp299startups.txt', '!unlisted1\n') -- This command will shield you from servers with no baseplate and abuse on join. It will immediately try to shield crash the server if someone did abuse in those few seconds 
    elseif string.sub(msg, 0, 9) == "!findpads" then
        if not shared.mod then return end
	    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y + 6500, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z))
    elseif string.sub(msg, 0, 12) == "!lookforp299" then
        if not shared.mod then return end
        wait(10) -- Delay just for start-up commands/autoexec so newmode's perm playerlist loads up faster (https://pastebin.com/raw/1XZ8wHaY)
        loadstring(game:HttpGet("https://pastebin.com/raw/4dn91uQa"))()
    elseif string.sub(msg, 0, 2) == "m " then 
        local mesg = string.sub(msg, 3)
        if not shared.mod then return end
            wait(.49)
            game.Players:Chat("clear the regular M moment");wait()
            game.Players:Chat("fogcolor 0 0 0")
            game.Players:Chat("outdoorambient/0/0/0")
            game.Players:Chat("fogend/150")
            for i = 1, 3 do
                game.Players:Chat("h/ You know this command is called ''m'' and they say it stands for message but actually it stands for MOTHER BECAUSE CLEARLY YOU HAVE NO MOTHER or massage cus girls aka your mother\n\n\n\n\n\n\n\n\n\n\n\n\n \n\n\n\n\n\n\n\n\n\n\n\n\n Message from "..lplayer.Name.." \n\n\n\n\n\n\n\n\n\n\n"..mesg);wait(1.8)
            end
            wait(1.35)
            game.Players:Chat("fix")
    elseif string.sub(msg, 0, 14) == "!addunfiltered" then 
        local mesg = string.sub(msg, 16)
        if not shared.mod then return end
            writefile('letters.txt', mesg) 
    elseif string.sub(msg, 0, 15) == "!showunfiltered" then 
        if not shared.mod then return end
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/h%20chat%20bypasser'),true))() -- This script wasn't meant to be for BP299 at first.
    elseif string.sub(msg, 0, 13) == "!csunfiltered" then 
        if not shared.mod then return end
            pcall(function()
                local file = readfile("letters.txt")
                for command in file:gmatch("[^\r\n]+") do
                    local h = Instance.new("Hint")
                    h.Parent = Workspace
                    h.Text = command
                    wait(5)
                    h:Remove()
                end
            end)
    elseif string.sub(msg, 0, 8) == "!biglogs" then 
        if not shared.mod then return end
            game.Players:Chat("logs are spammed...");task.wait(.49)
            pcall(function()
                game.Players.LocalPlayer.PlayerGui.ScrollGui.TextButton.Frame.Size =  UDim2.new(3, t, 1000, j)
            end)
    elseif string.sub(msg, 0, 14) == "!shieldkickhop" then 
        if not shared.mod then return end
            logn("Check clipboard")
            setclipboard("https://raw.githubusercontent.com/Tech-187/Obfuscated-art/main/Shieldkickhop")
    elseif string.sub(msg, 0, 3) == "emr" then -- Emergency mode. Lag everyone without Perm/admin as long as you have persons
        if not shared.mod then return end
            --logn("Press C (keybind) and zoom out cus it will lag")
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/NoAdmin%20Lagger%20v2.3P'),true))()
            game.Players:Chat("!admin");wait(.35)
            game.Players:Chat("blind/others");wait(.65)
            for i = 1, 99 do
                    game.Players:Chat("shield/others/others/others/"..math.random(1,1000))
                end;wait()
            for i = 1, 99 do
                    game.Players:Chat("shield/others/others/others/"..math.random(1,1000))
                end;wait()
            for i = 1, 99 do
                    game.Players:Chat("shield/others/others/others/"..math.random(1,1000))
                end;wait()
            for i = 1, 99 do
                    game.Players:Chat("rocket/others/others/others/"..math.random(1,1000))
                end;wait(.1)
            for i = 1, 99 do
                    game.Players:Chat("rocket/others/others/others/"..math.random(1,1000))
                end;wait()
            for i = 1, 99 do
                    game.Players:Chat("rocket/others/others/others/"..math.random(1,1000))
                end;wait()
            for i = 1, 99 do
                    game.Players:Chat("shield/others/others/others/"..math.random(1,1000))
                end;wait(.1)
            for i = 1, 99 do
                    game.Players:Chat("sparkles/others/others/others/"..math.random(1,1000))
                end;wait(.1)
            for i = 1, 99 do
                game.Players:Chat("freeze/others/others/others/"..math.random(1,1000))
            end
            wait(.15)
            for i = 1, 99 do
                game.Players:Chat("freeze/others/others/others/"..math.random(1,1000))
            end
            wait(.35)
            for i = 1, 10 do
                game.Players:Chat("clone others others others "..math.random(1,1000))
            end
            wait(1)
            game.Players:Chat("ff/others/others/others/"..math.random(1,1000))
            game.Players:Chat("trip/others/"..math.random(1,1000))
            game.Players:Chat("explode/others/"..math.random(1,1000));wait(3.5)
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/Tech-187/Obfuscated-art/main/Basic%20antisilcrash.lua'),true))();wait(2.5)
            game.Players:Chat("!s")
            game.Players:Chat("!tempcrash fuck")
    elseif string.sub(msg:lower(), 0, 10) == "!tempcrash" then
        if not shared.mod then return end
            local playercount = game.Players:GetPlayers()
            if #playercount > 3 then
                --[[task.spawn(function()
                    wait(.1)
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
                        wait(2.51)
                    end
                end)]]
                for i = 1, 7 do
                    for i = 1, 350 do
                        game.Players:Chat("respawn/                                                                                                                   all all all "..math.random(1,1000))
                    end
                    wait(1)
                end
                for i = 1, 350 do
                    game.Players:Chat("shield/                                                                                                                   all all all "..math.random(1,1000))
                end
                wait(1)
                shared.spam2 = true
                while shared.spam2 do task.wait(nil)
                    game.Players:Chat("shield/                                                                                                                      all all all")
                end
            else
                game.Players:Chat("h/ Could not initiate, not enough players.")
            end
        elseif string.sub(msg:lower(), 0, 7) == "!rcrash" then -- Found by quiving
            if not shared.mod then return end
            game.Players:Chat(":punish me");wait(.51)
                    for i = 1,100 do
                    task.wait()
                    game.Players:Chat("rocket/                                                                                                                                       me me me fuck")
                end

                task.wait(.5)

                for i = 1,500 do
                    task.wait()
                    game.Players:Chat("unpunish/                                                                                                                                     me me me fuck")
                end
    elseif string.sub(msg:lower(), 0, 10) == "!unlisted1" then
        if shared.mod == true then
            if cibp then return end
            wait(.65)
            print("Join shield active")
            pcall(function()
                if not game:GetService("Workspace").Terrain["_Game"].Admin:FindFirstChild("Regen") or game:GetService("Workspace").Terrain["_Game"].WorkspaceFindFirstChild("Baseplate") then
                    print("Part missing")
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck")
                end
            end)
            pcall(function()
                if not game:GetService("Workspace").Terrain._Game.Workspace["Basic House"]:FindFirstChild("SmoothBlockModel112") then
                    print("Part missing")
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck")
                end
            end)
            pcall(function()
                if game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate.CFrame.Y > 1.5 or game:GetService("Workspace").Terrain._Game.Workspace["Basic House"].SmoothBlockModel112.CFrame.Y > 15 then
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck") -- The f word would make it all tag out so other peoples chatted scripts cannot detect it
                end
            end)
            pcall(function()
                if game:GetService("Workspace").Terrain["_Game"].Workspace.Baseplate.CFrame.Y < 0 then
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck");wait(20)
                    game.Players:Chat("!rcrash fuck") -- The f word would make it all tag out so other peoples chatted scripts cannot detect it
                end
            end)
            local countdown = 7
            while countdown > 0 do
                local c = game.Players.LocalPlayer.Character
                local h = c:FindFirstChild("Humanoid")
                if h and h.Health > 0 then
                countdown = countdown - 1
                wait(1)
                else
                    print("Dead")
                    game.Players:Chat("emr fuck");wait(.35)
                    game.Players:Chat("h/ Abusing when I join is a rookie mistake, bucko")
                break
                end
            end
            if countdown == 0 then 
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Qltxi/scripts/main/Color%20API%202.0"))()
                print("Safe joining countdown expired")
            end
        end
    elseif string.sub(msg:lower(), 0, 9) == "sabotage/" then -- Attempt to kinda kick someone
        local player = string.sub(msg:lower(), 10)
        if shared.mod == true then
            game.Players:Chat("nodetector fuck")
            game.Players:Chat("punish/"..player)
            game.Players:Chat("blind/"..player)
            game.Players:Chat("invis/all")
            task.spawn(function()
                shared.spam1 = true
                wait(10)
                shared.spam2 = true
                wait(5)
                game.Players:Chat("vis/ all all all")
            end)
            pcall(function()
                fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
            end)
            for i = 1, 350 do
                game.Players:Chat("pm/"..player.." \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n😆😊😅😀🙃😝😇😇😇🙃😇🙂🤣🤣😆😆😇😃😜😀😝🤪😀😝😄😉😅🤪\n🤪😀😆🤪😆😇😅😉🤣🤪🤣🙂😅😅😁😄😉😀😊🤪😇😄😇😀😝😀😊\n😇😝🤪😜😊😆🙂🤪🤣😜😅😀🙂😀😃🤪😜😁😝😆😊😅😀😆😊😅😀🙃😝😇😇😇🙃😇🙂🤣🤣😆😆😇😃😜😀😝🤪😀😝😄😉😅🤪\n🤪😀😆🤪😆😇😅😉🤣🤪🤣🙂😅😅😁😄😉😀😊🤪😇😄😇😀😝😀😊\n😇😝🤪😜😊😆🙂🤪🤣😜😅😀🙂😀😃🤪😜😁😝😆😊😅😀😆😊😅😀🙃😝😇😇😇🙃😇🙂🤣🤣😆😆😇😃😜😀😝🤪😀😝😄😉😅🤪\n🤪😀😆🤪😆😇😅😉🤣🤪🤣🙂😅😅😁😄😉😀😊🤪😇😄😇😀😝😀😊\n😇😝🤪😜😊😆🙂🤪🤣😜😅😀🙂😀😃🤪😜😁🤪😜😁🤪🤪\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
            end
            wait(.75)
            task.spawn(function()
                while shared.spam1 do task.wait(nil)
                    for i = 1, 9 do
                        game.Players:Chat("pm/"..player.." \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n😆😊😅😀🙃😝😇😇😇🙃😇🙂🤣🤣😆😆😇😃😜😀😝🤪😀😝😄😉😅🤪\n🤪😀😆🤪😆😇😅😉🤣🤪🤣🙂😅😅😁😄😉😀😊🤪😇😄😇😀😝😀😊\n😇😝🤪😜😊😆🙂🤪🤣😜😅😀🙂😀😃🤪😜😁😝😆😊😅😀😆😊😅😀🙃😝😇😇😇🙃😇🙂🤣🤣😆😆😇😃😜😀😝🤪😀😝😄😉😅🤪\n🤪😀😆🤪😆😇😅😉🤣🤪🤣🙂😅😅😁😄😉😀😊🤪😇😄😇😀😝😀😊\n😇😝🤪😜😊😆🙂🤪🤣😜😅😀🙂😀😃🤪😜😁😝😆😊😅😀😆😊😅😀🙃😝😇😇😇🙃😇🙂🤣🤣😆😆😇😃😜😀😝🤪😀😝😄😉😅🤪\n🤪😀😆🤪😆😇😅😉🤣🤪🤣🙂😅😅😁😄😉😀😊🤪😇😄😇😀😝😀😊\n😇😝🤪😜😊😆🙂🤪🤣😜😅😀🙂😀😃🤪😜😁🤪😜😁🤪🤪\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
                    end
                end
            end)
        end
    elseif string.sub(msg:lower(), 0, 8) == "control/" then
        local player = string.sub(msg:lower(), 9)
        if shared.mod == true then
            game.Players:Chat("speed "..player.." 0");wait(.65)
            game.Players:Chat("dog me," .. player)
            game.Players:Chat("tp me " .. player);wait(1)
            game.Players:Chat("undog me," .. player);wait(.1)
            game.Players:Chat("unpunish me," .. player);wait(.1)
            game.Players:Chat("unpunish me," .. player);wait(.1)
            game.Players:Chat("invis me")
            game.Players:Chat("speed me 32");wait(1.5)
            fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
        end
    elseif string.sub(msg:lower(), 0, 6) == "!admin" then
        if shared.mod == true then
            PadCheck = true
            GetPad(msg)-- From SCV1
        end
    elseif string.sub(msg:lower(), 0, 9) == "!closemod" then
            PadCheck = false
            shared.mod = false
            shared.p2p = false
            for _, connection in ipairs(connections) do
                connection:Disconnect()
            end
    elseif string.sub(msg:lower(), 0, 2) == "!s" then -- Switch admin basically for non-perm accounts with just Person299
        if shared.mod == true then
		    if string.sub(msg:lower(), 0, 4) == "!ser" then
			    game.Players:Chat("!hop fuck")
		    else
            if togg then return end
                if shared.p2p == true then
                    wait()
                    shared.p2p = false
                    print("Perm to person is now false")
                    togg = true
                    wait(1)
                    togg = false
                else
                    shared.p2p = true
                    print("Perm to person is now true")
                    togg = true
                    wait(1)
                    togg = false
                    -- It has a cooldown system because of p2p overlapping commands
                end
            end
	  end
    elseif string.sub(msg:lower(), 0, 4) == "!dis" then -- Switch admin basically for non-perm accounts with just Person299
        if shared.mod == true then
            if togg then return end
                wait()
                game.Players:Chat("# #")
                if shared.displayon == true then
                    wait()
                    shared.displayon = false
                    print("Display name support is now false")
                    togg = true
                    wait(1)
                    togg = false
                else
                    shared.displayon = true
                    print("Display name support is now true")
                    togg = true
                    wait(1)
                    togg = false
                end
	    end
    elseif string.sub(msg:lower(), 0, 4) == "!666" then
        if shared.mod == true then
            game.Players:Chat("m Looks like the devil has taken over");wait(.49)
            game.Players:Chat("!admin");wait(.49)
            for i = 1, 99 do
                game.Players:Chat("size all .3")
                game.Players:Chat("size all .3")
                game.Players:Chat("size all .3")
                game.Players:Chat("freeze all")
                game.Players:Chat("size all 10")
                game.Players:Chat("size all 10")
                game.Players:Chat("size all 10")
                game.Players:Chat("clone all")
                wait()
            end
            game.Players:Chat("emr");wait(1)
            game.Players:Chat("!closemod. Hey, where did the script go?")
        end
    elseif string.sub(msg:lower(), 0, 9) == "!drawmode" then
        if shared.mod == true then
            local UserInputService = game:GetService("UserInputService")
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if input.KeyCode == Enum.KeyCode.R then
                    while true do
                        game.Players:Chat("part/1/.1/1")
                        local part = workspace.Terrain._Game.Folder:WaitForChild("Part")
                        task.wait(0.024)
                        if part.Size == Vector3.new(1, .1, 1) then
                            game:GetService("TweenService"):Create(part, TweenInfo.new(.1), {CFrame = CFrame.new(game.Players.LocalPlayer:GetMouse().Hit.Position + Vector3.new(0, 1, 0))}):Play()
                        end
                        part.Name = "doneplacing"
                        if not UserInputService:IsKeyDown(Enum.KeyCode.R) then
                            break
                        end
                    end
                end
            end)
        end
    elseif string.sub(msg:lower(), 0, 10) == "!findregen" then
        if shared.mod == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1000000, 1000000, 1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-200000, 50000, 3500000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-7, 534009, 95));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1000000, 1000003, -1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1101734, 33651680, -33531784));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1000000, -1000003, -1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1000000, -1000000, -3));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(3, -1000000, 1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1000000, -3, -1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-1000000, -3, 1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1000000, 3, 1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-7, 200009, 95));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1000000, 1000003, 1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1000000, -1000003, 1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(454545, 150000, -678678));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(306712, 420552, 398158));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-1000000, 1000003, 1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-1000000, 1000003, -1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-1000000, -1000003, -1000000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-397746, 503, -168829));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-674082.8125,-698538.6875,-286853.125));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(45400, -49860, 56673));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-559702.25,-724234.1875,-563028.25));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-504678,-470264.90625,-387767.9375));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-397745.9375,499.0865173339844,-168829.078125));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(56470, -48312, 28578));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-9, 60008, 89));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-123317.0625, 119352.671875, 911237));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(75304, -49638, 47300));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(34120, -48830, 30233));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(279584.8125,-47841.0234375,410623.0625));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-225255.265625,-146865.9375,51726.44140625));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(77822, -49751, 79116));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(42682, -29202, 29886));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(54933, -500353, 85934));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(51052, -49558, 34068));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-23529.498046875,-21270.994140625,-17196.0078125));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(57099.02734375,-40034.640625,708909.75));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(562191.25,-39999.55078125,110908.984375));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(777584.875,52895.4140625,3576.002685546875));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(777584.875,52895.4140625,3576.002685546875));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(824511,1000000,24944.01953125));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(782629, 385179, 234698));wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-251773, 1000003, 382563));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(653864.8125,247022.828125,149027.078125));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-500000, 300000, 500000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-300000, 300000, 300000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(300000, 300000, 300000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(300000, 300000, -300000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-300000, 300000, -300000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-500000, 300000, 500000));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-7, 12009, 95));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(734399, 560502, 2776));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-360263, 421796, 716100));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(999982, 3143, 999997));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(696973, 999997, -1000001));wait(.15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(100000, 10000, 100000));wait(2.5)
            game.Players:Chat("respawn me")
            game.Players:Chat("respawn/me")
            shared.p2p = true
		wait(2.5)
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/FindVerticalRegen"), true))()
    end
    elseif string.sub(msg:lower(), 0, 4) == "!rej" or string.sub(msg:lower(), 0, 3) == "!rj" then
        if not shared.mod then return end
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer);wait()
    elseif string.sub(msg:lower(), 0, 4) == "!hop" or string.sub(msg:lower(), 0, 4) == "!ser" then -- Some people type !serverhop lol
        if shared.mod == true then
            local x = {}
                for _, v in ipairs(game:GetService("HttpService"):JSONDecode(
                        game:HttpGetAsync("https://games.roblox.com/v1/games/"..game.PlaceId .."/servers/Public?sortOrder=Asc&limit=100")).data) do
                    if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
                        x[#x + 1] = v.id
                        amount = v.playing
                    end
                end
                if #x > 0 then
                    task.wait(.25)
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
                else
                    game.Players:Chat("!hop")
                end
            end
    elseif string.sub(msg:lower(), 0, 4) == "cmds" then 
        if shared.mod == true then
            game.Players:Chat("!admin");wait(1)
            game.Players:Chat("Commands moment") -- So basically when you have just Persons and not perm, it does not load the full commands list. So if you just have persons it will do this
            createKohlsUi(
                {
                    "Thank you for using BetterPerson299\nCreated by Tech",
                    "Commands with a K tag use Kohls commands",
                    "",
                    "logs/",
                    "reset/me or all",
                    "skydive/bp299",
                    "house/bp299",
                    "m message (bp299)",
                    "emr (crasher)(K)",
                    "sabotage/bp299 (lags and blinds them)",
                    "control/bp299 (Removed p299 cmd)",
                    "system (silent commands)",
                    "stopmusic",
                    "rlag/bp299",
                    "!cmds (other commands)"
                }
            )
            PadCheck = false
        end
    elseif string.sub(msg:lower(), 0, 5) == "!cmds" then 
        if shared.mod == true then
            createKohlsUi(
                {
                    "!rejoin",
                    "!hop",
                    "!admin",
                    "!findregen",
                    "!findpads",
                    "!666 (crasher)(K)",
                    "!closemod",
                    "!crashonjoin",
                    "!lookforp299",
                    "!crashifbrokenparts (K)",
                    "!s" -- switch
                }
            )

            wait(5)

            createKohlsUi(
                {
                    "!addunfiltered (text)",
                    "!showunfiltered",
                    "!csunfiltered (client sided)",
                    "!biglogs",
                    "!shieldkickhop",
                    "!tempcrash (will ratelimit)",
                    "!drawmode",
                    "!rcrash (Crash using just P299 commands)",
                    "!dis (Display name support)" -- switch
                }
            )
        end
    end
end)

wait(.51) if shared.padgrab then game.Players:Chat("!admin fuck");PadCheck = true end
-- You can create a start-up commands by editing bp299startups.txt in your workspace folder
task.spawn(function()
    pcall(function()
        local file = readfile("bp299startups.txt")
        for command in file:gmatch("[^\r\n]+") do 
            game.Players:Chat(command)
            print(command)
        end
    end)
end)
-- Official BP299 Version 1.8.7
