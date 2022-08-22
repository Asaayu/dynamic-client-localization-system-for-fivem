-- Variables
-- The string table contains all the strings split by index.
local stringtable = {{},{},{},{},{},{},{},{},{},{},{},{},{}}

-- Functions
-- Add a key-strings pair to the stringtable
local function addString(input_key, strings)
    -- Check required input exists
    if not input_key or not strings then
        error("Language manager attempted to add a string without a "..(not input_key and (not strings and "key & strings" or "key") or (not strings and "strings" or "")))
    end

    -- Force the key to uppercase
    local key = input_key:upper()

    -- Check the strings variable is a table
    if type(strings) ~= "table" then
        error("Language manager attempted to add a string with incorrect strings format. Expected: table, got "..type(strings))
    end

    for i=1,13 do
        -- Check the string doesn't already exist
        if stringtable[i][key] then
            error("Language manager attempted to override already existing string '"..key.."'")
        end

        -- Add the string to the stringtable
        if strings[i] then
            -- Add the string to the stringtable or the english stringtable if the string is empty
            stringtable[i][key] = strings[i] and strings[i] or strings[1]

        end
    end
end

-- Localize a key based on the users current language
function localize(key)
    -- Check required input exists
    if not key then
        error("Language manager attempted to localize without a key")
    end

    -- Force the key to uppercase
    local string = key:upper()

    -- Language is zero indexed, increase by one to match the stringtable indexes
    local language = GetCurrentLanguage() + 1

    -- Return the string, if it doesn't exist then try to return the english string as a fall back, if that doesn't exist as well then return the undefined key
    return stringtable[language][string] and stringtable[language][string] or (stringtable[1][string] and stringtable[1][string] or "UNDEFINED KEY: "..string)
end

-- Load the stringtable file and add the strings to the internal stringtable
local stringData = json.decode(LoadResourceFile(GetCurrentResourceName(), "stringtable.json"))

-- Load the data into the stringtable
local i = 0
for key, table in pairs(stringData) do
    local strings = {}

    -- Add the strings to the indexed list of strings
    for language,string  in pairs(table) do
        local lang = language:upper()
        if lang == "EN" then
            strings[1] = string
        elseif lang == "FR" then
            strings[2] = string
        elseif lang == "DE" then
            strings[3] = string
        elseif lang == "IT" then
            strings[4] = string
        elseif lang == "ES" then
            strings[5] = string
        elseif lang == "BR" then
            strings[6] = string
        elseif lang == "PL" then
            strings[7] = string
        elseif lang == "RU" then
            strings[8] = string
        elseif lang == "KR" then
            strings[9] = string
        elseif lang == "TW" then
            strings[10] = string
        elseif lang == "JP" then
            strings[11] = string
        elseif lang == "MX" then
            strings[12] = string
        elseif lang == "CN" then
            strings[13] = string
        end
    end

    addString(key, strings)
    i += 1
end
print(i.." strings loaded from stringtable file")

-- Function exports
exports("localize", localize)