-- require "resources/essentialmode/lib/MySQL"

--[[ ***** EVENTS GUI ***** ]]
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("antirpquestion:kick")
AddEventHandler("antirpquestion:kick", function()
	DropPlayer(source, "Be soalat natoonestid javab bedid.")
end)

RegisterServerEvent("antirpquestion:success")
AddEventHandler("antirpquestion:success", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.execute(
		"UPDATE users SET question_rp='made' WHERE `identifier`=@identifier;", {['@identifier'] = xPlayer.identifier}, function()
		end)
end)

--[[ ***** SPAWN ***** ]]
RegisterServerEvent("antirpquestion:didQuestion")
AddEventHandler("antirpquestion:didQuestion", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT question_rp, created FROM users WHERE `identifier`=@identifier;', {['@identifier'] = xPlayer.identifier}, function(users)
		for i=1, #users, 1 do
			local questionMade = users[i].question_rp
			print(questionMade)
			if (questionMade == "false") then
				if users[i].created then
					TriggerClientEvent('antirpquestion:notMade',_source)
				end
			end
		end	
	end)

end)

RegisterServerEvent("antirpquestion:didQuestion2")
AddEventHandler("antirpquestion:didQuestion2", function(src)
	local xPlayer = ESX.GetPlayerFromId(src)
	MySQL.Async.fetchAll('SELECT question_rp, created FROM users WHERE `identifier`=@identifier;', {['@identifier'] = xPlayer.identifier}, function(users)
		for i=1, #users, 1 do
			local questionMade = users[i].question_rp
			if (questionMade == "false") then
				if users[i].created then
					TriggerClientEvent('antirpquestion:notMade',src)
				end
			end
		end	
	end)

end)


