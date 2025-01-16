local data = {} --insert raw data retrieved from game.ReplicatedStorage.GetBooks:InvokeServer()
wait(3)
table.sort(data,function(a,b)
	if a.AuthorLine == b.AuthorLine then
		return a.Title < b.Title
	else
		local a1 = string.gsub(string.upper(a.AuthorLine),"[^%w%s]","")
		local b1 = string.gsub(string.upper(b.AuthorLine),"[^%w%s]","")
		return a1 < b1
	end
end)

local function generateCSV(data, maxChars)
	-- Print the header
	local header = "Title,Author Line,Id,PublishDate,AuthorIds,PageCount,Genres"
	print(header)

	-- Keep track of the total character count
	local totalCharCount = #header

	-- Iterate over each entry in the data
	for _, entry in ipairs(data) do
		-- Prepare fields
		local title1 = entry.Title
		local authorLine = entry.AuthorLine
		local id = entry.Id
		local publishDate = entry.PublishDate
		local authorIds = entry.AuthorIds
		local pageCount = entry.PageCount
		local genres = entry.Genres or {}
		local title = ""
		for t0 in title1:gmatch("[^\\\"]+") do
			title = title .. t0
		end
		if string.find(publishDate,",") then publishDate = "\""..publishDate.."\"" end
		
		-- Prepare authorIds string
		local authorIdsString = ""
		if authorIds[1] ~= false then
			authorIds1 = {}
			for i,v in pairs(authorIds) do
				if type(v) == "string" then table.insert(authorIds1,v) end
			end
			authorIdsString = table.concat(authorIds1, ", ")
		end
		
		-- Concatenate genres
		local genresString = #genres > 0 and '"' .. table.concat(genres, ", ") .. '"' or ''

		-- Generate the CSV line
		local csvLine = string.format('%q,%q,%d,%s,%s,%d,%s', title, authorLine, id, publishDate, authorIdsString, pageCount, genresString)

		-- Check character count before printing
		local lineCharCount = #csvLine + 1 -- Adding 1 for the newline character
		if totalCharCount + lineCharCount > maxChars then
			-- Print the header again if we exceed maxChars
			print() print() print()
			print(header)
			totalCharCount = #header -- Reset the character count
			wait(0.5)
		end

		-- Print the CSV line
		print(csvLine)

		-- Update the total character count
		totalCharCount = totalCharCount + lineCharCount
	end
end

-- Call the function to generate and print the CSV with character limit
generateCSV(data, 320000)
