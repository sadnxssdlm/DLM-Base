GM = nil
TriggerEvent('GM:getSharedObject', function(obj) GM = obj end)
RegisterServerEvent("power:Admin_BringS")
AddEventHandler("power:Admin_BringS", function(plyId, plyPedCoords)
	TriggerClientEvent('power:Admin_BringC', plyId, plyPedCoords)
end)
RegisterServerEvent("power:Admin_giveBank")
AddEventHandler("power:Admin_giveBank", function(money)
	local _source = source
	local xPlayer = GM.GetPlayerFromId(_source)
	local total = money
	xPlayer.addAccountMoney('bank', total)
	local item = '$ ~s~en banque'
	local message = 'Give de ~g~'
	TriggerClientEvent('GM:showNotification', _source, message .. total .. item)
	TriggerEvent("GM:admingivemoneyalert",xPlayer.name,total)
end)
RegisterServerEvent("power:Admin_giveDirtyMoney")
AddEventHandler("power:Admin_giveDirtyMoney", function(money)
	local _source = source
	local xPlayer = GM.GetPlayerFromId(_source)
	local total = money	
	xPlayer.addAccountMoney('black_money', total)
	local item = '$ ~s~sale.'
	local message = 'Give de ~r~'
	TriggerClientEvent('GM:showNotification', _source, message..total..item)
	TriggerEvent("GM:admingivemoneyalert",xPlayer.name,total)
end)

GM.RegisterServerCallback('power:allkey', function(source, cb)
	local _source = source
	local xPlayer = GM.GetPlayerFromId(_source)

	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE owner = @owner', 
		{
			['@owner'] = xPlayer.identifier

		},
		function(result)
			key = {}
			for i=1, #result, 1 do
				
				keyadd = { plate = result[i].plate }
					
				table.insert(key, keyadd)
			end
			cb(key)
		end
	)
end)

RegisterServerEvent('power:deletekey')
AddEventHandler('power:deletekey', function(plate)
	local _source = source
	local xPlayer = nil
	local toplate = plate
	xPlayer = GM.GetPlayerFromId(_source)

    MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE value = @plate AND owner = @owner',
		{
		['@plate'] 		= toplate,
		['@owner'] = xPlayer.owner
		},
		function(result)

		for i=1, #result, 1 do
			MySQL.Async.execute(
			'DELETE FROM owned_vehicles WHERE owner = @owner',
			{
				['@owner'] = result[i].owner
			}
		)
		end
	end)
end)

RegisterServerEvent('power:donnerkey')
AddEventHandler('power:donnerkey', function(target, plate)
	local _source = source
	local xPlayer = nil
    local toplate = plate
    lxPlayertarget = GM.GetPlayerFromId(target)
    lxPlayer = GM.GetPlayerFromId(_source)

    MySQL.Async.execute(
		'INSERT INTO owned_vehicles (type, plate, owner) VALUES (@type, @plate, @owner)',
		{
			['@type']		  = 'car',
			['@plate']  	  = plate,
			['@owner']   = xPlayertarget.identifier

		},
	function(result)
		TriggerClientEvent('GM:showNotification', xPlayertarget.source, 'Vous avez reçu de nouvelle clé ')
		TriggerClientEvent('GM:showNotification', xPlayer.source, 'Vous avez donné votre clé, vous ne les avez plus !')
	end)
end)

RegisterServerEvent('power:changeowner')
AddEventHandler('power:changeowner', function(target, vehicleProps)
    local _source = source
    local xPlayer = nil
    xPlayertarget = GM.GetPlayerFromId(target)
    xPlayer = GM.GetPlayerFromId(_source)

    MySQL.Async.fetchAll(
		'INSERT INTO owned_vehicles (owner, vehicle) VALUES (@owner, @vehicle)',
		{
		['@owner']   = xPlayer.identifier,
		['@vehicle'] = json.encode(vehicleProps)
		},
		function(result)
			print("insert into terminé")
	end)
end)


GM.RegisterServerCallback('power-PersonalMenu:Bill_getBills', function(source, cb)
	local xPlayer = GM.GetPlayerFromId(source)
	local bills = {}

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #result, 1 do
			table.insert(bills, {
				id         = result[i].id,
				label      = result[i].label,
				amount     = result[i].amount
			})
		end

		cb(bills)
	end)
end)

RegisterServerEvent('power:saveidentite') 
AddEventHandler('power:saveidentite', function(sexe, prenom, nom, datedenaissance, taille)
	_source = source
	mySteamID = GetPlayerIdentifiers(_source) 
	mySteam = mySteamID[1] 
	MySQL.Async.execute('UPDATE users SET firstname = @firstname, lastname = @lastname, dateofbirth = @dateofbirth, sex = @sex, height = @height WHERE identifier = @identifier', {
		['@identifier'] = mySteam, 
		['@firstname'] = prenom, 
		['@lastname'] = nom, 
		['@dateofbirth'] = datedenaissance, 
		['@sex'] = sexe, 
		['@height'] = taille 
	}, 
	function(rowsChanged) 
		if callback then 
			callback(true) 
		end 
	end) 
end)

