resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Auto restart system'

version '1.0.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fa.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fa.lua',
	'config.lua',
	'client.lua'
}

-- dependency 'es_extended'