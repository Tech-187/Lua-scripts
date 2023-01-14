shared.displayon = false -- Set this to false if you don't want the script to boot

if displayrunning then
    return
end
getgenv().displayrunning = true -- Don't touch

local wordvar = nil
local lplayer = game.Players.LocalPlayer

lplayer.Chatted:Connect(function(message)
    local words = message:split(" ")
    local firstarg = words[2]
    local wordLength = firstarg:len()
    wordvar = wordLength
	local returnmsg = ""
	for i, word in pairs(words) do
		local search = word:sub(1, 1):lower() -- change the second 1 to 3 or something if you want it to be more strict on the player
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
	if shared.displayon then
	game.Players:Chat(returnmsg);wait(.35)
	end
	msgg = false
end)

-- 2 words so the script does not return an error
game.Players:Chat("# #")
