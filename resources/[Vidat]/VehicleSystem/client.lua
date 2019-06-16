local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local lastVehicle = false
local enterVehiclInProgress = false
local vehicles = {}

local lasttime = false

ESX				= nil
localVehId		= 0

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
end)

-- This will turn off the vehicles that is not for the player
Citizen.CreateThread(function()
	while true do
	
		Citizen.CreateThread(function()
			if not lasttime then
				lasttime = true
				-- print("===================", GetSeatPedIsTryingToEnter(GetPlayerPed(-1)), table.contains(vehicles, GetVehicleNumberPlateText(GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)))), IsPedInAnyVehicle(GetPlayerPed(-1), true), "=============")
				Citizen.Wait(2000)
				lasttime = false
			end
		end)
		
		if GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 and not table.contains(vehicles, GetVehicleNumberPlateText(GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)))) then
			if not lastVehicle and not enterVehiclInProgress then 
				Citizen.CreateThread(function()
					enterVehiclInProgress = true
					entered = false
					while not entered do
						if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
							vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
							if not IsVehicleSeatFree(vehicle, -1) then
								ped = GetPedInVehicleSeat(vehicle, -1)
								if DoesEntityExist(ped) then
									local playerHandle = NetworkGetPlayerIndexFromPed(ped)
									if NetworkIsPlayerActive(playerHandle) then
										if ped == GetPlayerPed(-1) then
											SetVehicleEngineOn(vehicle, false, true, false)
											errorNotify()
											lastVehicle = true
										end
									else
										SetVehicleEngineOn(vehicle, false, true, false)
										errorNotify()
										lastVehicle = true
									end
								else
									SetVehicleEngineOn(vehicle, false, true, false)
									errorNotify()
									lastVehicle = true
								end
							else
								SetVehicleEngineOn(vehicle, false, true, false)
								errorNotify()
								lastVehicle = true
							end
							entered = true
						end
						Citizen.Wait(100)
					end
					enterVehiclInProgress = false
				end)
			end
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) and not table.contains(vehicles, GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true))) then
			SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), true), false, true, false)
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) and table.contains(vehicles, GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true))) then
			if not lastVehicle then
				TriggerEvent("pNotify:SendNotification",{
					text = "<b dir='rtl'>کلید این وسیله نقلیه را دارید!</b>",
					type = "success",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
				lastVehicle = true
			end
		end
		Citizen.Wait(0)	
	end
end)

function errorNotify()
	TriggerEvent("pNotify:SendNotification",{
		text = "<b dir='rtl'>کلید این وسیله نقلیه را ندارید!</b>",
		type = "info",
		timeout = (3000),
		layout = "bottomcenter",
		queue = "global"
	})
end

RegisterNetEvent("VS:GiveAdminKey")
AddEventHandler("VS:GiveAdminKey", function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), true) and not table.contains(vehicles, GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true))) then
		TriggerEvent('VS:GiveKeyPlate', GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), true)))
	end
end)

RegisterNetEvent("VS:GiveKey")
AddEventHandler("VS:GiveKey", function(vehicle)
	local plate = GetVehicleNumberPlateText(vehicle)
	table.insert(vehicles, {plate, 1})
	TriggerEvent("pNotify:SendNotification",{
		text = "<b style='color:#CA5A65' dir='rtl'>".."کلید ماشین با پلاک "..plate.." را دریافت کردید".."</b>",
		type = "error",
		timeout = (3000),
		layout = "bottomcenter",
		queue = "global"
	})
end)

RegisterNetEvent("VS:RemoveKey")
AddEventHandler("VS:RemoveKey", function(vehicle)
	local plate = GetVehicleNumberPlateText(vehicle)
	table.removeObject(vehicles, plate)
end)

