function WaitForChildOfClass(parent,className,timeOut)
	local waitTime = 0
	local warned = false
	repeat
		local obj = parent:FindFirstChildOfClass(className)
		if obj then 
			return obj 
		else
			waitTime = waitTime + wait()
			if timeOut then 
				if waitTime > timeOut then return nil end
			elseif not warned then
				if waitTime > 5 then 
					warn("Infinite yield possible waiting on",parent:GetFullName() .. ":WaitForChildOfClass(\"".. className .. "\")")
					warned = true
				end
			end
		end
	until false
end


if (game.PlaceId == 333164326) then -- AH
    print("AdonisKey started...")

    local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
    local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

    local limits = {["Remote"] = 0.01, ["RateLog"] = 10, ["Command"] = 0.1}

    function getNil(name,class) for _,v in pairs(getnilinstances())do if v.ClassName==class and v.Name==name then return v;end end end
    getgenv().encrypt = function (a,b)local c=string.byte;local d=string.sub;local e=string.char;local f={}for g=1,#a do local h=g%#b+1;f[g]=e((c(d(a,g,g))+c(d(b,h,h)))%126+1)end;f=table.concat(f)return f end
    getgenv().decrypt = function(a,b)local c=string.byte;local d=string.sub;local e=string.char;local f={}for g=1,#a do local h=g%#b+1;f[g]=e((c(d(a,g,g))-c(d(b,h,h)))%126-1)end;f=table.concat(f)return f end
    function Notify(a,b,...)local c={...}if c[1]then Notification:Notify({Title=a,Description=b},{OutlineColor=Color3.fromRGB(86,84,240),Time=5,Type="option"},{Callback=c[1]})else Notification:Notify({Title=a,Description=b},{OutlineColor=Color3.fromRGB(86,84,240),Time=5,Type="default"})end end

    
    local jservice = game:GetService("JointsService")

    getgenv().Remote = jservice:FindFirstChildWhichIsA("RemoteEvent") or WaitForChildOfClass(jservice, "RemoteEvent")


    print("Got remote! " .. getgenv().Remote.Name)
    getgenv().Received = 1
    local event
    event = getgenv().Remote.OnClientEvent:Connect(function(...)
        getgenv().Received = getgenv().Received + 1

        local arg = {...}
        --local actualargs = arg
        if string.match(arg[2], "GIVE_KEY") then

            getgenv().Key = arg[3]
            Notify("AdonisKey", "Adonis key gathered (" .. arg[3] .. ")! Ready for execution")

            getgenv().Client = getNil("Client", "ModuleScript")
            getgenv().ClientMover = getNil("ClientMover", "LocalScript")

            getgenv().cmdKey = encrypt("ProcessCommand", getgenv().Key)

            local a=os.clock()
            getgenv().Fire = function(...) 
                if accepting == false then return -1 end
                local payload = {...}

                
                -- if payload[1] == getgenv().cmdKey and os.clock() - a < 0.11 then
                --     local waitAmount = (0.12 - (os.clock() - a)) -- add a 0.02
                --     task.wait(waitAmount)
                -- elseif os.clock() - a < 0.02 and payload[1] ~= getgenv().cmdKey then 
                --     task.wait(0.02 - (os.clock() - a))
                -- end

                if payload[1] == getgenv().cmdKey and os.clock() - a < limits.Remote + limits.Command then
                    task.wait(limits.Remote + limits.Command - (os.clock() - a))
                elseif os.clock() - a < limits.Remote then
                    task.wait(limits.Remote - (os.clock() - a))
                end

                local header = {
                    
                    ["Received"] = getgenv().Received,
                    ["Loader"] = getgenv().ClientMover,
                    ["Mode"] = "Fire",
                    ["Sent"] = 0,
                    ["Module"] = getgenv().Client
                }

                getgenv().Remote:FireServer(header, table.unpack(payload))
                a = os.clock()
            end

            getgenv().runCmd = function (cmd, ...)
                local options = {...}

                if options[1] == "Key" or cmd:len() > 200 then 
                    getgenv().Fire(getgenv().cmdKey, cmd)
                    return 1
                end

                getgenv().Fire("ProcessChat", cmd)

            end

            getgenv().isAdmin = function (user)
                local remoteFunc = getgenv().Remote:FindFirstChild("")
            
                local header = {
                    ["Received"] = 0,
                    ["Loader"] = getgenv().ClientMover,
                    ["Mode"] = "Get",
                    ["Sent"] = 0,
                    ["Module"] = getgenv().Client
                }
            
                local res = remoteFunc:InvokeServer(header, getgenv().encrypt("UpdateList", getgenv().Key), "AdminListUpdate")
                local admins = res[1]
            
                for i,v in pairs(admins) do 
                    if v == user .. " - Mod [PERM]" then
                        return {["Admin"] = true, ["Perm"] = true}
                    elseif v == user .. " - Mod" then
                        return {["Admin"] = true, ["Perm"] = false}
                    end
                end
                
                return {["Admin"] = false, ["Perm"] = false}
            end

            getgenv().loadBuild = function (buildname)
                local res = game:GetService("ReplicatedStorage").Network.BuildSaving:InvokeServer( {"LOAD", buildname} )
                if res == false then
                    Notify(project, "Couldnt load build.")
                    return -1
                end
                res["Clear"] = function() 
                    if res.Success then
                        for i,v in ipairs(res.Objects) do
                            if v.Parent == nil then table.remove(res.Objects, i) end
                        end
                        requireFex():InvokeServer("Remove", res.Objects)
                    end
                end
            
                return res
            end

        end

    end)
end