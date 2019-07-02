Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.CartelStations = {

  Cartel = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      -- { name = 'WEAPON_SAWNOFFSHOTGUN',       price = 9000 },
      -- { name = 'WEAPON_PISTOL50',     price = 30000 },
      -- { name = 'WEAPON_BULLPUPSHOTGUN',       price = 1125000 },
      -- { name = 'WEAPON_COMPACTRIFLE',     price = 1500000 },
     -- { name = 'WEAPON_PUMPSHOTGUN',      price = 600000 },
     -- { name = 'WEAPON_STUNGUN',          price = 50000 },
     -- { name = 'WEAPON_FLASHLIGHT',       price = 800 },
     -- { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
     -- { name = 'WEAPON_FLAREGUN',         price = 6000 },
     -- { name = 'GADGET_PARACHUTE',        price = 3000 },
	 -- { name = 'WEAPON_BAT'		,        price = 3000 },
     -- { name = 'WEAPON_STICKYBOMB',       price = 200000 },
   --   { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
     -- { name = 'WEAPON_FIREWORK',         price = 30000 },
     -- { name = 'WEAPON_GRENADE',          price = 180000 },
     -- { name = 'WEAPON_BZGAS',            price = 120000 },
    --  { name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
      --{ name = 'WEAPON_APPISTOL',         price = 70000 },
      --{ name = 'WEAPON_CARBINERIFLE',     price = 1100000 },
   --   { name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    --  { name = 'WEAPON_MINIGUN',          price = 700000 },
     -- { name = 'WEAPON_RAILGUN',          price = 2500000 },
    },

	AuthorizedVehicles = {
		  { name = 'g500',  label = 'Benz G500' },
		  { name = 'Manchez',    label = 'Moto' },
		  { name = 'trhawk',   label = 'JEEP' },
		  { name = 'cls63',      label = 'Mersedes Benz' },
		  { name = 'guardian',      label = 'Guardian' },
	},
	
	AuthorizedBoats = {
		  { name = 'seashark',  label = 'Jet 1' },
		  { name = 'seashark2',    label = 'Jet 2' },
		  { name = 'seashark3',   label = 'Jet 3' },
		  { name = 'squalo',      label = 'squalo' },
	},

    Cloakrooms = {
      { x = 1665.06, y = -0.17, z = 165.08},
    },

    Armories = {
      { x = 1662.84, y = -25.72, z = 172.76},
    },

    Vehicles = {
      {
        Spawner    = { x = 1667.58, y = -62.61, z = 173.1 },
        SpawnPoint = { x = 1670.79, y = -63.42, z = 172.78 },
        Heading    = 254.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 1697.16, y = -10.13, z = 161.53 },
        SpawnPoint = { x = 1708.03, y = -6.85, z = 163.5 },
        Heading    = 196.5,
      }
    },
	
	Boats = {
		{
			Spawner    = { x = 1682.52, y = 40.8, z = 160.74 },
			SpawnPoint = {x = 1686.94, y = 37.230000000001, z = 160.5 },
			Heading    = 272.0,
		}
	},

    VehicleDeleters = {
      { x = 1660.59, y = -75.15, z = 171.47 },
	  {x = 1679.9, y = 35.820000000001, z = 160.5 },
      
    },

    BossActions = {
      { x = 1671.34, y = -28.19, z = 177.27 },
    },
	
	Teleport = {
		{
			Source = {x = 1671.84, y = -26.24, z = 172.73, h = 100.0},
			Destination= {x = 1669.88, y = -22.82, z = 177.28, h = 191.0}
		}
	},

  },

}
