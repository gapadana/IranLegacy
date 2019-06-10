
------
-- InteractSound by Scott
-- Verstion: v0.0.1
------

-- Manifest Version
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
-- DON'T FORGET TO ADD THE SOUND FILES TO THIS!
files({
    'client/html/index.html',
    -- Begin Sound Files Here...
    'client/html/sounds/68.ogg',
    'client/html/sounds/channelx.ogg',
    'client/html/sounds/east_los_fm.ogg',
	'client/html/sounds/radio_los_santos.ogg',
	'client/html/sounds/rebel_radio.ogg',
	'client/html/sounds/soulwax_fm.ogg',
	'client/html/sounds/west_coast_classics.ogg',
	
})
