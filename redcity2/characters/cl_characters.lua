--[[ FDP de Dumpeur ! ]]--
local sexeSelect = 0
local teteSelect = 0
local colorPeauSelect = 0
local cheveuxSelect = 0
local bebarSelect = -1
local poilsCouleurSelect = 0
local ImperfectionsPeau = 0
local face, acne, skin, eyecolor, skinproblem, freckle, wrinkle, hair, haircolor, eyebrow, beard, beardcolor
local camfin = false

PMenu = {}
PMenu.Data = {}

local playerPed = PlayerPedId()
local incamera = false
local board_scaleform
local handle
local board
local board_model = GetHashKey("prop_police_id_board")
local board_pos = vector3(0.0,0.0,0.0)
local overlay
local overlay_model = GetHashKey("prop_police_id_text")
local isinintroduction = false
local pressedenter = false
local introstep = 0
local timer = 0
local inputgroups = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}
local enanimcinematique = false
local guiEnabled = false

local sound = false

local mum = {"Angel","Hannah","Audrey","Jasmine","Giselle","Amelia","Isabella","Zoe","Ava","Camilia","Violet","Sophie","Evelyn","Nicole","Ashley","Grace","Briana","Natalie","Olivia","Elizabeth","Charlotte"}
local dad = {"Benjamin","Daniel","Joshua","Noah","Andrew","Juan","Alex","Isaac","Evan","Ethan","Vincent","Diego","Adrian","Gabriel","Michael","Santiago","Kevin","Louis","Samuel","Anthony","Claude"}

Citizen.CreateThread(function()
	while true do
        if guiEnabled then
            GM.UI.HUD.SetDisplay(0.0)
            TriggerEvent('es:setMoneyDisplay', 0.0)
            TriggerEvent('hud:setDisplay', 0.0)
            DisplayRadar(false)
            IsPauseMenuActive()
            TriggerEvent('ui:toggle', false)
			DisableControlAction(0, 1,   true) -- LookLeftRight
			DisableControlAction(0, 2,   true) -- LookUpDown
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
			DisableControlAction(0, 21,  true) -- disable sprint
			DisableControlAction(0, 24,  true) -- disable attack
			DisableControlAction(0, 25,  true) -- disable aim
			DisableControlAction(0, 47,  true) -- disable weapon
			DisableControlAction(0, 58,  true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75,  true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
		end
		Citizen.Wait(10)
	end
end)

function drawCenterText(FsYIVlkf,HLXS0Q_,Kw,nvaIsNv7,vDnoL55,xlAK,zr1y)
	SetTextFont(vDnoL55)
	SetTextScale(Kw,Kw)
	SetTextColour(255,255,255,255)
	SetTextJustification(xlAK or 1)
	SetTextEntry("STRING")
	if zr1y then 
		SetTextWrap(FsYIVlkf,FsYIVlkf+.1)
	end
	AddTextComponentString(nvaIsNv7)
	DrawText(FsYIVlkf,HLXS0Q_)
end

local createdCam=CreateCam("DEFAULT_SCRIPTED_CAMERA",0)

function spawncinematiqueplayer(default)
    PrepareMusicEvent("FM_INTRO_START")
    TriggerMusicEvent("FM_INTRO_START")
    NetworkOverrideClockTime(17,00,0)
    --SetOverrideWeather("EXTRASUNNY")
    pressedenter = true
    ExecuteCommand('SansHUD')
    ExecuteCommand('SansHUD2')
    SetCamActive(createdCam,1)
    SetCamParams(createdCam,754.2219,1226.831,356.5081,-14.367,0.0,157.3524,42.2442,0,1,1,2)
    SetCamParams(createdCam,740.7797,1193.923,351.1997,-9.6114,0.0,157.8659,44.8314,6500,0,0,2)
    ShakeCam(createdCam,"HAND_SHAKE",0.15)
    RenderScriptCams(true,false,3000,1,1,0)
    Citizen.Wait(6000)
    if not vms5()then 
        return 
    end
    SetCamParams(createdCam,-259.3686,-553.8571,142.6048,13.2752,-0.5186,-143.3378,44.9959,0,1,1,2)
    SetCamParams(createdCam,-277.7789,-569.962,142.8625,12.4479,-0.5186,-134.9992,44.9959,6000,0,0,2)
    RenderScriptCams(true,false,3000,1,1,0)
    Citizen.Wait(5000)
    if not vms5()then 
        return 
    end
    SetCamParams(createdCam,-4.6668,-900.9736,184.887,-1.6106,-0.5186,78.3786,45.0069,0,1,1,2)
    SetCamParams(createdCam,-23.0087,-896.4288,184.1939,-2.8529,-0.5186,81.8262,45.0069,8000,0,0,2)
    ShakeCam(createdCam,"HAND_SHAKE",0.3)
    RenderScriptCams(true,false,3000,1,1,0)
end

function vms5()
    return
    introstep 
end

function pos()
    TriggerEvent("playerSpawned")
end

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local playerPed = PlayerPedId() 
        if pressedenter then 
            drawCenterText(.5,.1,1.0,"Appuyez sur ~g~ENTER~w~ pour valider votre entrée.",4,0)
            if IsControlJustPressed(1, 191) or IsControlJustPressed(1, 22) then
                DoScreenFadeOut(500)
                Citizen.Wait(500)
                DoScreenFadeIn(500)
                DestroyCam(createdCam, false)
                DestroyCam(createdCam, 0)
                RenderScriptCams(false, false, 1, 1, 1)
                createdCam = false
                PrepareMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
                TriggerMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
                print("^2[power_core] ^5Banking ^3initialized^7.")print("^2[power_core] ^5BlipsMap ^3initialized^7.")print("^2[power_core] ^5Characters ^3initialized^7.")print("^2[power_core] ^5Garage ^3initialized^7.")print("^2[power_core] ^5Identité ^3initialized^7.")print("^2[power_core] ^5Illegal ^3initialized^7.")print("^2[power_core] ^5Jobs ^3initialized^7.")print("^2[power_core] ^5Menu ^3initialized^7.")print("^2[power_core] ^5Mugging ^3initialized^7.")print("^2[power_core] ^5Scripts ^3initialized^7.")print("^2[power_core] ^5Stream ^3initialized^7.")print("^2[power_core] ^5Teleportation ^3initialized^7.")print("^2[power_core] ^5Vehicle ^3initialized^7.")print("^2[power_core] ^5Weapon ^3initialized^7.")
                DisplayRadar(true)
                pos()
                ExecuteCommand('HUD')
                PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
                GM.ShowNotification("~g~Personnage ~s~:\nVous venez d'être téléporté à votre dernière position.") 
                pressedenter = false
                ClearTimecycleModifier("scanline_cam_cheap")    
                SetFocusEntity(GetPlayerPed(PlayerId()))   
            end
        end
    end
end)

local function LoadScaleform(scaleform)
	local handle = RequestScaleformMovie(scaleform)
	if handle ~= 0 then
		while not HasScaleformMovieLoaded(handle) do
			Citizen.Wait(0)
		end
	end
	return handle
end

local function CreateNamedRenderTargetForModel(name, model)
	local handle = 0
	if not IsNamedRendertargetRegistered(name) then
		RegisterNamedRendertarget(name, 0)
	end
	if not IsNamedRendertargetLinked(model) then
		LinkNamedRendertarget(model)
	end
	if IsNamedRendertargetRegistered(name) then
		handle = GetNamedRendertargetRenderId(name)
	end

	return handle
