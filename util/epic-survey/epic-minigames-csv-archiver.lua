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
local ISO = {[""]="000",["AF"]="004",["AX"]="248",["AL"]="008",["DZ"]="012",["AS"]="016",["AD"]="020",["AO"]="024",["AI"]="660",["AQ"]="010",["AG"]="028",["AR"]="032",["AM"]="051",["AW"]="533",["AU"]="036",["AT"]="040",["AZ"]="031",["BS"]="044",["BH"]="048",["BD"]="050",["BB"]="052",["BY"]="112",["BE"]="056",["BZ"]="084",["BJ"]="204",["BM"]="060",["BT"]="064",["BO"]="068",["BQ"]="535",["BA"]="070",["BW"]="072",["BV"]="074",["BR"]="076",["IO"]="086",["BN"]="096",["BG"]="100",["BF"]="854",["BI"]="108",["KH"]="116",["CM"]="120",["CA"]="124",["CV"]="132",["KY"]="136",["CF"]="140",["TD"]="148",["CL"]="152",["CN"]="156",["CX"]="162",["CC"]="166",["CO"]="170",["KM"]="174",["CG"]="178",["CD"]="180",["CK"]="184",["CR"]="188",["CI"]="384",["HR"]="191",["CU"]="192",["CW"]="531",["CY"]="196",["CZ"]="203",["DK"]="208",["DJ"]="262",["DM"]="212",["DO"]="214",["EC"]="218",["EG"]="818",["SV"]="222",["GQ"]="226",["ER"]="232",["EE"]="233",["ET"]="231",["FK"]="238",["FO"]="234",["FJ"]="242",["FI"]="246",["FR"]="250",["GF"]="254",["PF"]="258",["TF"]="260",["GA"]="266",["GM"]="270",["GE"]="268",["DE"]="276",["GH"]="288",["GI"]="292",["GR"]="300",["GL"]="304",["GD"]="308",["GP"]="312",["GU"]="316",["GT"]="320",["GG"]="831",["GN"]="324",["GW"]="624",["GY"]="328",["HT"]="332",["HM"]="334",["VA"]="336",["HN"]="340",["HK"]="344",["HU"]="348",["IS"]="352",["IN"]="356",["ID"]="360",["IR"]="364",["IQ"]="368",["IE"]="372",["IM"]="833",["IL"]="376",["IT"]="380",["JM"]="388",["JP"]="392",["JE"]="832",["JO"]="400",["KZ"]="398",["KE"]="404",["KI"]="296",["KP"]="408",["KR"]="410",["XK"]="983",["KW"]="414",["KG"]="417",["LA"]="418",["LV"]="428",["LB"]="422",["LS"]="426",["LR"]="430",["LY"]="434",["LI"]="438",["LT"]="440",["LU"]="442",["MO"]="446",["MK"]="807",["MG"]="450",["MW"]="454",["MY"]="458",["MV"]="462",["ML"]="466",["MT"]="470",["MH"]="584",["MQ"]="474",["MR"]="478",["MU"]="480",["YT"]="175",["MX"]="484",["FM"]="583",["MD"]="498",["MC"]="492",["MN"]="496",["ME"]="499",["MS"]="500",["MA"]="504",["MZ"]="508",["MM"]="104",["NA"]="516",["NR"]="520",["NP"]="524",["NL"]="528",["NC"]="540",["NZ"]="554",["NI"]="558",["NE"]="562",["NG"]="566",["NU"]="570",["NF"]="574",["MP"]="580",["NO"]="578",["OM"]="512",["PK"]="586",["PW"]="585",["PS"]="275",["PA"]="591",["PG"]="598",["PY"]="600",["PE"]="604",["PH"]="608",["PN"]="612",["PL"]="616",["PT"]="620",["PR"]="630",["QA"]="634",["RE"]="638",["RO"]="642",["RU"]="643",["RW"]="646",["BL"]="652",["SH"]="654",["KN"]="659",["LC"]="662",["MF"]="663",["PM"]="666",["VC"]="670",["WS"]="882",["SM"]="674",["ST"]="678",["SA"]="682",["SN"]="686",["RS"]="688",["SC"]="690",["SL"]="694",["SG"]="702",["SX"]="534",["SK"]="703",["SI"]="705",["SB"]="090",["SO"]="706",["ZA"]="710",["GS"]="239",["SS"]="728",["ES"]="724",["LK"]="144",["SD"]="729",["SR"]="740",["SJ"]="744",["SZ"]="748",["SE"]="752",["CH"]="756",["SY"]="760",["TW"]="158",["TJ"]="762",["TZ"]="834",["TH"]="764",["TL"]="626",["TG"]="768",["TK"]="772",["TO"]="776",["TT"]="780",["TN"]="788",["TR"]="792",["TM"]="795",["TC"]="796",["TV"]="798",["UG"]="800",["UA"]="804",["AE"]="784",["GB"]="826",["US"]="840",["UM"]="581",["UY"]="858",["UZ"]="860",["VU"]="548",["VE"]="862",["VN"]="704",["VG"]="092",["VI"]="850",["WF"]="876",["EH"]="732",["YE"]="887",["ZM"]="894",["ZW"]="716",}

