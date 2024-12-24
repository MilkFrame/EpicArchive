local old = {} --insert latest revision here
local new = old --insert updated revision here if updating leaderboards, else declare 'old'

local countryNames={["MS"]={["Name"]="Montserrat",["Emoji"]="🇲🇸"},["FK"]={["Name"]="FalklandIslands",["Emoji"]="🇫🇰"},["CC"]={["Name"]="Cocos(Keeling)Islands",["Emoji"]="🇨🇨"},["HK"]={["Name"]="HongKongSARChina",["Emoji"]="🇭🇰"},["EC"]={["Name"]="Ecuador",["Emoji"]="🇪🇨"},["PS"]={["Name"]="PalestinianTerritories",["Emoji"]="🇵🇸"},["MK"]={["Name"]="Macedonia",["Emoji"]="🇲🇰"},["RS"]={["Name"]="Serbia",["Emoji"]="🇷🇸"},["US"]={["Emoji"]="🇺🇸",["Name"]="UnitedStates",["Language"]="English"},["WS"]={["Name"]="Samoa",["Emoji"]="🇼🇸"},["CK"]={["Name"]="CookIslands",["Emoji"]="🇨🇰"},["LC"]={["Name"]="St.Lucia",["Emoji"]="🇱🇨"},["DK"]={["Name"]="Denmark",["Emoji"]="🇩🇰"},["SC"]={["Name"]="Seychelles",["Emoji"]="🇸🇨"},["AS"]={["Name"]="AmericanSamoa",["Emoji"]="🇦🇸"},["TC"]={["Name"]="Turks & CaicosIslands",["Emoji"]="🇹🇨"},["VC"]={["Name"]="St.Vincent & Grenadines",["Emoji"]="🇻🇨"},["ES"]={["Emoji"]="🇪🇸",["Name"]="Spain",["Language"]="Spanish"},["VI"]={["Name"]="U.S.VirginIslands",["Emoji"]="🇻🇮"},["GS"]={["Name"]="SouthGeorgia & SouthSandwichIslands",["Emoji"]="🇬🇸"},["PK"]={["Name"]="Pakistan",["Emoji"]="🇵🇰"},["IS"]={["Name"]="Iceland",["Emoji"]="🇮🇸"},["PW"]={["Name"]="Palau",["Emoji"]="🇵🇼"},["BS"]={["Name"]="Bahamas",["Emoji"]="🇧🇸"},["TK"]={["Name"]="Tokelau",["Emoji"]="🇹🇰"},["NP"]={["Name"]="Nepal",["Emoji"]="🇳🇵"},["CO"]={["Name"]="Colombia",["Emoji"]="🇨🇴"},["VN"]={["Emoji"]="🇻🇳",["Name"]="Vietnam",["Language"]="Vietnamese"},["GH"]={["Name"]="Ghana",["Emoji"]="🇬🇭"},["LA"]={["Name"]="Laos",["Emoji"]="🇱🇦"},["MH"]={["Name"]="MarshallIslands",["Emoji"]="🇲🇭"},["KM"]={["Name"]="Comoros",["Emoji"]="🇰🇲"},["KH"]={["Name"]="Cambodia",["Emoji"]="🇰🇭"},["SX"]={["Name"]="SintMaarten",["Emoji"]="🇸🇽"},["MX"]={["Name"]="Mexico",["Emoji"]="🇲🇽"},["LS"]={["Name"]="Lesotho",["Emoji"]="🇱🇸"},["AG"]={["Name"]="Antigua & Barbuda",["Emoji"]="🇦🇬"},["BE"]={["Name"]="Belgium",["Emoji"]="🇧🇪"},["EH"]={["Name"]="WesternSahara",["Emoji"]="🇪🇭"},["BH"]={["Name"]="Bahrain",["Emoji"]="🇧🇭"},["CH"]={["Name"]="Switzerland",["Emoji"]="🇨🇭"},["IR"]={["Name"]="Iran",["Emoji"]="🇮🇷"},["SY"]={["Name"]="Syria",["Emoji"]="🇸🇾"},["SS"]={["Name"]="SouthSudan",["Emoji"]="🇸🇸"},["CX"]={["Name"]="ChristmasIsland",["Emoji"]="🇨🇽"},["LK"]={["Name"]="SriLanka",["Emoji"]="🇱🇰"},["SI"]={["Name"]="Slovenia",["Emoji"]="🇸🇮"},["PA"]={["Name"]="Panama",["Emoji"]="🇵🇦"},["GF"]={["Name"]="FrenchGuiana",["Emoji"]="🇬🇫"},["PH"]={["Emoji"]="🇵🇭",["Name"]="Philippines",["Language"]="Tagalog"},["GP"]={["Name"]="Guadeloupe",["Emoji"]="🇬🇵"},["NC"]={["Name"]="NewCaledonia",["Emoji"]="🇳🇨"},["NG"]={["Name"]="Nigeria",["Emoji"]="🇳🇬"},["TH"]={["Emoji"]="🇹🇭",["Name"]="Thailand",["Language"]="Thai"},["AX"]={["Name"]="ÅlandIslands",["Emoji"]="🇦🇽"},["AQ"]={["Name"]="Antarctica",["Emoji"]="🇦🇶"},["SH"]={["Name"]="St.Helena",["Emoji"]="🇸🇭"},["UY"]={["Name"]="Uruguay",["Emoji"]="🇺🇾"},["BA"]={["Name"]="Bosnia & Herzegovina",["Emoji"]="🇧🇦"},["MQ"]={["Name"]="Martinique",["Emoji"]="🇲🇶"},["FI"]={["Name"]="Finland",["Emoji"]="🇫🇮"},["GA"]={["Name"]="Gabon",["Emoji"]="🇬🇦"},["LI"]={["Name"]="Liechtenstein",["Emoji"]="🇱🇮"},["KI"]={["Name"]="Kiribati",["Emoji"]="🇰🇮"},["NZ"]={["Name"]="NewZealand",["Emoji"]="🇳🇿"},["MY"]={["Name"]="Malaysia",["Emoji"]="🇲🇾"},["LY"]={["Name"]="Libya",["Emoji"]="🇱🇾"},["KY"]={["Name"]="CaymanIslands",["Emoji"]="🇰🇾"},["MC"]={["Name"]="Monaco",["Emoji"]="🇲🇨"},["CA"]={["Emoji"]="🇨🇦",["Name"]="Canada",["Language"]="English"},["NA"]={["Name"]="Namibia",["Emoji"]="🇳🇦"},["CI"]={["Name"]="Côted’Ivoire",["Emoji"]="🇨🇮"},["BI"]={["Name"]="Burundi",["Emoji"]="🇧🇮"},["SA"]={["Name"]="SaudiArabia",["Emoji"]="🇸🇦"},["LB"]={["Name"]="Lebanon",["Emoji"]="🇱🇧"},["QA"]={["Name"]="Qatar",["Emoji"]="🇶🇦"},["BY"]={["Name"]="Belarus",["Emoji"]="🇧🇾"},["CD"]={["Name"]="Congo-Kinshasa",["Emoji"]="🇨🇩"},["BQ"]={["Name"]="CaribbeanNetherlands",["Emoji"]="🇧🇶"},["UA"]={["Name"]="Ukraine",["Emoji"]="🇺🇦"},["AO"]={["Name"]="Angola",["Emoji"]="🇦🇴"},["GQ"]={["Name"]="EquatorialGuinea",["Emoji"]="🇬🇶"},["ZA"]={["Name"]="SouthAfrica",["Emoji"]="🇿🇦"},["VA"]={["Name"]="VaticanCity",["Emoji"]="🇻🇦"},["NI"]={["Name"]="Nicaragua",["Emoji"]="🇳🇮"},["GL"]={["Name"]="Greenland",["Emoji"]="🇬🇱"},["MP"]={["Name"]="NorthernMarianaIslands",["Emoji"]="🇲🇵"},["IQ"]={["Name"]="Iraq",["Emoji"]="🇮🇶"},["VU"]={["Name"]="Vanuatu",["Emoji"]="🇻🇺"},["IN"]={["Name"]="India",["Emoji"]="🇮🇳"},["AZ"]={["Name"]="Azerbaijan",["Emoji"]="🇦🇿"},["KN"]={["Name"]="St.Kitts & Nevis",["Emoji"]="🇰🇳"},["JM"]={["Name"]="Jamaica",["Emoji"]="🇯🇲"},["JP"]={["Emoji"]="🇯🇵",["Name"]="Japan",["Language"]="Japanese"},["LV"]={["Name"]="Latvia",["Emoji"]="🇱🇻"},["AF"]={["Name"]="Afghanistan",["Emoji"]="🇦🇫"},["BF"]={["Name"]="BurkinaFaso",["Emoji"]="🇧🇫"},["MN"]={["Name"]="Mongolia",["Emoji"]="🇲🇳"},["BN"]={["Name"]="Brunei",["Emoji"]="🇧🇳"},["CN"]={["Name"]="China",["Emoji"]="🇨🇳"},["NF"]={["Name"]="NorfolkIsland",["Emoji"]="🇳🇫"},["SV"]={["Name"]="ElSalvador",["Emoji"]="🇸🇻"},["TV"]={["Name"]="Tuvalu",["Emoji"]="🇹🇻"},["NR"]={["Name"]="Nauru",["Emoji"]="🇳🇷"},["PY"]={["Name"]="Paraguay",["Emoji"]="🇵🇾"},["IT"]={["Name"]="Italy",["Emoji"]="🇮🇹"},["TF"]={["Name"]="FrenchSouthernTerritories",["Emoji"]="🇹🇫"},["MV"]={["Name"]="Maldives",["Emoji"]="🇲🇻"},["BV"]={["Name"]="BouvetIsland",["Emoji"]="🇧🇻"},["SK"]={["Name"]="Slovakia",["Emoji"]="🇸🇰"},["PF"]={["Name"]="FrenchPolynesia",["Emoji"]="🇵🇫"},["GM"]={["Name"]="Gambia",["Emoji"]="🇬🇲"},["FM"]={["Name"]="Micronesia",["Emoji"]="🇫🇲"},["CL"]={["Name"]="Chile",["Emoji"]="🇨🇱"},["MT"]={["Name"]="Malta",["Emoji"]="🇲🇹"},["SN"]={["Name"]="Senegal",["Emoji"]="🇸🇳"},["TN"]={["Name"]="Tunisia",["Emoji"]="🇹🇳"},["CV"]={["Name"]="CapeVerde",["Emoji"]="🇨🇻"},["CF"]={["Name"]="CentralAfricanRepublic",["Emoji"]="🇨🇫"},["GI"]={["Name"]="Gibraltar",["Emoji"]="🇬🇮"},["PN"]={["Name"]="PitcairnIslands",["Emoji"]="🇵🇳"},["JO"]={["Name"]="Jordan",["Emoji"]="🇯🇴"},["CG"]={["Name"]="Congo-Brazzaville",["Emoji"]="🇨🇬"},["RW"]={["Name"]="Rwanda",["Emoji"]="🇷🇼"},["EG"]={["Name"]="Egypt",["Emoji"]="🇪🇬"},["FO"]={["Name"]="FaroeIslands",["Emoji"]="🇫🇴"},["KW"]={["Name"]="Kuwait",["Emoji"]="🇰🇼"},["BG"]={["Name"]="Bulgaria",["Emoji"]="🇧🇬"},["MW"]={["Name"]="Malawi",["Emoji"]="🇲🇼"},["BO"]={["Name"]="Bolivia",["Emoji"]="🇧🇴"},["KG"]={["Name"]="Kyrgyzstan",["Emoji"]="🇰🇬"},["DO"]={["Name"]="DominicanRepublic",["Emoji"]="🇩🇴"},["MG"]={["Name"]="Madagascar",["Emoji"]="🇲🇬"},["TW"]={["Name"]="Taiwan",["Emoji"]="🇹🇼"},["GG"]={["Name"]="Guernsey",["Emoji"]="🇬🇬"},["YT"]={["Name"]="Mayotte",["Emoji"]="🇾🇹"},["ME"]={["Name"]="Montenegro",["Emoji"]="🇲🇪"},["TG"]={["Name"]="Togo",["Emoji"]="🇹🇬"},["SG"]={["Name"]="Singapore",["Emoji"]="🇸🇬"},["VG"]={["Name"]="BritishVirginIslands",["Emoji"]="🇻🇬"},["UG"]={["Name"]="Uganda",["Emoji"]="🇺🇬"},["PG"]={["Name"]="PapuaNewGuinea",["Emoji"]="🇵🇬"},["GB"]={["Name"]="UnitedKingdom",["Emoji"]="🇬🇧"},["GN"]={["Name"]="Guinea",["Emoji"]="🇬🇳"},["KP"]={["Emoji"]="🇰🇵",["Name"]="NorthKorea",["Language"]="Korean"},["RO"]={["Name"]="Romania",["Emoji"]="🇷🇴"},["GW"]={["Name"]="Guinea-Bissau",["Emoji"]="🇬🇼"},["TO"]={["Name"]="Tonga",["Emoji"]="🇹🇴"},["SO"]={["Name"]="Somalia",["Emoji"]="🇸🇴"},["NO"]={["Name"]="Norway",["Emoji"]="🇳🇴"},["MO"]={["Name"]="MacauSARChina",["Emoji"]="🇲🇴"},["AE"]={["Name"]="UnitedArabEmirates",["Emoji"]="🇦🇪"},["MF"]={["Name"]="St.Martin",["Emoji"]="🇲🇫"},["GY"]={["Name"]="Guyana",["Emoji"]="🇬🇾"},["WF"]={["Name"]="Wallis & Futuna",["Emoji"]="🇼🇫"},["IL"]={["Name"]="Israel",["Emoji"]="🇮🇱"},["PT"]={["Emoji"]="🇵🇹",["Name"]="Portugal",["Language"]="Portuguese"},["AD"]={["Name"]="Andorra",["Emoji"]="🇦🇩"},["BD"]={["Name"]="Bangladesh",["Emoji"]="🇧🇩"},["MA"]={["Name"]="Morocco",["Emoji"]="🇲🇦"},["LT"]={["Name"]="Lithuania",["Emoji"]="🇱🇹"},["MD"]={["Name"]="Moldova",["Emoji"]="🇲🇩"},["GD"]={["Name"]="Grenada",["Emoji"]="🇬🇩"},["AL"]={["Name"]="Albania",["Emoji"]="🇦🇱"},["BL"]={["Name"]="St.Barthélemy",["Emoji"]="🇧🇱"},["ID"]={["Name"]="Indonesia",["Emoji"]="🇮🇩"},["HN"]={["Name"]="Honduras",["Emoji"]="🇭🇳"},["ST"]={["Name"]="SãoTomé & Príncipe",["Emoji"]="🇸🇹"},["TT"]={["Name"]="Trinidad & Tobago",["Emoji"]="🇹🇹"},["AT"]={["Name"]="Austria",["Emoji"]="🇦🇹"},["BT"]={["Name"]="Bhutan",["Emoji"]="🇧🇹"},["SD"]={["Name"]="Sudan",["Emoji"]="🇸🇩"},["TD"]={["Name"]="Chad",["Emoji"]="🇹🇩"},["CW"]={["Name"]="Curaçao",["Emoji"]="🇨🇼"},["LR"]={["Name"]="Liberia",["Emoji"]="🇱🇷"},["CU"]={["Name"]="Cuba",["Emoji"]="🇨🇺"},["ZW"]={["Name"]="Zimbabwe",["Emoji"]="🇿🇼"},["SL"]={["Name"]="SierraLeone",["Emoji"]="🇸🇱"},["TL"]={["Name"]="Timor-Leste",["Emoji"]="🇹🇱"},["GT"]={["Name"]="Guatemala",["Emoji"]="🇬🇹"},["HT"]={["Name"]="Haiti",["Emoji"]="🇭🇹"},["ET"]={["Name"]="Ethiopia",["Emoji"]="🇪🇹"},["PL"]={["Name"]="Poland",["Emoji"]="🇵🇱"},["ML"]={["Name"]="Mali",["Emoji"]="🇲🇱"},["NL"]={["Name"]="Netherlands",["Emoji"]="🇳🇱"},["RU"]={["Name"]="Russia",["Emoji"]="🇷🇺"},["EE"]={["Name"]="Estonia",["Emoji"]="🇪🇪"},["DE"]={["Name"]="Germany",["Emoji"]="🇩🇪"},["IM"]={["Name"]="IsleofMan",["Emoji"]="🇮🇲"},["HM"]={["Name"]="Heard & McDonaldIslands",["Emoji"]="🇭🇲"},["MU"]={["Name"]="Mauritius",["Emoji"]="🇲🇺"},["LU"]={["Name"]="Luxembourg",["Emoji"]="🇱🇺"},["TZ"]={["Name"]="Tanzania",["Emoji"]="🇹🇿"},["NE"]={["Name"]="Niger",["Emoji"]="🇳🇪"},["CM"]={["Name"]="Cameroon",["Emoji"]="🇨🇲"},["BM"]={["Name"]="Bermuda",["Emoji"]="🇧🇲"},["KE"]={["Name"]="Kenya",["Emoji"]="🇰🇪"},["JE"]={["Name"]="Jersey",["Emoji"]="🇯🇪"},["IE"]={["Name"]="Ireland",["Emoji"]="🇮🇪"},["AM"]={["Name"]="Armenia",["Emoji"]="🇦🇲"},["GE"]={["Name"]="Georgia",["Emoji"]="🇬🇪"},["VE"]={["Name"]="Venezuela",["Emoji"]="🇻🇪"},["AU"]={["Name"]="Australia",["Emoji"]="🇦🇺"},["ZM"]={["Name"]="Zambia",["Emoji"]="🇿🇲"},["SE"]={["Name"]="Sweden",["Emoji"]="🇸🇪"},["RE"]={["Name"]="Réunion",["Emoji"]="🇷🇪"},["AI"]={["Name"]="Anguilla",["Emoji"]="🇦🇮"},["PE"]={["Name"]="Peru",["Emoji"]="🇵🇪"},["UM"]={["Name"]="U.S.OutlyingIslands",["Emoji"]="🇺🇲"},["TM"]={["Name"]="Turkmenistan",["Emoji"]="🇹🇲"},["SM"]={["Name"]="SanMarino",["Emoji"]="🇸🇲"},["HU"]={["Name"]="Hungary",["Emoji"]="🇭🇺"},["GU"]={["Name"]="Guam",["Emoji"]="🇬🇺"},["PM"]={["Name"]="St.Pierre & Miquelon",["Emoji"]="🇵🇲"},["OM"]={["Name"]="Oman",["Emoji"]="🇴🇲"},["CY"]={["Name"]="Cyprus",["Emoji"]="🇨🇾"},["MM"]={["Name"]="Myanmar(Burma)",["Emoji"]="🇲🇲"},["FJ"]={["Name"]="Fiji",["Emoji"]="🇫🇯"},["MR"]={["Name"]="Mauritania",["Emoji"]="🇲🇷"},["BB"]={["Name"]="Barbados",["Emoji"]="🇧🇧"},["UZ"]={["Name"]="Uzbekistan",["Emoji"]="🇺🇿"},["PR"]={["Name"]="PuertoRico",["Emoji"]="🇵🇷"},["IO"]={["Name"]="BritishIndianOceanTerritory",["Emoji"]="🇮🇴"},["NU"]={["Name"]="Niue",["Emoji"]="🇳🇺"},["SR"]={["Name"]="Suriname",["Emoji"]="🇸🇷"},["TR"]={["Name"]="Turkey",["Emoji"]="🇹🇷"},["KZ"]={["Name"]="Kazakhstan",["Emoji"]="🇰🇿"},["YE"]={["Name"]="Yemen",["Emoji"]="🇾🇪"},["MZ"]={["Name"]="Mozambique",["Emoji"]="🇲🇿"},["BJ"]={["Name"]="Benin",["Emoji"]="🇧🇯"},["AW"]={["Name"]="Aruba",["Emoji"]="🇦🇼"},["DJ"]={["Name"]="Djibouti",["Emoji"]="🇩🇯"},["SZ"]={["Name"]="Swaziland",["Emoji"]="🇸🇿"},["BZ"]={["Name"]="Belize",["Emoji"]="🇧🇿"},["CZ"]={["Name"]="Czechia",["Emoji"]="🇨🇿"},["DZ"]={["Name"]="Algeria",["Emoji"]="🇩🇿"},["SB"]={["Name"]="SolomonIslands",["Emoji"]="🇸🇧"},["BW"]={["Name"]="Botswana",["Emoji"]="🇧🇼"},["AR"]={["Name"]="Argentina",["Emoji"]="🇦🇷"},["BR"]={["Emoji"]="🇧🇷",["Name"]="Brazil",["Language"]="Portuguese"},["CR"]={["Name"]="CostaRica",["Emoji"]="🇨🇷"},["DM"]={["Name"]="Dominica",["Emoji"]="🇩🇲"},["ER"]={["Name"]="Eritrea",["Emoji"]="🇪🇷"},["FR"]={["Name"]="France",["Emoji"]="🇫🇷"},["GR"]={["Name"]="Greece",["Emoji"]="🇬🇷"},["HR"]={["Name"]="Croatia",["Emoji"]="🇭🇷"},["SJ"]={["Name"]="Svalbard & JanMayen",["Emoji"]="🇸🇯"},["TJ"]={["Name"]="Tajikistan",["Emoji"]="🇹🇯"},["KR"]={["Emoji"]="🇰🇷",["Name"]="SouthKorea",["Language"]="Korean"},["XK"]={["Name"]="Kosovo"}}
local function formatTimestamp(timestamp)
    local date = os.date("*t", timestamp)
    return string.format("%04d-%02d-%02d %02d:%02d", date.year, date.month, date.day, date.hour, date.min)
