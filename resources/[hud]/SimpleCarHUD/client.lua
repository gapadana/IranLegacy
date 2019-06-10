-- SCREEN POSITION PARAMETERS
local screenPosX = 0.165                    -- X coordinate (top left corner of HUD)
local screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)

-- SPEEDOMETER PARAMETERS
local speedLimit = 100.0                    -- Speed limit for changing speed color
local speedColorText = {255, 255, 255}      -- Color used to display speed label text
local speedColorUnder = {255, 255, 255}     -- Color used to display speed when under speedLimit
local speedColor6080 = {255, 255, 96} 
local speedColor80120 = {255, 180, 96}        -- Color used to display speed when over speedLimit
local speedColor120 = {255, 96, 96} 

-- FUEL PARAMETERS
local fuelWarnLimit = 25.0                  -- Fuel limit for triggering warning color
local fuelColorText = {255, 255, 255}       -- Color used to display fuel text
local fuelColorOver = {160, 255, 160}       -- Color used to display fuel when good
local fuelColorUnder = {255, 96, 96}        -- Color used to display fuel warning

-- SEATBELT PARAMETERS
local seatbeltInput = 311                   -- Toggle seatbelt on/off with K
local seatbeltEjectSpeed = 45               -- Speed threshold to eject player (MPH)
local seatbeltEjectAccel = 100              -- Acceleration threshold to eject player (G's)
local seatbeltColorOn = {160, 255, 160}     -- Color used when seatbelt is on
local seatbeltColorOff = {255, 96, 96}      -- Color used when seatbelt is off

-- CRUISE CONTROL PARAMETERS
local cruiseInput = 137                     -- Toggle cruise on/off with CAPSLOCK or A button (controller)
local cruiseColorOn = {160, 255, 160}       -- Color used when seatbelt is on
local cruiseColorOff = {255, 96, 96}        -- Color used when seatbelt is off

-- LOCATION PARAMETERS
local locationColorText = {255, 255, 255}   -- Color used to display location string

-- Lookup tables for direction and zone
local directions = { [0] = 'N', [1] = 'W', [2] = 'S', [3] = 'E', [4] = 'N' } 
local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

-- STATE VARIABLES
local currentFuel = 100.0
local cruiseIsOn = false
local seatbeltIsOn = false

-- Main thread
Citizen.CreateThread(function()
    -- Initialize local variable
    local currSpeed = 0.0
    local cruiseSpeed = 999.0
    local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}

    while true do
        -- Loop forever and update HUD every frame
        Citizen.Wait(0)

        -- Get player PED, position and vehicle and save to locals
        local player = GetPlayerPed(-1)
        local position = GetEntityCoords(player)
        local vehicle = GetVehiclePedIsIn(player, false)
        
        -- Display HUD only when in vehicle
        if (IsPedInAnyVehicle(player, false)) then
            -- Save previous speed and get current speed
            local prevSpeed = currSpeed
            currSpeed = GetEntitySpeed(vehicle)
            


            -- When player in driver seat, handle cruise control
           

            -- Get vehicle speed in MPH and draw speedometer
            local speed = currSpeed*3.6
			if speed <= 60 then 
				speedColor = speedColorUnder
			elseif speed > 60 and speed <= 80 then
				speedColor = speedColor6080
			elseif speed > 80 and speed <= 120 then
				speedColor = speedColor80120
			else
				speedColor = speedColor120
			end
				
            -- speedColor = (speed >= speedLimit) and speedColorOver or speedColorUnder
            drawTxt(("%.3d"):format(math.ceil(speed)), 2, speedColor, 2.0, screenPosX + 0.035, screenPosY - 0.025)
            drawTxt("KMH", 2, speedColorText, 0.4, screenPosX + 0.10, screenPosY + 0.050)
            
            -- Draw fuel gauge; always displays 100 but can be modified by setting currentFuel with an API call
            fuelColor = (currentFuel >= fuelWarnLimit) and fuelColorOver or fuelColorUnder
            drawTxt(("%.3d"):format(math.ceil(currentFuel)), 2, fuelColor, 0.8, screenPosX , screenPosY + 0.000)
            drawTxt("Benzin", 2, fuelColorText, 0.3, screenPosX + 0.003, screenPosY - 0.013)

            -- Get time and display
            local hour = GetClockHours()
            local minute = GetClockMinutes()
            local timeText = ("%.2d"):format((hour == 0) and 12 or hour) .. ":" .. ("%.2d"):format( minute) .. ((hour < 12) and " AM" or " PM")
            drawTxt(timeText, 4, {255,255,255}, 0.4, screenPosX, screenPosY + 0.048)

            
            
            -- Get heading and zone from lookup tables and street name from hash
            local heading = directions[math.floor((GetEntityHeading(player) + 45.0) / 90.0)]
            local zoneNameFull = zones[GetNameOfZone(position.x, position.y, position.z)]
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))
            
            -- Display heading, street name and zone when possible
            local locationText = heading
            locationText = (streetName == "" or streetName == nil) and (locationText) or (locationText .. " | " .. streetName)
            locationText = (zoneNameFull == "" or zoneNameFull == nil) and (locationText) or (locationText .. " | " .. zoneNameFull)
            drawTxt(locationText, 4, locationColorText, 0.5, screenPosX, screenPosY + 0.074)
        
        end
    end
end)

-- Helper function to draw text to screen
function drawTxt(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

RegisterNetEvent("SCH:updateFuel")
AddEventHandler("SCH:updateFuel", function(fuelPercent)

	currentFuel = fuelPercent

end)
