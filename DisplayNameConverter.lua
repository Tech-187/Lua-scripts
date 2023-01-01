local wordvar = nil
local lplayer = game.Players.LocalPlayer

lplayer.Chatted:Connect(function(message)
    local words = message:split(" ")
    local firstarg = words[2]
    local wordLength = firstarg:len()
    wordvar = wordLength
end)

lplayer.Chatted:Connect(function(message)
        local words = message:split(" ")
        local returnmsg = ""
        for i, word in pairs(words) do
            local search = word:sub(1, 1):lower()
            local returnplr = nil
            for _, v in pairs(game.Players:GetPlayers()) do
                if v.DisplayName:lower():sub(1, 1) == search then
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
        game.Players:Chat(returnmsg);wait(.35)
        msgg = false
    end)

-- Test
game.Players:Chat("# ###")