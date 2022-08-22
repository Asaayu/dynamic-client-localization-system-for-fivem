-- Information about this specific resource
name "language"
description "A new dynamic localization system for FiveM that allows individual localization for players based on thier language settings."
version '1.0.0'

-- Scripts that will be run only on the client side
client_scripts {'client/**/*.lua'}

-- Files that will be downloaded by clients
files {'stringtables/*.json'}

-- Stringtable files that will be loaded into the stringtable, does not support wildcards or blob patterns
stringtables {
    'stringtables/stringtable_main.json',
    'stringtables/stringtable_example.json',
}

-- Default resource information
author 'Asaayu'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
