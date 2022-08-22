-- Information about this specific resource
name "language"
description "A new dynamic localization system for FiveM that allows individual localization for players based on thier language settings."
version '1.0.0'

-- Scripts that will be run both client side and server side
shared_scripts {
    'shared/**/*.lua'
}

-- Scripts that will be run only on the client side
client_scripts {
    'client/**/*.lua'
}

-- Scripts that will be run only on the server side
server_scripts {
    'server/**/*.lua'
}

-- Files that will be downloaded by clients
files {'stringtable.json'}

-- Default resource information
author 'Asaayu'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
