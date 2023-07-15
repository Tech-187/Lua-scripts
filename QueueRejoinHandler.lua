local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local tps = game:GetService("TeleportService")
local plr = game:GetService("Players").LocalPlayer
getgenv().on = false
getgenv().on2 = true
getgenv().searching = false

local prefix4 = "/"
local cons = {}
local lastplayer

local function chatt(massage)
    game.Players:Chat(massage)
end

local function forcerj()
    while finished do task.wait()
        tps:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
end

local function sfx(id)
	local ClientSound = Instance.new("Sound")
	ClientSound.SoundId = "http://www.roblox.com/asset/?id="..id
	ClientSound.Volume = 1.5
	ClientSound.Parent = workspace
	ClientSound.PlaybackSpeed = 1
	ClientSound:Play()
end

pcall(function()rconsolecreate()end) -- Not all execs have this
rconsoleprint("Use the following commands in the rconsole\n\nType /host to host a rejoin session\nType /search to search for a host\nType /finish to accept all the people trying to connect as the host\n and /off IN THE CHAT (not in the rconsole) to unload this script early (It unloads after rejoin anyway so it ain't necessary)\n\n")

cons[#cons + 1] = game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 0, 3 + #prefix4) == prefix4.."off" then
        print("Turned it off")
        getgenv().on = false
        getgenv().on2 = false
        searching = false
        connectedd = false
        pcall(function()rconsoleclear()end)
        for _, connection in ipairs(cons) do
            connection:Disconnect()
        end
    end
end)

queueteleport('print("Rejoin successful!\nFeel free to give feedback. Did the bypass work or did it not work?\nIf anything this needs to be consistent")')

coroutine.wrap(function()
    while on2 do
        typee = rconsoleinput()
        if typee == "/host" then
            rconsoleprint("Opening a connection\n")
            searching = true
            task.spawn(function()
                while searching do wait(1)
                    chatt("TOKEN! ESTABLISHMENT")
                end
            end)
            task.spawn(function()
                wait(300)
                searching = false
                chatt("STOPPED SEARCHING FOR PEOPLE SEARCHING")
                rconsoleprint("STOPPED SEARCHING FOR PEOPLE SEARCHING\n")
            end)
            cons[#cons + 1] = plr.Chatted:Connect(function(msg)
                if on2 then 
                    for _, v in pairs(game.Players:GetPlayers()) do
                        local connection = v.Chatted:Connect(function(message)
                            if message:lower() == "token! received signal" then
                                if finished then return end
                                if lastplayer ~= v then
                                    lastplayer = v
                                    rconsoleprint(v.Name.." has connected!\n")
                                    sfx(7433801607)
                                    chatt("TOKEN! CONNECT 2");wait(5)
                                    if not message1 then
                                        message1 = true
                                        rconsoleprint("\nIf this is everyone then type /finish\n")
                                    end
                                    while on2 do task.wait()
                                        if typee == "/finish" then
                                            if finished then return end
                                            finished = true
                                            task.spawn(function()
                                                while task.wait(.5) do
                                                    chatt("TOKEN! ENDING CONNECTION")
                                                end
                                            end)
                                            rconsoleprint("Rejoining everyone in a bit...\n")
                                            print("finish")
                                            wait(1)
                                            pcall(function()rconsoleclear()end)
                                            forcerj()
                                        end
                                    end
                                end
                            end
                        end)
                        table.insert(cons, connection)
                    end
                end
            end)
        elseif typee == "/search" then
            rconsoleprint("Searching for host...")
            function chat(plr)
                local connection = plr.Chatted:Connect(function(msg)
                    if msg:lower():find("token! establishment") then
                        if on then 
                            return 
                        end
                        getgenv().on = true
                        while task.wait(.5) do
                            chatt("TOKEN! RECEIVED SIGNAL")
                        end
                    elseif msg:lower():find("token! ending connection") then
                        finished = true
                        rconsoleprint("Host has accepted!\nRejoining everyone in a bit...\n\n")
                        wait(.75)
                        pcall(function()rconsoleclear()end)
                        forcerj()
                    elseif msg:lower():find("token! connect 2") then
                        if connectedd then return end
                        connectedd = true
                        rconsoleprint("\n\nConnected!")
                        sfx(3725080645)
                    end
                end)
                table.insert(cons, connection)
            end

            for _, v in ipairs(game.Players:GetPlayers()) do
                chat(v)
            end

            game.Players.PlayerAdded:Connect(function(plr)
                chat(plr)
            end)
        end
    end
end)()