repeat wait(1) until game.ServerScriptService.Initialised.Value == true
wait(1)
local masterArray = game.ServerScriptService.getDatabaseArray:Invoke()
local size = 65
local recordsDone = 0
local filesDone = 0
local writtenUsers = {}

print("Username,ID,SurveyDate,Level,Wins,VIP,Title,Effect,Pet,Death,GearEquipped,ISO") --Produce 29 CSVs for high level players
for i,v in pairs(masterArray) do
	writtenUsers[v[1]] = true
	vip = "n" if v[2].Gamepasses.vip == true then vip = "y" end
	line = v[2].Username..","..tonumber(v[1])..","..v[2].Date:sub(1,10)..","..v[2].Level..","..v[2].Wins..","..vip..","..c(v[2].titleselected)..","..c(v[2].effectselected)..","..c(v[2].petselected)..","..c(v[2].deathselected)..","..fetchTrue(v[2].gearsequipped)..","..ISO[v[2].localeid]
	if size + string.len(line) < 350000 then
		print(line)
		size = size + string.len(line)
		recordsDone = recordsDone + 1
	else
		print("") print(recordsDone.." records written [file ".. filesDone+1 .."]") print("") 
		filesDone = filesDone + 1
		recordsDone = 0
		size = 65
		if filesDone >= 29 then
			break
		end
		wait(0.5)
		print("Username,ID,SurveyDate,Level,Wins,VIP,Title,Effect,Pet,Death,GearEquipped,ISO")
	end
end

table.sort(masterArray,function(a,b) return a[1]<b[1] end)
print("Username,ID,SurveyDate,Level,Wins,VIP,Title,Effect,Pet,Death,GearEquipped,ISO") --Produce 1 CSV for old accounts
for i,v in pairs(masterArray) do
	if writtenUsers[v[1]] == nil then
		vip = "n" if v[2].Gamepasses.vip == true then vip = "y" end
		line = v[2].Username..","..tonumber(v[1])..","..v[2].Date:sub(1,10)..","..v[2].Level..","..v[2].Wins..","..vip..","..c(v[2].titleselected)..","..c(v[2].effectselected)..","..c(v[2].petselected)..","..c(v[2].deathselected)..","..fetchTrue(v[2].gearsequipped)..","..ISO[v[2].localeid]
		if size + string.len(line) < 350000 then
			print(line)
			size = size + string.len(line)
			recordsDone = recordsDone + 1
		else
			print("") print(recordsDone.." records written [file ".. filesDone+1 .."]") print("") 
			break
		end
	end
end