end

Citizen.CreateThread(function()
	board_scaleform = LoadScaleform("mugshot_board_01")
	handle = CreateNamedRenderTargetForModel("ID_Text", overlay_model)


	while handle do
		SetTextRenderId(handle)
		Set_2dLayer(4)
		Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
		DrawScaleformMovie(board_scaleform, 0.405, 0.37, 0.81, 0.74, 255, 255, 255, 255, 0)
		Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
		SetTextRenderId(GetDefaultScriptRendertargetRenderId())

		Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
		Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
		Wait(0)
	end
end)

local function CallScaleformMethod (scaleform, method, ...)
	local t
	local args = { ... }

	BeginScaleformMovieMethod(scaleform, method)

	for k, v in ipairs(args) do
		t = type(v)
		if t == 'string' then
			PushScaleformMovieMethodParameterString(v)
		elseif t == 'number' then
			if string.match(tostring(v), "%.") then
				PushScaleformMovieFunctionParameterFloat(v)
			else
				PushScaleformMovieFunctionParameterInt(v)
			end
		elseif t == 'boolean' then
			PushScaleformMovieMethodParameterBool(v)
		end
	end
	EndScaleformMovieMethod()
end

function CreateBoard(ped)
    local plyData = GM.GetPlayerData()
    RequestModel(board_model)
    while not HasModelLoaded(board_model) do Wait(0) end
    RequestModel(overlay_model)
    while not HasModelLoaded(overlay_model) do Wait(0) end
    board = CreateObject(board_model, GetEntityCoords(ped), false, true, false)
    overlay = CreateObject(overlay_model, GetEntityCoords(ped), false, true, false)
    AttachEntityToEntity(overlay, board, -1, 4103, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    ClearPedWetness(ped)
    ClearPedBloodDamage(ped)
    ClearPlayerWantedLevel(PlayerId())
    SetCurrentPedWeapon(ped, GetHashKey("weapon_unarmed"), 1)
    AttachEntityToEntity(board, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
    CallScaleformMethod(board_scaleform, 'SET_BOARD', plyData.job.label, GetPlayerName(PlayerId()), 'LOS SANTOS POLICE DEPT', '' , 0, 1, 116)
end

local FirstSpawn     = true
local LastSkin       = nil
local PlayerLoaded   = false

RegisterNetEvent('GM:playerLoaded')
AddEventHandler('GM:playerLoaded', function(xPlayer)
	PlayerLoaded = true
end)

AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
		while not PlayerLoaded do
			Citizen.Wait(10)
		end
		if FirstSpawn then
			GM.TriggerServerCallback('pChacreate:getPlayerSkin', function(skin, jobSkin)
				if skin == nil then
					TriggerEvent('bypower:create')
				else
                    TriggerEvent('pChacreate:loadSkin', skin)
                    TriggerEvent('topserveur:openme')
                    spawncinematiqueplayer()
				end
			end)
			FirstSpawn = false
		end
	end)
end)

function createcam(default)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 403.03, -998.33, -98.20, -20.00, 0.00, 0.00, 70.00, false, 0)

    SetCamActive(cam, true)
    RenderScriptCams(true, false, 2000, true, true)
end

function cam_fin_v2(default)
    --DisplayRadar(false)
    TriggerEvent('hud:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 414.64, -998.16, -98.68, 0.0, 0.0, 88.455696105957, 60.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 414.64, -998.16, -98.68, 0.0, 0.0, 88.455696105957, 60.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end

function cam_v1()
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
end

function animationfin(default)
    FreezeEntityPosition(GetPlayerPed(-1), false)
    cam_v1()
    SetOverrideWeather("EXTRASUNNY")
    NetworkOverrideClockTime(19, 0, 0) 
    SetEntityCoords(GetPlayerPed(-1), 409.5, -1001.80, -99.0-0.98, 0.0, 0.0, 0.0, 10)
    SetEntityHeading(GetPlayerPed(-1), 2.9283561706543)
    AnimationIntro()
    SetEntityCoords(GetPlayerPed(-1), 408.8, -998.64, -99.0-0.98, 0.0, 0.0, 0.0, 10)
    SetEntityHeading(GetPlayerPed(-1), 268.72219848633)
end

function CreateCamEnter()
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 415.55, -998.50, -99.29, 0.00, 0.00, 89.75, 50.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 2000, true, true) 
end

RegisterNetEvent('power:SpawnCharacter')
AddEventHandler('power:SpawnCharacter', function(spawn)
    SetOverrideWeather("EXTRASUNNY")
    SetWeatherTypePersist("EXTRASUNNY")
    NetworkOverrideClockTime(16, 0, 0)
    TriggerServerEvent('SavellPlayer')
    RenderScriptCams(0, 0, 1, 1, 1)
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFocusEntity(GetPlayerPed(PlayerId()))
    --SetEntityCoords(PlayerPedId(), -490.11, -697.04, 33.24, 1.42, 0, 0, 1)
   -- SetEntityHeading(PlayerPedId(), 1.42)
    SetEntityCoords(PlayerPedId(), 458.95, -1008.10, 28.26-0.98)
    SetEntityHeading(PlayerPedId(), 94.79)
    FreezeEntityPosition(PlayerPedId(), false)
    GM.ShowNotification("~b~Aide:\n~w~Rendez-vous au Commissariat pour prendre votre carte d'identité.") 
    ExecuteCommand('HUD')
    TriggerEvent('instance:close')
    ExecuteCommand('invisible(debug)')
    --[[
    DoScreenFadeIn(1500)
    Citizen.Wait(21000)
    for i = 0, 357 do
        EnableAllControlActions(i)
    end]]
    --cam_v1()
end)

RegisterNetEvent('power:SpawnCharacter2')
AddEventHandler('power:SpawnCharacter2', function(spawn)
    SetOverrideWeather("EXTRASUNNY")
    SetWeatherTypePersist("EXTRASUNNY")
    NetworkOverrideClockTime(16, 0, 0)
    TriggerServerEvent('SavellPlayer')
    RenderScriptCams(0, 0, 1, 1, 1)
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFocusEntity(GetPlayerPed(PlayerId()))
    DoScreenFadeOut(200)
    Citizen.Wait(200)
    SetEntityCoords(PlayerPedId(), -438.04, 6023.34, 31.49-0.98)
    SetEntityHeading(PlayerPedId(), 304.45)
    FreezeEntityPosition(PlayerPedId(), false)
    GM.ShowNotification("~b~Aide:\n~w~Rendez-vous au Commissariat pour prendre votre carte d'identité.") 
    ExecuteCommand('HUD')
    TriggerEvent('instance:close')
    ExecuteCommand('invisible(debug)')
    for i = 0, 357 do
        EnableAllControlActions(i)
    end
end)

function startAnims(lib, anim) 
    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 8.0, -1, 14, 0, false, false, false)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
	
	blockinput = true 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end 
		 
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() 
		Citizen.Wait(500) 
		blockinput = false 
		return result 
	else
		Citizen.Wait(500) 
		blockinput = false 
		return nil 
	end
end

local isCameraActive = false

local ville = {
    "Los Santos",
    "Sandy Shores"
}

