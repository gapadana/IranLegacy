ESX = nil
local hasGPS = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

	for i=1, #PlayerData.inventory, 1 do
		if PlayerData.inventory[i].name == 'gps' then
			if PlayerData.inventory[i].count > 0 then
				hasGPS = true
			end
		end
	end

end)

RegisterNetEvent('esx_gps:addGPS')
AddEventHandler('esx_gps:addGPS', function()
	hasGPS = true
end)

RegisterNetEvent('esx_gps:removeGPS')
AddEventHandler('esx_gps:removeGPS', function()
	hasGPS = false
end)

Citizen.CreateThread(function()

	while true do
		if hasGPS then
			Citizen.Wait(100)
			playerPed = GetPlayerPed(-1)
			if IsPedInAnyVehicle(playerPed, true) then
				vehicle = GetVehiclePedIsIn(playerPed, false)
				if IsVehicleEngineOn(vehicle) then
					DisplayRadar(true)
				else
					DisplayRadar(false)
				end
			else
				DisplayRadar(false)
			end
		else
			DisplayRadar(false)
			Citizen.Wait(1000)
		end
	end
	
end)