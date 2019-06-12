
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
end, {help = _U('command_restart')})