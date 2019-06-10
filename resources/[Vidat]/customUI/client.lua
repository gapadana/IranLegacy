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

ESX = nil
local isTalking = false
local inVehicle = false
local PlayerData = {}
local preHealth = 200
local IsPaused = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	TriggerEvent('es:setMoneyDisplay', 0.0)
	ESX.UI.HUD.SetDisplay(0.0)
	
	-- Updates the UI on start
	NetworkSetTalkerProximity(10.0)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	PlayerData = ESX.GetPlayerData()
	local accounts = PlayerData.accounts
	-- for k,v in pairs(accounts) do
		-- local account = v
		-- if account.name == "bank" then
			-- SendNUIMessage({action = "setValue", key = "bankmoney", value = "$"..account.money})
		-- elseif account.name == "black_money" then
			-- SendNUIMessage({action = "setValue", key = "dirtymoney", value = "$"..account.money})
		-- end
	-- end

	-- Job
	local job = PlayerData.job
	SendNUIMessage({action = "setValue", key = "job", value = job.label.." - "..job.grade_label, icon = job.name})

	-- Money
	SendNUIMessage({action = "setValue", key = "money", value = "$"..PlayerData.money})
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		TriggerEvent('es:setMoneyDisplay', 0.0)
		ESX.UI.HUD.SetDisplay(0.0)
		
		local ped = GetPlayerPed(-1)
		local pedhealth = GetEntityHealth(ped)
		if pedhealth < preHealth then
			TriggerEvent("sendLossHealth")
			preHealth = pedhealth
		end

		local healthpcn = 0
		if pedhealth < 100 then
			healthpcn = 0
		else
			pedhealth = pedhealth - 100
			healthpcn = pedhealth
		end
		
		local armor100 = GetPedArmour(ped)
		
		SendNUIMessage({action = "updateHealth", health = healthpcn})
		SendNUIMessage({action = "updateArmor", armor = armor100})
		SendNUIMessage({action = "updateBreath", breath = GetPlayerUnderwaterTimeRemaining(PlayerId())})
	end
end)

RegisterNetEvent('sendLossHealth')
AddEventHandler('sendLossHealth', function()
	Citizen.CreateThread(function()
		SendNUIMessage({action = "toggleHealthLoss", show = true})
		Wait(500)
		SendNUIMessage({action = "toggleHealthLoss", show = false})
	end)
end)

-- RegisterNetEvent('sendGainHealth')
-- AddEventHandler('sendGainHealth', function()
	-- Citizen.CreateThread(function()
		-- SendNUIMessage({action = "toggleHealthGain", show = true})
		-- Wait(500)
		-- SendNUIMessage({action = "toggleHealthGain", show = false})
	-- end)
-- end)

RegisterNetEvent('ui:toggle')
AddEventHandler('ui:toggle', function(show)
	SendNUIMessage({action = "toggle", show = show})
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	if account.name == "bank" then
		SendNUIMessage({action = "setValue", key = "bankmoney", value = "$"..account.money})
	elseif account.name == "black_money" then
		SendNUIMessage({action = "setValue", key = "dirtymoney", value = "$"..account.money})
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  SendNUIMessage({action = "setValue", key = "job", value = job.label.." - "..job.grade_label, icon = job.name})
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(e)
	SendNUIMessage({action = "setValue", key = "money", value = "$"..e})
end)

RegisterNetEvent('esx_customui:updateStatus')
AddEventHandler('esx_customui:updateStatus', function(status)
	SendNUIMessage({action = "updateStatus", status = status})
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- Not sure which one is needed so you can choose/test which of these is the one you need.
        HideHudComponentThisFrame(3) -- SP Cash display 
        HideHudComponentThisFrame(4)  -- MP Cash display
        HideHudComponentThisFrame(13) -- Cash changes
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		if IsPauseMenuActive() and not IsPaused then
			IsPaused = true
			SendNUIMessage({action = "toggle", show = false})
		elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false
			SendNUIMessage({action = "toggle", show = true})
		end
	end
end)
