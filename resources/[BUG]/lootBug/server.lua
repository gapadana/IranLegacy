ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("LootBugS:removeWeapon")
AddEventHandler("LootBugS:removeWeapon", function(weapon)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	sourceXPlayer.removeWeapon(weapon)
end)

