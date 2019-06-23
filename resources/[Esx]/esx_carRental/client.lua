rentalTimer = 10 --How often a player should be charged in Minutes
chargeAmount = -1;
selectedZone = nil
haveRentedVehicle = false
rentedVehicle = nil

_menuPool = NativeUI.CreatePool()
menu = NativeUI.CreateMenu("Ejare Khodro", "")
menu2 = NativeUI.CreateMenu("Tahvil Khodro", "")
_menuPool:Add(menu)
_menuPool:Add(menu2)
_menuPool:MouseControlsEnabled(false)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	for zoneKey,zoneValues in pairs(Config.RentLocation)do
		local blip = AddBlipForCoord(zoneValues.Pos.x, zoneValues.Pos.y, zoneValues.Pos.z)

		SetBlipSprite(blip, 326)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 1.0)
		SetBlipColour(blip, 2)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		-- AddTextComponentString(_U('car_dealer'))
		AddTextComponentString('Ejare Mashin')
		EndTextCommandSetBlipName(blip)
		
	end
	
	for zoneKey,zoneValues in pairs(Config.Returns)do
		local blip = AddBlipForCoord(zoneValues.Pos.x, zoneValues.Pos.y, zoneValues.Pos.z)

		SetBlipSprite(blip, 326)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 1.0)
		SetBlipColour(blip, 1)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		-- AddTextComponentString(_U('car_dealer'))
		AddTextComponentString('Tahvil Mashin')
		EndTextCommandSetBlipName(blip)
		
	end
	
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k,v in pairs(Config.RentLocation) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then		
				DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)	
			end
		end
		for k,v in pairs(Config.Returns) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then		
				DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)	
			end
		end
	end
end)

Citizen.CreateThread(function()
	
	local hasAlreadyEnteredMarker = false
	local currentZone = 'none'
	while true do

		Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		
		for k,v in pairs(Config.RentLocation) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = 'rent'
				selectedZone = v
			end
		end
		
		for k,v in pairs(Config.Returns) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x - 1) then
				isInMarker  = true
				currentZone = 'return'
				selectedZone = v
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			if currentZone == 'rent' then
				menu:Visible(true)
			elseif currentZone == 'return' then
				menu2:Visible(true)
			end
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			if currentZone == 'rent' then
				menu:Visible(false)
				currentZone = 'none'
			elseif currentZone == 'return' then
				menu2:Visible(false)
				currentZone = 'none'
			end
		end

	end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

