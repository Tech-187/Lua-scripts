shared.active = true -- Configure this. Just run the entire script again but with this set to false to turn it off.

if p2p then
    return
end
getgenv().p2p = true -- Don't touch

local player = game.Players.LocalPlayer
--local chatted = 
player.Chatted:Connect(function(message)
    if shared.active == true then
        if msgg then return end
        msgg = true
        game.Players:Chat(string.gsub(message, " ", "/"));wait(.35) -- Spam delay.
        msgg = false
    end
end)
