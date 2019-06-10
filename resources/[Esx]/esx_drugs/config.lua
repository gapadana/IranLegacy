Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 5.0, y = 5.0, z = 2.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.ShowBlips   = false  --markers visible on the map? (false to hide the markers on the map)

Config.RequiredCopsCoke  = 2
Config.RequiredCopsMeth  = 1
Config.RequiredCopsWeed  = 0
Config.RequiredCopsOpium = 3

Config.TimeToFarm    = 2 * 750
Config.TimeToProcess = 2 * 700
Config.TimeToSell    = 2  * 700

Config.Locale = 'en'

Config.Zones = {
	CokeField =			{x = 1443.4459228516,	y = 6331.8452148438,	z = 23.981897354126,	name = _U('coke_field'),		sprite = 501,	color = 40},
	CokeProcessing =	{x = 2431.982421875,	y = 4970.6796875,	z = 42.34757232666,	name = _U('coke_processing'),	sprite = 478,	color = 40},
	CokeDealer =		{x = 954.07727050781,	y = -1674.6730957031,		z = 30.052242279053,	name = _U('coke_dealer'),		sprite = 500,	color = 40},
	MethField =			{x = 1525.29,	y = 1710.02,	z = 109.00,	name = _U('meth_field'),		sprite = 499,	color = 26},
	MethProcessing =	{x = -1001.41,	y = 4848.00,	z = 274.00,	name = _U('meth_processing'),	sprite = 499,	color = 26},
	MethDealer =		{x = -63.59,	y = -1224.07,	z = 27.76,	name = _U('meth_dealer'),		sprite = 500,	color = 26},
	WeedField =			{x = 2224.16,	y = 5577.14,	z = 52.8,	name = _U('weed_field'),		sprite = 496,	color = 52},
	WeedProcessing =	{x = 91.06,		y = 3750.03,	z = 39.77,	name = _U('weed_processing'),	sprite = 496,	color = 52},
	WeedDealer =		{x = -54.18,	y = -1442.63,	z = 31.06,	name = _U('weed_dealer'),		sprite = 500,	color = 52},
	OpiumField =		{x = 1972.78,	y = 3819.39,	z = 32.50,	name = _U('opium_field'),		sprite = 51,	color = 60},
	OpiumProcessing =	{x = 3615.9650878906,	y = 5024.1938476563,	z = 11.445943832397,	name = _U('opium_processing'),	sprite = 51,	color = 60},
	OpiumDealer =		{x = 2331.08,	y = 2570.22,	z = 45.30,	name = _U('opium_dealer'),		sprite = 500,	color = 60}
}
