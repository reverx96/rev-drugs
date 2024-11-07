ESX = exports['es_extended']:getSharedObject();
local PlayerData = {}
RSE = RegisterServerEvent
RNE = RegisterNetEvent
AEH = AddEventHandler
TSE = TriggerServerEvent
TSC = TriggerServerCallback
TE = TriggerEvent
RC = RegisterCommand
local qtarget = exports.qtarget
Many = exports['many-base']

local BlacklistedPeds = {
	[GetHashKey("u_f_m_casinocash_01")] = true,
	[GetHashKey("csb_trafficwarden")] = true,
	[GetHashKey("u_m_y_burgerdrug_01")] = true,
	[GetHashKey("s_m_y_xmech_01")] = true,
	[GetHashKey("s_m_m_lathandy_01")] = true,
	[GetHashKey("u_f_y_danceburl_01")] = true,
	[GetHashKey("ig_andreas")] = true,
	[GetHashKey("mp_m_shopkeep_01")] = true,
	[GetHashKey("u_m_m_jewelsec_01")] = true,
	[GetHashKey("a_m_m_business_01")] = true,
	[GetHashKey("s_m_m_autoshop_01")] = true,
    [GetHashKey("s_m_m_doctor_01")] = true,
    [GetHashKey("a_c_cow")] = true,
    [GetHashKey("a_c_boar")] = true,
    [GetHashKey("a_c_cat_01")] = true,
    [GetHashKey("a_c_chickenhawk")] = true,
    [GetHashKey("a_c_chimp")] = true,
    [GetHashKey("a_c_chop")] = true,
    [GetHashKey("a_c_crow")] = true,
    [GetHashKey("a_c_deer")] = true,
    [GetHashKey("a_c_husky")] = true,
    [GetHashKey("a_c_mtlion")] = true,
    [GetHashKey("a_c_pig")] = true,
    [GetHashKey("a_c_pigeon")] = true,
    [GetHashKey("a_c_poodle")] = true,
    [GetHashKey("a_c_pug")] = true,
    [GetHashKey("a_c_rabbit_01")] = true,
    [GetHashKey("a_c_rat")] = true,
    [GetHashKey("a_c_retriever")] = true,
    [GetHashKey("a_c_rhesus")] = true,
    [GetHashKey("a_c_rottweiler")] = true,
    [GetHashKey("a_c_seagull")] = true,
    [GetHashKey("a_c_shepherd")] = true,
    [GetHashKey("a_f_y_business_02")] = true,
    [GetHashKey("a_c_westy")] = true,

	[GetHashKey("ig_car3guy2")] = true,
    [GetHashKey("ig_bankman")] = true,
    [GetHashKey("cs_drfriedlander")] = true,
    [GetHashKey("u_m_y_mani")] = true,
    [GetHashKey("ig_g")] = true,
    [GetHashKey("a_f_y_business_03")] = true,
    [GetHashKey("s_m_y_chef_01")] = true,
    [GetHashKey("a_f_y_business_01")] = true,
    [GetHashKey("s_m_y_construct_01")] = true,
    [GetHashKey("s_m_y_cop_01")] = true,
    [GetHashKey("s_m_y_pilot_01")] = true,
    [GetHashKey("s_m_y_factory_01")] = true,
    [GetHashKey("a_m_m_skidrow_01")] = true,
    [GetHashKey("s_m_y_dockwork_01")] = true,
    [GetHashKey("csb_money")] = true,
    [GetHashKey("s_m_y_barman_01")] = true,
    [GetHashKey("csb_chef2")] = true,
    [GetHashKey("s_m_y_fireman_01")] = true,
    [GetHashKey("s_m_y_dealer_01")] = true,
	[GetHashKey("ig_mp_agent14")] = true,
	[GetHashKey("s_m_y_hwaycop_01")] = true,
	
}


Citizen.CreateThread(function()
    while ESX.GetPlayerData == nil do
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
	
	Wait(5000)
end)

function areaCheck(x,y,z,r)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, x, y, z, true)
    local radius = r

    return distance <= radius
end

