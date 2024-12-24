local data = {} --insert raw full metadata here

local index = 1
function f(num)
	local i, j, minus, int, fraction = tostring(num):find('([-]?)(%d+)([.]?%d*)')
	int = int:reverse():gsub("(%d%d%d)", "%1,")
	return '"'..minus .. int:reverse():gsub("^,", "") .. fraction..'"'
end
function d(timestamp)
	return os.date("%Y-%m-%d", timestamp)
end
local csv = "Rank,Game,Rating,Reviews,ID,Created,Visits,Favorites\n"
for i,v in pairs(data) do
	line = index .. ",\"" .. v[9]:gsub("\"","") .. "\", " .. v[1]/100 .. "," .. f(v[6]) .. "," .. v[13] .. "," .. d(v[8]) .. "," .. f(v[3]) .. "," .. f(v[2]) .. "\n"
	if index < 3001 then
		csv = csv .. line
		index = index + 1
	else
		print(csv)
		print(index)
		break
	end
end
