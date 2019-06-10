local timeUntilRestart
local secondsUntilRestart = 30

AddEventHandler("rconCommand", function(command, args)
    if command == "reset" and args[1] and tonumber(args[1]) then
        timeUntilRestart = tonumber(args[1])
		if timeUntilRestart >= 1 or timeUntilRestart <= 30 then
			announce()
			CancelEvent()
		end
    end
end)

TriggerEvent("es:addGroupCommand", 'reset', "admin", function(source, args, user)
	local Source = source
	if args[1] then
		if(tonumber(args[1]))then
			timeUntilRestart = tonumber(args[1])
			if timeUntilRestart >= 1 or timeUntilRestart <= 30 then
				announce()
			else
				TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect time, (time must be between 1 and 30 minutes)"}})
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect time, (time must be number)"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect time"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = _U('command_restart'), params = {{name = "time", help = _U('command_time_param')}}})

function announce()

	TriggerClientEvent('chat:addMessage', -1, { args = { "^1SYSTEM", _U('remaining_time_minutes', timeUntilRestart) }, color = { 147, 196, 109 }} )
	print("\t^1----> restart in "..timeUntilRestart.." minutes^7")
	if timeUntilRestart > 21 then
		timer(( timeUntilRestart - 20 ) * 60000, announce)
		timeUntilRestart = 20
	elseif timeUntilRestart > 16 then
		timer(( timeUntilRestart - 15 ) * 60000, announce)
		timeUntilRestart = 15
	elseif timeUntilRestart > 11 then
		timer(( timeUntilRestart - 10 ) * 60000, announce)
		timeUntilRestart = 10
	elseif timeUntilRestart > 6 then
		timer(( timeUntilRestart - 5 ) * 60000, announce)
		timeUntilRestart = 5
	elseif timeUntilRestart >= 4 then
		timer(( timeUntilRestart - 3 ) * 60000, announce)
		timeUntilRestart = 3
	elseif timeUntilRestart >= 3 then
		timer(( timeUntilRestart - 2 ) * 60000, announce)
		timeUntilRestart = 2
	elseif timeUntilRestart >= 2 then
		timer(( timeUntilRestart - 1 ) * 60000, announce)
		timeUntilRestart = 1
	elseif timeUntilRestart >= 1 then
		timer( 30000 , announce2)
		timeUntilRestart = 0
	end
   
end

function announce2()

	TriggerClientEvent('chat:addMessage', -1, { args = { "^1SYSTEM", _U('remaining_time_seconds', secondsUntilRestart) }, color = { 147, 196, 109 }} )  
	print("\t^1----> restart in "..secondsUntilRestart.." seconds^7")
	if secondsUntilRestart == 30 then
		timer(10000, announce2)
		secondsUntilRestart = 20
	elseif secondsUntilRestart == 20 then
		timer(5000, announce2)
		secondsUntilRestart = 15
	elseif secondsUntilRestart == 15 then
		timer(5000, announce2)
		secondsUntilRestart = 10
	elseif secondsUntilRestart <= 10 and secondsUntilRestart > 0 then
		timer(1000, announce2)
		secondsUntilRestart = secondsUntilRestart - 1
	elseif secondsUntilRestart == 0 then
		TriggerClientEvent('kickPlayer', -1)
		timer(5000, restartServer)
	end
	
	if( secondsUntilRestart == 2 ) then
		TriggerClientEvent('esx_ambulancejob:revive', -1)
	end
   
end

function restartServer()
	print ("\t^2=========================")
	print ("\t^2=ready to restart server=")
	print ("\t^2=========================^7")
end

function timer (timerTime, cb)
	Citizen.CreateThread(function()
		Wait(timerTime)
		cb()
	end)
end

RegisterServerEvent('dropPlayer')
AddEventHandler('dropPlayer', function()
	DropPlayer(source, _U('kick_message'))
end)