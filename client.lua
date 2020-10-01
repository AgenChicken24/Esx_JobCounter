---------------
----Made By----
--AgenChicken--
---------------
local display = false
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

local isMenuPaused = false

function menuPaused()
	SendNUIMessage({
        action = 'disableHud',
        paused = isMenuPaused,
        cops = cops_online,
		sani = sani_online,
		meca = meca_online,
		taxi = taxi_online
	})
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        if IsPauseMenuActive() then        
			if not isMenuPaused then
				isMenuPaused = true
				menuPaused()
			end
        elseif isMenuPaused then
			isMenuPaused = false
			menuPaused()
		end
	end
end)

function SetDisplay(bool)
    display = bool
    -- SetNuiFocus(bool, bool) Ads a mouse so you can do something with it
    SendNUIMessage({
        type = "ui",
        status = bool,
        cops = cops_online,
		sani = sani_online,
		meca = meca_online,
		taxi = taxi_online
    })
end

function SetDisplay2(cops_online2, sani_online2, meca_online2, taxi_online2)
    SendNUIMessage({
        cops = cops_online2,
		sani = sani_online2,
		meca = meca_online2,
		taxi = taxi_online2
    })
end


jobs = {}

RegisterNetEvent('esx_jobCounter:set')
AddEventHandler('esx_jobCounter:set', function(jobs_online)

	jobs = jobs_online

	if jobs['police'] < 1 then
		cops_online = 'red'
	elseif jobs['police'] < 3 then
		cops_online = 'yellow'
	elseif jobs['police'] >= 3 then
		cops_online = 'green'
	end

	if jobs['ambulance'] < 1 then
		sani_online = 'red'
	elseif jobs['ambulance'] < 3 then
		sani_online = 'yellow'
	elseif jobs['ambulance'] >= 3 then
		sani_online = 'green'
	end

	if jobs['mechanic'] < 1 then
		meca_online = 'red'
	elseif jobs['mechanic'] < 3 then
		meca_online = 'yellow'
	elseif jobs['mechanic'] >= 3 then
		meca_online = 'green'
	end

	if jobs['taxi'] < 1 then
		taxi_online = 'red'
	elseif jobs['taxi'] < 3 then
		taxi_online = 'yellow'
	elseif jobs['taxi'] >= 3 then
		taxi_online = 'green'
	end

	SetDisplay2(cops_online, sani_online, meca_online, taxi_online)

end)

Citizen.CreateThread(function()
	while true do
		Wait(1)
		TriggerServerEvent('esx_jobCounter:get')

		Wait(20000)
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer

	if jobs['police'] < 1 then
		cops_online = 'red'
	elseif jobs['police'] < 3 then
		cops_online = 'yellow'
	elseif jobs['police'] >= 3 then
		cops_online = 'green'
	end

	if jobs['ambulance'] < 1 then
		sani_online = 'red'
	elseif jobs['ambulance'] < 3 then
		sani_online = 'yellow'
	elseif jobs['ambulance'] >= 3 then
		sani_online = 'green'
	end

	if jobs['mechanic'] < 1 then
		meca_online = 'red'
	elseif jobs['mechanic'] < 3 then
		meca_online = 'yellow'
	elseif jobs['mechanic'] >= 3 then
		meca_online = 'green'
	end

	if jobs['taxi'] < 1 then
		taxi_online = 'red'
	elseif jobs['taxi'] < 3 then
		taxi_online = 'yellow'
	elseif jobs['taxi'] >= 3 then
		taxi_online = 'green'
	end
	SetDisplay(not display)
end)