RegisterNetEvent("VS:GiveKeyPlate")
AddEventHandler("VS:GiveKeyPlate", function(plate)
	table.insert(vehicles, {plate, 1})
	TriggerEvent("pNotify:SendNotification",{
		text = "<b style='color:#CA5A65' dir='rtl'>".."کلید ماشین با پلاک "..plate.." را دریافت کردید".."</b>",
		type = "error",
		timeout = (3000),
		layout = "bottomcenter",
		queue = "global"
	})
end)

RegisterNetEvent("VS:GiveKeyToPlayer")
AddEventHandler("VS:GiveKeyToPlayer", function(player)

	local ply = GetPlayerPed(-1)
	local pos = GetEntityCoords(ply)
	local vehicle = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 5.001, 0, 71)
	isInside = false
	if vehicle == 0 then
		vehicle = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 5.001, 0, 12294)
	end
	
	if(IsPedInAnyVehicle(ply, true))then
		TriggerEvent("pNotify:SendNotification",{
			text = "<b dir='rtl'>باید بیرون ماشین باشید</b>",
			type = "info",
			timeout = (3000),
			layout = "bottomcenter",
			queue = "global"
		})
	else
		if vehicle ~= 0 then
			local plate = GetVehicleNumberPlateText(vehicle)
			if table.contains(vehicles, plate)  then
				TriggerServerEvent('VS:GiveKeyPlayer', player, plate)
				table.removeObject(vehicles, plate)
				TriggerEvent("pNotify:SendNotification",{
					text = "<b style='color:#CA5A65' dir='rtl'>".."کلید ماشین با پلاک "..plate.." را به یک پلیر دادید".."</b>",
					type = "error",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
			else
				TriggerEvent("pNotify:SendNotification",{
					text = "<b dir='rtl'>باید نزدیک ماشین خودتان باشید</b>",
					type = "info",
					timeout = (3000),
					layout = "bottomcenter",
					queue = "global"
				})
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		if IsControlJustReleased(1, Keys["DELETE"]) and IsInputDisabled(0)  then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
				local plate = GetVehicleNumberPlateText(vehicle)
				if table.contains(vehicles, plate) then
					if not GetIsVehicleEngineRunning(vehicle) then 
						SetVehicleEngineOn(vehicle, true, true, false)
					else
						SetVehicleEngineOn(vehicle, false, true, false)
					end
				else
					TriggerEvent("pNotify:SendNotification",{
						text = "<b style='color:#CA5A65' dir='rtl'>کلید این وسیله نقلیه را ندارید!</b>",
						type = "error",
						timeout = (3000),
						layout = "bottomcenter",
						queue = "global"
					})
				end
			end
			Citizen.Wait(1000)
		end
		
		Citizen.Wait(10)
	end
end)

Citizen.CreateThread(function()
	while true do 
		if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			lastVehicle = false
		end
		Citizen.Wait(1000)
	end
end)

function table.contains(table, element)
  for _, value in pairs(table) do 
    if value[1] == element then
		return true
    end
  end
  return false
end

function table.removeObject(choosen, element)
  for i, value in pairs(choosen) do 
    if value[1] == element then
		table.remove(choosen, i)
    end
  end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if IsControlJustReleased(0, 303) then
			doLockSystemToggleLocks()
			Citizen.Wait(300)
		end
	end
end)

