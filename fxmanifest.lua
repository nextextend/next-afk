fx_version 'adamant'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name 'next-afk'
author 'The Next Team | discord.nextextend.com'
description 'A clean, well-optimized and standalone afk system for FiveM.'
version '1.0.0'

client_scripts { 'src/client/main.lua' }
server_scripts { 'src/server/main.lua', '@oxmysql/lib/MySQL.lua' }
shared_scripts { '@ox_lib/init.lua' }
files { 'config/**/*.lua', 'locales/**/*.json' }