creationPerso = {
    Base = { Header = {"commonmenu", "interaction_bgd"}, Blocked = true, Title = "Editeur de personnage"},
	Data = { currentMenu = "~b~NOUVEAU PERSONNAGE" },
    Events = {
        onButtonSelected = function(self, allButtons, currentButton, btn, _, slide)
            if btn.name == "Cuir noir" then 
                TriggerEvent('pChacreate:change', 'helmet_1', -1)
                TriggerEvent('pChacreate:change', 'helmet_2', 0)
                TriggerEvent('pChacreate:change', 'glasses_1', 0)
                TriggerEvent('pChacreate:change', 'tshirt_1', 24)
                TriggerEvent('pChacreate:change', 'tshirt_2', 1)
                TriggerEvent('pChacreate:change', 'torso_1', 6)
                TriggerEvent('pChacreate:change', 'torso_2', 0)
                TriggerEvent('pChacreate:change', 'arms', 14)
                TriggerEvent('pChacreate:change', 'bags_1', 0)
                TriggerEvent('pChacreate:change', 'pants_1', 1)
                TriggerEvent('pChacreate:change', 'pants_2', 1)
                TriggerEvent('pChacreate:change', 'shoes_1', 1)
                TriggerEvent('pChacreate:change', 'shoes_2', 0)
            end
            if btn.name == "Sport blanc" then
                TriggerEvent('pChacreate:change', 'helmet_1', -1)
                TriggerEvent('pChacreate:change', 'helmet_2', 0)
                TriggerEvent('pChacreate:change', 'glasses_1', 0)
                TriggerEvent('pChacreate:change', 'tshirt_1', 0)
                TriggerEvent('pChacreate:change', 'tshirt_2', 2)
                TriggerEvent('pChacreate:change', 'torso_1', 7)
                TriggerEvent('pChacreate:change', 'torso_2', 0)
                TriggerEvent('pChacreate:change', 'arms', 14)
                TriggerEvent('pChacreate:change', 'bags_1', 0)
                TriggerEvent('pChacreate:change', 'pants_1', 5)
                TriggerEvent('pChacreate:change', 'pants_2', 0)
                TriggerEvent('pChacreate:change', 'shoes_1', 4)
                TriggerEvent('pChacreate:change', 'shoes_2', 0)
            end
            if btn.name == "Cool" then
                TriggerEvent('pChacreate:change', 'helmet_1', -1)
                TriggerEvent('pChacreate:change', 'helmet_2', 0)
                TriggerEvent('pChacreate:change', 'glasses_1', 0)
                TriggerEvent('pChacreate:change', 'tshirt_1', 15)
                TriggerEvent('pChacreate:change', 'tshirt_2', 0)
                TriggerEvent('pChacreate:change', 'torso_1', 0)
                TriggerEvent('pChacreate:change', 'torso_2', 4)
                TriggerEvent('pChacreate:change', 'arms', 0)
                TriggerEvent('pChacreate:change', 'bags_1', 0)
                TriggerEvent('pChacreate:change', 'pants_1', 6)
                TriggerEvent('pChacreate:change', 'pants_2', 1)
                TriggerEvent('pChacreate:change', 'shoes_1', 12)
                TriggerEvent('pChacreate:change', 'shoes_2', 4)
            end
            if btn.name == "Junki" then
                TriggerEvent('pChacreate:change', 'helmet_1', -1)
                TriggerEvent('pChacreate:change', 'helmet_2', 0)
                TriggerEvent('pChacreate:change', 'glasses_1', 0)
                TriggerEvent('pChacreate:change', 'tshirt_1', 0)
                TriggerEvent('pChacreate:change', 'tshirt_2', 2)
                TriggerEvent('pChacreate:change', 'torso_1', 121)
                TriggerEvent('pChacreate:change', 'torso_2', 3)
                TriggerEvent('pChacreate:change', 'arms', 14)
                TriggerEvent('pChacreate:change', 'bags_1', 0)
                TriggerEvent('pChacreate:change', 'pants_1', 5)
                TriggerEvent('pChacreate:change', 'pants_2', 2)
                TriggerEvent('pChacreate:change', 'shoes_1', 5)
                TriggerEvent('pChacreate:change', 'shoes_2', 0)
            end
        end,
        onSelected = function(self, _, btn)
            RequestStreamedTextureDict("pause_menu_pages_char_mom_dad",false)
            SetStreamedTextureDictAsNoLongerNeeded("pause_menu_pages_char_mom_dad",false)
            SetStreamedTextureDictAsNoLongerNeeded("pause_menu_pages_char_mom_dad",false)
            RequestStreamedTextureDict("char_creator_portraits",false)RequestStreamedTextureDict("mpleaderboard",false)
            SetStreamedTextureDictAsNoLongerNeeded("char_creator_portraits",false)
            if btn.slidenum ~= 0 and btn.name == "Sexe" then
                TriggerEvent('pChacreate:change', 'sex', 0)
                Wait(10)
                TriggerEvent('pChacreate:change', 'helmet_1', -1)
                TriggerEvent('pChacreate:change', 'helmet_2', 0)
                TriggerEvent('pChacreate:change', 'glasses_1', 0)
                TriggerEvent('pChacreate:change', 'tshirt_1', 15)
                TriggerEvent('pChacreate:change', 'torso_1', 15)
                TriggerEvent('pChacreate:change', 'arms', 15)
                TriggerEvent('pChacreate:change', 'arms_2', 0)
                TriggerEvent('pChacreate:change', 'bags_1', 0)
                TriggerEvent('pChacreate:change', 'pants_1', 18)
                TriggerEvent('pChacreate:change', 'pants_2', 0)
                TriggerEvent('pChacreate:change', 'shoes_1', 34)
            end
            if btn.slidenum ~= 1 and btn.name == "Sexe" then
                TriggerEvent('pChacreate:change', 'sex', 1)
                Wait(10)
                TriggerEvent('pChacreate:change', 'helmet_1', 120)
                TriggerEvent('pChacreate:change', 'helmet_2', 0)
                TriggerEvent('pChacreate:change', 'glasses_1', 5)
                TriggerEvent('pChacreate:change', 'tshirt_1', 2)
                TriggerEvent('pChacreate:change', 'tshirt_20', 0)
                TriggerEvent('pChacreate:change', 'torso_1', 3)
                TriggerEvent('pChacreate:change', 'torso_2', 0)
                TriggerEvent('pChacreate:change', 'arms', 3)
                TriggerEvent('pChacreate:change', 'arms_2', 0)
                TriggerEvent('pChacreate:change', 'bags_1', 0)
                TriggerEvent('pChacreate:change', 'pants_1', 27)
                TriggerEvent('pChacreate:change', 'pants_2', 0)
                TriggerEvent('pChacreate:change', 'shoes_1', 1)
                TriggerEvent('pChacreate:change', 'shoes_1', 0)
            end
            if btn.name == "Héritage" then
                OpenMenu("Héritage")
            end
            if btn.name == 'Apparence' then 
                OpenMenu('Apparence')
            end 
            if btn.name == "Prénom" then 
                local result = GetOnscreenKeyboardResult() 
                if result ~= nil then 
                    ResultPrenom = result 
                end
            elseif btn.name == "Nom" then 
                local result = GetOnscreenKeyboardResult() 
                if result ~= nil then 
                    ResultNom = result 
                end 
            elseif btn.name == "Date de naissance" then 
                local result = GetOnscreenKeyboardResult() 
                if result ~= nil then 
                    ResultDateDeNaissance = result 
                end 
            elseif btn.name == "Lieu de naissance" then 
                local result = GetOnscreenKeyboardResult() 
                if result ~= nil then 
                    ResultLieuNaissance = result 
                end 
            elseif btn.name == "Taille" then 
                local result = GetOnscreenKeyboardResult() 
                if result ~= nil then 
                    ResultTaille = result 
                end 
            elseif btn.slidenum == 1 and btn.name == "Sexe" then 
                ResultSexe = "m" 
            elseif btn.slidenum == 2 and btn.name == "Sexe" then 
                ResultSexe = "f"  
            elseif btn.name == "~g~Sauvegarder" then     
                TriggerServerEvent('power:saveidentite', ResultSexe, ResultPrenom, ResultNom, ResultDateDeNaissance, ResultTaille)
                if ResultSexe == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Sexe du personnage.")
                    return
                end
                if ResultPrenom == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Prénom du personnage.")
                    return
                end
                if ResultNom == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Nom du personnage.")
                    return
                end
                if ResultDateDeNaissance == nil then
                    GM.ShowNotification("~r~Vous avez pas mis la Datz de Naissance du personnage.")
                    return
                end
                if ResultTaille == nil then
                    GM.ShowNotification("~r~Vous avez pas mis la Taille du personnage.")
                    return
                end
                OpenMenu("~b~NOUVEAU PERSONNAGE")
            end
            if btn.slidenum == 1 and btn.name == "Point d'arrivée" then
                isCameraActive = false
                TriggerServerEvent("charselect:createsign") 
                TriggerServerEvent('power:saveidentite', ResultSexe, ResultPrenom, ResultNom, ResultDateDeNaissance, ResultTaille)
                if ResultSexe == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Sexe du personnage.")
                    return
                end
                if ResultPrenom == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Prénom du personnage.")
                    return
                end
                if ResultNom == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Nom du personnage.")
                    return
                end
                if ResultDateDeNaissance == nil then
                    GM.ShowNotification("~r~Vous avez pas mis la Datz de Naissance du personnage.")
                    return
                end
                if ResultTaille == nil then
                    GM.ShowNotification("~r~Vous avez pas mis la Taille du personnage.")
                    return
                end
                CreateBoard(GetPlayerPed(-1))
                TriggerServerEvent("charselect:createsign") 
                startAnims("mp_character_creation@customise@male_a", "drop_outro")
                TriggerEvent('pChacreate:getSkin', function(skin)
                    LastSkin = skin
                end)
                TriggerEvent('pChacreate:getSkin', function(skin)
                TriggerServerEvent('pChacreate:save', skin)
                end)
                incamera = true
                createcam(false)
                self:CloseMenu(true)
                --animationfin()
                cam_fin_v2(false)
                TriggerEvent('power:launchCharMovie')
                SetOverrideWeather("EXTRASUNNY")
                Wait(50)
                TriggerEvent('power:charCinematiqueEnd')
                --TriggerEvent('power:startVideo')
            elseif btn.slidenum == 2 and btn.name == "Point d'arrivée" then
                isCameraActive = false
                TriggerServerEvent("charselect:createsign") 
                TriggerServerEvent('power:saveidentite', ResultSexe, ResultPrenom, ResultNom, ResultDateDeNaissance, ResultTaille)
                if ResultSexe == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Sexe du personnage.")
                    return
                end
                if ResultPrenom == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Prénom du personnage.")
                    return
                end
                if ResultNom == nil then
                    GM.ShowNotification("~r~Vous avez pas mis le Nom du personnage.")
                    return
                end
                if ResultDateDeNaissance == nil then
                    GM.ShowNotification("~r~Vous avez pas mis la Datz de Naissance du personnage.")
                    return
                end
                if ResultTaille == nil then
                    GM.ShowNotification("~r~Vous avez pas mis la Taille du personnage.")
                    return
                end
                CreateBoard(GetPlayerPed(-1))
                TriggerServerEvent("charselect:createsign") 
                startAnims("mp_character_creation@customise@male_a", "drop_outro")
                TriggerEvent('pChacreate:getSkin', function(skin)
                    LastSkin = skin
                end)
                TriggerEvent('pChacreate:getSkin', function(skin)
                TriggerServerEvent('pChacreate:save', skin)
                end)
                incamera = true
                createcam(false)
                self:CloseMenu(true)
                --animationfin()
                cam_fin_v2(false)
                TriggerEvent('power:launchCharMovie')
                SetOverrideWeather("EXTRASUNNY")
                Wait(50)
                TriggerEvent('power:charCinematiqueEnd2')
                --TriggerEvent('power:startVideo')
               -- TriggerEvent('power:SpawnCharacter2')
            end
        end,

        onSlide = function(menuData, btn, currentButton, currentSlt, slide, PMenu, onAdvSlide)
            local currentMenu, currentBtn, slide, opacity, btn, ped = menuData.currentMenu, menuData.currentBtn, btn.slidenum, btn.opacity, btn.name, GetPlayerPed(-1)  
            if btn == "Peau" and slide ~= -1 then
                skin = slide - 1 
                TriggerEvent('pChacreate:change', 'skin', skin)
            end
            if currentMenu == "Héritage" and slide ~= -1 then   
                mum = creationPerso.Menu["Héritage"].b[1].slidenum 
                dad = creationPerso.Menu["Héritage"].b[2].slidenum
                Ressemblance = creationPerso.Menu["Héritage"].b[3].parentSlider
                Peau = creationPerso.Menu["Héritage"].b[4].parentSlider 
                TriggerEvent('pChacreate:change', 'mom' , mum)
                TriggerEvent('pChacreate:change', 'dad' , dad)
                TriggerEvent('pChacreate:change', 'face' , Ressemblance)
                TriggerEvent('pChacreate:change', 'skin' , Peau)  
                --SetPedHeadBlendData(GetPlayerPed(-1), dad,mum,nil,dad,mum,nil,Ressemblance,Peau,nil,true)
                
            end  
            if currentMenu == "Apparence" and btn == "Cheveux" and slide ~= -1 then 
                hair = slide - 1
                TriggerEvent('pChacreate:change', 'hair_1' , hair)
                --SetPedComponentVariation(GetPlayerPed(-1),2,slide,0,2)
            end
            if currentMenu == "Apparence" and btn == "Sourcils" and slide ~= -1 then
                eyebrows = slide - 1
                TriggerEvent('pChacreate:change', 'eyebrows_1',eyebrows)
                TriggerEvent('pChacreate:change', 'eyebrows_2' , opacity*10)
                --SetPedHeadOverlay(GetPlayerPed(-1), 2, slide,opacity) 
            end
            if btn == "Barbe" and slide ~= -1 then
                beard = slide - 1
                SetPedHeadOverlay(GetPlayerPed(-1), 1, beard, 1.0)
                TriggerEvent('pChacreate:change', 'beard_2', opacity*10)
                TriggerEvent('pChacreate:change', 'beard_1', beard)
            end
            if btn == "Rides" and slide ~= -1 then
                wrinkle = slide - 1
                TriggerEvent('pChacreate:change', 'age_2', opacity*10)
                TriggerEvent('pChacreate:change', 'age_1', wrinkle)
            end
            --[[
            if currentMenu == "Sexe" then
                sex = slide - 1
                --SetPedComponentVariation(GetPlayerPed(-1), 0, visage, 0, 0)
                TriggerEvent('pChacreate:change', 'sex', sex)
            end
            ]]
            if btn == "Vos Parent" and slide ~= -1 then
                face = slide - 1
                TriggerEvent('pChacreate:change', 'face', face)
            end
            if btn == "Vos imperfections" and slide ~= -1 then
                skinproblem = slide - 1
                TriggerEvent('pChacreate:change', 'complexion_1', skinproblem)
            end
            if btn == "Opacité des imperfections" and slide ~= -1 then
                skinproblem2 = slide - 1
                TriggerEvent('pChacreate:change', 'complexion_2', skinproblem2)
            end
            if btn == "Taches de rousseur" and slide ~= -1 then
                freckle = slide - 1
                TriggerEvent('pChacreate:change', 'moles_1', freckle)
                TriggerEvent('pChacreate:change', 'moles_2', opacity*10)
            end
            if currentMenu == "Votre acné" and slide ~= -1 then
                acne = slide - 1
                SetPedHeadOverlay(GetPlayerPed(-1), 0, acne, 1.0)
            end
            if btn == "Dommages UV" and slide ~= -1 then
                sun1 = slide - 1
                TriggerEvent('pChacreate:change', 'sun_1', sun1)
                TriggerEvent('pChacreate:change', 'sun_2',  opacity*10)
            end
            if btn == "Teint " and slide ~= -1 then
                complexion1 = slide - 1
                TriggerEvent('pChacreate:change', 'complexion_1', complexion1)
                TriggerEvent('pChacreate:change', 'complexion_2',  opacity*10)
            end
            if btn == "Teint" and slide ~= -1 then
                peau = slide - 1
                TriggerEvent('pChacreate:change', 'mom', peau)
                --TriggerEvent('pChacreate:change', 'skin', sqc)
            end
            if btn == "Visage" and slide ~= -1 then
                face = slide - 1
                TriggerEvent('pChacreate:change', 'dad', face)
            end
            if btn == "Rougeurs" and slide ~= -1 then     
                blush1 = slide - 1
                TriggerEvent('pChacreate:change', 'blush_1', blush1)
                TriggerEvent('pChacreate:change', 'blush_2', opacity*10)
            end
            if btn == "Boutons" and slide ~= -1 then
                blemishes1 = slide - 1
                TriggerEvent('pChacreate:change', 'blemishes_1', blemishes1)
                TriggerEvent('pChacreate:change', 'blemishes_2', opacity*10)
            end

            if btn == "Imperfections du corp" and slide ~= -1 then
                bodyb1 = slide - 1
                TriggerEvent('pChacreate:change', 'bodyb_1', bodyb1)
                TriggerEvent('pChacreate:change', 'bodyb_2', opacity*10)
            end
            if btn == "Poils du torse" and slide ~= -1 then
                chest1 = slide - 1
                TriggerEvent('pChacreate:change', 'chest_2', opacity*10)
                TriggerEvent('pChacreate:change', 'chest_1', chest1)
            end
            if btn == "Maquillage" and slide ~= -1 then
                makeup1 = slide - 1
                TriggerEvent('pChacreate:change', 'makeup_1', makeup1)
                TriggerEvent('pChacreate:change', 'makeup_2', opacity*10)
            end
            if btn == "Rouge à lèvres" and slide ~= -1 then
                lipstick1 = slide - 1
                TriggerEvent('pChacreate:change', 'lipstick_1', lipstick1)
                TriggerEvent('pChacreate:change', 'lipstick_2', opacity*10)
            end
            if slide == 1 and btn == "Parent 1" then     
                creationPerso.Menu["Héritage"].father = "male_1"
            end
            if slide == 2 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_2"   
            end
            if slide == 3 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_3"            
            end
            if slide == 4 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_4"
            end
            if slide == 5 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_5"
            end
            if slide == 6 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_6"           

            end
            if slide == 7 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_7"
            end
            if slide == 8 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_8"
            end
            if slide == 9 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_9"
            end
            if slide == 10 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_10"            
            end
            if slide == 11 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_11"            
            end
            if slide == 12 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_12"            
            end
            if slide == 13 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_13"            
            end
            if slide == 14 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_14"            
            end
            if slide == 15 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_15"            
            end
            if slide == 16 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_16"            
            end
            if slide == 17 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_17"            
            end
            if slide == 18 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_18"            
            end
            if slide == 19 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_19"            
            end
            if slide == 20 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_20"            
            end
            if slide == 21 and btn == "Parent 1" then 
                creationPerso.Menu["Héritage"].father = "male_21"           
            end            
            if slide == 1 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_1"
            end
            if slide == 2 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_2"
            end
            if slide == 3 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_3"
            end
            if slide == 4 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_4"
            end
            if slide == 5 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_5"
            end
            if slide == 6 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_6"
            end
            if slide == 7 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_7"
            end
            if slide == 8 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_8"
            end
            if slide == 9 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_9"
            end
            if slide == 10 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_10"
            end
            if slide == 11 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_11"            
            end
            if slide == 12 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_12"
            end
            if slide == 13 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_13"
            end
            if slide == 14 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_14"
            end
            if slide == 15 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_15"
            end
            if slide == 16 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_16"
            end
            if slide == 17 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_17"
            end
            if slide == 18 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_18"
            end
            if slide == 19 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_19"
            end
            if slide == 20 and btn == "Parent 2" then 
                creationPerso.Menu["Héritage"].mother = "female_20"
            end
            if slide == 21 and btn == "Parent 2" then  
                creationPerso.Menu["Héritage"].mother = "female_21"
            end 
        end,
        
        onSlider = function(self, currentBtn, allButtons,parentSliderSize)
            if self.Data.currentMenu == "Héritage"  then 
                mum = creationPerso.Menu["Héritage"].b[1].slidenum
                dad = creationPerso.Menu["Héritage"].b[2].slidenum
                Ressemblance = creationPerso.Menu["Héritage"].b[3].parentSlider
                Peau = creationPerso.Menu["Héritage"].b[4].parentSlider
                TriggerEvent('pChacreate:change', 'mom' , mum)
                TriggerEvent('pChacreate:change', 'dad' , dad)
                TriggerEvent('pChacreate:change', 'face' , Ressemblance)
                TriggerEvent('pChacreate:change', 'skin' , Peau)  
                --SetPedHeadBlendData(GetPlayerPed(-1), dad,mum,nil,dad,mum,nil,Ressemblance,Peau,nil,true)
            end

        end,
        onAdvSlide = function(self, btn , currentBtn, currentButtons)
            local I=(currentBtn.advSlider[3]/40*2)-1
            if self.Data.currentMenu == 'Apparence'and currentBtn.name == "Cheveux" then 
                TriggerEvent('pChacreate:change', 'hair_color_1' , currentBtn.advSlider[3])
                --SetPedHairColor(GetPlayerPed(-1),currentBtn.advSlider[3],currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Apparence" and currentBtn.name == "Sourcils" then 
                TriggerEvent('pChacreate:change', 'eyebrows_3' , currentBtn.advSlider[3])
                --SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1,currentBtn.advSlider[3],currentBtn.advSlider[3])
            end 
            if self.Data.currentMenu == "trais du visage" and currentBtn.name == "Rougeurs" then
                TriggerEvent('pChacreate:change', 'blush_3' , currentBtn.advSlider[3])
            end  
            if self.Data.currentMenu == "trais du visage" and currentBtn.name == "Maquillage" then
                TriggerEvent('pChacreate:change', 'makeup_3', currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "trais du visage" and currentBtn.name == "Rouge à lèvres" then
                TriggerEvent('pChacreate:change', 'lipstick_3', currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Apparence" and currentBtn.name == "Poils du torse" then
                TriggerEvent('pChacreate:change', 'chest_3', currentBtn.advSlider[3])
            end
        end,
    },
	Menu = {
        ["~b~NOUVEAU PERSONNAGE"] = {
			b = {
                {name = "Sexe", slidemax = {"Homme","Femme"}, Description = "Cliquer pour sélectionner votre sexe."},
                {name = "Héritage", Description = "Choisissez vos parents."},
                {name = "Trais du visage", Description = "Changez les traits de votre visage."},
                {name = "Apparence", Description = "Changez votre apparence."},
                {name = "Vêtements", Description = "Changez vos vêtements."},
                {name = "Identité", Description = "Faire sa carte d'identité."},
                {name = "Sauvegarder et continuer", colorFree={18,48,83,165}, Description = "Êtes-vous prêt à jouer à RedCity ?"}
			}
        },
        ["Héritage"] = { 
            extra = true , charCreator = true , father = 'male_0', mother = 'female_0',
            b = {
                {name="Parent 1",slidemax=dad},
                {name="Parent 2",slidemax=mum},
                {name="Ressemblance",parentSlider=.25,Description="Sélectionnez si la forme de votre visage est plus influencée par celle de votre père / Parent 1."},
                {name="Peau",parentSlider=.75,Description="Sélectionnez si votre peau est plus influencée par celle de votre père / Parent 2."}
            }
        },
        ["trais du visage"] = {
            b = {
                {name = "Boutons", slidemax = 23, opacity = 0.9},
                {name = "Dommages UV", slidemax = 10, opacity = 0.9},
                {name = "Rides", slidemax = 15, opacity = 0.9},
                {name = "Rougeurs", slidemax = 32, advSlider = {0,GetNumMakeupColors(),0}, opacity = 0.9},
                {name = "Taches de rousseur", slidemax = 17, opacity = 0.9},
                {name = "Teint ", slidemax = 11, opacity = 0.9},
                {name = "Maquillage", slidemax = 71, advSlider = {0,GetNumMakeupColors(),0}, opacity = 0.9},
                {name = "Rouge à lèvres", slidemax = 9, advSlider = {0,GetNumMakeupColors(),0}, opacity = 0.9},
            }
        },
        ["Apparence"] = {  
            extra = true,     
			b = {
                {name = "Cheveux", slidemax = 74, advSlider = {0,GetNumMakeupColors(),0}},
                {name = "Sourcils" , slidemax = 33, advSlider = {0,GetNumMakeupColors(),0}, opacity = 0.9},
                {name = "Barbe", slidemax = 28, opacity = 0.9},
                {name = "Poils du torse", slidemax = 16, advSlider = {0,GetNumMakeupColors(),0}, opacity = 0.9},
                {name = "Imperfections du corp", opacity = 0.9},
            }
        },
        ["identité"] = {
            b = {
                {name = "Prénom", ask = "" },    
                {name = "Nom", ask = "" },
                {name = "Date de naissance", ask = "jj/mm/aa" }, 
                {name = "Lieu de naissance", ask = "" },
                {name = "Taille", ask = "170" },
                {name = "Sexe", slidemax = {"Homme","Femme"} }, --ask = "m/f" 
                {name = "~g~Sauvegarder"},  
            }
        },
        ["vêtements"] = {          
			b = {
                {name = "Cuir noir"},
                {name = "Sport blanc"},
                {name = "Cool"},
                {name = "Junki"},
            }
        },
        ["sauvegarder et continuer"] = {
            b = {
                {name = "Point d'arrivée", slidemax = ville}
            }
        }
	}
}

local don = {
    Base = {Header = {"commonmenu", "interaction_bgd"}, Blocked = true, Title = "Ped"},
    Data = {currentMenu = "~b~OPTION PERSONNAGE"},
    Events = {
        onSelected = function(self, _, btn, slide)
            local btn = btn.name 
            if btn == "Sauvegarder votre skin" then
                self:CloseMenu(true)
                TriggerEvent('pChacreate:getSkin', function(skin)
                    TriggerServerEvent('pChacreate:save', skin)
                end)
            end
            if btn == "~r~Annuler les modification" then
                self:CloseMenu(true)
                GM.TriggerServerCallback('pChacreate:getPlayerSkin', function(skin)
                    TriggerEvent('pChacreate:loadSkin', skin)
                end)
            end
        end,
        onSlide = function(menuData, btn, currentButton, currentSlt, slide, PMenu, onAdvSlide)
            local currentMenu, currentBtn, slide, btn, ped = menuData.currentMenu, menuData.currentBtn, btn.slidenum, btn.name, GetPlayerPed(-1)        
            if btn == "Skin" and slide ~= -1 then
                sex = slide - 1
                SetPedComponentVariation(GetPlayerPed(-1), 0, visage, 0, 0)
                TriggerEvent('pChacreate:change', 'sex', sex)
            end
        end,
    },
    Menu = {
        ["~b~OPTION PERSONNAGE"] = {
            b = {
                {name = "Skin", slidemax = 564},
                {name = "~r~Annuler les modification"},
                {name = "Sauvegarder votre skin", colorFree={18,48,83,165}, Description = "Êtes-vous sur ?"}
            }
        },
    }
}

RegisterCommand('ped', function()   
    GM.TriggerServerCallback('power:Admin', function(playerGroup)
        if playerGroup ~= nil and playerGroup == 'gold' or playerGroup == 'mod' or playerGroup == 'admin' or playerGroup == 'superadmin' or playerGroup == 'owner' then
            CreateMenu(don)
        end
    end) 
end)

function AnimationIntro()
    RequestAnimDict("mp_character_creation@lineup@male_a")
    Citizen.Wait(100)
    startAnims("mp_character_creation@lineup@male_a", "intro")
    Citizen.Wait(5700)
    RequestAnimDict("mp_character_creation@customise@male_a")
    Citizen.Wait(100)
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "loop", 1.0, 1.0, -1, 0, 1, 0, 0, 0)
    Citizen.Wait(2250)
end

TriggerEvent('instance:registerType', 'skin')

RegisterCommand('charcreate', function()    
    TriggerEvent('instance:create', 'skin')
    TriggerEvent('pChacreate:change', 'sex', 0)
    TriggerEvent('pChacreate:change', 'helmet_1', -1)
    TriggerEvent('pChacreate:change', 'helmet_2', 0)
    TriggerEvent('pChacreate:change', 'glasses_1', 0)
    TriggerEvent('pChacreate:change', 'tshirt_1', 15)
    TriggerEvent('pChacreate:change', 'torso_1', 15)
    TriggerEvent('pChacreate:change', 'arms', 15)
    TriggerEvent('pChacreate:change', 'arms_2', 0)
    TriggerEvent('pChacreate:change', 'bags_1', 0)
    TriggerEvent('pChacreate:change', 'pants_1', 18)
    TriggerEvent('pChacreate:change', 'pants_2', 0)
    TriggerEvent('pChacreate:change', 'shoes_1', 34)
    isCameraActive = true
    for i = 0, 357 do
        DisableAllControlActions(i)
    end
    SetOverrideWeather("EXTRASUNNY")
    NetworkOverrideClockTime(19, 0, 0)
    SetEntityCoords(GetPlayerPed(-1), 402.770, -996.81, -100.00, 179.57, 0, 0, 1)
    SetEntityHeading(PlayerPedId(), 181.66)
    createcam(true)
    CreateMenu(creationPerso)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    incamera = true
    ClearPedTasks(GetPlayerPed(-1))
    DeleteObject(board)
    DeleteObject(overlay)
end)

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
	if instance.type == 'skin' then
		TriggerEvent('instance:enter', instance)
	end
end)

