RegisterNetEvent('kickPlayer')
AddEventHandler('kickPlayer', function()
	TriggerServerEvent('dropPlayer')
end)