end

-- Function to print the database as an Excel-like tab-separated format
local function printSpreadsheet(database)
    -- Collect the keys and sort them alphabetically
    local keys = {}
    for key, _ in pairs(database) do
        table.insert(keys, key)
    end
    table.sort(keys)

    -- Print the header row (two-letter keys, each spanning 3 columns)
    local header = {}
    local lastupdated = {}
    local players = {}
    for _, key in ipairs(keys) do
        local entry = database[key]
        table.insert(header, countryNames[key].Name.." ["..key.."]\t\t\t")
        table.insert(lastupdated, "Last updated: " .. formatTimestamp(entry.lastupdated) .. "\t\t\t")
        
        -- Print players' information for this key
        for i = 1, 100 do
            local player = entry.players[i]
            if player then
                table.insert(players, string.format("%d%s\t%s\t%d", player[1], key, player[2], player[3]))
            else
                table.insert(players, "\t\t\t")
            end
        end
    end
    
    -- Print header line (first line)
    print(table.concat(header))
    
    -- Print last updated line (second line)
    print(table.concat(lastupdated))
    
    -- Print players' information (next 100 lines)
    for i = 1, 100 do
        local row = {}
        for _, key in ipairs(keys) do
            local entry = database[key]
            local player = entry.players[i]
            if player then
                table.insert(row, string.format("%d\t%s\t%d\t", player[1], player[2], player[3]))
            else
                table.insert(row, "\t\t\t")
            end
        end
        print(table.concat(row))
    end
