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


    Type "cmds" (no prefix) after running this script. It's recommended to put this in autoexec. This script is also compatible with other scripts
]]

local uniquemodstring = "betterperson299cmd" -- change this to whatever idc
local antilog = "00000000000000000000000000000000"
local lplayer = game.Players.LocalPlayer
local userId = game.Players.LocalPlayer.UserId
local antivg = true
local connections = {} -- If you're gonna alter the script then please add any connections that you add to a table so it can be closed with the !closemod command

-- CONFIGURE ANYTHING BELOW

shared.mod = true -- Turn this off and re-run the script to disable the mod
shared.gpcheck = true -- Only boot if you have the gamepass (recommended for autoexec). Cannot be altered after the script ran obviously
shared.p2p = false -- This will enable perm to persons. Re-run the script and turn this off to disable the mod
shared.padgrab = false -- Set this to true if your account has no perm

if p299running then
    return
end
getgenv().p299running = true -- Don't touch

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

--// BetterPerson299 \\--

local connections = {}

connections[#connections + 1] = game:GetService("RunService").RenderStepped:Connect(function()
    task.spawn(function()
        if antivg == true then
            for i, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= lplayer.Name then
                if player.Character then
                    if player.Backpack:FindFirstChild("VampireVanquisher") or player.Character:FindFirstChild("VampireVanquisher") then
                        local plrname = player.Name
                        game.Players:Chat("ungear/"..plrname.."                                                                     others "..math.random(1,1000));wait(.35)
                    end
                end
                end
            end
        end
    end)
end)

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

