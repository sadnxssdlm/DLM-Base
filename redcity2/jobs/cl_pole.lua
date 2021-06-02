local PoleE = {
    Base = {Title="Recherche d'emplois"},
    Data = {currentMenu="Emplois disponible"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            if btn.name == "Civil" then
                TriggerServerEvent('power_JB:setJobChômeur')
                GM.ShowNotification('Vous c\'êtes : ~b~"Civil"~w~')
            end

            if btn.name == "Abatteur" then
                TriggerServerEvent('power_JB:setJobAbatteur')
                GM.ShowNotification('Vous avez été embauchée en tant que  ~b~"Abatteur"~w~')
            end
            if btn.name == "Bûcheron" then
                TriggerServerEvent('power_JB:setJobBûcheron')
                GM.ShowNotification("~b~Aide:\n~w~Rendez-vous dans le nord dans les Bûches avec votre véhicule personnel pour commencer.") 
            end
            if btn.name == "Couturier" then
                TriggerServerEvent('power_JB:setJobCouturier')
                GM.ShowNotification("~b~Aide:\n~w~Rendez-vous dans le sub chez les Couturier avec votre véhicule personnel pour commencer.") 
            end
            if btn.name == "Mineur" then
                TriggerServerEvent('power_JB:setJobMineur')
                GM.ShowNotification("~b~Aide:\n~w~Rendez-vous dans le nord dans les Mines avec votre véhicule personnel pour commencer.") 
            end
        end,
    },
    Menu={
        ["Emplois disponible"]={
            Description2 = "",
            b = {
                {name = "Métiers", ask = "→", askX = true},
                {name = "-------------------------------------------"},
                {name = "Métiers publiques", ask = "→", askX = true},
            }
        },
        ["métiers"]={
            Description2 = "",
            b = {
                {name = "Civil", Des = "Cliquer si vous souhaiter quitter votre jobs"},
                {name = "Avocat"},
                {name = "LSPD"},
                {name = "LSSD"},
                {name = "LSFD - EMS"},
                {name = "Taxi"},
                {name = "Mecano"},
                {name = "Unicorn"},
                {name = "Bahamas"},
                {name = "Vin"}
            }
        },
        ["métiers publiques"]={
            Description2 = "",
            b = {
                {name = "Abatteur"},
                {name = "Bûcheron"},
                {name = "Couturier"}
            }
        }
    }

}
local polce_v1tuconnais = {
    {x=-55.7898,y=6525.02, z=31.4908},
    {x=-1081.7,y=-247.254,z=37.7632}
}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(polce_v1tuconnais) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, polce_v1tuconnais[k].x, polce_v1tuconnais[k].y, polce_v1tuconnais[k].z)
            if dist <= 2.0 then
                GM.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour accéder a la recherche ~b~d'emplois~w~.")
				if IsControlJustPressed(0,51) then 
					CreateMenu(PoleE)
				end
            end
		end	
    end
end)
local blips = {
    {title="Emplois", colour=25, id=480, x=-55.7898, y=6525.02, z=31.4908},
    {title="Emplois", colour=25, id=480, x = -1083.4, y = -245.893, z = 37.7632},
}
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.9)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)