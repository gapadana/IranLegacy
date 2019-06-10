DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/576453253303238667/F6BOyBWb9fRnr1LeIz-4Rc9XMKChDxvbQQ4IlEcb8Sb9tuggE7wjm52_aYRLQj0KiTm0'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/576452641962590218/gsNjza0nBHNeqt99TWLdcK4MqZZpu3GmhyMVwiGhIqyIwhXkih2dWiP-LwpDLQs5vvYa'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/576452780156256256/H4JgpjUoKl-_HNhgMsVVKfnlBMRaXo0he6cY8_RLZwg9Ibe4Ewjq3NnnDtE52SbmcrOg'

SystemAvatar = 'https://wiki.fivem.net/w/images/d/db/FiveM-Wiki.png'

UserAvatar = 'https://i.imgur.com/KIcqSYs.png'

SystemName = 'FiveM To Discord'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

