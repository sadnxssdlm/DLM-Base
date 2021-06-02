Citizen.CreateThread(function()
    while GM == nil do 
        TriggerEvent('GM:getSharedObject', function(obj) 
            GM = obj 
        end)
        Citizen.Wait(0)
    end 
    isPlayerWhitelisted = sdsdResdxWq()
    PlayerData = GM.GetPlayerData()
end)
RegisterNetEvent('GM:setJob')
AddEventHandler('GM:setJob', function(job)
    PlayerData.job = job 
    isPlayerWhitelisted = sdsdResdxWq()
end)
function sdsdResdxWq()
    if not GM.PlayerData then
        return false 
    end 
    if not GM.PlayerData.job then 
        return false 
    end 
    if v == GM.PlayerData.job.name then
        return true 
    end 
    return false 
end
function startAttitude(_, anim)
    Citizen.CreateThread(function()
   
        local playerPed = GetPlayerPed(-1)
   
        RequestAnimSet(anim)
         
        while not HasAnimSetLoaded(anim) do
            Citizen.Wait(1)
        end
		SetPedMotionBlur(playerPed, false)
        SetPedMovementClipset(playerPed, anim, true)
    end)
 
end 
function humeur(lib, anim)
    ped = GetPlayerPed(-1)
    ClearFacialIdleAnimOverride(ped)
    if Index ~= 1 then
        SetFacialIdleAnimOverride(ped, anim, 0)
    end 
end

function doAnim(animName, time, flag, ped, customPos)
    if type(animName) ~= "table" then
        animName = { animName }
    end
    ped, flag = ped or GetPlayerPed(-1), flag and tonumber(flag) or false
    if not animName or not animName[1] or string.len(animName[1]) < 1 then
        return
    end
    if IsPedRunningRagdollTask(ped) or IsEntityPlayingAnim(ped, animName[1], animName[2], 3) or IsPedActiveInScenario(ped) and (not typ or typ < 40) then
        ClearPedTasks(ped)
        return
    end
    Citizen.CreateThread(function()
        StartAnim(animName, flag, { ped = ped, time = time, pos = customPos })
    end)
end

