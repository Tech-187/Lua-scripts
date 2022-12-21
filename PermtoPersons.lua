local player = game.Players.LocalPlayer
--local chatted = 
player.Chatted:Connect(function(message)
    if msgg then return end
    msgg = true
    game.Players:Chat(string.gsub(message, " ", "/"));wait(.35) -- Spam delay.
    msgg = false
end)