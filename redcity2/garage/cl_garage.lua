Citizen.CreateThread(function()
	while not garage do Citizen.Wait(0) end
	
	AddTextEntry("ENTER", "Appuyez ~INPUT_CONTEXT~ pour entrer ~b~dans votre garage.")
	
	Garage_default = {
		vehicleTaken = false,
		vehicleTakenPos = false,
		curGarage = false,
		curGarageName = false,
		vehicles = {},
	} pwGarage = pwGarage or Garage_default
	
	local vehicleTable
	
	function GetVehicle(ply,doesNotNeedToBeDriver)
		local found = false
		local ped = GetPlayerPed((ply and ply or -1))
		local veh = 0
		if IsPedInAnyVehicle(ped) then
			 veh = GetVehiclePedIsIn(ped, false)
		end
		if veh ~= 0 then
			if GetPedInVehicleSeat(veh, -1) == ped or doesNotNeedToBeDriver then
				found = true
			end
		end
		return found, veh, (veh ~= 0 and GetEntityModel(veh) or 0)
	end
	
	local lock_fancyteleport = false
	local function FancyTeleport(ent,x,y,z,h,fOut,hold,fIn,resetCam)
		if not lock_fancyteleport then
			lock_fancyteleport = true
			Citizen.CreateThread(function() Citizen.Wait(15000) DoScreenFadeIn(500) end)
			Citizen.CreateThread(function()
				FreezeEntityPosition(ent, true)
	
				DoScreenFadeOut(fOut or 500)
				while IsScreenFadingOut() do Citizen.Wait(0) end
	
				SetEntityCoords(ent, x, y, z)
				if h then SetEntityHeading(ent, h) SetGameplayCamRelativeHeading(0) end
				if GetVehicle() then SetVehicleOnGroundProperly(ent) end
				FreezeEntityPosition(ent, false)
	
				Citizen.Wait(hold or 5000)
	
				DoScreenFadeIn(fIn or 500)
				while IsScreenFadingIn() do Citizen.Wait(0) end
	
				lock_fancyteleport = false
			end)
		end
	end
	
	local function ToCoord(t,withHeading)
		if withHeading == true then
			local h = (t[4]+0.0) or 0.0
			return (t[1]+0.0),(t[2]+0.0),(t[3]+0.0),h
		elseif withHeading == "only" then
			local h = (t[4]+0.0) or 0.0
			return h
		else
			return (t[1]+0.0),(t[2]+0.0),(t[3]+0.0)
		end
	end
	
	-- These vehicle functions are not /fully/ mine.
	-- I forgot where I took the originals from but I *did* modify them for my own use.
	-- Credit to whoever actually made the original functions.
	local function DoesVehicleHaveExtras( veh )
		for i = 1, 30 do
			if ( DoesExtraExist( veh, i ) ) then
				return true
			end
		end
	
		return false
	end
	
	local function VehicleToData(veh)
		local vehicleTableData = {}
	
		local model = GetEntityModel( veh )
		local primaryColour, secondaryColour = GetVehicleColours( veh )
		local pearlColour, wheelColour = GetVehicleExtraColours( veh )
		local mod1a, mod1b, mod1c = GetVehicleModColor_1( veh )
		local mod2a, mod2b = GetVehicleModColor_2( veh )
		local custR1, custG2, custB3, custR2, custG2, custB2
	
		if ( GetIsVehiclePrimaryColourCustom( veh ) ) then
			custR1, custG1, custB1 = GetVehicleCustomPrimaryColour( veh )
		end
	
		if ( GetIsVehicleSecondaryColourCustom( veh ) ) then
			custR2, custG2, custB2 = GetVehicleCustomSecondaryColour( veh )
		end
	
		vehicleTableData[ "model" ] = tostring( model )
		vehicleTableData[ "primaryColour" ] = primaryColour
		vehicleTableData[ "secondaryColour" ] = secondaryColour
		vehicleTableData[ "pearlColour" ] = pearlColour
		vehicleTableData[ "wheelColour" ] = wheelColour
		vehicleTableData[ "mod1Colour" ] = { mod1a, mod1b, mod1c }
		vehicleTableData[ "mod2Colour" ] = { mod2a, mod2b }
		vehicleTableData[ "custPrimaryColour" ] =  { custR1, custG1, custB1 }
		vehicleTableData[ "custSecondaryColour" ] = { custR2, custG2, custB2 }
	
		local livery = GetVehicleLivery( veh )
		local plateText = GetVehicleNumberPlateText( veh )
		local plateType = GetVehicleNumberPlateTextIndex( veh )
		local wheelType = GetVehicleWheelType( veh )
		local windowTint = GetVehicleWindowTint( veh )
		local burstableTyres = GetVehicleTyresCanBurst( veh )
		local customTyres = GetVehicleModVariation( veh, 23 )
	
		vehicleTableData[ "livery" ] = livery
		vehicleTableData[ "plateText" ] = plateText
		vehicleTableData[ "plateType" ] = plateType
		vehicleTableData[ "wheelType" ] = wheelType
		vehicleTableData[ "windowTint" ] = windowTint
		vehicleTableData[ "burstableTyres" ] = burstableTyres
		vehicleTableData[ "customTyres" ] = customTyres
	
		local neonR, neonG, neonB = GetVehicleNeonLightsColour( veh )
		local smokeR, smokeG, smokeB = GetVehicleTyreSmokeColor( veh )
	
		local neonToggles = {}
	
		for i = 0, 3 do
			if ( IsVehicleNeonLightEnabled( veh, i ) ) then
				table.insert( neonToggles, i )
			end
		end
	
		vehicleTableData[ "neonColour" ] = { neonR, neonG, neonB }
		vehicleTableData[ "smokeColour" ] = { smokeR, smokeG, smokeB }
		vehicleTableData[ "neonToggles" ] = neonToggles
	
		local extras = {}
	
	
		if ( DoesVehicleHaveExtras( veh ) ) then
			for i = 1, 30 do
				if ( DoesExtraExist( veh, i ) ) then
					if ( IsVehicleExtraTurnedOn( veh, i ) ) then
						table.insert( extras, i )
					end
				end
			end
		end
	
		vehicleTableData[ "extras" ] = extras
	
		local mods = {}
	
		for i = 0, 49 do
			local isToggle = ( i >= 17 ) and ( i <= 22 )
	
			if ( isToggle ) then
				mods[i] = IsToggleModOn( veh, i )
			else
				mods[i] = GetVehicleMod( veh, i )
			end
		end
	
		vehicleTableData[ "mods" ] = mods
	
		local ret = vehicleTableData
	
		return ret
	end
	
	local function CreateVehicleFromData(data, x,y,z,h, dontnetwork)
	
		local model = data[ "model" ]
		local primaryColour = data[ "primaryColour" ]
		local secondaryColour = data[ "secondaryColour" ]
		local pearlColour = data[ "pearlColour" ]
		local wheelColour = data[ "wheelColour" ]
		local mod1Colour = data[ "mod1Colour" ]
		local mod2Colour = data[ "mod2Colour" ]
		local custPrimaryColour = data[ "custPrimaryColour" ]
		local custSecondaryColour = data[ "custSecondaryColour" ]
		local livery = data[ "livery" ]
		local plateText = data[ "plateText" ]
		local plateType = data[ "plateType" ]
		local wheelType = data[ "wheelType" ]
		local windowTint = data[ "windowTint" ]
		local burstableTyres = data[ "burstableTyres" ]
		local customTyres = data[ "customTyres" ]
		local neonColour = data[ "neonColour" ]
		local smokeColour = data[ "smokeColour" ]
		local neonToggles = data[ "neonToggles" ]
		local extras = data[ "extras" ]
		local mods = data[ "mods" ]
	
		local veh = CreateVehicle(tonumber(model), x,y,z,h,not dontnetwork)
	
		-- Set the mod kit to 0, this is so we can do shit to the car
		SetVehicleModKit( veh, 0 )
	
		SetVehicleTyresCanBurst( veh, burstableTyres )
		SetVehicleNumberPlateTextIndex( veh,  plateType )
		SetVehicleNumberPlateText( veh, plateText )
		SetVehicleWindowTint( veh, windowTint )
		SetVehicleWheelType( veh, wheelType )
	
		for i = 1, 30 do
			if ( DoesExtraExist( veh, i ) ) then
				SetVehicleExtra( veh, i, true )
			end
		end
	
		for k, v in pairs( extras ) do
			local extra = tonumber( v )
			SetVehicleExtra( veh, extra, false )
		end
	
		for k, v in pairs( mods ) do
			local k = tonumber( k )
			local isToggle = ( k >= 17 ) and ( k <= 22 )
	
			if ( isToggle ) then
				ToggleVehicleMod( veh, k, v )
			else
				SetVehicleMod( veh, k, v, 0 )
			end
		end
	
		local currentMod = GetVehicleMod( veh, 23 )
		SetVehicleMod( veh, 23, currentMod, customTyres )
		SetVehicleMod( veh, 24, currentMod, customTyres )
	
		if ( livery ~= -1 ) then
			SetVehicleLivery( veh, livery )
		end
	
		SetVehicleExtraColours( veh, pearlColour, wheelColour )
		SetVehicleModColor_1( veh, mod1Colour[1], mod1Colour[2], mod1Colour[3] )
		SetVehicleModColor_2( veh, mod2Colour[1], mod2Colour[2] )
	
		SetVehicleColours( veh, primaryColour, secondaryColour )
	
		if ( custPrimaryColour[1] ~= nil and custPrimaryColour[2] ~= nil and custPrimaryColour[3] ~= nil ) then
			SetVehicleCustomPrimaryColour( veh, custPrimaryColour[1], custPrimaryColour[2], custPrimaryColour[3] )
		end
	
		if ( custSecondaryColour[1] ~= nil and custSecondaryColour[2] ~= nil and custSecondaryColour[3] ~= nil ) then
			SetVehicleCustomPrimaryColour( veh, custSecondaryColour[1], custSecondaryColour[2], custSecondaryColour[3] )
		end
	
		SetVehicleNeonLightsColour( veh, neonColour[1], neonColour[2], neonColour[3] )
	
		for i = 0, 3 do
			SetVehicleNeonLightEnabled( veh, i, false )
		end
	
		for k, v in pairs( neonToggles ) do
			local index = tonumber( v )
			SetVehicleNeonLightEnabled( veh, index, true )
		end
	
		SetVehicleDirtLevel(veh, 0.0)
	
		return veh
	end
	
	--Map Blips
	Citizen.CreateThread(function()
		local blips = {}
		for ln,loc in pairs(garage.locations) do
			local x,y,z = ToCoord(loc.inLocation[1],false) -- Get coords
			local blip = AddBlipForCoord(x,y,z) -- Create blip
	
			-- Set blip option
			SetBlipSprite(blip, 357)
			SetBlipColour(blip, 3)
			SetBlipScale(blip, 0.8)
			SetBlipAsShortRange(blip, true)
			SetBlipCategory(blip, 9)
			BeginTextCommandSetBlipName("STRING")
				  AddTextComponentString(true and "Garage" or ln)
			EndTextCommandSetBlipName(blip)
	
			-- Save handle to blip table
			blips[#blips+1] = blip
		end
	end)
	
	local vehicleTable = {}
	RegisterNetEvent("power:recVehicles")
	AddEventHandler("power:recVehicles", function(data)
		vehicleTable = data
	end)
	
	RegisterNetEvent("power:message")
	AddEventHandler("power:message", function(content,time)
		SetNotificationTextEntry("STRING")
			SetNotificationColorNext(0)
			AddTextComponentSubstringPlayerName(content)
		DrawNotification(0,1)
	end)
	
	RegisterCommand("testnot", function(_,args)
	
	
	end, false)
	
	local saveCallbackResponse = false
	RegisterNetEvent("power:savecallback")
	AddEventHandler("power:savecallback", function(response) saveCallbackResponse = response end)
	
	-- Load Garage
	function LoadGarage(wait)
		Citizen.CreateThread(function()
			local x,y,z = ToCoord(pwGarage.curGarage.inLocation[1], false)
			local int = GetInteriorAtCoords(x, y, z)
			if int then RefreshInterior(int) end
	
			if wait then
				BeginTextCommandBusyString("STRING")
					AddTextComponentSubstringPlayerName("Loading Garage")
				EndTextCommandBusyString(4)
				Citizen.Wait(wait)
				RemoveLoadingPrompt()
			end
	
			vehicleTable = false
			TriggerServerEvent("power:reqVehicles")
			while not vehicleTable do Citizen.Wait(0) end
			local vt = vehicleTable
	
			for _,oldVeh in pairs(pwGarage.vehicles) do
				SetEntityAsMissionEntity(oldVeh)
				DeleteVehicle(oldVeh)
			end
			pwGarage.vehicles = {}
	
			if vehicleTable and vehicleTable[pwGarage.curGarageName] then
				for pos=1,#garage.locations[pwGarage.curGarageName].carLocations do -- Something weird with JSON causes something to be stupid with null keys
					local vehData = vehicleTable[pwGarage.curGarageName][pos]
					if vehData and vehData ~= "none" then
						Citizen.CreateThread(function()
							local isInVehicle, veh, vehModel = GetVehicle()
							local x,y,z,h = ToCoord(pwGarage.curGarage.carLocations[pos], true)
							local model = tonumber(vehData["model"])
							if pwGarage.vehicleTakenLoc == pwGarage.curGarageName and pwGarage.vehicleTaken and pos == pwGarage.vehicleTakenPos and not IsEntityDead(pwGarage.vehicleTaken) then
							else
								-- Load
								RequestModel(model)
								while not HasModelLoaded(model) do Citizen.Wait(0) end
	
								-- Create
								pwGarage.vehicles[pos] = CreateVehicleFromData(vehData, x,y,z+1.0,h,true)
	
								-- Godmode
								SetEntityInvincible(pwGarage.vehicles[pos], true)
								SetEntityProofs(pwGarage.vehicles[pos], true, true, true, true, true, true, 1, true)
								SetVehicleTyresCanBurst(pwGarage.vehicles[pos], false)
								SetVehicleCanBreak(pwGarage.vehicles[pos], false)
								SetVehicleCanBeVisiblyDamaged(pwGarage.vehicles[pos], false)
								SetEntityCanBeDamaged(pwGarage.vehicles[pos], false)
								SetVehicleExplodesOnHighExplosionDamage(pwGarage.vehicles[pos], false)
							end
							Citizen.CreateThread(function()
								while true do
									Citizen.Wait(0)
									local isInVehicle, veh = GetVehicle()
									if isInVehicle and veh == pwGarage.vehicles[pos] then
										local x,y,z = table.unpack(GetEntityVelocity(veh))
										if (x > 0.5 or y > 0.5 or z > 0.5) or (x < -0.5 or y < -0.5 or z < -0.5) then
											Citizen.CreateThread(function()
												pwGarage.vehicleTakenPos = pos
												pwGarage.vehicleTakenLoc = pwGarage.curGarageName
	
												local ent = GetPlayerPed(-1)
												local x,y,z,h = ToCoord(pwGarage.curGarage.spawnOutLocation, true)
												TriggerServerEvent("power:deleteVehicle",pwGarage.curGarageName,pwGarage.vehicleTakenPos)
												DoScreenFadeOut(500)
												while IsScreenFadingOut() do Citizen.Wait(0) end
												FreezeEntityPosition(ent, true)
												SetEntityCoords(ent, x, y, z)
	
												-- Delete All Prev Vehicles
												for i,veh in ipairs(pwGarage.vehicles) do
													SetEntityAsMissionEntity(veh)
													DeleteVehicle(veh)
													Citizen.Wait(10)
												end
												if pwGarage.vehicleTaken then DeleteVehicle(pwGarage.vehicleTaken) end -- Delete the last vehicle taken out if there is one
	
												-- Create new vehicle
												pwGarage.vehicleTaken = CreateVehicleFromData(vehData, x,y,z+1.0,h)
												FreezeEntityPosition(pwGarage.vehicleTaken, true)
												Citizen.Wait(1000)
												SetEntityAsMissionEntity(pwGarage.vehicleTaken)
	
												SetPedIntoVehicle(ent, pwGarage.vehicleTaken, -1) -- Put the ped into the new vehicle
												Citizen.Wait(1000)
	
												FreezeEntityPosition(ent, false)
												FreezeEntityPosition(pwGarage.vehicleTaken, false)
												Citizen.Wait(1000)
	
												DoScreenFadeIn(500)
												while IsScreenFadingIn() do Citizen.Wait(0) end
	
												pwGarage.curGarage = false
												pwGarage.curGarageName = false
											end)
											break
										end
									end
								end
							end)
						end)
					end
				end
			end
		end)
	end

	Citizen.CreateThread(function()
		while true do
			local isInVehicle, veh, vehModel = GetVehicle()
			if not pwGarage.curGarage then
				for ln,location in pairs(garage.locations) do
					local ent = isInVehicle and veh or GetPlayerPed(-1)
					local ix,iy,iz = ToCoord(location.inLocation[1],false)
	
				--	if Vdist2(GetEntityCoords(ent),ix,iy,iz) < 500.0 then
					--	DrawMarker(20, ix,iy,iz+1.0, 0.0, 0.0, 0.0, 180.0, 0.0, 180.0, 1.5, 1.5, 1.0, 0, 128, 255, 100, false, true, 2, false, false, false, false)
				--	end
	
					local allowed = true
					if IsThisModelABoat(vehModel) then allowed = false end
					if IsThisModelAPlane(vehModel) then allowed = false end
					if IsThisModelAHeli(vehModel) then allowed = false end
					for _,blockedModel in ipairs("police") do
						if GetHashKey(blockedModel) == vehModel then allowed = false end
					end 
	
					if Vdist2(GetEntityCoords(ent),ix,iy,iz) < location.inLocation[2]*2.5 and not IsPedSprinting(GetPlayerPed(-1)) then
				        if not allowed then
							DisplayHelpTextThisFrame("WEB_VEH_INV", 1)
						else
							DisplayHelpTextThisFrame("ENTER", 1)
							if IsControlJustReleased(0, 51) then
								if isInVehicle then SetVehicleHalt(veh,1.0,1) end -- Nice Native!
								pwGarage.curGarage = location
								pwGarage.curGarageName = ln
								if false then print("[DEBUG] Garage entré: "..tostring(ln)) end
								if not isInVehicle then
									LoadGarage()
									local x,y,z,h = ToCoord(pwGarage.curGarage.spawnInLocation, true)
									FancyTeleport(ent, x,y,z,h)
									Citizen.Wait(500)
								else
									saveCallbackResponse = false
									if pwGarage.vehicleTaken ~= veh then
										TriggerServerEvent("power:saveVehicle",VehicleToData(veh),ln)
									else
										TriggerServerEvent("power:saveVehicle",VehicleToData(veh),ln,pwGarage.vehicleTakenPos,pwGarage.vehicleTakenLoc)
									end
									while not saveCallbackResponse do Citizen.Wait(0) end
	
									if saveCallbackResponse == "no_slot" then
										pwGarage.curGarage = false
										pwGarage.curGarageName = false
										while Vdist2(GetEntityCoords(ent),ix,iy,iz) < location.inLocation[2]*2.5 do
											Citizen.Wait(0)
											DisplayHelpTextThisFrame("WEB_VEH_FULL", 1)
										end
									end
	
									Citizen.Wait(1000)
									if saveCallbackResponse == "success" then
										local lastVeh = veh
										pwGarage.vehicleTaken = false
										pwGarage.vehicleTakenPos = false
										pwGarage.vehicleTakenLoc = false
	
										LoadGarage()
	
	
										local x,y,z,h = ToCoord(pwGarage.curGarage.spawnInLocation, true)
										FancyTeleport(GetPlayerPed(-1), x,y,z,h)
										Citizen.Wait(1000)
	
										SetEntityAsMissionEntity(lastVeh)
										DeleteVehicle(lastVeh)
									end
								end
								saveCallbackResponse = false
							end
						end
					end
				end
			else
				local gr = pwGarage.curGarage
				local ent = isInVehicle and veh or GetPlayerPed(-1)
				-- Exit Marker
	
				local ox,oy,oz = ToCoord(gr.outMarker)
				DrawMarker(1, ox,oy,oz, 0.0, 0.0, 0.0, 180.0, 180.0, 180.0, 1.0, 1.0, 1.0, 0, 128, 255, 100, false, true, 2, false, false, false, false)
				if Vdist2(GetEntityCoords(ent),ToCoord(gr.outMarker)) <= 1.5 then
					local x,y,z,h = ToCoord(pwGarage.curGarage.spawnOutLocation,true)
					local ix,iy,iz = ToCoord(gr.inLocation[1],false)
					local rad = gr.inLocation[2]
					FancyTeleport(ent, x,y,z,h, 500,2000,500, true)
					Citizen.Wait(3000)
					pwGarage.curGarage = false
					pwGarage.curGarageName = false
					pwGarage = pwGarage or Garage_default
					Citizen.Wait(500)
					while Vdist2(GetEntityCoords(ent),ix,iy,iz) < rad*2.5 do Citizen.Wait(0) end
				end
			end
			Citizen.Wait(0)
		end
	end)
	
	-- Slow walk loop
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if pwGarage.curGarage and true then
				DisableControlAction(0, 22, true)
				DisablePlayerFiring(PlayerId(), true)
			end
		end
	end)
	
	Citizen.CreateThread(function()
		while true do
			if true then
				local curGarage = pwGarage.curGarage
				while pwGarage.curGarage == curGarage do Citizen.Wait(0) end
	
				if pwGarage.curGarage then
					SetCanAttackFriendly(GetPlayerPed(-1), false, false)
					NetworkSetFriendlyFireOption(false)
				else
					SetCanAttackFriendly(GetPlayerPed(-1), true, false)
					NetworkSetFriendlyFireOption(true)
				end
			end
			Citizen.Wait(0)
		end
	end)
	
	
	-- Personal vehicle blip
	--[[
	Citizen.CreateThread(function()
		local blip = false
		while true do
			Citizen.Wait(0)
			local prevEntId = pwGarage.vehicleTaken
			while not pwGarage.vehicleTaken or prevEntId == pwGarage.vehicleTaken do Citizen.Wait(0) end
	
			blip = AddBlipForEntity(pwGarage.vehicleTaken)
	
			SetBlipSprite(blip, 225)
	
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringTextLabel("PVEHICLE")
			EndTextCommandSetBlipName(blip)
	
			Citizen.CreateThread(function() -- I could probably make this better but eh
				local myBlip = blip
				while myBlip == blip do
					Citizen.Wait(0)
					local isInVehicle, veh = GetVehicle(_,true)
					if isInVehicle and veh == pwGarage.vehicleTaken then
						if GetBlipInfoIdDisplay(myBlip) ~= 3 then
							SetBlipDisplay(myBlip, 3)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentSubstringTextLabel("PVEHICLE")
							EndTextCommandSetBlipName(myBlip)
						end
					else
						if GetBlipInfoIdDisplay(myBlip) ~= 2 then
							SetBlipDisplay(myBlip, 2)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentSubstringTextLabel("PVEHICLE")
							EndTextCommandSetBlipName(myBlip)
						end
					end
					if IsEntityDead(pwGarage.vehicleTaken) then
						RemoveBlip(myBlip)
						break
					end
				end
			end)
		end
	end)
	]]
	
	-- Hide players in garage
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if pwGarage.curGarage then
				for i=0,63 do
					if i ~= GetPlayerServerId(PlayerId()) then
						SetPlayerInvisibleLocally(GetPlayerFromServerId(i))
					end
				end
			end
		end
	end)
	
end) -- no, this is not mismatched
	