function doLockSystemToggleLocks()
	-- Init player infos
	local ply = GetPlayerPed(-1)
	local pos = GetEntityCoords(ply)
	local vehicle = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 5.001, 0, 71)
	isInside = false
	if vehicle == 0 then
		vehicle = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 5.001, 0, 12294)
	end
	
	-- Retrieve the local ID of the targeted vehicle
	if(IsPedInAnyVehicle(ply, true))then
		-- by sitting inside him
		localVehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		isInside = true
	else
		if (vehicle ~= 0) then	
			localVehId = vehicle
			savedVehicle = vehicle
		elseif (vehicle ~= 0) and (savedVehicle == vehicle) then
			localVehId = vehicle	
		elseif (vehicle == 0) then
			localVehId = savedVehicle
		end
	end
		
	-- Get targeted vehicle infos
	if(localVehId and localVehId ~= 0)then
		local localVehPlateTest = GetVehicleNumberPlateText(localVehId)
		if localVehPlateTest ~= nil then
			if table.contains(vehicles, localVehPlateTest) then
				local localVehLockStatus = GetVehicleDoorLockStatus(localVehId)
				if(time > timer)then
					if(IsPedInAnyVehicle(ply, true))then
						if localVehLockStatus < 2 then
							SetVehicleDoorsLocked(localVehId, 2)
							-- SetVehicleDoorsLockedForAllPlayers(localVehId, 1)
							TriggerEvent("pNotify:SendNotification",{
								text = "<b style='color:#CA5A65' dir='rtl'>".."ماشین قفل شد".."</b>",
								type = "error",
								timeout = (3000),
								layout = "bottomcenter",
								queue = "global"
							})
							TriggerServerEvent("VS:PlayWithinDistance", 10, "lock", 0.5)
							time = 0
						elseif localVehLockStatus >= 2 then
							SetVehicleDoorsLocked(localVehId, 1)
							-- SetVehicleDoorsLockedForAllPlayers(localVehId, false)
							TriggerEvent("pNotify:SendNotification",{
								text = "<b style='color:#CA5A65' dir='rtl'>".."ماشین باز شد".."</b>",
								type = "error",
								timeout = (3000),
								layout = "bottomcenter",
								queue = "global"
							})
							TriggerServerEvent("VS:PlayWithinDistance", 10, "unlock", 0.5)
							time = 0
						end
					else
						if localVehLockStatus < 2 then
						
							local lib = "anim@mp_player_intmenu@key_fob@"
							local anim = "fob_click"
	
							ESX.Streaming.RequestAnimDict(lib, function()
								TaskPlayAnim(ply, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
							end)

							Wait(250)
							SetVehicleDoorsLocked(localVehId, 2)
							SetVehicleDoorsLockedForAllPlayers(localVehId, 1)
							TriggerEvent("pNotify:SendNotification",{
								text = "<b style='color:#CA5A65' dir='rtl'>".."ماشین قفل شد".."</b>",
								type = "error",
								timeout = (3000),
								layout = "bottomcenter",
								queue = "global"
							})
							TriggerServerEvent("VS:PlayWithinDistance", 10, "lock2", 0.5)
							time = 0
						elseif localVehLockStatus >= 2 then
						
							local lib = "anim@mp_player_intmenu@key_fob@"
							local anim = "fob_click"
		
							ESX.Streaming.RequestAnimDict(lib, function()
								TaskPlayAnim(ply, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
							end)

							Wait(250)
						
							SetVehicleDoorsLocked(localVehId, 1)
							SetVehicleDoorsLockedForAllPlayers(localVehId, false)
							TriggerEvent("pNotify:SendNotification",{
								text = "<b style='color:#CA5A65' dir='rtl'>".."ماشین باز شد".."</b>",
								type = "error",
								timeout = (3000),
								layout = "bottomcenter",
								queue = "global"
							})
							TriggerServerEvent("VS:PlayWithinDistance", 10, "lock2", 0.5)
							time = 0
						end
					end					
				end
			else
				errorNotify()
			end
			
		else
			errorNotify()
		end
	end
end

RegisterNetEvent('VS_CL:PlayWithinDistance')
AddEventHandler('VS_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(localVehId, false)
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
	local farSound
    if(distIs < maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
	elseif distIs >= maxDistance and distIs < 15.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.25
        })
	elseif distIs >= 15.0 and distIs < 30.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.15
        })
	elseif distIs >= 30.0 and distIs < 50.0 then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = 0.05
        })
    end
end)

Citizen.CreateThread(function()
    timer = 2 * 1000
    time = 0
	while true do
		Wait(1000)
		time = time + 1000
	end
end)

