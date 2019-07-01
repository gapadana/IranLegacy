weaponsToRemove = {}
ESX = nil
isDead = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('LootBug:removeWeapon')
AddEventHandler('LootBug:removeWeapon', function(itemName)
	if isDead then
		table.insert(weaponsToRemove, itemName)
	end
end)

AddEventHandler('playerSpawned', function()
	isDead = false
	Citizen.Wait(100)
	for i=1, #weaponsToRemove, 1 do
		TriggerServerEvent('LootBugS:removeWeapon', weaponsToRemove[i])
	end
	weaponsToRemove = {}
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)