Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 5000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 6 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 300 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(341.0, -1397.3, 32.5), heading = 48.5 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(291.6, -613.67, 43.4),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(325.72, -583.02,  43.31) --rais va lebas
		},

		Pharmacies = {
			vector3(342.47,  -585.99, 43.31) --daru
		},

		Vehicles = {
			{
				Spawner = vector3(295.82, -601.22,43.3),
				InsideShop = vector3(293.14, -607.68,43.33),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(291.6, -613.67, 43.4), heading = 227.6, radius = 4.0 },
					{ coords = vector3(291.6, -613.67, 43.4), heading = 227.6, radius = 4.0 },
					{ coords = vector3(291.6, -613.67, 43.4), heading = 227.6, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(349.64, -577.84, 74.16),
				InsideShop = vector3(351.75, -587.44, 74.16),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.75, -587.44, 74.16), heading = 142.7, radius = 10.0 },
					{ coords = vector3(351.75, -587.44, 74.16), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			-- {
				-- From = vector3(298.14, -584.47, 43.26),--dar
				-- To = { coords = vector3(305.77,  -585.32, 43.29), heading = 0.0 },
				-- Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- },

			-- {
				-- From = vector3(300.43, -584.89, 43.29),--kharej
				-- To = { coords = vector3(291.71,  -584.09, 43.13), heading = 0.0 },
				-- Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- },

			{
				From = vector3(309.05, -602.67, 43.29), --bala heli
				To = { coords = vector3(341.27,  -585.15, 74.16), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(339.23, -584.28, 74.16), --pain heli
				To = { coords = vector3(308.29, -600.28, 43.29), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

		--	{
	--			From = vector3(234.5 -1373.7 20.9), --dakhel be parking
	--			To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
	--			Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
	--		},

	--		{
	--			From = vector3(317.9, -1476.1, 28.9), --parking be dakhel
	--			To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
		--		Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
	--		}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 5000}
	},
ambulance = {
		{ model = 'qrv', label = 'Ambulance ', price = 15000}
	},
	doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 4500}
	},
doctor = {
		{ model = 'qrv', label = 'Ambulance ', price = 14500}
	},
	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 3000}
	},
chief_doctor = {
		{ model = 'qrv', label = 'Ambulance ', price = 13000}
	},
	boss = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 2000}
	},
boss = {
		{ model = 'qrv', label = 'Ambulance ', price = 12000}
	}
}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 }
	},

	chief_doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 300000 }
	},

	boss = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }
	}

}