local dsWl_2Vrtx = {}
local humeur2={"Normale","Blessé","Chic","Colère","Concentration","Dormir","Heureux","Milou","Soul","Stressé"}
local demarche={"Normale","Gangster 1","Gangster 2","Gangster 3","Gangster 4","Apeuré","Sexy","Efféminé 1","Efféminé 2","Efféminé 3","Buzzed","Brave 1","Brave 2","Bravo 1","Casu 1","Casu 2","Casu 3","Casu 4","Casu 5","Casu 6","Casu 7","Bourré 1","Hipster","Presser 1","Blessé","Peureux","Riche","Musclé","Triste 1","Triste 2","Triste 3","Triste 4","Efféminé 5","Shady 1","Swag 1","Swag 2","Franklin 1","Trevor 1","Michael 1","Jimmy 1","Lester","Lester2","Lemar","Alien"}
dqs = {
    Base = {Header={"commonmenu","interaction_bgd"},Header2={"mprankbadge", "rankglobe_21x21_colour"},Color={color_black},HeaderColor={255, 255, 255}}, -- "commonmenu","interaction_bgd"
    Data = {currentMenu = "~b~MENU INTERACTION"}, 
    Events = {
        ["onSelected"] = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            local slide = btn.slidenum
            local button = btn
            local btn = btn.name   
            local check = btn.unkCheckbox
            local closestPlayer, closestDistance = GM.Game.GetClosestPlayer()
            local playerPed = PlayerPedId() 
            local vehicle = GetVehiclePedIsIn(playerPed)
            local coords = GetEntityCoords(playerPed)
            local currentMenu = self.Data.currentMenu

            if btn == "Enlever le Haut" then
                setUniform('torso', plyPed)
            elseif btn == "Enlever le Pantalon" then
                setUniform('pants', plyPed)
            elseif btn == "Enlever les Chaussures" then
                setUniform('shoes', plyPed)
            elseif btn == "Enlever le Sac" then
                setUniform('bag', plyPed)
            elseif btn == "Enlever le Gilet par balle" then
                setUniform('bproof', plyPed)
            elseif btn == "Enlever le Chapeau" then
                setUniform('helmet_1', plyPed)
            elseif btn == "Enlever les Lunettes" then
                setUniform('glasses_1', plyPed)
            elseif btn == "Enlever les Oreillette" then
                setUniform('oreillette', plyPed)
            elseif btn == "Enlever le Masque" then
                setUniform('mask_1', plyPed)
            elseif btn == "Enlever la Montre" then
                setUniform('montre', plyPed)
            elseif btn == "Enlever le Bracelets" then
                setUniform('bracelets', plyPed)
            elseif btn == "Enlever la Chaîne" then
                setUniform('chaine', plyPed)
            end
            if slide== 1 and btn == "Catégories" then 
                OpenMenu("haut")
            end
            if slide== 2 and btn == "Catégories" then
                OpenMenu("bas")
            end   
            if slide== 3 and btn == "Catégories" then
                OpenMenu("accessoires")
            end
            TriggerEvent('pChacreate:getSkin', function(skin)
                if slide== 1 and btn == "Démarche du joueur" then 
                    if skin.sex == 0 then
                        startAttitude('move_m@multiplayer', 'move_m@multiplayer')
                    elseif skin.sex == 1 then
                        startAttitude('move_f@multiplayer', 'move_f@multiplayer')
                    end
                end
            end)
            if slide== 2 and btn == "Démarche du joueur" then 
 
                startAttitude('move_m@gangster@generic', 'move_m@gangster@generic')
            end
            if slide== 3 and btn == "Démarche du joueur" then
 
                startAttitude('move_m@gangster@ng', 'move_m@gangster@ng')
            end   
            if slide== 4 and btn == "Démarche du joueur" then
 
                startAttitude('move_m@gangster@var_e', 'move_m@gangster@var_e')
            end
            if slide== 5 and btn == "Démarche du joueur" then
 
                startAttitude('move_m@gangster@var_f', 'move_m@gangster@var_f')
            end   
            if slide== 6 and btn == "Démarche du joueur" then
 
                startAttitude('move_m@gangster@var_i', 'move_m@gangster@var_i')
            end       
            if slide== 7 and btn == "Démarche du joueur" then
 
                startAttitude('move_f@sexy@a', 'move_f@sexy@a')
            end   
            if slide== 8 and btn == "Démarche du joueur" then

                startAttitude('move_f@femme@', 'move_f@femme@')
            end    
            if slide== 9 and btn == "Démarche du joueur" then

                startAttitude('move_m@femme@', 'move_m@femme@')
            end   
            if slide== 10 and btn == "Démarche du joueur" then

                startAttitude('move_f@generic', 'move_f@generic')
            end   
            if slide== 11 and btn == "Démarche du joueur" then

                startAttitude('move_m@buzzed', 'move_m@buzzed')
            end
            if slide== 12 and btn == "Démarche du joueur" then

                startAttitude('move_m@brave', 'move_m@brave')
            end   
            if slide== 13 and btn == "Démarche du joueur" then

                startAttitude('MOVE_M@TOUGH_GUY@', 'MOVE_M@TOUGH_GUY@')
            end   
            if slide== 14 and btn == "Démarche du joueur" then

                startAttitude('move_m@hobo@a', 'move_m@hobo@a')
            end   
            if slide== 15 and btn == "Démarche du joueur" then

                startAttitude('move_m@casual@a', 'move_m@casual@a')
            end   
            if slide== 16 and btn == "Démarche du joueur" then

                startAttitude('move_m@casual@b', 'move_m@casual@b')
            end    
            if slide== 17 and btn == "Démarche du joueur" then

                startAttitude('move_m@casual@c', 'move_m@casual@c')
            end   
            if slide== 18 and btn == "Démarche du joueur" then

                startAttitude('move_m@casual@d', 'move_m@casual@d')
            end   
            if slide== 19 and btn == "Démarche du joueur" then

                startAttitude('move_m@casual@e', 'move_m@casual@e')
            end
            if slide== 20 and btn == "Démarche du joueur" then

                startAttitude('move_m@casual@f', 'move_m@casual@f')
            end   
            if slide== 21 and btn == "Démarche du joueur" then

                startAttitude('move_m@fat@a', 'move_m@fat@a')
            end   
            if slide== 22 and btn == "Démarche du joueur" then

                startAttitude('move_m@hobo@a', 'move_m@hobo@a')
            end   
            if slide== 23 and btn == "Démarche du joueur" then

                startAttitude('move_m@hipster@a', 'move_m@hipster@a')
            end 
            if slide== 24 and btn == "Démarche du joueur" then

                startAttitude('move_m@hurry_butch@a','move_m@hurry_butch@a')
            end    
            if slide== 25 and btn == "Démarche du joueur" then

                startAttitude('move_m@injured', 'move_m@injured')
            end   
            if slide== 26 and btn == "Démarche du joueur" then

                startAttitude('move_m@scared', 'move_m@scared')
            end   
            if slide== 27 and btn == "Démarche du joueur" then

                startAttitude('move_m@business@a', 'move_m@business@a')
            end
            if slide== 28 and btn == "Démarche du joueur" then

                startAttitude('move_m@muscle@a', 'move_m@muscle@a')
            end   
            if slide== 29 and btn == "Démarche du joueur" then

                startAttitude('move_m@leaf_blower','move_m@leaf_blower')
            end   
            if slide== 30 and btn == "Démarche du joueur" then

                startAttitude('move_f@sad@a', 'move_f@sad@a')
            end   
            if slide== 31 and btn == "Démarche du joueur" then

                startAttitude('move_m@sad@a', 'move_m@sad@a')
            end 
            if slide== 32 and btn == "Démarche du joueur" then

                startAttitude('move_m@hobo@a', 'move_m@hobo@a')
            end    
            if slide== 33 and btn == "Démarche du joueur" then

                startAttitude('move_f@tough_guy@', 'move_f@tough_guy@')
            end   
            if slide== 34 and btn == "Démarche du joueur" then

                startAttitude('move_m@shadyped@a', 'move_m@shadyped@a')
            end   
            if slide== 35 and btn == "Démarche du joueur" then

                startAttitude('move_m@swagger', 'move_m@swagger')
            end
            if slide== 36 and btn == "Démarche du joueur" then

                startAttitude('move_m@swagger@b', 'move_m@swagger@b')
            end   
            if slide== 37 and btn == "Démarche du joueur" then

                startAttitude('move_p_m_one', 'move_p_m_one')
            end   
            if slide== 38 and btn == "Démarche du joueur" then

                startAttitude('move_p_m_two', 'move_p_m_two')
            end   
            if slide== 39 and btn == "Démarche du joueur" then

                startAttitude('move_ped_bucket', 'move_ped_bucket')
            end  
            if slide== 40 and btn == "Démarche du joueur" then

                startAttitude('move_characters@michael@fire', 'move_characters@michael@fire')
            end   
           if slide== 41 and btn == "Démarche du joueur" then

                startAttitude('move_heist_lester', 'move_heist_lester')
            end  
            if slide== 42 and btn == "Démarche du joueur" then
                startAttitude('move_lester_caneup', 'move_lester_caneup')
            end  
            if slide== 43 and btn == "Démarche du joueur" then
                startAttitude('anim_group_move_lemar_alley', 'anim_group_move_lemar_alley')
            end
            if slide== 44 and btn == "Démarche du joueur" then
                startAttitude('move_m@alien', 'move_m@alien')
            end  
            if slide == 1 and btn == "Humeur du joueur" then
                humeur("")
            end
            if slide == 2 and btn == "Humeur du joueur" then
                humeur("mood_injured_1", "mood_injured_1")
            end
            if slide == 3 and btn == "Humeur du joueur" then
                humeur("mood_smug_1", "mood_smug_1")
            end
            if slide == 4 and btn == "Humeur du joueur" then
                humeur("mood_angry_1", "mood_angry_1")
            end
            if slide == 5 and btn == "Humeur du joueur" then
                humeur("mood_aiming_1", "mood_aiming_1")
            end
            if slide == 6 and btn == "Humeur du joueur" then
                humeur("mood_sleeping_1", "mood_sleeping_1")
            end
            if slide == 7 and btn == "Humeur du joueur" then
                humeur("mood_happy_1", "mood_happy_1")
            end
            if slide == 8 and btn == "Humeur du joueur" then
                humeur("mood_sulk_1", "mood_sulk_1")
            end
            if slide == 9 and btn == "Humeur du joueur" then
                humeur("mood_drunk_1", "mood_drunk_1")
            end
            if slide == 10 and btn == "Humeur du joueur" then
                humeur("mood_stressed_1", "mood_stressed_1")
            end

            if slide == 1 and btn == "GPS" then
				DeleteWaypoint()
            end
            if slide == 2 and btn == "GPS" then
                coords = vector2(423.99,-980.63) 
                if coords ~= nil then
					SetNewWaypoint(coords)
				else
					DeleteWaypoint()
				end
            end
            if slide == 3 and btn == "GPS" then
                coords = vector2(360.86, -604.38)
                if coords ~= nil then
					SetNewWaypoint(coords)
				else
					DeleteWaypoint()
				end
            end
            if slide == 4 and btn == "GPS" then
                coords = vector2(-1391.06, -590.34)
                if coords ~= nil then
					SetNewWaypoint(coords)
				else
					DeleteWaypoint()
				end
            end
            if slide == 5 and btn == "GPS" then
                coords = vector2(-565.09, 273.45)
                if coords ~= nil then
					SetNewWaypoint(coords)
				else
					DeleteWaypoint()
				end
            end
            if slide == 6 and btn == "GPS" then
                coords = vector2(-33.88, -1102.37)
                if coords ~= nil then
					SetNewWaypoint(coords)
				else
					DeleteWaypoint()
				end
            end
            if slide == 1 and btn == "Fenêtres" then
                TriggerEvent('window_open', 2)
            elseif slide == 2 and btn == "Fenêtres" then
                TriggerEvent('window_open', 1)
            elseif slide == 3 and btn == "Fenêtres" then	
                TriggerEvent('window_open', 4)
            elseif slide == 4 and btn == "Fenêtres" then
                TriggerEvent('window_open', 3)
            elseif slide == 5 and btn == "Fenêtres" then 
                TriggerEvent('window_open', 5)
            end
            if btn == "Statut moteur" then 
                plyPed = PlayerPedId()
                if not IsPedSittingInAnyVehicle(plyPed) then
                    ShowAboveRadarMessage('~r~Vous c\'êtes pas sur un véhicule.')
                elseif IsPedSittingInAnyVehicle(plyPed) then 
                    plyVehicle = GetVehiclePedIsIn(plyPed, false)
                    if GetIsVehicleEngineRunning(plyVehicle) then
                        SetVehicleEngineOn(plyVehicle, false, false, true)
                        SetVehicleUndriveable(plyVehicle, true)
                    else
                        SetVehicleEngineOn(plyVehicle, true, false, true)
                        SetVehicleUndriveable(plyVehicle, false)
                    end
                end
            end
            if slide == 1 and btn == "Portes" then
                plyPed = PlayerPedId()
                if not IsPedSittingInAnyVehicle(plyPed) then
                    ShowAboveRadarMessage('~r~Vous c\'êtes pas sur un véhicule.')
                elseif IsPedSittingInAnyVehicle(plyPed) then
                    plyVehicle = GetVehiclePedIsIn(plyPed, false)
                    if not dsWl_2Vrtx.frontLeftDoorOpen then
						dsWl_2Vrtx.frontLeftDoorOpen = true
						SetVehicleDoorOpen(plyVehicle, 0, false, false)
					elseif dsWl_2Vrtx.frontLeftDoorOpen then
						dsWl_2Vrtx.frontLeftDoorOpen = false
						SetVehicleDoorShut(plyVehicle, 0, false, false)
                    end
                end
            end
            if slide == 2 and btn == "Portes" then
                plyPed = PlayerPedId()
                if not IsPedSittingInAnyVehicle(plyPed) then
                    ShowAboveRadarMessage('~r~Vous c\'êtes pas sur un véhicule.')
                elseif IsPedSittingInAnyVehicle(plyPed) then
                    plyVehicle = GetVehiclePedIsIn(plyPed, false)
					if not dsWl_2Vrtx.frontRightDoorOpen then
						dsWl_2Vrtx.frontRightDoorOpen = true
						SetVehicleDoorOpen(plyVehicle, 1, false, false)
					elseif dsWl_2Vrtx.frontRightDoorOpen then
						dsWl_2Vrtx.frontRightDoorOpen = false
						SetVehicleDoorShut(plyVehicle, 1, false, false)
					end
                end
            end
            if slide == 3 and btn == "Portes" then
                plyPed = PlayerPedId()
                if not IsPedSittingInAnyVehicle(plyPed) then
                    ShowAboveRadarMessage('~r~Vous c\'êtes pas sur un véhicule.')
                elseif IsPedSittingInAnyVehicle(plyPed) then
                    plyVehicle = GetVehiclePedIsIn(plyPed, false)
					if not dsWl_2Vrtx.backLeftDoorOpen then
						dsWl_2Vrtx.backLeftDoorOpen = true
						SetVehicleDoorOpen(plyVehicle, 2, false, false)
					elseif dsWl_2Vrtx.backLeftDoorOpen then
						dsWl_2Vrtx.backLeftDoorOpen = false
						SetVehicleDoorShut(plyVehicle, 2, false, false)
					end
                end
            end
            if slide == 4 and btn == "Portes" then
                plyPed = PlayerPedId()
                if not IsPedSittingInAnyVehicle(plyPed) then
                    ShowAboveRadarMessage('~r~Vous c\'êtes pas sur un véhicule.')
                elseif IsPedSittingInAnyVehicle(plyPed) then
                    plyVehicle = GetVehiclePedIsIn(plyPed, false)
					if not dsWl_2Vrtx.backRightDoorOpen then
						dsWl_2Vrtx.backRightDoorOpen = true
						SetVehicleDoorOpen(plyVehicle, 3, false, false)
					elseif dsWl_2Vrtx.backRightDoorOpen then
						dsWl_2Vrtx.backRightDoorOpen = false
						SetVehicleDoorShut(plyVehicle, 3, false, false)
					end
                end
            end
            if slide == 5 and btn == "Portes" then 
                plyPed = PlayerPedId()
                if not IsPedSittingInAnyVehicle(plyPed) then
                    ShowAboveRadarMessage('~r~Vous c\'êtes pas sur un véhicule.')
                elseif IsPedSittingInAnyVehicle(plyPed) then
                    plyVehicle = GetVehiclePedIsIn(plyPed, false)
                    if not dsWl_2Vrtx.hoodDoorOpen then
                        dsWl_2Vrtx.hoodDoorOpen = true
                        SetVehicleDoorOpen(plyVehicle, 4, false, false)
                    elseif dsWl_2Vrtx.hoodDoorOpen then
						dsWl_2Vrtx.hoodDoorOpen = false
						SetVehicleDoorShut(plyVehicle, 4, false, false)
                    end
				end
            end
            if slide == 6 and btn == "Portes" then 
                plyPed = PlayerPedId()
                if not IsPedSittingInAnyVehicle(plyPed) then
                    ShowAboveRadarMessage('~r~Vous c\'êtes pas sur un véhicule.')
                elseif IsPedSittingInAnyVehicle(plyPed) then
                    plyVehicle = GetVehiclePedIsIn(plyPed, false)
                    if not dsWl_2Vrtx.trunkDoorOpen then
                        dsWl_2Vrtx.trunkDoorOpen = true
                        SetVehicleDoorOpen(plyVehicle, 5, false, false)
                    elseif dsWl_2Vrtx.trunkDoorOpen then
						dsWl_2Vrtx.trunkDoorOpen = false
						SetVehicleDoorShut(plyVehicle, 5, false, false)
                    end
                end
            end
            if btn == "État du véhicule" then
                if IsPedInAnyVehicle(PlayerPedId(-1), true) then
					ShowAboveRadarMessage("Réservoir: ~o~"..math.ceil(GetVehicleFuelLevel(vehicle)).."L\n~w~État moteur: ~o~"..math.ceil(GetVehicleEngineHealth(vehicle)/10).."%\n~w~État véhicule: ~o~"..getVehicleHealth(vehicle).."%")
				else
					ShowAboveRadarMessage('~r~Vous c\'êtes pas sur un véhicule.')
				end
            end
            if slide == 1 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 300.0)
            end
            if slide == 2 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 8.1)
            end
            if slide == 3 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 11.0)
            end
            if slide == 4 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 13.8)
            end
            if slide == 5 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 19.2)
            end
            if slide == 6 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 22.0)
            end
            if slide == 7 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 24.9)
            end
            if slide == 8 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 30.5)
            end
            if slide == 9 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 36.0)
            end
            if slide == 10 and btn == "Régulateur de vitesse" then
                SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId(), false), 41.6)
            end
            if slide == 1 and btn == "Cacher la Carte / Afficher la Carte" then
                ExecuteCommand('cachermap')
            end
            if slide == 1 and btn == "Cacher l'hud / Afficher l'hud" then
                ExecuteCommand("HUD")
            end    
            if slide == 2 and btn == "Cacher l'hud / Afficher l'hud" then
                ExecuteCommand("cacherHUD")
            end
            if slide == 1 and btn == "Oui" then
                CloseMenu()
                if not HasAnimDictLoaded('mp_suicide') then
                    RequestAnimDict('mp_suicide')
                    
                    while not HasAnimDictLoaded('mp_suicide') do
                        Wait(1)
                    end
                end
    
                TaskPlayAnim(playerPed, "mp_suicide", "pill", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
    
                Wait(4600)
    
                SetPedShootsAtCoord(playerPed, 0.0, 0.0, 0.0, 0)
                SetEntityHealth(playerPed, 0)
            end
            if slide == 2 and btn == "Oui" then
                if IsPedArmed(PlayerPedId(), 4) then
                    CloseMenu()
                    if not HasAnimDictLoaded('mp_suicide') then
                        RequestAnimDict('mp_suicide')
                        
                        while not HasAnimDictLoaded('mp_suicide') do
                            Wait(1)
                        end
                    end
        
                    TaskPlayAnim(playerPed, "mp_suicide", "pistol", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
        
                    Wait(900)
        
                    SetPedShootsAtCoord(playerPed, 0.0, 0.0, 0.0, 0)
                    SetEntityHealth(playerPed, 0)
                else
                    GM.ShowNotification('~r~Vous n\'avez pas d\'arme')
                end
            end
            if btn == "Non" then
                OpenMenu("style")
            end
            if btn == "Inventaire" then
                TriggerEvent('GM:getSharedObject', function(obj) GM = obj end)
                GM.PlayerData = GM.GetPlayerData()
                dqs.Menu["inventaire"].b = {}
                table.insert(dqs.Menu["inventaire"].b, {name = "Portefeuille", ask = "→", askX = true})
                for i=1, #GM.PlayerData.inventory, 1 do
                    local count = GM.PlayerData.inventory[i].count
                    if count >= 1 then 
                        table.insert(dqs.Menu["inventaire"].b, { name = "(".. count ..")  " .. GM.PlayerData.inventory[i].label .. "", slidemax = {"Utiliser","Donner","Jeter "}})
                    end
                end
            end
            if button.slidename == "Utiliser" then
                for i=1, #GM.PlayerData.inventory, 1 do
                    local count = GM.PlayerData.inventory[i].count
                    if "(".. count ..")  " .. GM.PlayerData.inventory[i].label .. "" == btn and count > 0 then
                        if GM.PlayerData.inventory[i].usable then
                            TriggerServerEvent('GM:useItem', GM.PlayerData.inventory[i].name)
                            CloseMenu()
                            Wait(100)
                            CreateMenu(dqs)
                            Wait(100)
                            TriggerEvent('GM:getSharedObject', function(obj) GM = obj end)
                            GM.PlayerData = GM.GetPlayerData()
                            dqs.Menu["inventaire"].b = {}
                            table.insert(dqs.Menu["inventaire"].b, {name = "Portefeuille", ask = "→", askX = true})
                            for i=1, #GM.PlayerData.inventory, 1 do
                                local count = GM.PlayerData.inventory[i].count
                                if count >= 1 then 
                                    table.insert(dqs.Menu["inventaire"].b, { name = "(".. count ..")  " .. GM.PlayerData.inventory[i].label .. "", slidemax = {"Utiliser","Donner","Jeter "}})
                                end
                            end
                            OpenMenu('inventaire')
                        else
                            GM.ShowNotification('Pas utilisable', GM.PlayerData.inventory[i].label)
                        end
                    end 
                end
            end
            if button.slidename == "Donner" then
                if foundPlayers == true then
                    local quantity = KeyboardInput("RedCity", '', "", 8)
                    for i=1, #GM.PlayerData.inventory, 1 do
                        local count = GM.PlayerData.inventory[i].count
                        if "(".. count ..")  " .. GM.PlayerData.inventory[i].label .. "" == btn and count > 0 then
                            local foundPlayers = false
                            kAucJRnd.closestPlayer, kAucJRnd.closestDistance = GM.Game.GetClosestPlayer()
                            if kAucJRnd.closestDistance ~= -1 and kAucJRnd.closestDistance <= 3 then
                                foundPlayers = true
                            end
            
                            local closestPed = GetPlayerPed(kAucJRnd.closestPlayer)
                            if quantity ~= nil and count > 0 then
                                local post = true
                                quantity = tonumber(quantity)
                                if type(quantity) == 'number' then
                                    quantity = GM.Math.Round(quantity)
                        
                                    if quantity <= 0 then
                                        post = false
                                    end
                                end
                                TriggerServerEvent('GM:giveInventoryItem', GetPlayerServerId(kAucJRnd.closestPlayer), 'item_standard', GM.PlayerData.inventory[i].name, quantity)
                                TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake2_a", 2.0, 2.0, 1000, 51, 0, false, false, false)
                                CloseMenu()
                            else
                                GM.ShowNotification('~r~Montant invalide')
                            end
                         end
                    end
                else
                    GM.ShowNotification('~r~Il n\'y a personne près de vous.')
                end
            end
            if button.slidename == "Jeter " then
                local quantity = KeyboardInput("RedCity", '', "", 8)
                for i=1, #GM.PlayerData.inventory, 1 do
                    local count = GM.PlayerData.inventory[i].count
                    if "(".. count ..")  " .. GM.PlayerData.inventory[i].label .. "" == btn and count > 0 then
                        if not IsPedSittingInAnyVehicle(plyPed) then
                            if quantity ~= nil then
                                local post = true
                                quantity = tonumber(quantity)
                                if type(quantity) == 'number' then
                                    quantity = GM.Math.Round(quantity)
                                    if quantity <= 0 then
                                        post = false
                                    end
                                end
                                TriggerServerEvent('GM:removeInventoryItem', 'item_standard', GM.PlayerData.inventory[i].name, quantity)
                                TaskPlayAnim(GetPlayerPed(-1), "random@domestic", "pickup_low", 2.0, 2.0, 1000, 51, 0, false, false, false)
                                CloseMenu()
                                Wait(100)
                                CreateMenu(dqs)
                                Wait(100)
                                TriggerEvent('GM:getSharedObject', function(obj) GM = obj end)
                                GM.PlayerData = GM.GetPlayerData()
                                dqs.Menu["inventaire"].b = {}
                                table.insert(dqs.Menu["inventaire"].b, {name = "Portefeuille", ask = "→", askX = true})
                                for i=1, #GM.PlayerData.inventory, 1 do
                                    local count = GM.PlayerData.inventory[i].count
                                    if count >= 1 then 
                                        table.insert(dqs.Menu["inventaire"].b, { name = "(".. count ..")  " .. GM.PlayerData.inventory[i].label .. "", slidemax = {"Utiliser","Donner","Jeter "}})
                                    end
                                end
                                OpenMenu('inventaire')
                            else
                                GM.ShowNotification('Montant invalide')
                            end
                        else
                            GM.ShowNotification("~r~Vous pouvez pas jeter dans un véhicule !")
                        end
                    end
                end
            end
            if btn == "Mes clé(s)" then 
                OpenMenu('Mes clé(s)') 
                dqs.Menu["Mes clé(s)"].b = {}  
                GM.TriggerServerCallback('power:allkey', function(mykey)
                    for k, v in pairs(mykey) do 
                        table.insert(dqs.Menu["Mes clé(s)"].b,  {name = 'Plaque [~b~'..mykey[k].plate..'~s~]', slidemax = {"Donner "}}) 
                    end  
                end)
            end
            if button.slidename == "Donner " then
                local player, distance = GM.Game.GetClosestPlayer()
                local coords = GetEntityCoords(playerPed, true)
                local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 71)
                local vehicleProps = GM.Game.GetVehicleProperties(vehicle)
                if distance ~= -1 and distance <= 3.0 then
                    CloseMenu()
                    TriggerServerEvent('power:donnerkey', GetPlayerServerId(player), button.slidename)
                    TriggerServerEvent('power:deletekey', button.slidename)
                    TriggerServerEvent('power:changeowner', GetPlayerServerId(player), vehicleProps)
                else
                    GM.ShowNotification('~r~Il n\'y a personne près de vous.')
                end
            end
            if btn == "Arrêter l'animation" then
                SetEnableHandcuffs(GetPlayerPed(-1), false)
                ClearPedTasks(PlayerPedId())
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUND", true)
            end 
            if btn == "Dormir/se réveiller" then
                while true do 
                    Wait(0)
                    local myPed = GetPlayerPed(-1)
                    SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                    GM.ShowHelpNotification ("Appuyez sur ~INPUT_CONTEXT~ ou ~INPUT_JUMP~ pour ~b~vous relever")
                    ResetPedRagdollTimer(myPed)
                    if IsControlJustPressed(0, 22) or IsControlJustPressed(0, 46) then 
                        break
                    end
                end
            end
            if btn == "liste d'animations" then
                for i = 1 , #v, 1 do
                    if Selected then
                        StartAnim(v[i].anim, nil, v[i].func)
                    end
                end
            end
            if btn == "~r~Retirer le point" then
                DeleteWaypoint()
            end
            if btn == "Prendre votre carte bancaire." then
                if not ds then
                    ds = true 
                    SetNewWaypoint(151.19,-1037.06,29.33)
                elseif ds then
                    ds = false 
                    DeleteWaypoint()
                end
            end
            if btn == "Aller au magasin de vêtements." then
                if not z then
                    z = true 
                    SetNewWaypoint(83.456,-1391.30,29.41)
                elseif z then
                    z = false
                    DeleteWaypoint()
                end
            end
            if btn == "Aller à l'epicerie." then
                if not f then
                    f = true 
                    SetNewWaypoint(29.39,-1349.82,29.32)
                elseif f then
                    f = false
                    DeleteWaypoint()
                end
            end
            if btn == "Facture" then
                dqs.Menu["facture"].b = {}
                GM.TriggerServerCallback('power_facture:GetFacture', function(bills)
                    for i = 1, #bills, 1 do
                        local label = bills[i].label
                        local amount = bills[i].amount
                        table.insert(dqs.Menu["facture"].b, { name = bills[i].label.. ": ~r~$"..GM.Math.GroupDigits(amount) , ask = "", askX = true})
                    end
                end)
                Citizen.Wait(200)
                OpenMenu("facture")
            end
        end,
    },
    Menu = {
        ["~b~MENU INTERACTION"] = {
            b = {
                {name = "GPS", slidemax = {"Aucun","Poste de Police","Hôpital","Bahama Mama","Téquila-la"}, Des = "Sélectionnez cette option pour placer votre repère à l'endroite voulu.", Description2 = ""},
                {name = "Objectifs",  Description2 = "", Des = "Consultez vos objectifs en tant que débutant sur RedCity afin de vous aider à débuter."},
                {name = "Inventaire", Des = "Votre Inventaire contient des éléments tels que, de la Nouriture.", Description2 = ""},
                {name = "Style", Des = "Consultez et modifiez les options relatives.", Description2 = ""},
                {name = "Véhicules", Des = "Consultez et moifiez les options relatives à votre véhicule.", Description2 = ""},
                {name = "Masquer carte", Des = "Consultez et moifiez les options relatives de votre carte.", Description2 = ""},
            }
        },
        ["objectifs"] = {
            b = {
                {name = "Prendre votre carte bancaire.", checkbox = false},
                {name = "Aller au magasin de vêtements.", checkbox = false},
                {name = "Aller à l'epicerie.", checkbox = false}
            }
        },
        ["inventaire"] = { 
            Description2 = "",
			b = {
			}
        },
        ["style"] = {
            Description2 = "",
            b = {
                {name = "Dormir/se réveiller"},
                {name = "Liste d'animations"},
                {name = "Démarche du joueur", slidemax = demarche,Des = "Sélectionnée vos Démarche."},
                {name = "Humeur du joueur",slidemax=humeur2,Des = "Sélectionnée vos Humeur."},
                {name = "Suicide", Des = "Voulez-vous vraiment faire ça ?"},
                {name = "--------------------------------------"},
                {name = "Vêtements"}
            }
        },
        ["portefeuille"]={
            Description2 = "",
            b={
                {name = "Métier :",ask=function()return PlayerData.job.label end,askX=true},
                {name = "Grade :",ask=function()return PlayerData.job.grade_label end,askX=true},
                {name = "------------------------------------------------------------------"},
                {name = "Facture",ask = "→",askX=true},
            }
        },

        ["liste d'animations"] = {
            Description2 = "",
            b = {
                {name = "Arrêter l'animation"},
                {name = "Actions anim", ask = "→", askX = true},
                {name = "Armes", ask = "→", askX = true},
                {name = "Danses", ask = "→", askX = true},
                {name = "Du Sexe lo", ask = "→", askX = true},
                {name = "Expressions", ask = "→", askX = true},
                {name = "Festives", ask = "→", askX = true},
                {name = "Gestures", ask = "→", askX = true},
                {name = "Insolentes", ask = "→", askX = true},
                {name = "Poses", ask = "→", askX = true},
                {name = "S'asseoir", ask = "→", askX = true},
            },
        },

        ["s'asseoir"] = {
            Description2 = "",
            b = {
                {name = "Accouder flow 01", slide = function()return StartAnim({"missheistdockssetup1ig_12@base","talk_gantry_idle_base_worker2"},1) end},
                {name = "Accouder flow 02",slide = function()return StartAnim({"missheistdockssetup1ig_12@base","talk_gantry_idle_base_worker4"},1) end},
                {name = "S'asseoir au sol",slide = function()return StartAnim({"anim@heists@fleeca_bank@ig_7_jetski_owner","owner_idle"},1) end},
                {name = "Se poser contre un mur",slide = function()return doAnim("WORLD_HUMAN_LEANING") end},
                {name = "S'asseoir par terre",slide = function()return doAnim("WORLD_HUMAN_PICNIC") end},
                {name = "S'asseoir cool 2",slide = function()return StartAnim({"anim@heists@heist_safehouse_intro@phone_couch@male","phone_couch_male_idle"},1) end},
                {name = "Méditation",slide = function()return StartAnim({"rcmcollect_paperleadinout@","meditiate_idle"},1) end},
                {name = "Genoux au sol",slide = function()return StartAnim({"amb@medic@standing@kneel@base","base"},1) end},
                {name = "S'asseoir chill",slide = function()return StartAnim({"missheistpaletoscoresetupleadin","rbhs_mcs_1_leadin"},1) end},
                {name = "S'asseoir cool",slide = function()return StartAnim({"missfam2leadinoutmcs3","onboat_leadin_pornguy_a"},1) end }
            }
        },
        
        ["actions anim"] = {
            Description2 = "",
            b = {       
                {name = "Slide",slide = function()return StartAnim({"anim@arena@celeb@flat@solo@no_props@","slide_a_player_a"}) end },
                {name = "Reverence ",slide = function()return StartAnim({"anim@arena@celeb@podium@no_prop@","regal_c_1st"}) end },
                {name = "Pleure a genoux",slide = function()return StartAnim({"mp_bank_heist_1","f_cower_01"},1) end},
                {name = "Sortir son carnet",slide = function()return doAnim("CODE_HUMAN_MEDIC_TIME_OF_DEATH") end },
                {name = "Noter des informations",slide = function()return StartAnim({"amb@world_human_clipboard@male@base", "base"}) end },
                {name = "Siffler",slide = function()return StartAnim({"rcmnigel1c","hailing_whistle_waive_a"},48) end},
                {name = "Faire des pompes",slide = function()return StartAnim({"amb@world_human_push_ups@male@base", "base"}) end},
                {name = "Je me sens pas bien",slide = function()return StartAnim({"missfam5_blackout","pass_out"}) end },
                {name = "Locoooo",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@you_loco","you_loco"}) end },
                {name = "Wank",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@wank","wank"}) end },
                {name = "Laché moi",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@freakout","freakout"}) end },
                {name = "Mendier",slide = function()return StartAnim({"amb@world_human_bum_freeway@male@base", "base"}) end },
                {name = "Applaudir",slide = function()return doAnim("WORLD_HUMAN_CHEERING") end },
                {name = "Slow Clap",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@slow_clap","slow_clap"}) end},
                {name = "Appel téléphonique",slide = function()return StartAnim({"cellphone@","cellphone_call_listen_base"},49) end},
                {name = "Encouragement",slide = function()return StartAnim({"mini@triathlon","male_one_handed_a"}) end },
                {name = "Prendre une photo",slide = function()return doAnim("WORLD_HUMAN_MOBILE_FILM_SHOCKING")end},
                {name = "Bras tendu",slide = function()return StartAnim({"nm@hands","flail"},1) end},
                {name = "Yoga",slide = function()return StartAnim({"amb@world_human_yoga@male@base","base_a"}) end },
                {name = "Mîme",slide = function()return StartAnim({"special_ped@mime@monologue_5@monologue_5a","10_ig_1_wa_0"}) end },
                {name = "Faire des abdos",slide = function()return StartAnim({"amb@world_human_sit_ups@male@idle_a", "idle_a"}) end },
                {name = "Sortir votre carte",slide = function()return doAnim("WORLD_HUMAN_TOURIST_MAP") end },
                {name = "Acrobatie 1",slide = function()return StartAnim({"anim@arena@celeb@flat@solo@no_props@","cap_a_player_a"}) end },
                {name = "Acrobatie 2",slide = function()return StartAnim({"anim@arena@celeb@flat@solo@no_props@","flip_a_player_a"}) end },
                {name = "Acrobatie 3",slide = function()return StartAnim({"anim@arena@celeb@flat@solo@no_props@","pageant_a_player_a"}) end },
                {name = "Radio",slide = function()return StartAnim({"random@arrests","generic_radio_chatter"},49) end}
            }
        },

        ["gestures"] = {
            Description2 = "",
            b = {
                {name = "Bise au doigt",slide = function()return StartAnim({"anim@mp_player_intcelebrationfemale@finger_kiss","finger_kiss"}) end },
                {name = "Quoi",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_bring_it_on"},48) end },
                {name = "Casse-toi",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_bye_hard"},48) end },
                {name = "Salut",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_bye_soft"},48) end },
                {name = "Viens voir",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_come_here_hard"},48)end},
                {name = "Allez viens..",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_come_here_soft"},48) end },
                {name = "Damn",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_damn"},48) end },
                {name = "Tsss",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_displeased"},48) end },
                {name = "Hey calme",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_easy_now"},48) end },
                {name = "ICI",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_hand_down"},48) end },
                {name = "Gauche",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_hand_left"},48) end },
                {name = "Droite",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_hand_right"},48) end },
                {name = "Oh non",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_head_no"},48) end },
                {name = "Hey toi",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_hello"},48) end },
                {name = "Lourd",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_i_will"},48) end },
                {name = "Moi ?!",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_me_hard"},48) end },
                {name = "Moi",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_me"},48) end },
                {name = "Pas moyen",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_no_way"},48) end },
                {name = "Non non",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_nod_no_hard"},48) end },
                {name = "Non soft",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_nod_no_soft"},48) end },
                {name = "Oui fonce",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_nod_yes_hard"},48) end },
                {name = "Mouai",slide = function()return StartAnim({"gestures@f@standing@casualgesture_nod_yes_soft"},48) end },
                {name = "C'est ça",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_pleased"},48) end },
                {name = "My man",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_point"},48) end },
                {name = "Aucune idée",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_shrug_hard"},48) end },
                {name = "Aucune idée soft",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_shrug_soft"},48) end },
                {name = "Quoi ?!",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_what_hard"},48) end },
                {name = "Quoi soft",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_what_soft"},48) end },
                {name = "Toi",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_you_hard"},48) end },
                {name = "Toi soft",slide = function()return StartAnim({"gestures@f@standing@casual","gesture_you_soft"},48) end },
                {name = "C'est à moi",slide = function()return StartAnim({"gestures@f@standing@casual","getsure_its_mine"},48) end }
            }
        },
    
        ["expressions"] = {
            Description2 = "",
            b = {
                {name = "Loose Thumbs 1",slide = function()return StartAnim({"anim@arena@celeb@flat@solo@no_props@","thumbs_down_a_player_a"},48) end },
                {name = "Mort de rire",slide = function()return StartAnim({"anim@arena@celeb@flat@solo@no_props@","taunt_d_player_b"}) end },
                {name = "Badmood 1",slide = function()return StartAnim({"amb@world_human_stupor@male@base","base"},1) end },
                {name = "Badmood 2",slide = function()return StartAnim({"amb@world_human_stupor@male_looking_left@base","base"},1) end },
                {name = "Bisou",slide = function()return StartAnim({"mp_ped_interaction","kisses_guy_a"}) end },
                {name = "Stressé",slide = function()return StartAnim({"rcmme_tracey1","nervous_loop"},1) end },
                {name = "Peace",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@peace","peace"},48) end },
                {name = "Clown teubé",slide = function()return StartAnim({"move_clown@p_m_two_idles@","fidget_short_dance"}) end },
                {name = "Face Palm",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@face_palm","face_palm"}) end },
                {name = "Patience",slide = function()return StartAnim({"special_ped@impotent_rage@base","base"},1) end },
                {name = "Respect",slide = function()return StartAnim({"mp_player_int_upperbro_love","mp_player_int_bro_love_fp"},48) end },
                {name = "Inspecter ses lunettes",slide = function()return StartAnim({"clothingspecs","try_glasses_positive_a"},48) end },
                {name = "Réflexion",slide = function()return StartAnim({"misscarsteal4@aliens","rehearsal_base_idle_director"},49) end },
                {name = "Check mon flow",slide = function()return StartAnim({"clothingshirt","try_shirt_positive_d"},48) end },
                {name = "VICTOIRE",slide = function()return StartAnim({"mini@tennisexit@","tennis_outro_win_01_female"}) end },
                {name = "Le plus fort",slide = function()return StartAnim({"rcmbarry","base"}) end },
                {name = "Ta géré!",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@thumbs_up","thumbs_up"}) end },
                {name = "Mal de tête",slide = function()return StartAnim({"misscarsteal4@actor","stumble"}) end },
                {name = "Bro love",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@bro_love","bro_love"}) end },
                {name = "Craquer les poignets",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@knuckle_crunch","knuckle_crunch"}) end },
                {name = "Salut militaire",slide = function()return StartAnim({"anim@mp_player_intuppersalute","idle_a"},49) end },
                {name = "Signe GSF",slide = function()return StartAnim({"amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base","idle_a"},48) end },
                {name = "Signe Vagos",slide = function()return StartAnim({"amb@code_human_in_car_mp_actions@v_sign@std@rds@base","idle_a"},48) end },
                {name = "Signe Ballas",slide = function()return StartAnim({"mp_player_int_uppergang_sign_b","mp_player_int_gang_sign_b"},48) end },
                {name = "Signe Locura",slide = function()return StartAnim({"mp_player_int_uppergang_sign_a","mp_player_int_gang_sign_a"},48) end },
                {name = "Check moi ça !",slide = function()return StartAnim({"mp_ped_interaction","handshake_guy_a"}) end },
                {name = "Check moi ça 2",slide = function()return StartAnim({"mp_ped_interaction","hugs_guy_a"}) end },
                {name = "A vos marque ! Partez !",slide = function()return StartAnim({"random@street_race","grid_girl_race_start"}) end },
                {name = "Il a gagné !",slide = function()return StartAnim({"random@street_race","_streetracer_accepted"}) end },
                {name = "Ceinturons",slide = function()return StartAnim({"amb@code_human_wander_idles_cop@male@static","static"},49) end },
                {name = "On arrête tous !",slide = function()return StartAnim({"anim@heists@ornate_bank@chat_manager","fail"},48) end }
            }
        },
    
        ["poses"] = {
            Description2 = "",
            b = {
                {name = "Faire du stop",slide = function()return StartAnim({"random@hitch_lift","idle_f"},1) end },
                {name = "Se rendre, à genoux",slide = function()return StartAnim({"random@arrests@busted","enter"},0) end },
                {name = "Dormir sur place",slide = function()return StartAnim({"mp_sleep","sleep_loop"},49) end },
                {name = "PLS",slide = function()return StartAnim({"timetable@tracy@sleep@","idle_c"},1) end },
                {name = "Roule au sol",slide = function()return StartAnim({"missfinale_a_ig_2","trevor_death_reaction_pt"},2) end },
                {name = "Blessé au sol",slide = function()return StartAnim({"combat@damage@rb_writhe","rb_writhe_loop"},1) end },
                {name = "Désespéré",slide = function()return StartAnim({"rcmnigel1c","idle_d"},1) end },
                {name = "Essouffler",slide = function()return StartAnim({"re@construction","out_of_breath"}) end },
                {name = "Faire la statue",slide = function()return doAnim("WORLD_HUMAN_HUMAN_STATUE") end },
                {name = "Montrer ses muscles",slide = function()return doAnim("WORLD_HUMAN_MUSCLE_FLEX") end },
                {name = "Zombie",slide = function()return StartAnim({"special_ped@zombie@monologue_1@monologue_1c","iamundead_2"},1) end },
                {name = "Pose garde",slide = function()return StartAnim({"amb@world_human_stand_guard@male@base","base"},49) end },
                {name = "Bras croisé lourd",slide = function()return StartAnim({"anim@heists@heist_corona@single_team","single_team_loop_boss"},1) end },
                {name = "Faire le maik",slide = function()return StartAnim({"anim@heists@heist_corona@single_team","single_team_intro_two"},49) end },
                {name = "Bras croisé",slide = function()return StartAnim({"random@street_race","_car_b_lookout"},1) end },
                {name = "Holster",slide = function()return StartAnim({"reaction@intimidation@cop@unarmed","intro"},50) end },
                {name = "Patauge",slide = function()return StartAnim({"move_m@wading","walk"}) end }
            }
        },
    
        ["festives"] = {
            Description2 = "",
            b = {
                {name = "Suspens",slide = function()return StartAnim({"anim@amb@nightclub@dancers@black_madonna_entourage@","li_dance_facedj_11_v1_male^1"},1) end },
                {name = "Coincé",slide = function()return StartAnim({"anim@amb@nightclub@dancers@black_madonna_entourage@","li_dance_facedj_15_v2_male^2"},1) end },
                {name = "Enchainé",slide = function()return StartAnim({"anim@amb@nightclub@dancers@black_madonna_entourage@","hi_dance_facedj_09_v2_male^5"},1) end },
                {name = "Hey man",slide = function()return StartAnim({"anim@amb@nightclub@dancers@club_ambientpeds@","mi-hi_amb_club_09_v1_male^1"},1) end },
                {name = "Move 01",slide = function()return StartAnim({"anim@mp_player_intupperuncle_disco","idle_a"},1) end },
                {name = "Move 02",slide = function()return StartAnim({"anim@mp_player_intuppersalsa_roll","idle_a"},1) end },
                {name = "Move 03",slide = function()return StartAnim({"anim@mp_player_intupperraise_the_roof","idle_a"},1) end },
                {name = "Move 04",slide = function()return StartAnim({"anim@mp_player_intupperoh_snap","idle_a"},1) end },
                {name = "Move 05",slide = function()return StartAnim({"anim@mp_player_intupperheart_pumping","idle_a"},1) end },
                {name = "Move 06",slide = function()return StartAnim({"anim@mp_player_intupperfind_the_fish","idle_a"},1) end },
                {name = "Move 07",slide = function()return StartAnim({"anim@mp_player_intuppercats_cradle","idle_a"},1) end },
                {name = "Move 08",slide = function()return StartAnim({"anim@mp_player_intupperbanging_tunes","idle_a"},1) end },
                {name = "Move 09",slide = function()return StartAnim({"anim@mp_player_intupperbanging_tunes_right","idle_a"},1) end },
                {name = "Move 10",slide = function()return StartAnim({"anim@mp_player_intupperbanging_tunes_left","idle_a"},1) end },
                {name = "DJ",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@dj","dj"}) end },
                {name = "Fausse guitare",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@air_guitar","air_guitar"}) end },
                {name = "Mains Jazz",slide = function()return StartAnim({"anim@mp_player_intcelebrationfemale@jazz_hands","jazz_hands"}) end },
                {name = "Rock'n roll",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@rock","rock"}) end }
            }
        },
    
        ["insolentes"] = {
            Description2 = "",
            b = {
                {name = "MDR",slide = function()return StartAnim({"anim@arena@celeb@flat@solo@no_props@","giggle_a_player_a"}) end },
                {name = "Se curer le nez",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@nose_pick","nose_pick"}) end },
                {name = "Bouffe mon doigt",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@finger","finger"}) end },
                {name = "Prend mon fuck",slide = function()return StartAnim({"random@shop_gunstore","_negative_goodbye"}) end },
                {name = "Nananère",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@thumb_on_ears","thumb_on_ears"}) end },
                {name = "DTC",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@dock","dock"}) end },
                {name = "Chuuuuute",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@shush","shush"}) end },
                {name = "Poule Mouillé",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@chicken_taunt","chicken_taunt"}) end },
                {name = "Doigt solo",slide = function()return StartAnim({"anim@mp_player_intselfiethe_bird","enter"}) end },
                {name = "Doigt d'honneur",slide = function()return StartAnim({"mp_player_int_upperfinger","mp_player_int_finger_01"},49) end },
                {name = "Uriner",slide = function()return StartAnim({"misscarsteal2peeing","peeing_intro"}) end },
                {name = "Se gratter le cul",slide = function()return StartAnim({"mp_player_int_upperarse_pick","mp_player_int_arse_pick"},49) end },
                {name = "Se gratter les couilles",slide = function()return StartAnim({"mp_player_int_uppergrab_crotch","mp_player_int_grab_crotch"},49) end },
                {name = "Pluie de fric",slide = function()return StartAnim({"anim@arena@celeb@flat@solo@props@","make_it_rain_b_player_b"}) end },
                {name = "Pluie de fric 2",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@raining_cash","raining_cash"}) end }
            }
        },
    
        ["du sexe lo"] = {
            Description2 = "",
            b = {
                {name = "Fellation",slide = function()return StartAnim({"misscarsteal2pimpsex","pimpsex_hooker"}) end },
                {name = "Se faire sucer 01",slide = function()return StartAnim({"misscarsteal2pimpsex","pimpsex_pimp"}) end },
                {name = "Se faire sucer 02",slide = function()return StartAnim({"misscarsteal2pimpsex","pimpsex_punter"}) end },
                {name = "Danse sexy",slide = function()return StartAnim({"mp_safehouse","lap_dance_girl"}) end },
                {name = "Danse Twerk",slide = function()return StartAnim({"mini@strip_club@private_dance@part3","priv_dance_p3"}) end },
                {name = "Montrer sa poitrine",slide = function()return StartAnim({"mini@strip_club@backroom@","stripper_b_backroom_idle_b"}) end },
                {name = "Montrer ses fesses",slide = function()return StartAnim({"switch@trevor@mocks_lapdance","001443_01_trvs_28_idle_stripper"},49) end },
                {name = "Se faire su*** en voiture",slide = function()return StartAnim({"oddjobs@towing","m_blow_job_loop"},49) end },
                {name = "Faire une gaterie en voiture",slide = function()return StartAnim({"oddjobs@towing","f_blow_job_loop"},49) end },
                {name = "***** en voiture",slide = function()return StartAnim({"mini@prostitutes@sexlow_veh","low_car_sex_loop_player"},49) end },
                {name = "Se ***** en voiture",slide = function()return StartAnim({"mini@prostitutes@sexlow_veh","low_car_sex_loop_female"},49) end },
                {name = "Mon coeur",slide = function()return StartAnim({"mini@hookers_spvanilla","idle_a"}) end }
            }
        },

        ["danses"] = {
            Description2 = "",
            b = {
                {name = "Danser",slide = function()return StartAnim({"misschinese2_crystalmazemcs1_cs","dance_loop_tao"}) end },
                {name = "Danser stylé",slide = function()return StartAnim({"missfbi3_sniping","dance_m_default"},1) end },
                {name = "Danse banale",slide = function()return StartAnim({"rcmnigel1bnmt_1b","dance_loop_tyler"},1) end },
                {name = "Danse spéciale 01",slide = function()return StartAnim({"timetable@tracy@ig_5@idle_a","idle_a"},1) end },
                {name = "Danse spéciale 02",slide = function()return StartAnim({"timetable@tracy@ig_5@idle_a","idle_b"},1) end },
                {name = "Danse spéciale 03",slide = function()return StartAnim({"timetable@tracy@ig_5@idle_b","idle_e"},1) end },
                {name = "Danse spéciale 04",slide = function()return StartAnim({"timetable@tracy@ig_5@idle_b","idle_d"},1) end },
                {name = "Danse de pecno ",slide = function()return StartAnim({"special_ped@mountain_dancer@monologue_3@monologue_3a","mnt_dnc_buttwag"},1) end },
                {name = "Danse basique",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_hi_06_base_laz"},1) end },
                {name = "Danse turnaround",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_hi_11_turnaround_laz"},1) end },
                {name = "Danse crotchgrab",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_hi_13_crotchgrab_laz"},1) end },
                {name = "Danse flying",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_hi_13_flyingv_laz"},1) end },
                {name = "Danse robot",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_mi_15_robot_laz"},1) end },
                {name = "Danse shimmy",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_mi_15_shimmy_laz"},1) end },
                {name = "Danse crazyrobot",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_hi_15_crazyrobot_laz"},1) end },
                {name = "Danse smack",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_hi_17_smackthat_laz"},1) end },
                {name = "Danse spider",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_hi_17_spiderman_laz"},1) end },
                {name = "Danse hipswivel",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_li_13_hipswivel_laz"},1) end },
                {name = "Danse Grind",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_li_15_sexygrind_laz"},1) end },
                {name = "Danse point",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_mi_11_pointthrust_laz"},1) end },
                {name = "Danse miturn",slide = function()return StartAnim({"anim@amb@nightclub@lazlow@hi_podium@","danceidle_mi_13_turnaround_laz"},1) end },
                {name = "Danse du ventre",slide = function()return StartAnim({"mini@strip_club@private_dance@idle","priv_dance_idle"},1) end },
                {name = "Dance Salsa Roll",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@salsa_roll","salsa_roll"},1) end },
                {name = "Danse de soirée 1",slide = function()return StartAnim({"anim@amb@nightclub@dancers@crowddance_facedj@","hi_dance_facedj_09_v1_male^4"},1) end },
                {name = "Danse de soirée 2",slide = function()return StartAnim({"anim@amb@nightclub@dancers@crowddance_facedj@","hi_dance_facedj_09_v2_female^1"},1) end },
                {name = "Danse de soirée 3",slide = function()return StartAnim({"anim@amb@nightclub@dancers@crowddance_facedj@","hi_dance_facedj_09_v2_female^2"},1) end },
                {name = "Danse de soirée 4",slide = function()return StartAnim({"anim@amb@nightclub@dancers@crowddance_facedj@","hi_dance_facedj_09_v2_male^2"},1) end },
                {name = "Danse de soirée 5",slide = function()return StartAnim({"anim@amb@nightclub@dancers@crowddance_facedj@","hi_dance_facedj_11_v2_male^2"},1) end },
                {name = "Danse de soirée 6",slide = function()return StartAnim({"anim@amb@nightclub@dancers@crowddance_groups@","hi_dance_crowd_09_v1_female^1"},1) end },
                {name = "Danse de soirée 7",slide = function()return StartAnim({"anim@amb@nightclub@dancers@crowddance_groups@","hi_dance_crowd_09_v1_female^3"},1) end },
                {name = "Danse de soirée 8",slide = function()return StartAnim({"anim@amb@nightclub@djs@black_madonna@","dance_b_idle_a_blamadon"},1) end },
                {name = "Danse de soirée 9",slide = function()return StartAnim({"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@","high_center"},1) end },
                {name = "Danse de soirée 10",slide = function()return StartAnim({"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@","med_center"},1) end },
                {name = "Danse de soirée 11",slide = function()return StartAnim({"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@","high_center_up"},1) end },
                {name = "Dance Disco",slide = function()return StartAnim({"anim@mp_player_intcelebrationmale@uncle_disco","uncle_disco"},1) end }
            }
        },
        
        ["armes"] = {
            Description2 = "",
            b = {
                {name = "Tenue classique",slide = function()return 
                    StartAnim({},SetWeaponAnimationOverride(GetPlayerPed(-1),GetHashKey("Default")))
                end},
                {name = "Tenue gangster",slide = function()return 
                    StartAnim({},SetWeaponAnimationOverride(GetPlayerPed(-1),GetHashKey("Gang1H"))) 
                   -- ShowAboveRadarMessage("~r~Ne fonctionne pas avec toutes les armes.")
                end},
                {name = "Tenue 007",slide = function()return 
                    StartAnim({},SetWeaponAnimationOverride(GetPlayerPed(-1),GetHashKey("Hillbilly"))) 
                   -- ShowAboveRadarMessage("~r~Ne fonctionne pas avec toutes les armes.") 
                end},
                {name = "Tenue débutant",slide = function()return 
                    StartAnim({},SetWeaponAnimationOverride(GetPlayerPed(-1),GetHashKey("FirstPersonAiming"))) 
                end},
                {name = "Animation execution",slide = function()return StartAnim({"oddjobs@suicide","bystander_pointinto"},50) end },
                {name = "Animation suicide",slide = function()return StartAnim({"mp_suicide","pistol"},2) end },
                {name = "Check arme",slide = function()return StartAnim({"mp_corona@single_team","single_team_intro_one"}) end },
                {name = "Arme pointé",slide = function()return StartAnim({"random@arrests","cop_gunaimed_door_open_idle"}) end },
                {name = "Melée 1",slide = function()return StartAnim({"anim@deathmatch_intros@melee@2h","intro_male_melee_2h_b"}) end },
                {name = "Melée 2",slide = function()return StartAnim({"anim@deathmatch_intros@melee@1h","intro_male_melee_1h_b"}) end },
                {name = "Melée 3",slide = function()return StartAnim({"anim@deathmatch_intros@melee@1h","intro_male_melee_1h_c"}) end },
                {name = "Melée 4",slide = function()return StartAnim({"mp_deathmatch_intros@melee@2h","intro_male_melee_2h_d"}) end },
                {name = "Melée 5",slide = function()return StartAnim({"mp_deathmatch_intros@melee@2h","intro_male_melee_2h_a_gclub"}) end },
                {name = "Melée 6",slide = function()return StartAnim({"mp_deathmatch_intros@melee@1h","intro_male_melee_1h_b"}) end },
                {name = "Fight 1",slide = function()return StartAnim({"anim@deathmatch_intros@unarmed","intro_male_unarmed_e"}) end },
                {name = "Fight 2",slide = function()return StartAnim({"anim@deathmatch_intros@unarmed","intro_male_unarmed_d"}) end },
                {name = "Fight 3",slide = function()return StartAnim({"anim@deathmatch_intros@unarmed","intro_male_unarmed_b"}) end }
            }
        },
        ["facture"] = { 
            Description2 = "",
			b = {
			}
        },
        ["suicide"]={
            Description2 = "",
            b={
                {name = "Oui", slidemax = {"Prendre une pilule","Se mettre une balle"}},
                {name = "--------------------------------------------------"},
                {name = "Non"}
            }
        },
        ["vêtements"]={
            b={
                {name="Catégories", slidemax = {"haut","bas","accessoires"}},
            }
        },
        ["haut"] = {
            b={
                {name="Catégories", slidemax = {"haut","bas","accessoires"}},
                {name = "-----------------------------------------"},
                {name = "Enlever le Haut"},
                {name = "Enlever le Gilet par balle"},
                {name = "Enlever le Sac"}
            }
        },
        ["bas"] = {
            b={
                {name="Catégories", slidemax = {"haut","bas","accessoires"}},
                {name = "-----------------------------------------"},
                {name = "Enlever le Pantalon"},
                {name = "Enlever les Chaussures"}
            }
        },
        ["accessoires"] = {
            b={
                {name="Catégories", slidemax = {"haut","bas","accessoires"}},
                {name = "-----------------------------------------"},
                {name = "Enlever le Chapeau"},
                {name = "Enlever les Lunettes"},
                {name = "Enlever le Masque"},
                {name = "Enlever les Oreillette"},
                {name = "Enlever la Chaîne"},
                {name = "Enlever le Bracelets"},
                {name = "Enlever la Montre"}
            }
        },
        ["véhicules"] = {
            Description2 = "",
            b = {
                {name = "Statut moteur", checkbox = false},
                {name = "Fenêtres", slidemax = {"Avant Droite","Avant Gauche","Arrière Droite","Arrière Gauche","Fermer toutes les fenêtres"}},
                {name = "Portes", slidemax = {"Avent Gauche","Avent Droite","Arrière Gauche","Arrière Droite","Capot","Coffre"}},
                {name = "État du véhicule"},
                {name = "Régulateur de vitesse", slidemax = {"Aucun","30 km/h","40 km/h","50 km/h","70 km/h","80 km/h","90 km/h","110 km/h","130 km/h","150 km/h"}},
                {name = "Mes clé(s)", Des = "Consultez vos clés de véhicules."}
            }
        },
        ["Mes clé(s)"] = {
            b = {
            }
        },
        ["masquer carte"] = {
            b = {
                {name = "Cacher la Carte / Afficher la Carte", slidemax = {"Carte"}},
                {name = "Cacher l'hud / Afficher l'hud", slidemax = {"HUD","Cacher HUD"}},
            }
        }
    }
}

RegisterCommand('cachermap', function()
    if mapsupp then
        stopmap()
        mapsupp = false
    else
        hidemap()
        mapsupp = true
    end
end)
function stopmap()
    DisplayRadar(false)
end
function hidemap()
    DisplayRadar(true)
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		    if IsControlJustPressed(1,244) then 
                CreateMenu(dqs)
            end
            if IsControlJustPressed(1,81) then
                SetEnableHandcuffs(GetPlayerPed(-1), false)
                ClearPedTasks(PlayerPedId())
                FreezeEntityPosition(PlayerPedId(),false)
                PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUND", true)
            end
        end
end)

function setUniform(value, plyPed)
	GM.TriggerServerCallback('pChacreate:getPlayerSkin', function(skin)
		TriggerEvent('pChacreate:getSkin', function(skina)
            if value == 'torso' then
				handsup, pointing = false, false
                ClearPedTasks(plyPed)
				if skin.torso_1 ~= skina.torso_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['torso_1'] = skin.torso_1, ['torso_2'] = skin.torso_2, ['tshirt_1'] = skin.tshirt_1, ['tshirt_2'] = skin.tshirt_2, ['arms'] = skin.arms})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})
				end
            elseif value == 'pants' then
				handsup, pointing = false, false
				ClearPedTasks(plyPed)
				if skin.pants_1 ~= skina.pants_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['pants_1'] = skin.pants_1, ['pants_2'] = skin.pants_2})
				else
					if skin.sex == 0 then
						TriggerEvent('pChacreate:loadClothes', skina, {['pants_1'] = 18, ['pants_2'] = 0})
					else
						TriggerEvent('pChacreate:loadClothes', skina, {['pants_1'] = 15, ['pants_2'] = 0})
					end
				end
            elseif value == 'shoes' then
				handsup, pointing = false, false
				ClearPedTasks(plyPed)
				if skin.shoes_1 ~= skina.shoes_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['shoes_1'] = skin.shoes_1, ['shoes_2'] = skin.shoes_2})
				else
					if skin.sex == 0 then
						TriggerEvent('pChacreate:loadClothes', skina, {['shoes_1'] = 34, ['shoes_2'] = 0})
					else
						TriggerEvent('pChacreate:loadClothes', skina, {['shoes_1'] = 35, ['shoes_2'] = 0})
					end
				end
            elseif value == 'bag' then
				handsup, pointing = false, false
				ClearPedTasks(plyPed)
				if skin.bags_1 ~= skina.bags_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['bags_1'] = skin.bags_1, ['bags_2'] = skin.bags_2})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['bags_1'] = 0, ['bags_2'] = 0})
				end
            elseif value == 'bproof' then
                SetPedArmour(PlayerPedId(), 0) 
				if skin.bproof_1 ~= skina.bproof_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['bproof_1'] = skin.bproof_1, ['bproof_2'] = skin.bproof_2})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['bproof_1'] = 0, ['bproof_2'] = 0})
                end
            elseif value == 'mask_1' then
				handsup, pointing = false, false
				ClearPedTasks(plyPed)
                if skin.mask_1 ~= skina.mask_1 then
                    TriggerEvent('pChacreate:loadClothes', skina, {['mask_1'] = skin.mask_1, ['mask_2'] = skin.mask_2})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['mask_1'] = 0, ['mask_2'] = 0})
                end
            elseif value == 'glasses_1' then

				handsup, pointing = false, false
				ClearPedTasks(plyPed)
                if skin.glasses_1 ~= skina.glasses_1 then
                    TriggerEvent('pChacreate:loadClothes', skina, {['glasses_1'] = skin.glasses_1, ['glasses_2'] = skin.glasses_2})
                else
                    TriggerEvent('pChacreate:loadClothes', skina, {['glasses_1'] = -1, ['glasses_2'] = 0})
                end
            elseif value == 'helmet_1' then
                if skin.helmet_1 ~= skina.helmet_1 then
                    TriggerEvent('pChacreate:loadClothes', skina, {['helmet_1'] = skin.helmet_1, ['helmet_2'] = skin.helmet_2})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['helmet_1'] = -1, ['helmet_2'] = 0})
                end
            elseif value == 'montre' then
                if skin.watches_1 ~= skina.watches_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['watches_1'] = skin.watches_1, ['watches_2'] = skin.watches_2})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['watches_1'] = -1, ['watches_2'] = 0})
                end
            elseif value == 'bracelets' then
                if skin.bracelets_1 ~= skina.bracelets_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['bracelets_1'] = skin.bracelets_1, ['bracelets_2'] = skin.bracelets_2})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['bracelets_1'] = -1, ['bracelets_2'] = 0})
                end
            elseif value == 'chaine' then
                if skin.chain_1 ~= skina.chain_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['chain_1'] = skin.chain_1, ['chain_2'] = skin.chain_2})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['chain_1'] = -1, ['chain_2'] = 0})
                end
            elseif value == 'oreillette' then
                if skin.ears_1 ~= skina.ears_1 then
					TriggerEvent('pChacreate:loadClothes', skina, {['ears_1'] = skin.ears_1, ['ears_2'] = skin.ears_2})
				else
					TriggerEvent('pChacreate:loadClothes', skina, {['ears_1'] = -1, ['ears_2'] = 0})
                end
            end
		end)
	end)
end

function getVehicleHealth(entityVeh)
	return math.floor( math.max(0, math.min(100, GetVehicleEngineHealth(entityVeh) / 10 ) ) )
end