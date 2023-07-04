getgenv().on = false

local prefix4 = "/"
local wrdcheck = 3 -- Minimum number of repeats required
local cons = {}

cons[#cons + 1] = game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if string.sub(msg, 0, 3 + #prefix4) == prefix4.."off" then
        print("Turned it off")
        getgenv().on = false
        spammin = false
        for _, connection in ipairs(cons) do
            connection:Disconnect()
        end
    end
end)

function chat(plr)
    local connection = plr.Chatted:Connect(function(msg)
        if msg:lower():find("token! duo script 1") then
            if on then 
                return 
            end
            getgenv().on = true
            print("Duo script is loaded. Type /off to turn this off")
            for _, player in ipairs(game.Players:GetPlayers()) do
                cons[#cons + 1] = player.Chatted:Connect(function(message)
                    if funiword then return end
                    local words = {}
                    for word in message:gmatch("%S+") do
                        words[word] = (words[word] or 0) + 1
                        if words[word] == wrdcheck then
                            funiword = true
                            while on do wait(5.1)
                                if not on then return end
                                for i = 1, 100 do -- This will be really messy due to the odd spam pattern but it has a reason. It all has to do with the ratelimit system that nobody besides me really looked into
                                    game.Players:Chat("respawn "..word.." "..word.." "..word)
                                end
                                task.spawn(function()
                                    spammin = true
                                    wait(1.5)
                                    spammin = false
                                    wait(5.1)
                                    if not on then return end
                                    for i = 1, 100 do 
                                        game.Players:Chat("respawn "..word.." "..word.." "..word)
                                    end
                                end)
                                task.wait(.1)
                                while spammin and on do task.wait()
                                    if not on then return end
                                    game.Players:Chat("respawn "..word.." "..word.." "..word)
                                end
                            end
                        end
                    end
                end)
            end
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

print("Ran the script now suck cock")
