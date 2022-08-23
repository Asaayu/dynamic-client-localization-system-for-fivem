Citizen.CreateThread(function()
    while true do

        local language = exports.language
        local line1 = language:localize("STR_LANGUAGE_MANAGER_EXAMPLE_LINE1")
        local line2 = language:localize("STR_LANGUAGE_MANAGER_EXAMPLE_LINE2")

        BeginTextCommandDisplayHelp('TWOSTRINGS')
        AddTextComponentSubstringPlayerName(line1)
        AddTextComponentSubstringPlayerName('\n'..line2)
        EndTextCommandDisplayHelp(0, true, true, 1000)

        Wait(1000)
    end
end)