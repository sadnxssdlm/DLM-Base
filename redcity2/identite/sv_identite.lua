GM = nil

TriggerEvent('GM:getSharedObject', function(obj) GM = obj end)

RegisterServerEvent('buyitem')
AddEventHandler('buyitem', function(price, item, label, cb)
	xPlayer.addItem(item, 1)
end)

function getIdentity(source, callback)
	local xPlayer = GM.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, dateofbirth, sex, height FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {
				identifier	= result[1].identifier,
				firstname	= result[1].firstname,
				lastname	= result[1].lastname,
				dateofbirth	= result[1].dateofbirth,
				sex			= result[1].sex,
				height		= result[1].height
			}

			callback(data)
		else
			local data = {
				identifier	= '',
				firstname	= '',
				lastname	= '',
				dateofbirth	= '',
				sex			= '',
				height		= ''
			}

			callback(data)
		end
	end)
end

RegisterServerEvent('power:identity')
AddEventHandler('power:identity', function()
    local xPlayer = GM.GetPlayerFromId(source)
    
	getIdentity(xPlayer.source, function(data)
		if data.firstname ~= '' then
			TriggerClientEvent('GM:showNotification', xPlayer.source, 'Vous avez déjà une carte d\'identité')
		else
			TriggerClientEvent('identity:showRegisterIdentity', xPlayer.source)
		end
	end)
end)

RegisterServerEvent('permit:buy')
AddEventHandler('permit:buy', function(price, limite)
	local _source = source
    local xPlayer = GM.GetPlayerFromId(_source)
    
	if xPlayer.getMoney() >= price then
	    xPlayer.removeMoney(price)
    end
end)