ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
	
	ESX.RegisterServerCallback(
		"CS:DoesHaveNeededItems",
		function(source, cb, target, needs)
			local xPlayer = ESX.GetPlayerFromId(target)
			local result = true

			if xPlayer ~= nil then
				for _,item in pairs(needs) do
					local itemInv = xPlayer.getInventoryItem(item.name)
					if itemInv == nil or itemInv.count < item.count then
						result = false
						break
					end
				end
				if not result then 
					cb(false)
				else
					cb(true)
				end
			else
				cb(false)
			end
		end
	)
		
end)

RegisterServerEvent('CS:GetItemsData')
AddEventHandler('CS:GetItemsData', function()
	_source = source
	TriggerClientEvent('CS:SetItemsData', _source, ESX.Items)
end)

RegisterServerEvent('CS:RemoveItems')
AddEventHandler('CS:RemoveItems', function(item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, count)
end)

RegisterServerEvent('CS:AddItem')
AddEventHandler('CS:AddItem', function(item, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(item, count)
end)

RegisterServerEvent('CS:AddWeapon')
AddEventHandler('CS:AddWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weapon, ammo)
end)


