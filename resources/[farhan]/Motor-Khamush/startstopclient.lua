-- Engine start-stop system by Vespura (www.vespura.com) v1.0.2

-- Configure the amount of time needed before the engine stops after the vehicle has been stopped.
local delay = 4000 -- Default 4000 (4 seconds).

-- Start-stop system toggle command, can be used to enable or disable the script, preference is saved directly on the client side so when the user re-joins the preference is restored
local toggleCommand = "ss" -- Default "ss"

-- Send chat message: enable this if you want to send a chat message to the user whenever they use the toggleCommand.
local sendChatMessage = true

-- Send notification: enable this if you want to send a notification (above the minimap) to the user whenever they use the toggleCommand.
local sendNotification = true


--------------------------------------------------------------------------------------------------------------------------------------------------
-- No need to touch any of this below unless you want to fuck shit up or you know what you're doing, but honestly there's not much to change... --
--------------------------------------------------------------------------------------------------------------------------------------------------

-- Load the user saved setting for this resource (most likely different per server because I don't think everyone will use the same resource name).
local enabled = true
local kvp = GetResourceKvpString("string_engine_start_stop_enabled")
if kvp ~= nil then
    if string.lower(kvp) == "true" then
        enabled = true
    elseif string.lower(kvp) == "false" then
        enabled = false
    else
        enabled = true
        SetResourceKvp("string_engine_start_stop_enabled", "true")
    end
else
    enabled = true
    SetResourceKvp("string_engine_start_stop_enabled", "true")
end

function Notify(justEnabled)
    SetNotificationTextEntry("engine_ss_toggle_msg")
    if justEnabled then
        AddTextComponentSubstringPlayerName("~g~enabled")
    else
        AddTextComponentSubstringPlayerName("~r~disabled")
    end
    DrawNotification(false, true)
end

RegisterCommand("ss", function()
    local message = {
        color = {255, 255, 255},
        multiline = true,
        args = {}
    }
    local text = ""
    if enabled then
        enabled = false
        SetResourceKvp("string_engine_start_stop_enabled", "false")
        text = "^3Engine start stop system is now ^1disabled^3."
    else
        enabled = true
        SetResourceKvp("string_engine_start_stop_enabled", "true")
        text = "^3Engine start stop system is now ^2enabled^3."
    end
    
    
    if sendChatMessage then
        message.args = {"", text}
        TriggerEvent("chat:addMessage", message)
    end
    
    if sendNotification then
        Notify(enabled)
    end
    
end)

Citizen.CreateThread(function()
    AddTextEntry("engine_ss_toggle_msg", "Engine start stop system is now ~a~~s~.")
    
    while true do
        -- Loop once every 100ms
        Wait(100)
        
        if enabled then
        
            -- Get the vehicle.
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            
            -- Make sure the vehicle exists and it's not dead, and that the player is actually driving.
            if DoesEntityExist(veh) and not IsEntityDead(veh) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            
                -- Get the vehicle model
                local model = GetEntityModel(veh)
                
                -- Only continue if this is a car, because this is usually only fitted to cars.
                if IsThisModelACar(model) then
                
                    -- Check the entity speed.
                    if GetEntitySpeed(veh) < 0.1 then
                    
                        -- Setup a timer
                        local timer = GetGameTimer()
                        
                        -- Only check while the speed is below 0.1
                        while GetEntitySpeed(veh) < 0.1 and not (IsControlPressed(0, 71) or IsControlPressed(0, 72)) do
                        
                            -- Keep checking every frame if the speed is still below 0.1.
                            Wait(0)
                            
                            -- If it has been (default) 4 seconds and the car still hasn't moved, or the engine is already turned off, then we shut down the engine.
                            if GetGameTimer() - timer > delay or not GetIsVehicleEngineRunning(veh) then
                                
                                -- Toggle the engine off
                                SetVehicleEngineOn(veh, false, false, true)
                                
                                local hour = GetClockHours()
                                local resetLights = false
                                if hour > 18 or hour < 7 then
                                    SetVehicleLights(veh, 2)
                                    resetLights = true
                                end
                                -- Now wait for the vehicle to be moved by some external force, or wait for the engine to be started 
                                -- again (through some other script) or wait for the user to press the brake/reverse or accelerate controls.
                                while true do
                                    Wait(0)
                                    if resetLights then
                                        local _, lightsOn, _ = GetVehicleLightsState(veh)
                                        if lightsOn == 0 then
                                            SetVehicleLights(veh, 0)
                                        else
                                            SetVehicleLights(veh, 2)
                                        end
                                    end
                                    if IsControlPressed(0, 71) or IsControlPressed(0, 72) or GetEntitySpeed(veh) > 0.1 or GetIsVehicleEngineRunning(veh) then
                                        -- If that's the case, then toggle the engine on so the player can drive away.
                                        SetVehicleEngineOn(veh, true, false, true)
                                        
                                        if resetLights then
                                            SetVehicleLights(veh, 0)
                                        end
                                        
                                        -- Wait at least 2 seconds before doing everything all over again, because we don't want the engine to stop immediately if the player doesn't start moving fast enough
                                        -- especially in case someone reduced the 4 second delay.
                                        Wait(2000)
                                        break
                                    end
                                end
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end)


