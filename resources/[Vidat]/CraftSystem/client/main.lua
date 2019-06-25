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

_menuPool = NativeUI.CreatePool()
craftMenu = NativeUI.CreateMenu("Crafting", "")
_menuPool:Add(craftMenu)
_menuPool:MouseControlsEnabled(false)

dataLoaded = false
ESX = nil
itemData = {}
crafting = false
stopped = false
lastVisible = false
preJob = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

AddEventHandler('playerSpawned', function()
	TriggerServerEvent('CS:GetItemsData')
end)

RegisterNetEvent('CS:SetItemsData')
AddEventHandler('CS:SetItemsData', function(data)
	itemData = data
	dataLoaded = true
end)

function startEscToStop()
	Citizen.CreateThread(function()
		while crafting do 
			if IsControlJustPressed(1, Keys["X"]) then
				stopped = true
			end
			Wait(0)
		end
	end)
end

function craftItem(item, isItemJob)
	stopped = false
	ESX.TriggerServerCallback( "CS:DoesHaveNeededItems", function(satisfing)
		if satisfing then
			Citizen.CreateThread(function()
				crafting = true
				DisableAllControlActions(0)
				TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, true)
				EnableControlAction(0, Keys['Z'], true)
				EnableControlAction(0, Keys['T'], true)
				EnableControlAction(0, Keys['X'], true)
				EnableControlAction(0, 177, true)
				EnableControlAction(0, 200, true)
				EnableControlAction(0, 202, true)
				EnableControlAction(0, 322, true)
				startEscToStop()
				Wait((item.crafttime - 1) * 1000)
				if stopped then
					EnableAllControlActions(0)
					crafting = false
					return
				end
				ESX.TriggerServerCallback( "CS:DoesHaveNeededItems", function(satisfing2)
					if satisfing2 then
						for _,need in pairs(item.Needs) do
							TriggerServerEvent('CS:RemoveItems', need.name, need.count)
						end
					else
						ESX.ShowNotification("Manabe mored niaz ra az dast dadid")
						ClearPedTasksImmediately(GetPlayerPed(-1))
						EnableAllControlActions(0)
						crafting = false
						return
					end
				end, GetPlayerServerId(PlayerId()), item.Needs)
				Wait(1 * 1000)
				rand = math.random(1, 100)
				chance = item.chance * 100
				if isItemJob then
					chance = 100
				end
				if rand <= chance then
					if not item.weapon then
						TriggerServerEvent('CS:AddItem', item.name, 1)
					else
						TriggerServerEvent('CS:AddWeapon', item.name, 1)
					end
				else
					ESX.ShowNotification("Movafagh nashodid")
				end
				ClearPedTasksImmediately(GetPlayerPed(-1))
				EnableAllControlActions(0)
				crafting = false
			end)
		else
			ESX.ShowNotification("Manabe mored niaz ra nadarid")
		end
	end, GetPlayerServerId(PlayerId()), item.Needs)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, Keys["Z"]) then
			if dataLoaded then
				lastVisible = true
				startTimer()
				craftMenu:Visible(true)
			else
				TriggerServerEvent("CS:GetItemsData")
			end
        end
    end
end)

function jobChanged()

	while not dataLoaded do
		TriggerServerEvent("CS:GetItemsData")
		Wait(100)
	end

	craftMenu = NativeUI.CreateMenu("Crafting", "")
	_menuPool:Add(craftMenu)
	_menuPool:MouseControlsEnabled(false)
	
	number = 1
	local items = {}
	local itemsData = {}
	local itemJobs = {}
	
	for _,item in pairs(Config.Items) do
		
		itemJob = false
		for _, job in pairs (item.Jobs) do
			if job.name ==  preJob then
				itemJob = true
				break
			end
		end
		
		itemJobs[number] = itemJob
		
		description = "Modat Zamane sakht: "..item.crafttime.."s\n"
		if itemJob then
			description = description.."Sakhti: 100%"
		else
			description = description.."Sakhti: "..((item.chance)*100).."%"
		end

		itemName = nil
		if not item.weapon then
			if itemData[item.name] then
				itemName = itemData[item.name].label
			else
				itemName = item.name
			end
		else
			itemName = ESX.GetWeaponLabel(item.name)
		end	
		
		
		items[number] = NativeUI.CreateItem(itemName, description)
		itemsData[number] = item
		if itemJob then
			items[number]:SetLeftBadge(BadgeStyle.Star)
		end
		
		craftMenu:AddItem(items[number])
		number = number + 1
	end
	
	craftMenu:CurrentSelection(0)
    craftMenu.OnItemSelect = function(sender, item, index)
		for key,olderItems in pairs(items) do
			if item == olderItems then
				if not crafting then
					craftItem(itemsData[key], itemJobs[key])
					craftMenu:Visible(false)
					SendNUIMessage({action = "toggle",show = false})
				else
					ESX.ShowNotification("Hanooz darid craft mikonid")
				end
			end
		end
	end
	craftMenu.OnIndexChange = function(craftMenu, newindex)
		SendNUIMessage({action = "toggle",show = true})	
		description2 = ""
		for _,need in pairs(itemsData[newindex].Needs) do
			-- if itemData[need.name] ~= nil then
				description2 = description2..itemData[need.name].label..": x"..need.count.."<br>"
			-- end
		end
		SendNUIMessage({action = "updateData",data = description2})	
	end

end

Citizen.CreateThread(function()
    while true do
		if ESX ~= nil and ESX.GetPlayerData().job ~= nil then
			if preJob == nil then
				PlayerData = ESX.GetPlayerData()
				preJob = PlayerData.job.name
				jobChanged()
			else
				PlayerData = ESX.GetPlayerData()
				if PlayerData.job.name ~= preJob then
					preJob = PlayerData.job.name
					jobChanged()
				end
			end
			Citizen.Wait(5000)
		else
			Wait(10)
		end
    end
end)

function startTimer()
	Citizen.CreateThread(function()
		while lastVisible do
			currentVisibility = craftMenu._Visible
			if (not currentVisibility) and lastVisible then
				SendNUIMessage({action = "toggle",show = false})
				lastVisible = false
			end
			if lastVisible then
				Wait(100)
			end
		end
	end)
end

