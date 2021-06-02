--[[
local posveentegofast = {vector3(1203.80, -3115.88, 4.56)}

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local bonus = GetVehicleEngineHealth(vehicle)
        local playerPos = GetEntityCoords(PlayerPedId(), true)
        for k,v in pairs(posveentegofast) do 
            if(25 ~= -1 and GetDistanceBetweenCoords(playerPos, posveentegofast[k].x, posveentegofast[k].y, posveentegofast[k].z, true) < 10.0) then
                Drawing.Zmppppp3d(posveentegofast[k].x, posveentegofast[k].y, posveentegofast[k].z, "Appuyez sur ~g~E ~s~pour vendre le ~b~véhicule.", 0, 2.1, 0.45, 255, 255, 255, 255)
                DrawMarker(25, posveentegofast[k].x, posveentegofast[k].y, posveentegofast[k].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 9.2, 9.2, 9.2, 248, 1, 1, 100, false, true, 2, false, false, false, false)
            end
        end
        if(GetDistanceBetweenCoords(playerPos, 1203.80, -3115.88, 4.56, true) < 1.2) then
            if IsControlJustPressed(0,51) then 
                PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 1)
                TriggerEvent('GM:deleteVehicle')
                Scaleform.ShowAddMoney(money)
                TriggerServerEvent("power:venfres", bonus) 
            else 
                GM.ShowNotification("test")
            end
        end   
    end
end)

Wrapper = {}
Wrapper.jsonEncode = json.encode

setmetatable(Wrapper, {
    __index = function(_, key)
        Wrapper[key] = _G[key]
        return _G[key]
    end
})
Scaleform = {}
function Scaleform.ShowAddMoney(money)
    Scaleform.showCountDown("$1000", 71, 204, 0)
end

function Scaleform.loadScaleform(scaleformName)
    local scaleform = Wrapper.RequestScaleformMovie(scaleformName)
    while not Wrapper.HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    return scaleform
end

function Scaleform.showCountDown(text, r, g, b)
    Citizen.CreateThread(function()
        local scaleform = Scaleform.loadScaleform('COUNTDOWN')
        Wrapper.BeginScaleformMovieMethod(scaleform, 'SET_MESSAGE')
        Wrapper.PushScaleformMovieMethodParameterString(text)
        Wrapper.PushScaleformMovieMethodParameterInt(r)
        Wrapper.PushScaleformMovieMethodParameterInt(g)
        Wrapper.PushScaleformMovieMethodParameterInt(b)
        Wrapper.PushScaleformMovieMethodParameterBool(false)
        Wrapper.EndScaleformMovieMethod()
        Scaleform.draw(scaleform, 40, 10)
    end)
end

function Scaleform.draw(scaleform, loops, delayBetweenLoops)
    for i = 1, loops do
        Wrapper.DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        Citizen.Wait(delayBetweenLoops)
    end
end

Drawing = setmetatable({}, Drawing)
Drawing.__index = Drawing

function Drawing.Zmppppp3d(x,y,z,textInput,fontId,scaleX,scaleY,r, g, b, a)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local scale = (1/dist)*14
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    SetTextScale(scaleX*scale, scaleY*scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(r, g, b, a)
    SetTextDropshadow(0, 0, 0, 0, 0)
    SetTextEdge(0, 0, 0, 0, 0)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(textInput)
    SetDrawOrigin(x,y,z+1, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
]]