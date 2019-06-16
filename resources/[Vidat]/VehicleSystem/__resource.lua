resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Total vehicle system that controlls engins, and lock'	-- Resource Description

dependency "pNotify"

server_script {								-- Server Scripts
	-- 'config.lua',
	'server.lua',
}

client_script {								-- Client Scripts
	-- 'config.lua',
	'client.lua',
}


ui_page 'html/index.html'

files {
    'html/index.html',
    'html/sounds/lock.ogg',
    'html/sounds/unlock.ogg',
	'html/sounds/lock2.ogg',
	'html/sounds/unlock2.ogg'
}