AddEventHandler("power:launchCharMovie", function()
	local function LoadScaleform (scaleform)
		local handle = RequestScaleformMovie(scaleform)

		if handle ~= 0 then
			while not HasScaleformMovieLoaded(handle) do
				Citizen.Wait(0)
			end
		end

		return handle
	end

	local function CallScaleformMethod (scaleform, method, ...)
		local t
		local args = { ... }

		BeginScaleformMovieMethod(scaleform, method)

		for k, v in ipairs(args) do
			t = type(v)
			if t == 'string' then
				PushScaleformMovieMethodParameterString(v)
			elseif t == 'number' then
				if string.match(tostring(v), "%.") then
					PushScaleformMovieFunctionParameterFloat(v)
				else
					PushScaleformMovieFunctionParameterInt(v)
				end
			elseif t == 'boolean' then
				PushScaleformMovieMethodParameterBool(v)
			end
		end

		EndScaleformMovieMethod()
	end

	local interior_pos = vector3(399.9, -998.7, -100.0)
	local interior = GetInteriorAtCoordsWithType(interior_pos, "v_mugshot")
	local room = 2086940140 -- mugshot room
	local lineup_male = "mp_character_creation@lineup@male_a"

	local handle
	local board
	local board_model = GetHashKey("prop_police_id_board")
	local board_pos = vector3(409.02, -1000.8, -98.859)
	local board_scaleform
	local overlay
	local overlay_model = GetHashKey("prop_police_id_text")

	local camera_scaleform
	local cam
	local cam2

	--
	local TakePhoto = N_0xa67c35c56eb1bd9d
	local WasPhotoTaken = N_0x0d6ca79eeebd8ca3
	local SavePhoto = N_0x3dec726c25a11bac
	local ClearPhoto = N_0xd801cc02177fa3f1
	--

	local function Cleanup()
		ReleaseNamedRendertarget("ID_Text")
		SetScaleformMovieAsNoLongerNeeded(board_scaleform)
		DeleteObject(overlay)
		DeleteObject(board)
		DestroyCam(cam, 1)
		DestroyCam(cam2, 1)
		ReleaseNamedScriptAudioBank("DLC_GTAO/MUGSHOT_ROOM")
		ReleaseNamedScriptAudioBank("Mugshot_Character_Creator")
		RemoveAnimDict(lineup_male)
		ClearPedTasksImmediately(PlayerPedId())
		StopPlayerSwitch()
		UnpinInterior("v_mugshot")
		handle = false
	end

	AddEventHandler('onResourceStop', function (resource)
		if resource == GetCurrentResourceName() then Cleanup() end
	end)

	local function TaskHoldBoard()
		local empty, sequence = OpenSequenceTask(0)
		TaskPlayAnim(0, lineup_male, "react_light", 8.0, -8.0, -1, 512, 0, 0, 0, 0)
		TaskPlayAnim(0, lineup_male, "Loop", 8.0, -8.0, -1, 513, 0, 0, 0, 0)
		CloseSequenceTask(sequence)
		ClearPedTasks(PlayerPedId())
		TaskPerformSequence(PlayerPedId(), sequence)
		ClearSequenceTask(sequence)
	end

	local function TaskRaiseBoard()
		local empty, sequence = OpenSequenceTask(0)
		TaskPlayAnim(0, lineup_male, "low_to_high", 8.0, -8.0, -1, 512, 0, 0, 0, 0)
		TaskPlayAnim(0, lineup_male, "Loop_raised", 8.0, -8.0, -1, 513, 0, 0, 0, 0)
		CloseSequenceTask(sequence)
		ClearPedTasks(PlayerPedId())
		TaskPerformSequence(PlayerPedId(), sequence)
		ClearSequenceTask(sequence)
	end

	local function TaskWalkInToRoom()
		local empty, sequence = OpenSequenceTask(0)
		local ped = PlayerPedId()
		local rot = vector3(0.0, 0.0, 0.0)
		TaskPlayAnimAdvanced(0, lineup_male, "Intro", board_pos, rot, 8.0, -8.0, -1, 4608, 0, 2, 0)
		TaskPlayAnim(0, lineup_male, "Loop", 8.0, -8.0, -1, 513, 0, 0, 0, 0)
		CloseSequenceTask(sequence)
		ClearPedTasks(ped)
		TaskPerformSequence(ped, sequence)
		ClearSequenceTask(sequence)
	end

	local function ConfigCameraUI(bool)
		CallScaleformMethod(camera_scaleform, 'OPEN_SHUTTER', 250)
		if bool then
			CallScaleformMethod(camera_scaleform, 'SHOW_PHOTO_FRAME', false)
			CallScaleformMethod(camera_scaleform, 'SHOW_PHOTO_BORDER', true, -0.7, 0.5, 0.5, 162, 120)
		else
			CallScaleformMethod(camera_scaleform, 'SHOW_REMAINING_PHOTOS', true)
			CallScaleformMethod(camera_scaleform, 'SET_REMAINING_PHOTOS', 0, 1)
			CallScaleformMethod(camera_scaleform, 'SHOW_PHOTO_FRAME', true)
			CallScaleformMethod(camera_scaleform, 'SHOW_PHOTO_BORDER', false)
		end
	end

	local function TaskTakePicture()
		local ped = PlayerPedId()

		CallScaleformMethod(camera_scaleform, 'CLOSE_SHUTTER', 250)
		if RequestScriptAudioBank("Mugshot_Character_Creator", false, -1) then
			PlaySound(-1, "Take_Picture", "MUGSHOT_CHARACTER_CREATION_SOUNDS", 0, 0, 1)
		end

		TakePhoto()
		if WasPhotoTaken() --[[and SavePhoto(-1)]] then

		end
		ConfigCameraUI(true)
		ClearPhoto()
	end

	local function ExitRoom ()
		local empty, sequence = OpenSequenceTask(0)
		TaskPlayAnim(0, lineup_male, "outro", 8.0, -8.0, -1, 512, 0, 0, 0, 0)
		TaskPlayAnim(0, lineup_male, "outro_loop", 8.0, -8.0, -1, 513, 0, 0, 0, 0)
		CloseSequenceTask(sequence)
		ClearPedTasks(PlayerPedId())
		TaskPerformSequence(PlayerPedId(), sequence)
		ClearSequenceTask(sequence)
		TaskLookAtCoord(PlayerPedId(), GetCamCoord(cam), -1, 10240, 2)
		Citizen.Wait(10000)
		Cleanup()
		RenderScriptCams(false, false, 0, false, false)
		--TriggerEvent("power:charCinematiqueEnd")
	end

	local function func_1636 (cam, f1, f2, f3, f4)
		N_0xf55e4046f6f831dc(cam, f1)
		N_0xe111a7c0d200cbc5(cam, f2)
		SetCamDofFnumberOfLens(cam, f3)
		SetCamDofMaxNearInFocusDistanceBlendLevel(cam, f4)
	end

	-- Camera
	Citizen.CreateThread(function ()
		-- SCRIPT::SHUTDOWN_LOADING_SCREEN();
		LoadInterior(interior)
		DoScreenFadeOut(0)

		-- Booth cam
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
		SetCamCoord(cam, 416.4084, -998.3806, -99.24789)
		SetCamRot(cam, 0.878834, -0.022102, 90.0173, 2)
		SetCamFov(cam, 36.97171)
		ShakeCam(cam, "HAND_SHAKE", 0.1)
		func_1636(cam, 7.2, 1.0, 0.5, 1.0)

		-- Show booth cam eventually
		Wait(5000)
		ConfigCameraUI(false)
		SetCamActive(cam, true)

		-- Zoomed cam
		cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
		SetCamCoord(cam2, 412.0216, -997.9448, -98.8) -- In room
		SetCamRot(cam2, 0.865862, -0.01934, 91.04581, 2)
		SetCamFov(cam2, 35.2015)

		while DoesCamExist(cam) do
			if not IsCamInterpolating(cam) and not IsCamInterpolating(cam2) then
				RenderScriptCams(true, false, 3000, 1, 0, 0)
			end
            Wait(0)
        end
	end)

	-- Fade in
	Citizen.CreateThread(function ()
		Wait(500)
		if IsScreenFadedOut() or IsScreenFadingOut() then
			DoScreenFadeIn(500)
		end
	end)

	Citizen.CreateThread(function ()
		local ped = PlayerPedId()

		SetEntityCoords(interior_pos)
		SetPlayerVisibleLocally(PlayerId(), false)
		FreezeEntityPosition(ped, true)
		RequestModel(board_model)
		RequestModel(overlay_model)
		RequestAnimDict(lineup_male);
		RequestScriptAudioBank("DLC_GTAO/MUGSHOT_ROOM", false, -1)
		RequestScriptAudioBank("Mugshot_Character_Creator", false, -1)

		while not IsInteriorReady(interior) do Wait(1) end
		while not HasModelLoaded(board_model) or not HasModelLoaded(overlay_model) do Wait(1) end
		while not HasAnimDictLoaded(lineup_male) do Wait(1) end

		board = CreateObject(board_model, board_pos, false, true, false)
		overlay = CreateObject(overlay_model, board_pos, false, true, false)
		AttachEntityToEntity(overlay, board, -1, 4103, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		SetModelAsNoLongerNeeded(board_model)
		SetModelAsNoLongerNeeded(overlay_model)

		SetEntityCoords(ped, board_pos)
		ClearPedWetness(ped)
		ClearPedBloodDamage(ped)
		ClearPlayerWantedLevel(PlayerId())
		SetCurrentPedWeapon(ped, GetHashKey("weapon_unarmed"), 1)
		FreezeEntityPosition(ped, false)
		AttachEntityToEntity(board, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)

		-- FIXME
		ClearPedTasksImmediately(ped)
		TaskWalkInToRoom()
		Wait(7000)
		if RequestScriptAudioBank("DLC_GTAO/MUGSHOT_ROOM", false, -1) then
			PlaySoundFrontend(-1, "Lights_On", "GTAO_MUGSHOT_ROOM_SOUNDS", true)
		end

		Wait(500)
		TaskHoldBoard()

		PlaySound(-1, "Zoom_In", "MUGSHOT_CHARACTER_CREATION_SOUNDS", 0, 0, 1)

		if DoesCamExist(cam2) then
			StopCamShaking(cam2)
			SetCamActiveWithInterp(cam2, cam, 300, 1, 1)
		end

		Wait(5000)
		TaskTakePicture()
		Wait(1000)
		ConfigCameraUI(false)
		SetCamActiveWithInterp(cam, cam2, 300, 1, 1)
		PlaySound(-1, "Zoom_Out", "MUGSHOT_CHARACTER_CREATION_SOUNDS", 0, 0, 1)
		ExitRoom()
	end)

	-- Draw the id board
	Citizen.CreateThread(function ()
		board_scaleform = LoadScaleform("mugshot_board_01")
		camera_scaleform = LoadScaleform("digital_camera")
		handle = CreateNamedRenderTargetForModel("ID_Text", overlay_model)

		-- headerStr, numStr, footerStr, importedStr, importedCol, rankNum, rankCol
		CallScaleformMethod(board_scaleform, 'SET_BOARD', 'Nouveau', "1,500$", 'LOS SANTOS POLICE DEPT', 'Civil')
		CallScaleformMethod(camera_scaleform, 'OPEN_SHUTTER', 250)
        --TriggerEvent('power:charCinematiqueEnd')
		while handle do
			HideHudAndRadarThisFrame()
			SetTextRenderId(handle)
			Set_2dLayer(4)
			Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
			DrawScaleformMovie(board_scaleform, 0.405, 0.37, 0.81, 0.74, 255, 255, 255, 255, 0);
			Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
			SetTextRenderId(GetDefaultScriptRendertargetRenderId())

			Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
			DrawScaleformMovieFullscreen(camera_scaleform, 255, 255, 255, 255, 0);
            Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
            Wait(0)
        end
	end)
end)

function CreateNamedRenderTargetForModel(name, model)
    local handle = 0
    if not IsNamedRendertargetRegistered(name) then
        RegisterNamedRendertarget(name, false)
    end
    if not IsNamedRendertargetLinked(model) then
        LinkNamedRendertarget(model)
    end
    if IsNamedRendertargetRegistered(name) then
        handle = GetNamedRendertargetRenderId(name)
    end

    return handle
end

AddEventHandler("power:charCinematiqueEnd",function()
    Wait(23500)
    DeleteObject(board)
    DeleteObject(overlay)
    TriggerEvent('power:SpawnCharacter') 
    Wait(3000)
    NetworkSetTalkerProximity(8.0)
end)

AddEventHandler("power:charCinematiqueEnd2",function()
    --DoScreenFadeOut(0)
    Wait(23500)
    DeleteObject(board)
    DeleteObject(overlay)
    TriggerEvent('power:SpawnCharacter2') 
    Wait(3000)
    NetworkSetTalkerProximity(8.0)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isCameraActive then
            if IsControlJustPressed(1, 107) then 
                SetEntityHeading(PlayerPedId(), 0.50)
            elseif IsControlJustPressed(1, 108) then 
                SetEntityHeading(PlayerPedId(), 193.26)
            elseif IsControlJustPressed(1, 112) then 
                SetEntityHeading(PlayerPedId(), 268.72219848633)
            elseif IsControlJustPressed(1, 111) then 
                SetEntityHeading(PlayerPedId(), 91.04)
            end
        end
    end
end)