Citizen.CreateThread(function()
	local return1 = NativeUI.CreateItem("Tahvil Khodro", "")
    menu2:AddItem(return1) 
	local return2 = NativeUI.CreateItem("Tahvil Khodro bedoone khodro $10000", "")
    menu2:AddItem(return2)
	menu2:CurrentSelection(0)
    menu2.OnItemSelect = function(sender, item, index)
		if not haveRentedVehicle then
			TriggerEvent("pNotify:SendNotification",{
				text = "<b dir='rtl'>شما ماشینی اجاره نکردید</b>",
				type = "error",
				timeout = (3000),
				layout = "bottomcenter",
				queue = "global"
			})
			return
		end
        if item == return1 then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
				vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
				local plate = GetVehicleNumberPlateText(vehicle)
				local rentedPlate = GetVehicleNumberPlateText(rentedVehicle)
				if plate == rentedPlate then
					rentedVehicle = nil
					haveRentedVehicle = false
					TriggerEvent('VS:RemoveKey', vehicle)
					ESX.Game.DeleteVehicle(vehicle)
					TriggerEvent("pNotify:SendNotification",{
						text = "<b dir='rtl'>ماشین تحویل داده شد</b>",
						type = "success",
						timeout = (3000),
						layout = "bottomcenter",
						queue = "global"
					})
				else
					TriggerEvent("pNotify:SendNotification",{
						text = "<b dir='rtl'>این همان خودروی اجاره ای نیست</b>",
						type = "error",
						timeout = (3000),
						layout = "bottomcenter",
						queue = "global"
					})
				end
			else
				TriggerEvent("pNotify:SendNotification",{
					text = "<b dir='rtl'>داخل خودرو نیستید</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
			end
		elseif item == return2 then	
			TriggerEvent('VS:RemoveKey', rentedVehicle)
			TriggerServerEvent("chargePlayer", 10000)
			rentedVehicle = nil
			haveRentedVehicle = false
			TriggerEvent("pNotify:SendNotification",{
				text = "<b dir='rtl'>خسارت داده شد هزینه 10000$</b>",
				type = "success",
				timeout = (3000),
				layout = "bottomcenter",
				queue = "global"
			})
        end
		menu2:Visible(false)
    end
end)



Citizen.CreateThread(function()
	local vehicleRent = NativeUI.CreateItem("Ejare Mashin - 5000$", "")
    menu:AddItem(vehicleRent) 
	local motorRent = NativeUI.CreateItem("Ejare Motor - 1000$", "")
    menu:AddItem(motorRent)
	local bikeRent = NativeUI.CreateItem("Ejare Docharkhe - 100$", "")
    menu:AddItem(bikeRent)
	menu:CurrentSelection(0)
    menu.OnItemSelect = function(sender, item, index)
		if haveRentedVehicle then
			TriggerEvent("pNotify:SendNotification",{
				text = "<b dir='rtl'>یک ماشین اجاره دارید</b>",
				type = "success",
				timeout = (3000),
				layout = "bottomcenter",
				queue = "global"
			})
			return
		end
        if item == vehicleRent then
			for k,spawnLocation in pairs(selectedZone.SpawnPoint)do
				if not IsAnyVehicleNearPoint(spawnLocation.Pos.x, spawnLocation.Pos.y, spawnLocation.Pos.z, 1.0) then
					ESX.Game.SpawnVehicle("blista2",{
						x=spawnLocation.Pos.x ,
						y=spawnLocation.Pos.y,
						z=spawnLocation.Pos.z + 1											
						},spawnLocation.Heading, function(callback_vehicle)
							SetVehRadioStation(callback_vehicle, "OFF")
							TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
							TriggerEvent('VS:GiveKey', callback_vehicle)
							rentedVehicle = callback_vehicle
						end)
					TriggerEvent("startRental", 5000)
					break
				end
			end
		elseif item == motorRent then
			for k,spawnLocation in pairs(selectedZone.SpawnPoint)do
				if not IsAnyVehicleNearPoint(spawnLocation.Pos.x, spawnLocation.Pos.y, spawnLocation.Pos.z, 1.0) then
					ESX.Game.SpawnVehicle("faggio",{
						x=spawnLocation.Pos.x ,
						y=spawnLocation.Pos.y,
						z=spawnLocation.Pos.z + 1											
						},spawnLocation.Heading, function(callback_vehicle)
							SetVehRadioStation(callback_vehicle, "OFF")
							TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
							TriggerEvent('VS:GiveKey', callback_vehicle)
							rentedVehicle = callback_vehicle
						end)
					TriggerEvent("startRental", 1000)
					break
				end
			end
		elseif item == bikeRent then
			for k,spawnLocation in pairs(selectedZone.SpawnPoint)do
				if not IsAnyVehicleNearPoint(spawnLocation.Pos.x, spawnLocation.Pos.y, spawnLocation.Pos.z, 1.0) then
					ESX.Game.SpawnVehicle("tribike3",{
						x=spawnLocation.Pos.x ,
						y=spawnLocation.Pos.y,
						z=spawnLocation.Pos.z + 1											
						},spawnLocation.Heading, function(callback_vehicle)
							SetVehRadioStation(callback_vehicle, "OFF")
							TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
							rentedVehicle = callback_vehicle
						end)
					TriggerEvent("startRental", 100)
					break
				end
			end
        end
		menu:Visible(false)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
    end
end)

RegisterNetEvent('startRental')
AddEventHandler('startRental', function(price)
	haveRentedVehicle = true
	TriggerServerEvent("chargePlayer", price)
	TriggerEvent("pNotify:SendNotification",{
		text = "<b dir='rtl'>ماشین اجاره شد و مبلغ کم شد"..price.."</b>",
		type = "success",
		timeout = (3000),
		layout = "bottomcenter",
		queue = "global"
	})
	Citizen.CreateThread(function()
		Citizen.Wait(rentalTimer * 60 * 1000)
		while haveRentedVehicle do
			TriggerServerEvent("chargePlayer", price / 10)
			TriggerEvent("pNotify:SendNotification",{
				text = "<b dir='rtl'>هزینه اجاره کم شد "..(price/10).."</b>",
				type = "success",
				timeout = (3000),
				layout = "bottomcenter",
				queue = "global"
			})
			Citizen.Wait(rentalTimer * 60 * 1000)
		end
	end)
end)
