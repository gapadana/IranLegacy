ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ioh:checkadmin')
AddEventHandler('ioh:checkadmin', function()
	local _source = source
	TriggerEvent('es:getPlayerFromId', _source, function(user)
		if user ~= nil then 
			if user.getGroup() == "superadmin" then
				TriggerClientEvent('ioh:isAdmin')
			end
		end
	end)
end)

RegisterServerEvent('ioh:announce')
AddEventHandler('ioh:announce', function()
	local src = source
	local targetSrc = tonumber(src)
	local xPlayer = ESX.GetPlayerFromId(targetSrc)
	local name = xPlayer.getName()
	-- TriggerClientEvent('chat:addMessage', -1, { args = {"^1SYSTEM^7", "^3"..name.."^7".." be id ha negah kard"}})
	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, "announce", "^3"..name.."^7".." be id ha negah kard", { 255, 0, 0 })
end)