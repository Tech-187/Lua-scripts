    local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
    local Notiication = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
    
    
    function Notify(title, msg, ...) 
        local arfgs = {...}
    
        if args[1] then
            Notification:Notify(
                {Title = title, Description = msg},
                {OutlineColor = Color3.fromRGB(86, 84, 240),Time = 5, Type = "option"},
                {Callback = args[1]}
            )
        else
            Notification:Notify(
                {Title = title, Description = msg},
                {OutlineColor = Color3.fromRGB(86, 84, 240),Time = 5, Type = "default"}
            )
        end
    end
        
    --getgenv().conga = readfile("SYN.AH") == "1"
    getgenv().conga = true
    getgenv().deletedParts = {}
    
    
    function encrypt(a,b)local c=string.byte;local d=string.sub;local e=string.char;local f={}for g=1,#a do local h=g%#b+1;f[g]=e((c(d(a,g,g))+c(d(b,h,h)))%126+1)end;f=table.concat(f)return f end
    function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
    
    local RunService = game:GetService("RunService")
    
    function getIndex(array, value)
        for i, v in ipairs(array) do
            if v == value then
                return i
            end
        end
        return nil
    end
    
    local level = 2
    
    game.Workspace.DescendantAdded:Connect(function(part)
        if getgenv().conga then
            if game.Players:GetPlayerFromCharacter(part:FindFirstAncestorOfClass("Model")) ~= nil then
                do return end
            end
    
            if part:IsA("Humanoid") and part.DisplayName:len() > 20 then
                part.DisplayName = "⚠"
            end
    
            if part.ClassName == "MeshPart" and part.MeshId == "rbxassetid://760766662" then 
                table.insert(getgenv().deletedParts, part)
                task.wait()
                part:Destroy()
            end

            if part:IsA("SkateboardPlatform") then
                task.wait()
                part:Destroy()
            end
    
     if part.ClassName == "SpecialMesh" or part.ClassName == "Smoke" and part.Parent then
                if level == 1 then
                    table.insert(getgenv().deletedParts, part.Parent)
                    task.wait() --HEARTBEAT
                    part:Destroy()
                elseif level == 2 then
                    table.insert(getgenv().deletedParts, part.Parent)
                    task.wait()
                    part.Parent:Destroy()
                end
    
            end
            
        end
    
    end)

    
    RunService.RenderStepped:Connect(function(step)
        if getgenv().conga then
            local players = game.Players:GetChildren()
            for i = 1, #players do
                local char = players[i].Character
                if (char) and char:FindFirstChild("Humanoid") then
                    if char.Humanoid.DisplayName:len() > 20 then
                        char.Humanoid.DisplayName = "⚠ AntiLag ⚠"
                        if getgenv().Key then
                            getgenv().runCmd(":undisplayname " .. char.name)
                        end
                    end
                end
    
            end 
        end
    end)