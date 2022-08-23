-- Stringtable variable
local stringtable = {{},{},{},{},{},{},{},{},{},{},{},{},{}}

-- Add a key and table of strings to the stringtable
function addString(key, strings)

    if not key or not strings then error("^1Missing required argument(s)") end
    if type(key) ~= "string" or type(strings) ~= "table" then error("^1Incorrect argument type(s)") end

    local k = key:upper()

    -- Go through each language and add the language's string to the stringtable
    for i=1, #stringtable do
        if stringtable[i][k] then error("^1Attempted to override existing string '%s'") end

        if strings[i] then
            stringtable[i][k] = strings[i] and strings[i] or strings[1]
        end
    end
end

-- Localize a key based on the users current language
function localize(key, ...)

    if not key then error("^1Missing required argument(s)") end

    local k = key:upper()

    local language = GetCurrentLanguage() + 1
    local output = string.format("UNDEFINED KEY: '%s'", k)

    -- Get the string from the stringtable
    if stringtable[language][k] then
        output = stringtable[language][k]

    -- If the string doesn't exist in the current language, get the string from the english language
    elseif stringtable[1][k] then
        output = stringtable[1][k]
    end

    -- Add the arguments to the string
    local args = {...}
    if #args > 0 then
        return string.format(output, ...)
    end

    return output
end

-- Export the loocalize function
exports("localize", localize)