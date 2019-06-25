resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Craft System'

version '1.0.0'

ui_page 'html/ui.html'

server_scripts {
  '@es_extended/locale.lua',
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'@NativeUI/NativeUI.lua',
	'config.lua',
	'client/main.lua',
}

files {
	'html/ui.html',
	'html/style.css',
	'html/iransans.otf',
	'html/main.js',
}
