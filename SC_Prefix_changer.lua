-- Replace the ; with your desired prefix. It cannot be / or // because that would overlap, especially //
local v2or3prefix = ";" -- // by default
local v1prefix = ";" -- Shortcut v1 commands basically (/ by default)

--[[
This will replace the // and the /
Script below. Please don't use this incorrectly. Contact staff if you have any questions]]

game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if string.sub(msg:lower(), 0, 1) == v2or3prefix .. "" then
            local techontop = string.sub(msg:lower(), 2)
            game.Players:Chat("//" .. techontop .. "")
        end

        if string.sub(msg:lower(), 0, 1) == v1prefix .. "" then
            local techontop = string.sub(msg:lower(), 2)
            game.Players:Chat("/" .. techontop .. "")
        end
    end)

