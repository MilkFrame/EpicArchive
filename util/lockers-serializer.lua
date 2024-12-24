function table_to_string(tbl) local result = "{" for k, v in pairs(tbl) do -- Check the key type (ignore any numerical keys - assume its an array) if type(k) == "string" then result = result.."[\""..k.."\"]".."=" end -- Check the value type if type(v) == "table" then meta = table_to_string(v) if meta ~= "}" then result = result..table_to_string(v) else result = result.."{}" end elseif type(v) == "boolean" or type(v) == "number" or typeof(v) == "EnumItem" then result = result..tostring(v) elseif typeof(v) == "BrickColor" then result = result.."BrickColor.new(\""..tostring(v).."\")" elseif type(v) == "string" and (string.find(v,"\"") or string.find(v,"\n")) then result = result.."[["..tostring(v).."]]" else result = result.."\""..tostring(v).."\"" end result = result.."," end -- Remove leading commas from the result if result ~= "" then result = result:sub(1, result:len()-1) end --setclipboard(result) return result.."}" end
local L2
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("list")==nil then
local L1=Instance.new"ScreenGui"
L1.Name="list"
L1.ZIndexBehavior=1
L2=Instance.new"ScrollingFrame"
L2.Name="list"
L2.Size=UDim2.new(0.2,0,0.5,0)
L2.Position=UDim2.new(0,0,0.3,0)
L2.Active=true
L2.BackgroundColor3=Color3.fromRGB(90,90,90)
L2.ScrollBarImageColor3=Color3.fromRGB(0,0,0)
L2.Parent=L1
local d=Instance.new"UIListLayout"
d.SortOrder=2
d.Parent=L2
L1.Parent=game.Players.LocalPlayer.PlayerGui
else L2=game.Players.LocalPlayer.PlayerGui:FindFirstChild("list").list
end
local button=Instance.new"TextButton"
button.Size=UDim2.new(1,-10,0,30)
button.BackgroundColor3=Color3.fromRGB(179,190,194)
button.FontSize=5
button.TextSize=14
button.TextColor3=Color3.fromRGB(0,0,0)
button.TextWrapped=true
button.TextWrap=true
button.TextScaled=true
val=Instance.new("StringValue",button)
val.Name="data"

local args = {[1] = "1"}
--local out = ""

--[[local store
if game.ReplicatedStorage:FindFirstChild("Backup")==nil then
    store=Instance.new("Folder") store.Name="Backup"
    store.Parent=game.ReplicatedStorage
else
    store=game.ReplicatedStorage:FindFirstChild("Backup")
end]]

local event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GetLockerData")
local HttpService = game:GetService("HttpService")
--local vu = game:GetService("VirtualUser") (use autoclicker to prevent AFK instead)

function createPack(r1,r2)
	L3=#(L2:GetChildren())
	local out = ""
	local newb=button:Clone() newb.Name="b"..tostring(r1)
	newb.Parent=L2 L2.CanvasSize=UDim2.new(0,0,0,L3*30)
	newb.MouseButton1Click:connect(function() newb.BackgroundTransparency=0.5
	setclipboard(out) wait(1) newb.BackgroundTransparency=0 end)
	for i = r1,r2 do
		if string.len(out) > 197000 or workspace:FindFirstChild("stop") then
			newb.BackgroundColor3=Color3.new(200,140,140) end
	    local data = event:InvokeServer(tostring(i))
	    local tab = HttpService:JSONDecode(data)
	    out = out .. "{" .. i .. "," .. table_to_string(tab) .. "},\n"
	    newb["data"].Value=out
	    newb.Text=i.."/"..r2 --print(i)
	    if i%2==0 then keypress(0x20) keyrelease(0x57) else keyrelease(0x20)  keypress(0x57) end
	end
	newb.Text = "[DONE] "..newb.Text
	print("Done") wait(0.5)
end
--setclipboard(out)
--print("Done")
createPack(24501,25000)
createPack(25001,25750)
createPack(25751,26500)
createPack(26501,27250)
createPack(27251,28000)

createPack(28001,28750)
createPack(28751,29500)
createPack(29501,30250)
createPack(30251,31000)
createPack(31001,31750)
createPack(31751,32500)
--[[createPack(5001,5750)
createPack(5751,6500)
createPack(6501,7250)
createPack(7251,8000)]]

--setclipboard(game.Players.LocalPlayer.PlayerGui:FindFirstChild("list").list.b2001.data.Value) print("Done")
