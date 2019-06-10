local oldModel = nil
local oldPlate = nil

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
	playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, true) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
		vehicleModel = GetEntityModel(vehicle)
		newPlate = GetVehicleNumberPlateText(vehicle)
		if oldModel == nil then
			oldPlate = newPlate
			oldModel = vehicleModel
		elseif newPlate ~= oldPlate then
			oldPlate = newPlate
			oldModel = vehicleModel
		else
			if oldModel ~= vehicleModel and oldPlate == newPlate then
				TriggerServerEvent("anticheat:ban", "Cheating")
			end
		end
	end
  end
end)


RegisterNetEvent('showVehicleModel')
AddEventHandler('showVehicleModel', function()
	playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, true) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
		vehicleModel = GetEntityModel(vehicle)
		print(vehicleModel)
	end
end)