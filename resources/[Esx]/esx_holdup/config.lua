Config = {}
Config.Locale = 'en'

Config.PoliceNumberRequired = 1
Config.TimerBeforeNewRob = 1800 -- seconds

Config.MaxDistance    = 10 -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead.

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(10000, 35000),
		nameofstore = "24/7. (Paleto Bay)",
		secondsRemaining = 350, -- seconds
		lastrobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(10000, 20000),
		nameofstore = "24/7. (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastrobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(10000, 20000),
		nameofstore = "24/7. (Little Seoul)",
		secondsRemaining = 200, -- seconds
		lastrobbed = 0
	},
	["upperjail_supermarket"] = {
		position =  {x = 2673.45, y = 3286.22, z = 54.54 },
		reward = math.random(10000, 25000),
		nameofstore = "24/7. (upper Jail supermarket)",
		secondsRemaining = 350, -- seconds
		lastrobbed = 0
	},
	["leftjail_supermarket"] = {
		position =  {x = 546.33, y = 2663.5, z = 41.56},
		reward = math.random(10000, 25000),
		nameofstore = "24/7. (left Jail supermarket)",
		secondsRemaining = 350, -- seconds
		lastrobbed = 0
	},
	["farm_supermarket"] = {
		position =  {x = 1707.19, y = 4919.72, z = 41.5},
		reward = math.random(10000, 20000),
		nameofstore = "24/7. (farm supermarket)",
		secondsRemaining = 350, -- seconds
		lastrobbed = 0
	},
	["mili_supermarket"] = {
		position =  {x = -1828.55, y = 799.3, z = 137.34},
		reward = math.random(10000, 20000),
		nameofstore = "24/7. (military supermarket)",
		secondsRemaining = 300, -- seconds
		lastrobbed = 0
	},
	["ocean_liquor"] = {
		position = { x = -3047.11, y = 585.8, z = 7.0 },
		reward = math.random(10000, 30000),
		nameofstore = "Robs Liquor. (Great Ocean Highway)",
		secondsRemaining = 200, -- seconds
		lastrobbed = 0
	},
	["vinewood"] = {
		position = { x = 377.92, y = 332.43, z = 102.75 },
		reward = math.random(10000, 35000),
		nameofstore = "vinewood Supermarket",
		secondsRemaining = 200, -- seconds
		lastrobbed = 0
	},
	["central"] = {
		position = { x = 28.23, y = -1339.97, z = 28.67 },
		reward = math.random(20000, 50000),
		nameofstore = "Central Supermarket",
		secondsRemaining = 200, -- seconds
		lastrobbed = 0
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(10000, 15000),
		nameofstore = "LTD Gasoline. (Grove Street)",
		secondsRemaining = 200, -- seconds
		lastrobbed = 0
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(10000, 15000),
		nameofstore = "LTD Gasoline. (Mirror Park Boulevard)",
		secondsRemaining = 200, -- seconds
		lastrobbed = 0
	}
}