RC('test3',function()
	ESX.TriggerServerCallback('rev:checkadmin', function(source, cb)
		if source == 'admin' or source == 'superadmin' or source == 'best' or source == 'mod' or source == 'moderator' then
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local x=playerCoords.x
		local y=playerCoords.y
		local z=playerCoords.z
		local radius = 200.0
		--print('TEST3 Pozycja Z!',GetGroundZFor_3dCoord(x, y, z + 10.0))
		end
	end)
end)


RNE('rev-drugs:zbiorkaKoka')
AEH('rev-drugs:zbiorkaKoka', function(data)
	ESX.TriggerServerCallback('rev_drugs:PlayerCount', function(status)
		if status then

			for _, narkotyk in ipairs(Config.Narkotyki) do
				if narkotyk.name == 'Kokaina 1' then

	coordsy = narkotyk.coords
	x = tonumber(coordsy.x)
	y = tonumber(coordsy.y)
	z = tonumber(coordsy.z)
	--print(x,y,z, areaCheck(x,y,z, 50.0))
	if areaCheck(x,y,z, 50.0) then
	
	itemek = tostring(data.ItemNameAdd)
	ESX.TriggerServerCallback('rev-drugs:ItemCount',function(itemName)
		if itemName < data.ItemMax then
	id = GetPlayerServerId(PlayerId())
	RequestAnimDict(data.animDict)
	TaskPlayAnim(PlayerPedId(), data.animDict, data.anim, 3.5, 1.0, -1, 11, 0.0, 0, 0, 0)

	TE("lastrp_hud:client:progress", {
		duration = data.Duration,
		label = data.BarText,
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		}, function(status)
		if not status then
				TSE('rev-drugs:addItem', data.ItemNameAdd, 1 ,exports['rev_script']:TokenSys() )
				RemoveAnimDict(data.animDict)
			end
		end)
	else
		ESX.ShowNotification('Masz maksymalną możliwą ilość przy sobie!')
	end
	end, itemek)
else
	ESX.ShowNotification('To tylko podobny krzak!')
end

end
end
else
	ESX.ShowNotification('Za mało ludzi na mieście!')
end
end, Config.NormalPlayerCount)
end)

RNE('rev-drugs:zbiorkaMetaWeed')
AEH('rev-drugs:zbiorkaMetaWeed', function(data)	
	ESX.TriggerServerCallback('rev_drugs:PlayerCount', function(status)
		if status then


	itemek = tostring(data.ItemNameAdd)
	ESX.TriggerServerCallback('rev-drugs:ItemCount',function(itemName)
		if itemName < data.ItemMax then

	id = GetPlayerServerId(PlayerId())
	RequestAnimDict(data.animDict)
	TaskPlayAnim(PlayerPedId(), data.animDict, data.anim, 3.5, 1.0, -1, 11, 0.0, 0, 0, 0)

	TE("lastrp_hud:client:progress", {
		duration = data.Duration,
		label = data.BarText,
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		}, function(status)
		if not status then
			TSE('rev-drugs:addItem', data.ItemNameAdd, 1 ,exports['rev_script']:TokenSys())
			RemoveAnimDict(data.animDict)
		end
		end)

		
	else
		ESX.ShowNotification('Masz maksymalną możliwą ilość przy sobie!')
	end
	end, itemek)
else
	ESX.ShowNotification('Za mało ludzi na mieście!')
end
end, Config.NormalPlayerCount)
end)

RNE('rev-drugs:zbiorka1')
AEH('rev-drugs:zbiorka1', function(data)
	--print('TEST')
	tid = data.targetID
	ESX.TriggerServerCallback('rev-drugs:CheckTimeWeed',function(time, tid)
		if time then
	itemek = tostring(data.ItemNameAdd)
	ESX.TriggerServerCallback('rev-drugs:ItemCount',function(itemName)
		if itemName < data.ItemMax then
	id = GetPlayerServerId(PlayerId())
	RequestAnimDict(data.animDict)
	TaskPlayAnim(PlayerPedId(), data.animDict, data.anim, 3.5, 1.0, -1, 11, 0.0, 0, 0, 0)

	TE("lastrp_hud:client:progress", {
		duration = data.Duration,
		label = data.BarText,
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		}, function(status)
		if not status then
				TSE('rev-drugs:addItem', data.ItemNameAdd, 1 ,exports['rev_script']:TokenSys())
				RemoveAnimDict(data.animDict)
			end
		end)
	else
		ESX.ShowNotification('Masz maksymalną możliwą ilość przy sobie!')
	end
	end, itemek)
end

end)
end)