end
local function printCSV(database)
    -- Collect the keys and sort them alphabetically
    local keys = {}
    for key, _ in pairs(database) do
        table.insert(keys, key)
    end
    table.sort(keys)

    -- Print the header row (two-letter keys, each spanning 3 columns)
    local header = {}
    local lastupdated = {}
    local players = {}
    for _, key in ipairs(keys) do
        local entry = database[key]
        table.insert(header, " ,"..countryNames[key].Name.." ["..key.."],,")
        table.insert(lastupdated, ",Last updated: " .. formatTimestamp(entry.lastupdated) .. ",,")
        
        -- Print players' information for this key
        for i = 1, 100 do
            local player = entry.players[i]
            if player then
                table.insert(players, string.format("%d%s,%s,%d", player[1], key, player[2], player[3]))
            else
                table.insert(players, ",,,")
            end
        end
    end
    
    -- Print header line (first line)
    print(table.concat(header))
    
    -- Print last updated line (second line)
    print(table.concat(lastupdated))
    
    -- Print players' information (next 100 lines)
    for i = 1, 100 do
        local row = {}
        for _, key in ipairs(keys) do
            local entry = database[key]
            local player = entry.players[i]
            if player then
                table.insert(row, string.format("%d,%s,%d,", player[1], player[2], player[3]))
            else
                table.insert(row, ",,,")
            end
        end
        print(table.concat(row))
    end
