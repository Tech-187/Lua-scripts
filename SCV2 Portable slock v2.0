-- I removed this from the latest version of SCV2 and forgot to include this as people loved it. This code is old and I got a little help from yeemi at the time

local pslock = true
local slockwl = {"ecks_pLoit","An0rdinaryGirl_Mia","TechnoReaperX","1x3x3x7x1x7","KohlsH_Angler","harlyqwinn5621"} 
local connections = {}
local csp = string.rep("0", 50)

-- Main slock
task.spawn(function() 
    while pslock do
    for i, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:IsDescendantOf(game.Workspace) and player ~= game.Players.LocalPlayer then
                game.Players:Chat("punish "..csp.." others")
                break
            end
        end
        task.wait(.35)
    end
end)

-- Whitelist
for i, player in pairs(game.Players:GetPlayers()) do
    if table.find(slockwl, player.Name) then
        if player.Character and player.Character:FindFirstChild("Lighting") then
            local conn = player.CharacterAdded:Connect(function()
                if player.Character:FindFirstChild("Lighting") then
                    game.Players:Chat("unpunish "..player.Name)
                end
            end)
            table.insert(connections, conn)
        end
    end
end

--[[
function closeslock()
    for i, conn in ipairs(connections) do
        conn:Disconnect()
    end
end
]]
