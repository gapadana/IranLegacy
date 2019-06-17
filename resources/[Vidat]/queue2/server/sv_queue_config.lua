Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
    ["steam:1100001167d265e"] = 100, -- farhan Admin
    ["steam:11000010b3a30a0"] = 100, -- sina Admin
	["steam:110000114a058a8"] = 85, -- Boz
	["steam:1100001045fbd8f"] = 80, -- parsa
	["steam:1100001197619a3"] = 80, -- Amir
	["steam:110000132ca8f2e"] = 80, -- Mamad
	
--	["steam:11000011ccefbfe"] = 75, -- stiker Admin 4/28

    ["steam:11000011685b145"] = 75, -- sajjad

	["steam:11000010b5a1f6c"] = 75, -- 
	["steam:1100001196679b9"] = 75, -- Zartoshtkabir
	["steam:1100001342a4659"] = 75, -- Mamosh Admin 21/2
	["steam:110000135523857"] = 75, -- haji Admin 21/2
	["steam:11000010f2ace5b"] = 75, --moondanger streamer7/3

    ["steam:11000011a3f0a06"] = 50, --game_over streamer
	["steam:11000013a9176d4"] = 50, --Emo streamer
    ["steam:1100001196679b9"] = 50, --zartosht streamer
	



    ["ip:127.0.0.0"] = 85
}

-- require people to run steam
Config.RequireSteam = false

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 90

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = false

-- how much priority power grace time will give
Config.GracePower = 5

-- how long grace time lasts in seconds
Config.GraceTime = 480

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 30000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Joining...",
    connecting = "\xE2\x8F\xB3Connecting...",
    idrr = "\xE2\x9D\x97[Queue] Error: Couldn't retrieve any of your id's, try restarting.",
    err = "\xE2\x9D\x97[Queue] There was an error",
    pos = "\xF0\x9F\x90\x8CYou are %d/%d in queue \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[Queue] Error: Error adding you to connecting list",
    timedout = "\xE2\x9D\x97[Queue] Error: Timed out?",
    wlonly = "\xE2\x9D\x97[Queue] You must be whitelisted to join this server",
    steam = "\xE2\x9D\x97 [Queue] Error: Steam must be running"
}
