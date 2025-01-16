wait(2)
function quote(str)
	local str2 = str:gsub('"',"'")
	str2 = str2:gsub("\n", ""):match("^%s*(.-)%s*$")
	if string.find(str2,",") then
		return '"'..str2..'"'
	end
	return str2
end
local books = {}
for i,v in pairs(workspace.Books:GetChildren()) do
	if v.Name ~= " " and v:FindFirstChild("Pages") then
		table.insert(books,v)
	end
end
for i,v in pairs(workspace.Books2:GetChildren()) do
	if v.Name ~= " " and v:FindFirstChild("Pages") then
		table.insert(books,v)
	end
end
table.sort(books, function(a, b)
	if a.Name == b.Name then
		return a.Author.Value < b.Author.Value
	else
		return a.Name < b.Name
	end
end)
print(#books) print()

wait(3)
print("Title,Author,Pages,CharCount")
local doneBooks = {}
local len = 28
for i,v in pairs(books) do
	local p = v.Pages:GetChildren()
	local pages = {}
	for x,y in pairs(p) do
		if y.ClassName == "StringValue" then
			table.insert(pages,y)
		end
	end
	local author = ""
	if v:FindFirstChild("Author") then
		author = v.Author.Value
	end
	local charCount = 0
	for i,v in pairs(pages) do
		charCount = charCount + string.len(v.Value)
	end
	local line = "/////"..quote(v.Name)..","..quote(author)..","..#pages..","..charCount
	if doneBooks[line] == nil then
		doneBooks[line] = true
		if len + string.len(line) < 380000 then
			print(line)
			len = len + string.len(line)
		else
			print("")
			len = 28
			wait(0.5)
			print("Title,Author,Pages,CharCount")
			print(line)
		end
	end
	if i % 100 == 0 then wait() end
end
--Ctrl+F to clean the "  /////" with ""
