GM = nil
local myJob = nil
local cokeQTE = 0
local coke_poochQTE = 0
local weedQTE = 0
local weed_poochQTE = 0
local methQTE = 0
local meth_poochQTE = 0
local opiumQTE = 0
local opium_poochQTE = 0
local playerPed = nil
local coords = {}
local currentped = nil

Citizen.CreateThread(function()
  while GM == nil do
    TriggerEvent('GM:getSharedObject', function(obj) GM = obj end)
    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()
    while(true) do
		playerPed = PlayerPedId()
		coords = GetEntityCoords(PlayerPedId())
        Citizen.Wait(1000)
    end
end)

local function DrawText3Ds(msg, time)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(msg)
	DrawSubtitleTimed(time and math.ceil(time) or 0, true)
end

RegisterNetEvent('power:ReturnInventory')
AddEventHandler('power:ReturnInventory', function(cokeNbr, cokepNbr, methNbr, methpNbr, weedNbr, weedpNbr, opiumNbr, opiumpNbr, Job1)
    cokeQTE       = cokeNbr
    coke_poochQTE = cokepNbr
    methQTE 	  = methNbr
    meth_poochQTE = methpNbr
    weedQTE 	  = weedNbr
    weed_poochQTE = weedpNbr
    opiumQTE       = opiumNbr
    opium_poochQTE = opiumpNbr
	myJob			= Job1
end)

RegisterNetEvent('power:RefreshJob')
AddEventHandler('power:RefreshJob', function(Job1)
	myJob = Job1
end)

Citizen.CreateThread(function()
    while true do
		Wait(5000)
		TriggerServerEvent('power:GetJob')
		TriggerServerEvent('power:GetUserInventory')
    end
end)

RegisterNetEvent('GM:setJob')
AddEventHandler('GM:setJob', function(job)
  TriggerServerEvent('power:GetJob')
end)

local function Vente(pos1)
    local player = playerPed
    local playerloc = coords
    local distance = GetDistanceBetweenCoords(pos1.x, pos1.y, pos1.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= 2 then
		TriggerServerEvent('power:vente')
    elseif distance > 2 then
		TriggerServerEvent('power:dist')
    end
end

Citizen.CreateThread(function()
	while true do
		Wait(15)
		
		--[[
		if myJob == "police" or myJob == "sheriff" then
			return
		end]]

		if (coke_poochQTE ~= 0 or meth_poochQTE ~= 0 or weed_poochQTE ~= 0 or opium_poochQTE ~= 0) then
				local handle, ped = FindFirstPed()
				repeat
					success, ped = FindNextPed(handle)
					local pos = GetEntityCoords(ped)
					local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords['x'], coords['y'], coords['z'], true)
					if not IsPedInAnyVehicle(playerPed) then
						if DoesEntityExist(ped) then
							if not IsPedDeadOrDying(ped) then
								if not IsPedInAnyVehicle(ped) then
									local pedType = GetPedType(ped)
									if pedType ~= 28 and not IsPedAPlayer(ped) then
										if distance <= 2 and ped ~= playerPed and ped ~= oldped then
											DrawText3Ds('Appuyez sur [E] pour ~g~vendre votre Drugs~w~..')
											if IsControlJustPressed(1, 86) then
												oldped = ped
												TaskLookAtCoord(ped, coords['x'], coords['y'], coords['z'], -1, 2048, 3)
												TaskStandStill(ped, 100.0)
												SetEntityAsMissionEntity(ped)
												local pos1 = GetEntityCoords(ped)
												TriggerServerEvent('power:GetUserInventory')
												Wait(1000)
												Vente(pos1)
												Wait(2500)
												SetPedAsNoLongerNeeded(oldped)
											end
										end
									end
								end
							end
						end
					end
					
				until not success
				EndFindPed(handle)
		end
	end
end)

RegisterNetEvent("power:policeAppel2")
AddEventHandler("power:policeAppel2", function()
	TriggerServerEvent("power:policeAppel")
end)

RegisterNetEvent("AppelpoliceTropBien")
AddEventHandler("AppelpoliceTropBien", function(coords)
	AppelCoords = coords
	GM.ShowAdvancedNotification('Centrale', "~b~Appel d'urgence", '~b~Identité: ~s~Centrale\n~b~Localisation: ~s~'.. AppelCoords..'\n~b~Infos :~s~ Deal de drugs', "CHAR_CALL911", 1)
	GM.ShowNotification("Accepter: ~g~E~s~ ou ~r~X~s~")
end)

RegisterNetEvent('power:animation')
AddEventHandler('power:animation', function()
	local pid = PlayerPedId()
	RequestAnimDict("mp_common")
	while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(0) end
	TaskPlayAnim(pid,"mp_common","givetake2_a",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
	Wait(750)
	StopAnimTask(pid, "mp_common","givetake2_a", 1.0)
end)