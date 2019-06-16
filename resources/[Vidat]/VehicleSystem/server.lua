
RegisterServerEvent('VS:GiveKeyPlayer')
AddEventHandler('VS:GiveKeyPlayer',
	function(player, plate)
		print(plate)
		TriggerClientEvent('VS:GiveKeyPlate', player, plate)
	end
)

TriggerEvent("es:addGroupCommand", 'adminkey', "mod", function(source, args, user)
	local Source = source
	TriggerClientEvent('VS:GiveAdminKey', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end)

RegisterServerEvent('VS:PlayWithinDistance')
AddEventHandler('VS:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('VS_CL:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
end)