RegisterServerEvent("anticheat:ban")
AddEventHandler("anticheat:ban", function(reason)
	TriggerEvent("banCheater", source,"Cheating")
end)

TriggerEvent("es:addGroupCommand", 'carmodel', "admin", function(source, args, user)
	local Source = source
	TriggerClientEvent('showVehicleModel', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = "show car model"})