resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script {
	'@NativeUI/NativeUI.lua',
	'config.lua',
	'client.lua'
}


server_script { 'config.lua' }
server_script { 'server.lua' }