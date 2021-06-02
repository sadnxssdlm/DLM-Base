GM = nil

TriggerEvent('GM:getSharedObject', function(obj) GM = obj end)

RegisterServerEvent('power_JB:setJobAvocat')
AddEventHandler('power_JB:setJobAvocat', function(job)

	local _source = source

	local xPlayer = GM.GetPlayerFromId(_source)

	xPlayer.setJob("avocat", 0)	

end)

RegisterServerEvent('power_JB:setJobMineur')
AddEventHandler('power_JB:setJobMineur', function(job)

	local _source = source

	local xPlayer = GM.GetPlayerFromId(_source)

	xPlayer.setJob("miner", 0)	

end)

RegisterServerEvent('power_JB:setJobLivreurviande')
AddEventHandler('power_JB:setJobLivreurviande', function(job)

	local _source = source

	local xPlayer = GM.GetPlayerFromId(_source)

	xPlayer.setJob("livreurviande", 0)	

end)

RegisterServerEvent('power_JB:setJobBûcheron')
AddEventHandler('power_JB:setJobBûcheron', function(job)

	local _source = source

	local xPlayer = GM.GetPlayerFromId(_source)

	xPlayer.setJob("lumberjack", 0)	

end)

RegisterServerEvent('power_JB:setJobAbatteur')
AddEventHandler('power_JB:setJobAbatteur', function(job)

	local _source = source

	local xPlayer = GM.GetPlayerFromId(_source)

	xPlayer.setJob("slaughterer", 0)	

end)

RegisterServerEvent('power_JB:setJobCouturier')
AddEventHandler('power_JB:setJobCouturier', function(job)

	local _source = source

	local xPlayer = GM.GetPlayerFromId(_source)

	xPlayer.setJob("tailor", 0)	

end)

RegisterServerEvent('power_JB:setJobChômeur')
AddEventHandler('power_JB:setJobChômeur', function(job)

	local _source = source

	local xPlayer = GM.GetPlayerFromId(_source)

	xPlayer.setJob("unemployed", 0)	

end)

RegisterServerEvent('power_JB:setJobVin')
AddEventHandler('power_JB:setJobVin', function(job)

	local _source = source

	local xPlayer = GM.GetPlayerFromId(_source)

	xPlayer.setJob("vigne", 0)	

end)


local Jobs     = {}
local LastTime = nil

function RunAt(h, m, cb)

	table.insert(Jobs, {
		h  = h,
		m  = m,
		cb = cb
	})

end

function GetTime()

	local timestamp = os.time()
	local d         = os.date('*t', timestamp).wday
	local h         = tonumber(os.date('%H', timestamp))
	local m         = tonumber(os.date('%M', timestamp))

	return {d = d, h = h, m = m}

end

function OnTime(d, h, m)

	for i=1, #Jobs, 1 do
		if Jobs[i].h == h and Jobs[i].m == m then
			Jobs[i].cb(d, h, m)
		end
	end

end

function Tick()

	local time = GetTime()

	if time.h ~= LastTime.h or time.m ~= LastTime.m then
		OnTime(time.d, time.h, time.m)
		LastTime = time
	end

	SetTimeout(60000, Tick)
end

LastTime = GetTime()

Tick()

AddEventHandler('cron:runAt', function(h, m, cb)
	RunAt(h, m, cb)
end)
