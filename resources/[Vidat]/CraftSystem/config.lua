Config                            = {}
Config.Locale                     = 'en'

Config.Items = {

	[1] = {
		
		name = 'metal_spring',
		crafttime = 10,
		weapon = false,
		Needs = {
			{name = 'metal_hq', count = 5},
			{name = 'copper', count = 5}
		},
		Jobs = {
			{name = 'miner'},
		},
		chance = 0.7
		
	},
	
	[2] = {
		
		name = 'metal_sheet',
		crafttime = 5,
		weapon = false,
		Needs = {
			{name = 'iron', count = 2}
		},
		Jobs = {
			{name = 'miner'},
		},
		chance = 0.9
		
	},
	
	[3] = {
		
		name = 'metal_hq',
		crafttime = 10,
		weapon = false,
		Needs = {
			{name = 'iron', count = 10},
			{name = 'gold', count = 1}
		},
		Jobs = {
			{name = 'miner'},
		},
		chance = 0.5
		
	},
   
	[4] = {
		
		name = 'gear',
		crafttime = 10,
		weapon = false,
		Needs = {
			{name = 'metal_hq', count = 5},
			{name = 'copper', count = 5},
			{name = 'gold', count = 1}
		},
		Jobs = {
			{name = 'miner'},
		},
		chance = 0.6
		
	},
   
	[5] = {
		
		name = 'metal_pipe',
		crafttime = 5,
		weapon = false,
		Needs = {
			{name = 'metal_hq', count = 5},
			{name = 'copper', count = 5},
		},
		Jobs = {
			{name = 'miner'},
		},
		chance = 0.6
		
	},
   
	[6] = {
		
		name = 'metal_blade',
		crafttime = 5,
		weapon = false,
		Needs = {
			{name = 'metal_hq', count = 5},
			{name = 'metal_sheet', count = 2}
		},
		Jobs = {
			{name = 'miner'},
		},
		chance = 0.6
		
	},
   
	[7] = {
		
		name = 'drill',
		crafttime = 30,
		weapon = false,
		Needs = {
			{name = 'metal_hq', count = 5},
			{name = 'metal_blade', count = 5},
			{name = 'metal_spring', count = 2},
			{name = 'gear', count = 2},
			{name = 'metal_pipe', count = 3},
			{name = 'metal_sheet', count = 3},
			{name = 'diamond', count = 1},
		},
		Jobs = {
			{name = 'miner'},
		},
		chance = 0.1
		
	},
	
	[8] = {
		
		name = 'leather',
		crafttime = 5,
		weapon = false,
		Needs = {
			{name = 'fabric', count = 10},
			{name = 'wool', count = 10},
		},
		Jobs = {
			{name = 'tailor'},
		},
		chance = 0.6
		
	},
	
	[9] = {
		
		name = 'rope',
		crafttime = 5,
		weapon = false,
		Needs = {
			{name = 'fabric', count = 10}
		},
		Jobs = {
			{name = 'tailor'},
		},
		chance = 0.9
		
	},
	
	[10] = {
		
		name = 'glue_hq',
		crafttime = 10,
		weapon = false,
		Needs = {
			{name = 'petrol_raffin', count = 2}
		},
		Jobs = {
			{name = 'fueler'},
		},
		chance = 0.1
		
	},
	
	[11] = {
		
		name = 'glue_lq',
		crafttime = 5,
		weapon = false,
		Needs = {
			{name = 'petrol', count = 1}
		},
		Jobs = {
			{name = 'fueler'},
		},
		chance = 0.5
		
	},
	
	[12] = {
		
		name = 'sewingkit',
		crafttime = 10,
		weapon = false,
		Needs = {
			{name = 'fabric', count = 10},
			{name = 'rope', count = 5},
			{name = 'metal_blade', count = 1},
		},
		Jobs = {
			{name = 'tailor'},
		},
		chance = 0.4
		
	},
	
	[13] = {
		
		name = 'bandage',
		crafttime = 10,
		weapon = false,
		Needs = {
			{name = 'fabric', count = 5},
			{name = 'sewingkit', count = 1},
			{name = 'glue_lq', count = 1},
		},
		Jobs = {
			{name = 'ambulance'},
			{name = 'tailor'},
		},
		chance = 0.6
		
	},
	
	[14] = {
		
		name = 'rifle_body',
		crafttime = 20,
		weapon = false,
		Needs = {
			{name = 'metal_pipe', count = 6},
			{name = 'metal_hq', count = 3},
			{name = 'metal_sheet', count = 3},
			{name = 'glue_hq', count = 2},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
		},
		chance = 0.3
		
	},
	
	[15] = {
		
		name = 'smg_body',
		crafttime = 20,
		weapon = false,
		Needs = {
			{name = 'metal_pipe', count = 4},
			{name = 'metal_hq', count = 2},
			{name = 'metal_sheet', count = 2},
			{name = 'glue_hq', count = 1},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.5
		
	},
	
	[16] = {
		
		name = 'semi_body',
		crafttime = 20,
		weapon = false,
		Needs = {
			{name = 'metal_pipe', count = 1},
			{name = 'cutted_wood', count = 10},
			{name = 'metal_sheet', count = 1},
			{name = 'glue_lq', count = 1},
			{name = 'fabric', count = 5},
			{name = 'rope', count = 1},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.7
		
	},
	
	[17] = {
		
		name = 'WEAPON_COMBATPISTOL',
		crafttime = 45,
		weapon = true,
		Needs = {
			{name = 'semi_body', count = 1},
			{name = 'metal_hq', count = 2},
			{name = 'metal_sheet', count = 2},
			{name = 'glue_lq', count = 2},
			{name = 'gear', count = 1},
			{name = 'metal_spring', count = 1},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.8
		
	},
	
	[18] = {
		
		name = 'WEAPON_PISTOL',
		crafttime = 45,
		weapon = true,
		Needs = {
			{name = 'semi_body', count = 2},
			{name = 'metal_hq', count = 3},
			{name = 'metal_sheet', count = 2},
			{name = 'glue_lq', count = 2},
			{name = 'gear', count = 1},
			{name = 'metal_spring', count = 1},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.7
		
	},
	
	[19] = {
		
		name = 'WEAPON_PISTOL50',
		crafttime = 60,
		weapon = true,
		Needs = {
			{name = 'semi_body', count = 3},
			{name = 'metal_hq', count = 3},
			{name = 'metal_sheet', count = 2},
			{name = 'glue_hq', count = 2},
			{name = 'gear', count = 2},
			{name = 'metal_spring', count = 2},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.3
		
	},
	
	[20] = {
		
		name = 'WEAPON_REVOLVER',
		crafttime = 60,
		weapon = true,
		Needs = {
			{name = 'semi_body', count = 3},
			{name = 'metal_hq', count = 3},
			{name = 'metal_sheet', count = 2},
			{name = 'glue_hq', count = 2},
			{name = 'gear', count = 2},
			{name = 'metal_spring', count = 2},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.6
		
	},
	
	[21] = {
		
		name = 'WEAPON_APPISTOL',
		crafttime = 75,
		weapon = true,
		Needs = {
			{name = 'smg_body', count = 3},
			{name = 'metal_hq', count = 2},
			{name = 'metal_sheet', count = 2},
			{name = 'glue_hq', count = 2},
			{name = 'gear', count = 2},
			{name = 'metal_spring', count = 2},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.4
		
	},
	
	[22] = {
		
		name = 'WEAPON_MICROSMG',
		crafttime = 75,
		weapon = true,
		Needs = {
			{name = 'smg_body', count = 4},
			{name = 'metal_hq', count = 2},
			{name = 'metal_sheet', count = 2},
			{name = 'glue_hq', count = 3},
			{name = 'gear', count = 2},
			{name = 'metal_spring', count = 2},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.3
		
	},
	
	[23] = {
		
		name = 'WEAPON_ASSAULTRIFLE',
		crafttime = 90,
		weapon = true,
		Needs = {
			{name = 'rifle_body', count = 2},
			{name = 'metal_hq', count = 2},
			{name = 'metal_sheet', count = 2},
			{name = 'glue_hq', count = 2},
			{name = 'gear', count = 2},
			{name = 'metal_spring', count = 2},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.2
		
	},
	
	[24] = {
		
		name = 'WEAPON_BULLPUPRIFLE',
		crafttime = 90,
		weapon = true,
		Needs = {
			{name = 'rifle_body', count = 4},
			{name = 'metal_hq', count = 3},
			{name = 'metal_sheet', count = 3},
			{name = 'glue_hq', count = 3},
			{name = 'gear', count = 3},
			{name = 'metal_spring', count = 3},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.1
		
	},
	
	[25] = {
		
		name = 'WEAPON_SPECIALCARBINE',
		crafttime = 90,
		weapon = true,
		Needs = {
			{name = 'rifle_body', count = 5},
			{name = 'metal_hq', count = 4},
			{name = 'metal_sheet', count = 3},
			{name = 'glue_hq', count = 4},
			{name = 'gear', count = 3},
			{name = 'metal_spring', count = 3},
		},
		Jobs = {
			{name = 'fbi'},
			{name = 'gang'},
			{name = 'mafia'},
			{name = 'mafia2'},
			{name = 'cartel'},
			{name = 'police'},
			{name = 'securiter'},
			{name = 'biker'},
		},
		chance = 0.1
		
	},
	
}
