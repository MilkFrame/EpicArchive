function fetchTrue(jsonString)
	local result = {}
	local startPos = 1
	repeat
		local keyStart, keyEnd = string.find(jsonString, '"', startPos)
		if not keyStart then break end  -- Exit if no more keys
		local nextQuote = string.find(jsonString, '"', keyEnd + 1)
		if not nextQuote then break end
		local key = string.sub(jsonString, keyStart + 1, nextQuote - 1)
		local valueStart = string.find(jsonString, ":", nextQuote + 1)
		local valueEnd = string.find(jsonString, ",", valueStart + 1) or string.find(jsonString, "}", valueStart + 1)
		if valueEnd then
			local value = string.sub(jsonString, valueStart + 1, valueEnd - 1):match("^%s*(.-)%s*$")
			if value == "true" then
				table.insert(result, key)
			end
		end
		startPos = valueEnd + 1
	until startPos > #jsonString
	return '"'..table.concat(result, " | ")..'"'
end
function c(name)
	if name == "none" then return "" else
	return name:gsub(",","") end
end

repeat wait(1) until game.ServerScriptService.Initialised.Value == true
wait(1)
local masterArray = game.ServerScriptService.getDatabaseArray:Invoke()
local size = 65
local recordsDone = 0
local filesDone = 0
local writtenUsers = {}

print("Username,ID,SurveyDate,Level,Wins,Title,Effect,Pet,Death,GearEquipped,VIP") --Produce 19 CSVs for high level players
for i,v in pairs(masterArray) do
	writtenUsers[v[1]] = true
	vip = "n" if v[2].Gamepasses.vip == true then vip = "y" end
	line = v[2].Username..","..tonumber(v[1])..","..v[2].Date:sub(1,10)..","..v[2].Level..","..v[2].Wins..","..vip..","..c(v[2].titleselected)..","..c(v[2].effectselected)..","..c(v[2].petselected)..","..c(v[2].deathselected)..","..fetchTrue(v[2].gearsequipped)
	if size + string.len(line) < 384000 then
		print(line)
		size = size + string.len(line)
		recordsDone = recordsDone + 1
	else
		print("") print(recordsDone.." records written [file ".. filesDone+1 .."]") print("") 
		filesDone = filesDone + 1
		recordsDone = 0
		size = 65
		if filesDone >= 19 then
			break
		end
		wait(0.5)
		print("Username,ID,SurveyDate,Level,Wins,Title,Effect,Pet,Death,GearEquipped,VIP")
	end
end

table.sort(masterArray,function(a,b) return a[1]<b[1] end)
print("Username,ID,SurveyDate,Level,Wins,Title,Effect,Pet,Death,GearEquipped,VIP") --Produce 1 CSV for old accounts
for i,v in pairs(masterArray) do
	if writtenUsers[v[1]] == nil then
		vip = "n" if v[2].Gamepasses.vip == true then vip = "y" end
		line = v[2].Username..","..tonumber(v[1])..","..v[2].Date:sub(1,10)..","..v[2].Level..","..v[2].Wins..","..vip..","..c(v[2].titleselected)..","..c(v[2].effectselected)..","..c(v[2].petselected)..","..c(v[2].deathselected)..","..fetchTrue(v[2].gearsequipped)
		if size + string.len(line) < 384000 then
			print(line)
			size = size + string.len(line)
			recordsDone = recordsDone + 1
		else
			print("") print(recordsDone.." records written [file ".. filesDone+1 .."]") print("") 
			break
		end
	end
end
