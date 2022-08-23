
local resource = GetCurrentResourceName()
local count, num = 0, GetNumResourceMetadata(resource, "stringtable")
local langTable = {["EN"]=1,["FR"]=2,["DE"]=3,["IT"]=4,["ES"]=5,["BR"]=6,["PL"]=7,["RU"]=8,["KR"]=9,["TW"]=10,["JP"]=11,["MX"]=12,["CN"]=13}

for i=0, num-1 do
    local file = GetResourceMetadata(resource, "stringtable", i)
    local data = json.decode(LoadResourceFile(resource, file))

    if not data then error(string.format("^1Failed to load stringtable file: %s", file)) end

    for key, table in pairs(data) do
        local strings = {}

        -- Add the strings to the indexed list of strings
        for language, string in pairs(table) do strings[langTable[language:upper()]] = string end

        addString(key, strings)
        count += 1
    end
end

print("^2"..localize("STR_LANGUAGE_MANAGER_LOADED_MESSAGE", num, count))