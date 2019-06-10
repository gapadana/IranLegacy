
RegisterServerEvent('VS:GiveKeyPlayer')
AddEventHandler('VS:GiveKeyPlayer',
	function(player, plate)
		print(plate)
		TriggerClientEvent('VS:GiveKeyPlate', player, plate)
	end
)