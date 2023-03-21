local id1 = 66254
	while task.wait do 
		pcall(function()
		string.match(game:HttpGet("https://inventory.roblox.com/v1/users/193282101/items/GamePass/" .. id1), id1)
		-- It will time you out eventually
		print("pinged "..math.random(1,999999))
	end)
end