local kv = [======[

]======]

local function parse(s)
	local t = {};
	for chunk in string.gmatch(s, "[^\n]+") do
		t[#t+1] = chunk;
	end;
	return t;
end;

local output = [[]]
local all = parse(kv)
table.sort(all)
wait(3)

local checked = {}
local final = {}
for i = #all,1,-1 do
	local id = string.sub(all[i],3,18)
	if i % 500 == 0 then wait(0.3) print(i) end
	if checked[id] == nil then
		checked[id] = true
		--output = all[i] .. "\n" .. output
		entry = all[i]:gsub("%[%[%[%]%]%]","[=[]=]")
		table.insert(final,entry)
	end
end
print("Done")
--print(output)

for i = #final,1,-1 do
	print(final[i])
	if i%200==0 then wait() end
	--if tonumber(string.sub(final[i],3,18)) > 100000000 then break end
end
