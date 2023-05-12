-- Giving it all away because I will redo it all, I made most of this for nothing as I could have done it way better


pcall(function()
local listF = listfiles("myvarcmds")
local foundFilename
local playerFilename
for _,v in pairs(listF) do
  local filename = string.sub(v, string.find(v, "\\")+1, string.find(v, "%.txt")-1)
  if string.find(filename, "player") then
    playerFilename = filename
    filename = string.sub(filename, 1, string.find(filename, "player")-1) .. string.sub(filename, string.find(filename, "player")+6)
    foundFilename = filename
    table.insert(customcmdstable, filename)
    print("Found player in file", playerFilename)
    addcommand(filename,
    "path",
    function()
        for _Index, Target in pairs(GetPlayer(args[2])) do
            local file = readfile(CustomcmdsFolder.."/"..filename.."player.txt")
            for command in file:gmatch("[^\r\n]+") do 
                game.Players:Chat(command.." "..Target.Name)
                print(command.." "..Target.Name)
            end
            if debugmode then
                ndebug("Ran custom cmd on "..Target.Name)
            end
        end
    end)
  else
    print("Static file", filename)
    table.insert(customcmdstable, filename)
    addcommand(filename,
    "path",
    function()
        local file = readfile(CustomcmdsFolder.."/"..filename..".txt")
        for command in file:gmatch("[^\r\n]+") do 
            game.Players:Chat(command)
            print(command)
        end
        if debugmode then
            ndebug("Ran custom cmd")
        end
    end)
  end
end

if foundFilename then
  print("The modified filename without 'player' is:", foundFilename)
  print("The original filename containing 'player' is:", playerFilename)
else
  print("No filenames containing 'player' were found.")
end

local listF2 = listfiles("myvarcode")
for _,v in pairs(listF2) do
    local filename2 = string.sub(v, string.find(v, "\\")+1, string.find(v, "%.txt")-1)
    print(filename2)
    table.insert(customcmdstable, filename2)
    addcommand(filename2,
    "path",
    function()
        dofile(CustomcodeFolder.."/"..filename2..".txt")
        if debugmode then
            ndebug("Ran custom code")
        end
    end)
end
end)
