AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		-- if Config.EnableESXIdentity then name = GetCharacterName(source) end
		-- TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', name), message }, color = { 128, 128, 128 } })
	end
end)

-- RegisterCommand('tweet', function(source, args, rawCommand)
    -- local playerName = GetPlayerName(source)
    -- local msg = rawCommand:sub(6)
    -- local name = GetPlayerName(source)
    -- fal = name
    -- TriggerClientEvent('chat:addMessage', -1, {
        -- template = '<div style="display: inline-block; padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><img src="twitter.png"><i class="fab fa-twitter"></i> @{0}: {1}</div>',
        -- args = { fal, msg }
    -- })
-- end, false)

RegisterCommand('twt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	
	local msg = rawCommand:sub(4)
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="display: inline-block; padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 10px;"><img src="twitter.png"><i class="fab fa-twitter"></i> @{0}:  {1}</div>',
        args = { name, msg }
    })
end, false)

RegisterCommand('ad', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = GetPlayerName(source)
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="display: inline-block; padding: 0.5vw; margin: 0.5vw; background-color: rgba(214, 168, 0, 0.6); border-radius: 10px;"><img src="ads.png"><i class="fas fa-ad"></i> آگهی تبلیغاتی:  {1}<br></div>',
        args = { name, msg }
    })
end, false)

RegisterCommand('me', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--print(('%s: %s'):format(name, args))
	
	
	
end, false)

RegisterCommand('do', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('do_prefix', name), args, { 0, 0, 255 })
	--print(('%s: %s'):format(name, args))
end, false)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
