GM=nil
--[[Scripts fait power]]--
Citizen.CreateThread(function()
	while GM==nil do
		TriggerEvent('GM:getSharedObject',function(obj) GM=obj end)
		Citizen.Wait(1000)
	end
end)

function lwelwd(self,_,btn,BMenu,menuData,currentButton,currentSlt,result)
    local A54z=btn.name 
    local playerPed = PlayerPedId()
    if A54z=="Acheter une Carte d'identité" then
        GM.ShowNotification("~b~Vous avez acheter votre carte d'identité.")
        TriggerServerEvent('power:buy', 1, "carteidentite", "Acheter une Carte d'identité", 1)
    end
    if A54z=="Permis d'armes" then
        GM.ShowNotification("~b~Vous avez acheter votre carte de parmis d'armes.")
        TriggerServerEvent('power:buy', 150, "ppa", "Permis d'armes", 1)
    end
end

local achetercarte={
    Base={Header={"",""}},
    Data={currentMenu="Action disponibles"},
    Events={
        onSelected=lwelwd,
    },
    Menu = {
        ["Action disponibles"]={
            b={
                {name="Acheter une Carte d'identité", price = 1},
                {name="Permis d'armes", price = 150, Description = "Allez voir un policier pour le passer."}
            }
        }
    }
}

local zizidanslecaca={
    {x=441.14,y=-981.07,z=30.68},
} 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(zizidanslecaca) do
            local plyCoords=GetEntityCoords(GetPlayerPed(-1),false)
			local dist=Vdist(plyCoords.x,plyCoords.y,plyCoords.z,zizidanslecaca[k].x,zizidanslecaca[k].y,zizidanslecaca[k].z)
            if dist <= 1.2 then
                GM.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour ~b~parler a John")
                if IsControlJustPressed(1,51) then 
                    CreateMenu(achetercarte)
                end
            end
        end
    end
end)