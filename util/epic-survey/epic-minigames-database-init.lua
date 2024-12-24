local master = {}
wait(3)

local b1 = require(game.ServerStorage.Batch1)
for i,v in pairs(b1) do
	master[i] = v
end
print("Batch 1 imported")
wait(1)
local b2 = require(game.ServerStorage.Batch2)
for i,v in pairs(b2) do
	master[i] = v
end
print("Batch 2 imported")
wait(1)
local b3 = require(game.ServerStorage.Batch3)
for i,v in pairs(b3) do
	master[i] = v
end
print("Batch 3 imported")

local total = 0
local masterArray = {}
for i,v in pairs(master) do
	total = total + 1
	table.insert(masterArray,{i,v})
end

--table.sort(masterArray,function(a,b) return a[1] < b[1] end)
table.sort(masterArray,function(a,b) return a[2].Wins > b[2].Wins end)

script.Parent.getDatabase.OnInvoke = function()
	return master
end

script.Parent.getDatabaseArray.OnInvoke = function()
	return masterArray
end

wait(0.5)
script.Parent.Initialised.Value = true
print("Database initialised")
print(total.." unique records in database")
