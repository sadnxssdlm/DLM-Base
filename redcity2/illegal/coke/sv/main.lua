GM = nil

local CopsConnected = 1
local LSPD1 = 0
local FBI1 = 0

TriggerEvent('GM:getSharedObject', function(obj) GM = obj end)

local function CountCops()
	local xPlayers = GM.GetPlayers()
	CopsConnected = 1
	LSPD1 = 0
	FBI1 = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = GM.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			LSPD1 = LSPD1 + 1
		end
		if xPlayer.job.name == 'lssd' then
			FBI1 = FBI1 + 1
		end
		CopsConnected = (LSPD1 + FBI1)
	end
	SetTimeout(5000, CountCops)
end

CountCops()

function isIntrested()
	local percent = math.random(1, 2)
	if percent == 1  then 
	  return true
	else 
	  return false
	end
end

RegisterServerEvent("power:policeAppel")
AddEventHandler("power:policeAppel", function()
	local xPlayers	= GM.GetPlayers()

	local xPlayer = GM.GetPlayerFromId(xPlayers[i])
	if xPlayer.job.name == 'police' then
	  TriggerClientEvent("AppelpoliceTropBien", coords)
    end
end)

RegisterServerEvent('power:vente')
AddEventHandler('power:vente', function()
	local xPlayer = GM.GetPlayerFromId(source)
	local QTE = 1
	local TYPE = "l78Z7enfGGarnS4x0ojcCwKDXf+SW/+1ERTAio7M8MY="
	local LABEL = "l78Z7enfGGarnS4x0ojcCwKDXf+SW/+1ERTAio7M8MY="
	local PrixFinal = 0
	local methQTE = xPlayer.getInventoryItem('meth_pooch').count
	local cokeQTE = xPlayer.getInventoryItem('coke_pooch').count
	local weedQTE = xPlayer.getInventoryItem('weed_pooch').count
	local opiumQTE = xPlayer.getInventoryItem('opium_pooch').count
	
	if CopsConnected >= gd.CopsNeeds then
		if isIntrested() then
			if methQTE >= 5 or cokeQTE >= 5 or weedQTE >= 5 or opiumQTE >= 5 then
				QTE = math.random (1,5)
			elseif methQTE >= 10 or cokeQTE >= 10 or weedQTE >= 10 or opiumQTE >= 10 then
				QTE = math.random (1,10)
			elseif methQTE >= 25 or cokeQTE >= 25 or weedQTE >= 25 or opiumQTE >= 25 then
				QTE = math.random (1,25)
			end	
			if methQTE >= QTE then 
				TYPE = "meth_pooch" 
				LABEL = gd.Text['meth']
				PrixFinal = (gd.MethPrice * QTE)
			elseif cokeQTE >= QTE then 
				TYPE = "coke_pooch" 
				LABEL = gd.Text['coke']
				PrixFinal = (gd.CokePrice * QTE)
			elseif weedQTE >= QTE then 
				TYPE = "weed_pooch" 
				LABEL = gd.Text['weed']
				PrixFinal = (gd.WeedPrice * QTE)
			elseif opiumQTE >= QTE then 
				TYPE = "opium_pooch" 
				LABEL = gd.Text['opium']
				PrixFinal = (gd.OpiumPrice * QTE)
			end	
			TriggerClientEvent("power:animation", source)
			xPlayer.removeInventoryItem(TYPE, QTE)
			xPlayer.addAccountMoney('black_money', PrixFinal)
			TriggerClientEvent('GM:showNotification', source, gd.Text['done'] .. QTE .. LABEL .. gd.Text['for'] .. PrixFinal)
		else
			TriggerClientEvent('GM:showNotification', source, "~r~Euhhhhh... ,Désoler je fume pas.")
			TriggerClientEvent("power:policeAppel")
		end
    else
	    TriggerClientEvent('GM:showNotification', source, gd.Text['cops1'] .. CopsConnected .. "/" .. gd.CopsNeeds .. gd.Text['cops2'])
    end
end)

RegisterNetEvent('power:dist')
AddEventHandler('power:dist', function()
	TriggerClientEvent('GM:showNotification', source, gd.Text['dist'])
end)

RegisterServerEvent('power:GetJob')
AddEventHandler('power:GetJob', function()
    local xPlayer  = GM.GetPlayerFromId(source)
    TriggerClientEvent('power:RefreshJob', source, xPlayer.job.name)
end)

RegisterServerEvent('power:GetUserInventory')
AddEventHandler('power:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = GM.GetPlayerFromId(_source)
    TriggerClientEvent('power:ReturnInventory', 
    	_source, 
    	xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.job.name
    )
end)

RegisterServerEvent("power:venfres")
AddEventHandler("power:venfres", function(bonus)
    local _source = source
    local xPlayer = GM.GetPlayerFromId(_source)
    if not xPlayer then return; end
    if bonus > 1500 then
		TriggerClientEvent('GM:showNotification', source, '~g~Véhicule en parfait état à plus dans le bus.')
    end
	local montantentre = math.random(1000, 1000)
    xPlayer.addAccountMoney('black_money', montantentre)
    TriggerClientEvent('GM:DrawMissionText', source, 'Le dealer vous a donné ~r~'..montantentre..' $', 5000)
end)