end
function printJSON(database)
  local JSON = "{\n"
  local keys = {}
    for key, _ in pairs(database) do
        table.insert(keys, key)
    end
    table.sort(keys)

    for _, key in ipairs(keys) do
        JSON = JSON .. "\""..key.."\":{\"players\":["
        local entry = database[key]
        for i = 1, 100 do
            local player = entry.players[i]
            if player and player[3] > 0 then
                JSON = JSON .. "["..player[1]..",\""..player[2].."\","..player[3].."],"
            end
        end
        JSON = JSON:sub(1,JSON:len()-1).."],\"lastupdated\":"..database[key].lastupdated.."},\n"
    end
    JSON = JSON:sub(1,JSON:len()-2).."\n}"
    print(JSON)
end

function compareEntries(old_entry, new_entry, key)
    -- Function to count the number of "Player" entries in the players subtable
    local function countPlayers(entry)
        local playerCount = 0
        for _, player in ipairs(entry["players"]) do
            if player[2] == "Player" then
                playerCount = playerCount + 1
            end
        end
        return playerCount
    end
    
    -- Get the player counts for both old and new entries
    local oldPlayerCount = countPlayers(old_entry)
    local newPlayerCount = countPlayers(new_entry)
    
    -- Print the difference in "Player" counts if they are different
    if oldPlayerCount ~= newPlayerCount then
        print(string.format("Key: %s - Player count difference: %d", key, oldPlayerCount-newPlayerCount))
    else
        --print(string.format("Key: %s - No difference", key))
    end
    
    if oldPlayerCount < newPlayerCount then
        return old_entry
    end
    -- Return the entry with the higher lastupdated value
    if old_entry["lastupdated"] > new_entry["lastupdated"] then
        return old_entry
    else
        print(key.." updated:",math.floor((new_entry["lastupdated"]-old_entry["lastupdated"])/3600).."h")
        return new_entry
    end
