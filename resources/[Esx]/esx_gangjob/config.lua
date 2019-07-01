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

Config.GangStations = {

  Gang = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
     -- { name = 'WEAPON_NIGHTSTICK',       price = 9000 },
    --  { name = 'WEAPON_COMBATPISTOL',     price = 30000 },
     -- { name = 'WEAPON_ASSAULTSMG',       price = 1125000 },
     -- { name = 'WEAPON_ASSAULTRIFLE',     price = 1500000 },
   --   { name = 'WEAPON_PUMPSHOTGUN',      price = 600000 },
     -- { name = 'WEAPON_STUNGUN',          price = 50000 },
     -- { name = 'WEAPON_FLASHLIGHT',       price = 800 },
     -- { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
     -- { name = 'WEAPON_FLAREGUN',         price = 6000 },
 --     { name = 'GADGET_PARACHUTE',        price = 3000 },
	--  { name = 'WEAPON_BAT'		,        price = 3000 },
     -- { name = 'WEAPON_STICKYBOMB',       price = 200000 },
   --   { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
     -- { name = 'WEAPON_FIREWORK',         price = 30000 },
     -- { name = 'WEAPON_GRENADE',          price = 180000 },
     -- { name = 'WEAPON_BZGAS',            price = 120000 },
    --  { name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
  --    { name = 'WEAPON_APPISTOL',         price = 10000 },
  --    { name = 'WEAPON_CARBINERIFLE',     price = 50000 },
   --   { name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    --  { name = 'WEAPON_MINIGUN',          price = 700000 },
     -- { name = 'WEAPON_RAILGUN',          price = 2500000 },
    },

	  AuthorizedVehicles = {
		  { name = 'schafter5',  label = 'Véhicule Civil' },
		  { name = 'Akuma',    label = 'Moto' },
		  { name = 'Granger',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
	  },

    Cloakrooms = {
      { x = -811.810, y = 175.175, z = 76.745 },
    },

    Armories = {
      { x = -803.065, y = 184.802, z = 72.605 },
    },

    Vehicles = {
      {
        Spawner    = { x = -819.400, y = 184.122, z = 72.165 },
        SpawnPoint = { x = -818.212, y = 157.828, z = 70.754 },
        Heading    = 90.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 113.30500793457, y = -3109.3337402344, z = 5.0060696601868 },
        SpawnPoint = { x = 112.94457244873, y = -3102.5942382813, z = 5.0050659179688 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
    { x = -812.15, y = 187.163, z = 72.471 },
      { x = 21.35, y = 543.3, z = 175.027 },
      
    },

    BossActions = {
      { x = -803.122, y = 172.404, z = 72.844 }
    },

  },

}