RNE('rev-drugs:1za1')
AEH('rev-drugs:1za1', function(data)
itemek = tostring(data.ItemNameOff)
	ESX.TriggerServerCallback('rev-drugs:hasItem1', function(itemName)
	if itemName then
	id = GetPlayerServerId(PlayerId())
	ClearPedTasksImmediately(PlayerPedId())
	RequestAnimDict(data.animDict)
	TaskPlayAnim(PlayerPedId(), data.animDict, data.anim, 3.5, 1.0, -1, 11, 0.0, 0, 0, 0)
		--print(data.animDict,data.anim)
	TE("lastrp_hud:client:progress", {
		duration = data.Duration,
		label = data.BarText,
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		
		}, function(status)
		if not status then
				TSE('rev-drugs:addItem', data.ItemNameAdd, 1 ,exports['rev_script']:TokenSys())
				RemoveAnimDict(data.animDict)
			end
		end)
	else
		ESX.ShowNotification('Nie masz wystarczająco składników do przeróbki!')
	end
	end, itemek)
end)

RNE('rev-drugs:2za1')
AEH('rev-drugs:2za1', function(data)
itemek = tostring(data.ItemNameOff)
	ESX.TriggerServerCallback('rev-drugs:hasItem2', function(itemName)
	if itemName then
	id = GetPlayerServerId(PlayerId())
	RequestAnimDict(data.animDict)
	TaskPlayAnim(PlayerPedId(), data.animDict, data.anim, 3.5, 1.0, -1, 11, 0.0, 0, 0, 0)

	TE("lastrp_hud:client:progress", {
		duration = data.Duration,
		label = data.BarText,
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		}, function(status)
		if not status then

				TSE('rev-drugs:addItem', data.ItemNameAdd, 1 ,exports['rev_script']:TokenSys())
				RemoveAnimDict(data.animDict)
			end 
		end)
	else
		ESX.ShowNotification('Nie masz wystarczająco składników do przeróbki!')
	end
	end, itemek)
end)
-- Ograniczenia na ilośc sztuk w EQ