end

c3=0 new_countries={} local toPrint=true
function compareDatabases(old_database,new_database)
  local combined = {}
  for i,v in pairs(old_database) do
    if new_database[i] ~= nil then
      local compare = compareEntries(v,new[i],i)
      combined[i] = compare
    else
      combined[i] = v
    end
  end
  for i, v in pairs(new_database) do
    if old_database[i] == nil then
      combined[i] = v
    end
  end
  combined["country"]=nil
  for i,v in pairs(combined) do
    c3=c3+1
    if old_database[i]==nil then table.insert(new_countries,countryNames[i].Name.." ["..i.."]") end
  end
  
  p="{" countries={}
  for i,v in pairs(combined) do table.insert(countries,{i,v}) end
  table.sort(countries,function(a,b) return a[1]<b[1] end)
  for i,v in pairs(countries) do
  p=p.."[\""..v[1].."\"]={[\"players\"]={"
  for rank= 1,100 do
  local plr=v[2].players[rank]
  p=p.."{"..rank..",\""..plr[2].."\","..plr[3].."},"
  end
  p=p.."},[\"lastupdated\"]="..v[2].lastupdated.."},\n"
  end
  p=p.."}"
  if toPrint==true then print(p) end
  return combined
end

---Actions below:

toPrint=true --set to FALSE if only need to print spreadsheet
local newDatabase = compareDatabases(old,new)
--printSpreadsheet(newDatabase)
--printCSV(newDatabase)
--printJSON(newDatabase)

--LATEST REVISION: EM_countries1734789867.915b3

c1=0 for i,v in pairs(old) do c1=c1+1 end print("old count:",c1)
c2=0 for i,v in pairs(new) do c2=c2+1 end print("new count:",c2)
print("union count:",c3)
for i,v in pairs(new_countries) do print("new country: "..v) end
