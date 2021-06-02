local resourceName = tostring(GetCurrentResourceName())
local function savePlayerFile(player, data)
    local fileName = GetPlayerIdentifiers(player)[2]
    local ret = SaveResourceFile(resourceName, "saves/"..fileName..".json", data, -1)
    return ret
end
local function loadPlayerFile(player)
    local fileName = GetPlayerIdentifiers(player)[2]
    local ret = LoadResourceFile(resourceName, "saves/"..fileName..".json")
    if ret then return ret else return "[]" end
end

RegisterServerEvent("power:reqVehicles")
AddEventHandler("power:reqVehicles", function(player)
    local ply = player or source
    local data = json.decode(loadPlayerFile(ply)) or {}
    TriggerClientEvent("power:recVehicles",source,data)
end)

RegisterServerEvent("power:saveVehicle")
AddEventHandler("power:saveVehicle", function(vehicleData, location, position, oldLocation)
    local player = source
    local data = json.decode(loadPlayerFile(player)) or {}
    if not data[location] then data[location] = {} end
    local oldLocation = oldLocation or location
    if not data[oldLocation] then data[oldLocation] = {} end

    if location == oldLocation then
        if not position then
            local found = false
            for i=1,#garage.locations[location].carLocations do
                if data[location][i] == nil or data[location][i] == "none" then
                    data[location][i] = vehicleData
                    found = true
                    break
                end
            end
            if not found then TriggerClientEvent("power:savecallback", source, "no_slot") return end
        else
            data[location][position] = vehicleData
        end
    else
        if data[oldLocation] then
            data[oldLocation][position] = "none"
        end

        local found = false
        for i=1,#garage.locations[location].carLocations do
            if data[location][i] == nil or data[location][i] == "none" then
                data[location][i] = vehicleData
                found = true
                break
            end
        end
        if not found then TriggerClientEvent("power:savecallback", source, "no_slot") return end
    end
    savePlayerFile(player, json.encode(data))

    TriggerClientEvent("power:savecallback", source, "success")
end)

RegisterServerEvent("power:deleteVehicle")
AddEventHandler("power:deleteVehicle", function(location, position)
    local player = source
    local data = json.decode(loadPlayerFile(player)) or {}
    if data[location] and data[location][position] then data[location][position] = "none" end

    savePlayerFile(player, json.encode(data))
end)

RegisterServerEvent("power:moveVehicle")
AddEventHandler("power:moveVehicle", function(location, oldPosition, newPosition)
    local player = source
    local data = json.decode(loadPlayerFile(player)) or {}
    if data[location] then
        local oldVehicleData
        if data[location][newPosition] then
            oldVehicleData = data[location][newPosition]
        else
            oldVehicleData = "none"
        end
        data[location][newPosition] = data[location][oldPosition]
        data[location][oldPosition] = oldVehicleData
    end

    savePlayerFile(player, json.encode(data))

    TriggerClientEvent("power:message", source, "Vehicle Moved")
end)
