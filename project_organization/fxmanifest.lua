fx_version 'adamant'

game 'gta5'

description 'ORG-JOB'

version 'PF 2.0'

author '!Hexus#2915'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'config.lua',
	'server/*.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/pl.lua',
	'config.lua',
	'client/*.lua',
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
}

dependencies {
	"PolyZone"
}
