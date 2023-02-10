--[[
    I have only tested this in R6 so far.
    Feel free to use the code, credit would be appreciated (Tech#0700)

    Type "hug" to do the hug animation and "unhug" to stop it
    Type "hugnearest" to walk automatically to the nearest player, and then start hugging.
]]

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

if not humanoid then return end
if hl then return end
getgenv().hl = true

local lockcontrols = false -- Incase you're using another script with whitelist commands or something

function logn(msg)
	game.StarterGui:SetCore(
        "SendNotification",
        {
		Title = "E-hugs are cute asf",
		Text = msg,
		Duration = 10
	})
end

local function findnp()
    local np, nDistance
    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer then
            local plrchar = player.Character
            if plrchar then
                local plrroot = plrchar:FindFirstChild("HumanoidRootPart")
                if plrroot then
                    local distance = (plrroot.Position - character.HumanoidRootPart.Position).magnitude
                    if not nDistance or distance < nDistance then
                        np = player
                        nDistance = distance
                    end
                end
            end
        end
    end
    return np
end

local function frz(anchored)
    local bodyparts = {}
    for _, child in pairs(character:GetChildren()) do
        if child:IsA("Part") and (child.Name:find("Leg") or child.Name:find("Torso") or child.Name:find("Head")) then
            table.insert(bodyparts, child)
        end
    end

    for _, bodyPart in pairs(bodyparts) do
        bodyPart.Anchored = anchored
    end
end
task.spawn(function()
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if string.sub(msg:lower(), 0, 3) == "hug" then
            if lockcontrols then return end
            if string.sub(msg:lower(), 0, 10) == "hugnearest" then
                game.Players:Chat("hnearest Also nice chatlogs lol")
            else
                frz(true)
                game.Players.LocalPlayer.Character.Humanoid.Sit = true
            end
        elseif string.sub(msg:lower(), 0, 5) == "unhug" then
            if lockcontrols then return end
            frz(false)
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        elseif string.sub(msg:lower(), 0, 8) == "hnearest" then
            if lockcontrols then return end
            while true do
                local np = findnp()
                if np then
                    local rootpart = np.Character.HumanoidRootPart
                    humanoid:MoveTo(rootpart.Position)
                    wait(1.5)
                    logn("Now hugging ".. np.Name)
                    game.Players:Chat("hug")
                    break
                end
                wait(1)
            end
        end
    end)
end)

logn("Script booted")