lplayer.Chatted:Connect(function(msg)
    if string.sub(msg:lower(), 0, 5) == "logs/" then -- Renamed from logs to logs/ because it kept interfering
        if shared.mod == true then
            if loga then return end
            loadstring(game:HttpGet(('https://pastebin.com/raw/EthjHsJ7'),true))()
            loadstring(game:HttpGet(('https://pastebin.com/raw/stggPUBM'),true))()
            loga = true
            -- https://v3rmillion.net/showthread.php?tid=709709
		-- \104\116\116\112\115\58\47\47\109\101\103\97\46\110\122\47\102\105\108\101\47\87\79\52\48\120\97\67\75\35\98\69\75\84\100\45\113\119\81\89\99\100\95\105\84\54\109\107\75\74\51\99\117\51\85\49\87\79\117\68\100\105\48\78\98\116\66\99\87\107\87\76\119 also type "savetofile" to save the chatlogs to a file. Bypasses the full chat GUI limit
        end
    elseif string.sub(msg:lower(), 0, 0) == "foryou" then 
        local player = string.sub(msg:lower(), 1)
        if shared.mod == true then
            -- Hey there. So if you're gonna edit this and add your own commands then copy this area pretty much.
        end
    elseif string.sub(msg:lower(), 0, 8) == "reset/me" or string.sub(msg:lower(), 0, 9) == "reload/me" or string.sub(msg:lower(), 0, 10) == "refresh/me" then 
        if shared.mod == true then
            local spos = lplayer.Character.HumanoidRootPart.CFrame -- Creds. Vecko
            task.wait(.05)
            game.Players:Chat("respawn/"..uniquemodstring.."/me")
            game.Players:Chat("invis/"..uniquemodstring.."/me")
            for i = 1, 2 do
                wait(.65)
                lplayer.Character.HumanoidRootPart.CFrame = spos
            end
            wait(1) -- High ping affects this command, making it nil too fast will simply not make it teleport :/
            local spos = nil
            game.Players:Chat("vis/"..uniquemodstring.."/me")
        end
    elseif string.sub(msg:lower(), 0, 9) == "reset/all" or string.sub(msg:lower(), 0, 10) == "reload/all" or string.sub(msg:lower(), 0, 11) == "refresh/all" then 
        -- This will obviously only teleport you back. But people do this cus it's faster to type than respawn
        if shared.mod == true then
            local spos = lplayer.Character.HumanoidRootPart.CFrame -- Creds. Vecko
            task.wait(.05)
            game.Players:Chat("respawn/"..uniquemodstring.."/all")
            game.Players:Chat("invis/"..uniquemodstring.."/me")
            for i = 1, 2 do
                wait(.65)
                lplayer.Character.HumanoidRootPart.CFrame = spos
            end
            wait(1)
            local spos = nil
        end
    elseif string.sub(msg:lower(), 0, 12) == "reset/others" or string.sub(msg:lower(), 0, 13) == "reload/others" or string.sub(msg:lower(), 0, 14) == "refresh/others" then
        -- Faster to type than respawn
        if shared.mod == true then
            game.Players:Chat("respawn/"..uniquemodstring.."/others")
        end
    elseif string.sub(msg:lower(), 0, 8) == "skydive/" then 
        local player = string.sub(msg:lower(), 9)
        if shared.mod == true then
            lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(
            lplayer.Character.HumanoidRootPart.CFrame.X,
            lplayer.Character.HumanoidRootPart.CFrame.Y + 2500,
            lplayer.Character.HumanoidRootPart.CFrame.Z))
            wait(.35)
            game.Players:Chat("tp/"..player.."/me")
        end
    elseif string.sub(msg:lower(), 0, 3) == "clr" then 
        if shared.mod == true then
            game.Players:Chat("clear")
        end
    elseif string.sub(msg:lower(), 0, 6) == "system" then 
        if shared.mod == true then
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
        end
    elseif string.sub(msg:lower(), 0, 6) == "house/" then 
        local player = string.sub(msg:lower(), 7)
        if shared.mod == true then
            game.Players:Chat("invis/"..uniquemodstring.."/me");task.wait(.35)
            lplayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-28.6829948, 8.2299995, 66.4913253));task.wait(.65)
            wait(.35)
            game.Players:Chat("tp/"..player.."/me")
        end
    elseif string.sub(msg, 0, 2) == "m " then 
        local mesg = string.sub(msg, 3)
        if shared.mod == true then
            wait(.35)
            game.Players:Chat("clear the regular M moment");wait()
            game.Players:Chat("fogcolor 0 0 0")
            game.Players:Chat("outdoorambient/0/0/0")
            game.Players:Chat("fogend/150")
            for i = 1, 3 do
                game.Players:Chat("h/\n\n\n\n\n\n\n\n\n\n\n\n\n \n\n\n\n\n\n\n\n\n\n\n\n\n Message from "..lplayer.Name.." \n\n\n\n\n\n\n\n\n\n\n"..mesg);wait(1.8)
            end
            wait(1.35)
            game.Players:Chat("fix")
        end
    elseif string.sub(msg, 0, 3) == "emr" then -- Emergency mode. Lag everyone without Perm/admin as long as you have persons
        if shared.mod == true then
            logn("Press C (keybind) and zoom out cus it will lag")
            if emr_ == true then return end
            emr_ = true
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/NoAdmin%20Lagger%20v2.3P'),true))()
            game.Players:Chat("!admin");wait(.35)
            game.Players:Chat("punish/others")
            game.Players:Chat("blind/others");wait(.65)
            for i = 1, 99 do
                game.Players:Chat("freeze/others/"..math.random(1,1000))
            end
            wait(1.5)
            for i = 1, 99 do
                game.Players:Chat("freeze/others/"..math.random(1,1000))
            end
            wait(1)
            for i = 1, 100 do
                game.Players:Chat("clone others "..math.random(1,1000))
            end
        end
    elseif string.sub(msg:lower(), 0, 9) == "sabotage/" then
        local player = string.sub(msg:lower(), 10)
        if shared.mod == true then
            game.Players:Chat("punish/all")
            game.Players:Chat("blind/others")
            game.Players:Chat("invis/all")
            pcall(function()
                fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
            end)
            while task.wait() do
                for i = 1, 9 do
                    game.Players:Chat("pm/"..player.." \n\n\n\n\n\n\n\n\n\n\n\n\n\n Hello there. So you're busy doing some bad activity, \n my name is ''Text'' and I'm here to help you. \n The sabotage needs to be fixed so give me a moment... \n I'm afraid you're gonna have to find your own way out. \n But I think you're a bit smart, you can do this \n\n\n People that don't misuse admin tend to be a lot smarter than most \n they can fix it themselves, how come you can't? \n Indeed. There's your answer, you're not smart. \n And yes. I lied about helping, I will be doing this for ever and there's nothing you can do to stop it. \n😆😊😅😀🙃😝😇😇😇🙃😇🙂🤣🤣😆😆😇😃😜😀😝🤪😀😝😄😉😅🤪\n🤪😀😆🤪😆😇😅😉🤣🤪🤣🙂😅😅😁😄😉😀😊🤪😇😄😇😀😝😀😊\n😇😝🤪😜😊😆🙂🤪🤣😜😅😀🙂😀😃🤪😜😁😝😆😊😅😀\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
                end
            end
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
            game.Players:Chat("!closemod. Hey, where did the script go?")
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
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/FindVerticalRegen"), true))()
    end
    elseif string.sub(msg:lower(), 0, 4) == "!rej" or string.sub(msg:lower(), 0, 3) == "!rj" then
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer);wait()
    elseif string.sub(msg:lower(), 0, 4) == "!hop" or string.sub(msg:lower(), 0, 4) == "!ser" then
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
                    "",
                    "logs/",
                    "reset/me or all",
                    "skydive/plr",
                    "house/plr",
                    "m message (no /)",
                    "emr (use if people abuse)",
                    "sabotage/plr (lags and blinds them)",
                    "control/plr (Removed cmd)",
                    "cmds (mod commands)",
                    "system (silent commands)",
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
                    "!666",
                    "!closemod",
                    "!s"
                }
            )
        end
    end
end)

wait(1) if shared.padgrab then PadCheck = true end

-- Official BP299 Version 1.2