GM.RegisterServerCallback('power_facture:GetFacture', function(source, cb)
	local xPlayer = GM.GetPlayerFromId(source)
	local bills = {}

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)

--[[
GM.RegisterServerCallback('power_facture:GetFacture', function(source, cb)
	local xPlayer = GM.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local bills = {}
		for i=1, #result, 1 do
			table.insert(bills, {
				id         = result[i].id,
				identifier = result[i].identifier,
				sender     = result[i].sender,
				targetType = result[i].target_type,
				target     = result[i].target,
				label      = result[i].label,
				amount     = result[i].amount
			})
		end

		cb(bills)
	end)
end)
]]

GM.RegisterServerCallback('power_impound:get_vehicle_list2', function(source, cb)
	local _source = source
	local xPlayer = GM.GetPlayerFromId(_source)
	local vehicles = {}
  
	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = xPlayer.getIdentifier()}, function(data)
	  for _,v in pairs(data) do
		local vehicle = json.decode(v.vehicle)
		table.insert(vehicles, {vehicle = vehicle, state = v.state, can_release = VehicleEligableForRelease(v)})
	  end
	  cb(vehicles)
	end)
end)  

function VehicleEligableForRelease(vehicle)
	local current_time = os.time(os.date("!*t"))
  
	if true then
	  -- Determine the time the user could get their vehicle back and check if that time
	  -- has expired
	  if (0 * 60) <= current_time then
		return true
	  else
		return false
	  end
	else
	  return true
	end
end

GM.RegisterServerCallback('power_facture:payfacture', function(source, cb, id)
	local xPlayer = GM.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE id = @id', {
		['@id'] = id
	}, function(result)

		local sender     = result[1].sender
		local targetType = result[1].target_type
		local target     = result[1].target
		local amount     = result[1].amount

		local xTarget = GM.GetPlayerFromIdentifier(sender)

		if targetType == 'player' then

			if xTarget ~= nil then

				if xPlayer.getMoney() >= amount then

					MySQL.Async.execute('DELETE from billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						xPlayer.removeMoney(amount)
						xTarget.addMoney(amount)

						TriggerClientEvent('GM:showNotification', xPlayer.source, '~b~Vous avez payez la facture', GM.Math.GroupDigits(amount))
						TriggerClientEvent('GM:showNotification', xPlayer.source, '~g~Vous avez payez la facture depuis votre poche', GM.Math.GroupDigits(amount))
						cb()
					end)

				elseif xPlayer.getBank() >= amount then

					MySQL.Async.execute('DELETE from billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						xPlayer.removeAccountMoney('bank', amount)
						xTarget.addAccountMoney('bank', amount)

						TriggerClientEvent('GM:showNotification', xPlayer.source, '~b~Vous avez payez la facture', GM.Math.GroupDigits(amount))
						TriggerClientEvent('GM:showNotification', xTarget.source, '~g~Vous avez payez la facture depuis votre bank', GM.Math.GroupDigits(amount))

						cb()
					end)

				else
					TriggerClientEvent('GM:showNotification', xTarget.source, '~r~Le joueurs n\'a pas assez d\'argent pour payez la facture.')
					TriggerClientEvent('GM:showNotification', xPlayer.source, '~r~vous n\'avez pas assez d\'argent pour payer cette facture.')

					cb()
				end

			else
				TriggerClientEvent('GM:showNotification', xPlayer.source, '~r~Le joueur n\'est pas connecté.')
				cb()
			end

		else

			TriggerEvent('power_addonaccount:getSharedAccount', target, function(account)

				if xPlayer.getMoney() >= amount then

					MySQL.Async.execute('DELETE from billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						xPlayer.removeMoney(amount)
						account.addMoney(amount)
						TriggerClientEvent('GM:showNotification', xPlayer.source, '~b~Vous avez payez la facture', GM.Math.GroupDigits(amount))
						if xTarget ~= nil then
							TriggerClientEvent('GM:showNotification', xPlayer.source, '~g~Vous avez payez la facture depuis votre poche', GM.Math.GroupDigits(amount))
						end

						cb()
					end)

				elseif xPlayer.getBank() >= amount then

					MySQL.Async.execute('DELETE from billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						xPlayer.removeAccountMoney('bank', amount)
						account.addMoney(amount)

						TriggerClientEvent('GM:showNotification', xPlayer.source, '~b~Vous avez payez la facture', GM.Math.GroupDigits(amount))
						if xTarget ~= nil then
							TriggerClientEvent('GM:showNotification', xPlayer.source, '~g~Vous avez payez la facture depuis votre bank', GM.Math.GroupDigits(amount))
						end

						cb()
					end)

				else
					TriggerClientEvent('GM:showNotification', xPlayer.source, '~r~vous n\'avez pas assez d\'argent pour payer cette facture.')

					if xTarget ~= nil then
						TriggerClientEvent('GM:showNotification', xTarget.source, '~r~Le joueurs n\'a pas assez d\'argent pour payez la facture.')
					end

					cb()
				end
			end)

		end

	end)
end)