Citizen.CreateThread(function()
Citizen.Wait(2000)
for i, narko in ipairs(Config.Narkotyki) do
	--print(i)
	if narko.name ~= 'Marihuana 2' and narko.name ~= 'Marihuana 3' and narko.name ~= 'Marihuana 4' then
	target = tostring(narko.propaction)
	exports.qtarget:AddTargetModel({target}, {
			options = {
				{
				event = narko.event,
				icon =  narko.icon,
				label = narko.label,
				num = 1,
				animDict = narko.animDict,
				anim = narko.anim,
				BarText = narko.BarText,
				Duration = narko.Duration,
				ItemNameAdd = narko.ItemNameAdd,
				ItemMax = narko.ItemMax,
				coords = narko.coords,
				canInteract = function()
					if areaCheck(narko.coords.x, narko.coords.y, narko.coords.z, 100) then
						   return true
					end
					return false
				end,
			},
		},
		distance = 3.0,
})
end
end
--print('ZAŁADOWANO NARKOTYKI')
Citizen.Wait(2000)
for _, narko in ipairs(Config.Przerobki) do
	
	target = tostring(narko.propaction)
	exports.qtarget:AddTargetModel({target}, {
			options = {
				{
					event = narko.event,
					icon =  narko.icon,
					label = narko.label,
					item = narko.ItemNameOff,
					num = 1,
					animDict = narko.animDict,
					anim = narko.anim,
					BarText = narko.BarText,
					Duration = narko.Duration,
					ItemNameAdd = narko.ItemNameAdd,
					ItemNameOff = narko.ItemNameOff,
					canInteract = function()
						if areaCheck(narko.coords.x, narko.coords.y, narko.coords.z, 100) then
							   return true
						end
						return false
					end,
				},
			},
			distance = 3.0,
	})
	end
	--print('ZAŁADOWANO PRZERÓBKI')
	end)


	--[[Citizen.CreateThread(function()
		Citizen.Wait(10000)	
		while true do
		Citizen.Wait(10000)
		if ESX.PlayerData.job ~= nil then
		ESX.TriggerServerCallback('rev-drugs:maxItem',function()
		end, 'weed1')
		ESX.TriggerServerCallback('rev-drugs:maxItem',function()
		end, 'koka1')
		ESX.TriggerServerCallback('rev-drugs:maxItem',function()
		end, 'meta1')
		end
	end
	end)]]


	local lastPeds = {}
	local targetPed = nil

	exports.qtarget:Ped({
		options = {
			{
				event = "rev_drugs:Sell",
				icon = "fas fa-usd",
				label = "Sprzedaj marihuane",
				item = 'weed2',
				text = 'weed2',
				canInteract = function(entity)
					if not IsPedDeadOrDying(entity, true) and IsPedAPlayer(ped) or not IsPedAPlayer(entity) and not IsPedDeadOrDying(entity, true) and not BlacklistedPeds[GetEntityModel(entity)] == true then
						   return true
					end
					return false
				end,
			},
			{
				event = "rev_drugs:Sell",
				icon = "fas fa-usd",
				label = "Sprzedaj koke",
				item = 'koka2',
				text = 'koka2',
				canInteract = function(entity)
					if not IsPedDeadOrDying(entity, true) and IsPedAPlayer(ped) or not IsPedAPlayer(entity) and not IsPedDeadOrDying(entity, true) and not BlacklistedPeds[GetEntityModel(entity)] == true then
						   return true
					end
					return false
				end,
			},
			{
				event = "rev_drugs:Sell",
				icon = "fas fa-usd",
				label = "Sprzedaj mete",
				item = 'meta2',
				text = 'meta2',
				canInteract = function(entity)
					if not IsPedDeadOrDying(entity, true)and IsPedAPlayer(ped) or not IsPedAPlayer(entity) and not IsPedDeadOrDying(entity, true) and not BlacklistedPeds[GetEntityModel(entity)] == true then
						   return true
					end
					return false
				end,
			},
		},
		distance = 2.0
	})
	
	
	RNE('rev_drugs:Sell')
	AEH('rev_drugs:Sell', function(data)
		if areaCheck(-121.0,-1569.0,25.0, 2300.0) then
		ESX.TriggerServerCallback('rev_drugs:PoliceCount', function(status)
			if status then
		if lastPeds[data.entity] then
		ESX.ShowNotification('Już sprzedawałeś tej osobie!')
		else
			SellAttempt(data.entity, data.text)
		end
				else
					ESX.ShowNotification('Nie ma policji!')
			end
		end, Config.PoliceCount)
		else
			ESX.ShowNotification('Osoby ze wsi wydają się nie być zainteresowane handlem z Tobą!')
		end
	end)

	function SellAttempt(ped, itemTosell)
		if not IsPedAPlayer(ped) then  -- dodajemy warunek, żeby funkcja działała tylko na NPC
			local selling = false
			local playerPed = PlayerPedId()
			targetPed = ped
			lastPeds[ped] = true
			SetBlockingOfNonTemporaryEvents(ped, true)
	
			Wait(10)
			SetBlockingOfNonTemporaryEvents(ped, true)
			TaskTurnPedToFaceEntity(playerPed, ped, 10 * 10000)
			TaskTurnPedToFaceEntity(ped, playerPed, 10 * 10000)
			Many:playAnim(ped, 'special_ped@impotent_rage@convo_6@convo_6a', 'a_tourist_just_asked_0', -1, true)
			Many:playAnim(playerPed, 'anim@amb@casino@brawl@fights@guard@', 'argument_loop_mp_m_brawler_01', -1, true)
			Wait(5000)
			local random = math.random(1, Config.SellPercent)
			--print(random)
			--ESX.ShowNotification(random)
			if random == 1 then
				selling = true
				random2 = math.random(1, 5)
				if random2 == 1 then
				BlipNarko() 
				end
			elseif random == 3 then
				selling = true
				BlipNarko() 
			
			else
				ClearPedTasksImmediately(playerPed)
				ClearPedTasksImmediately(ped)
				ESX.ShowNotification('Osoba odmówiła zakupu!')
			end
	
			if selling then
			TriggerEvent("lastrp_hud:client:progress", {
				duration = 5000,
				label = "Sprzedawanie narkotyku...",
				useWhileDead = false,
				canCancel = true,
				controlDisables = {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				},
			}, function(status)
				if not status then
					ClearPedTasksImmediately(playerPed)
					ClearPedTasksImmediately(ped)
					Wait(10)
					TaskTurnPedToFaceEntity(playerPed, ped, 10 * 1000)
					TaskTurnPedToFaceEntity(ped, playerPed, 10 * 1000)
					Many:playAnim(ped, 'mp_common', 'givetake1_a', -1, true)
					Many:playAnim(playerPed, 'mp_common', 'givetake1_b', -1, true)
					Wait(2000)
					ClearPedTasksImmediately(playerPed)
					ClearPedTasksImmediately(ped)

					--print('To SERVER',itemTosell)
					TriggerServerEvent('rev_drugs:SellItemServer', itemTosell, exports['rev_script']:TokenSys())

					ClearPedTasks(playerPed)
					ClearPedTasks(ped)
				else
					ClearPedTasksImmediately(playerPed)
					ClearPedTasksImmediately(ped)
					ESX.ShowNotification('Przestałeś sprzedawać!')
					ClearPedTasks(playerPed)
					ClearPedTasks(ped)
				end
			end)
		end
		end
	end

	function BlipNarko() 
		messagetag = "Zgłoszenie o narkotykach!"
		local coords = GetEntityCoords(PlayerPedId())
		local Panic2 = {
			code = "10-71",
			--street = messagetag,
			street = exports['esx_dispatch']:GetStreetAndZone(),
			id = exports['esx_dispatch']:randomId(),
			priority = 2,
			title = "Zgłoszenie o narkotykach!",
			duration = 9000,
			blipname = "10-71 Narkotyki",
			color = 57,
			sprite = 51,
			fadeOut = 180,
			position = {
				x = coords.x,
				y = coords.y,
				z = coords.z
			},
			job = "police"
		}
		TriggerServerEvent("dispatch:svNotify", Panic2)
	end


	RegisterNetEvent('rev-drugs:bletkiUse')
	AddEventHandler( 'rev-drugs:bletkiUse',function()
		print('usable')
		ESX.TriggerServerCallback('rev-drugs:hasItemm', function(itemName1)
		if itemName1 then
			ESX.TriggerServerCallback('rev-drugs:hasItem',function(itemName2)
			if itemName2 then


				TriggerServerEvent('rev-drugs:removeItem','weed2',2)
				TriggerServerEvent('rev-drugs:removeItem','bletki',1)
				TriggerServerEvent('rev-drugs:addItem','blant',1 , exports['rev_script']:TokenSys())

			end
			end, 'bletki')
		else
		ESX.ShowNotification('Nie masz wystarczająco zioła')
		end
		end, 'weed2')
	
	end)



	RegisterNetEvent('rev-drugs:blantUse')
	AddEventHandler( 'rev-drugs:blantUse',function()
		item = "blant"
		prop = 'prop_sh_joint_01'
		size = 20
		type = 'joint'
		time = 120000
		TriggerEvent('many_smoking:client:Smoke',item, size, prop, type, time)
	end)

	RegisterNetEvent('rev-drugs:bongoUse')
	AddEventHandler( 'rev-drugs:bongoUse',function()
		Item = "bongo"
		Prop = 'prop_bong_01'
		Size = 0
		Type = 'bong'
		Time = 0

		TriggerEvent('many_smoking:client:Smoke',Item, Size, Prop, Type, Time)
	end)

	RegisterNetEvent('rev-drugs:kokaUse')
	AddEventHandler( 'rev-drugs:kokaUse',function()
		przycpaj('koka2')
	end)
	RegisterNetEvent('rev-drugs:metaUse')
	AddEventHandler( 'rev-drugs:metaUse',function()
		przycpaj('meta2')
	end)


		function przycpaj(itemgetter)
		ESX.TriggerServerCallback('rev-drugs:hasItem',function(itemName2)
			if itemName2 then

				local playerPed = GetPlayerPed(-1)
				ESX.UI.Menu.CloseAll()
		  
			local elements = {
				{label = ('Wciagnij z maski samochodu'), value = 'maska',},
				{label = ('Wez na dziąsło'), value = 'dziaslo',},
			}
		  
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'kokas', {
				title    = ('Kokaina'),
				align    = 'left',
				elements = elements
			  }, function(data, menu)
				local element = data.current.value
					if element == 'maska' then
						TriggerServerEvent('rev-drugs:removeItem','koka2',1)
						maskakoka()			
					elseif element == 'dziaslo' then
						TriggerServerEvent('rev-drugs:removeItem','koka2',1)
						dziaslo()			
					end
			  end, function(data, menu)
				menu.close()
			  end
			)
			end
			end, tostring(itemgetter))
		end



	function maskakoka()
		checknarcotic()
		takeanothernarkotic = true
		local playerPed = PlayerPedId()

		animDict = 'anim@amb@nightclub@peds@'
		anim = 'missfbi3_party_snort_coke_b_male3'

	RequestAnimDict(animDict)
	TaskPlayAnim(playerPed, 'anim@amb@nightclub@peds@', 'missfbi3_party_snort_coke_b_male3', 8.0, -8, -1, 49, 0, 0, 0, 0)

		TriggerEvent("lastrp_hud:client:progress", {
			duration = 17000,
			label = "Wciąganie...",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
		}, function(status)
			if not status then
				RemoveAnimDict(animDict)
			end
		end)
	
			
			 StartScreenEffect('FocusIn', 120, true) 
			StartScreenEffect('HeistLocate', 120, true)   
			 SetPedMotionBlur(playerPed, true)		
			Citizen.Wait(30*1000)
			stopnarcotic()	
			koka = true	
			Citizen.Wait(1000*60)
			koka = false		
		end
		
		function dziaslo()
		checknarcotic()
		takeanothernarkotic = true
		local playerPed = PlayerPedId()

		animDict = 'mp_player_inteat@burger'
		anim = 'mp_player_int_eat_burger_fp'


	TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

		TriggerEvent("lastrp_hud:client:progress", {
			duration = 3000,
			label = "Wciąganie...",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
		}, function(status)
			if not status then
				RemoveAnimDict(animDict)
			end
		end)
	
			
			 StartScreenEffect('FocusIn', 120, true) 
			StartScreenEffect('HeistLocate', 120, true)   
			 SetPedMotionBlur(playerPed, true)		
			Citizen.Wait(30*1000)
			stopnarcotic()	
			koka = true	
			Citizen.Wait(1000*60)
			koka = false	

		end


		function checknarcotic()
			local playerPed = PlayerPedId()
			if takeanothernarkotic == true then
				TriggerEvent('meta:reset')
				takeanothernarkotic = false
				StopScreenEffect('MinigameEndMichael')
				StopScreenEffect('FocusIn')
				StopScreenEffect('RaceTurbo')
				StopScreenEffect('HeistLocate')
				StopScreenEffect('PeyoteIn')	
			   ClearTimecycleModifier()	
			  SetPedMotionBlur(playerPed, false)
				onkoka = false
			SetPedMoveRateOverride(playerPed, 1.0)	
			end
			end
			
			function stopnarcotic()
			local playerPed = PlayerPedId()
				takeanothernarkotic = false
				StopScreenEffect('MinigameEndMichael')
				StopScreenEffect('FocusIn')
				StopScreenEffect('RaceTurbo')
				StopScreenEffect('HeistLocate')
				StopScreenEffect('PeyoteIn')	
				StopScreenEffect('Rampage')
			   ClearTimecycleModifier()	
			  SetPedMotionBlur(playerPed, false)
				onkoka = false  
			SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)	
			end
			
