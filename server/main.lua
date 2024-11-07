ESX = exports['es_extended']:getSharedObject();

local PlayerData = {}
RSE = RegisterServerEvent
AEH = AddEventHandler
TCE = TriggerClientEvent
TE = TriggerEvent
RC = RegisterCommand
local qtarget = exports.qtarget
komendaana = true
--TSE('rev-drugs:addItem', GetPlayerServerId(PlayerId()), 'weed1', 1)

ESX.RegisterCommand('anastopnarko', {'admin', 'superadmin', 'best'}, function()
    print('zatrzymano narkotyki')
komendaana = false
end)

RSE('rev-drugs:addItem')
AEH('rev-drugs:addItem', function(name,count, token)
    --print('SERWERSZMATO',name,count,source)
    local _source=source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetPlayerName(_source)

    exports['rev_script']:TriggerAC2(_source, token, 'Narkotyki:AddItem',name,count)

    if name == 'weed1' or name == 'weed2' or name == 'koka1' or name == 'koka2' or name == 'meta1' or name == 'meta2' then 

        if komendaana then
            xPlayer.addInventoryItem(name, count)
        end

    end

    
    if string.find(name, '1') then
        exports['many-logs']:LogiMain(_source, '**'.. playerName .. 'zebrał **'.. count ..' szt.** `'.. name ..'`', name)
    elseif string.find(name, '2') then
        exports['many-logs']:LogiMain(_source, '**'.. playerName .. 'przerobił **'.. count ..' szt.** `'.. name ..'`', name)
    end
end)


RSE('rev-drugs:removeItem')
AEH('rev-drugs:removeItem', function(name,count)
  --  print('SERWERSZMATO',name,count,source)
    local _source=source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem(name, count)
end)

ESX.RegisterServerCallback('rev-drugs:hasItem', function(source, cb, item)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local playerItem = player.getInventoryItem(item)

    if player and playerItem ~= nil then
        if playerItem.count >= 1 then
            cb(true, playerItem.label)
			--player.removeInventoryItem(item, 1)
        else
            cb(false, playerItem.label)
            --TriggerClientEvent('esx:showNotification', source, 'Nie masz potrzebnych przedmiotów!')
        end
    else
        print('[many-info] Nie znaleziono przedmiotów w bazie danych')
    end
end)
ESX.RegisterServerCallback('rev-drugs:hasItemm', function(source, cb, item)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local playerItem = player.getInventoryItem(item)

    if player and playerItem ~= nil then
        if playerItem.count >= 1 then
            cb(true, playerItem.label)
			--player.removeInventoryItem(item, 1)
        else
            cb(false, playerItem.label)
            --TriggerClientEvent('esx:showNotification', source, 'Nie masz potrzebnych przedmiotów!')
        end
    else
        print('[many-info] Nie znaleziono przedmiotów w bazie danych')
    end
end)

ESX.RegisterServerCallback('rev-drugs:hasItem1', function(source, cb, item)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local playerItem = player.getInventoryItem(item)

    if player and playerItem ~= nil then
        if playerItem.count >= 1 then
            cb(true, playerItem.label)
			player.removeInventoryItem(item, 1)
        else
            cb(false, playerItem.label)
            --TriggerClientEvent('esx:showNotification', source, 'Nie masz potrzebnych przedmiotów!')
        end
    else
        print('[many-info] Nie znaleziono przedmiotów w bazie danych')
    end
end)

ESX.RegisterServerCallback('rev-drugs:hasItem2', function(source, cb, item)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local playerItem = player.getInventoryItem(item)

    if player and playerItem ~= nil then
        if playerItem.count >= 2 then
            cb(true, playerItem.label)
			player.removeInventoryItem(item, 2)
        else
            cb(false, playerItem.label)
            --TriggerClientEvent('esx:showNotification', source, 'Nie masz potrzebnych przedmiotów!')
        end
    else
        print('[many-info] Nie znaleziono przedmiotów w bazie danych')
    end
end)

ESX.RegisterServerCallback('rev-drugs:ItemCount', function(source, cb, item)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local playerItem = player.getInventoryItem(item)

    if player and playerItem ~= nil then
            cb(playerItem.count)
    else
        print('[many-info] Nie znaleziono przedmiotów w bazie danych')
    end
end)

ESX.RegisterServerCallback('rev-drugs:maxItem', function(source, cb, item)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    local playerItem = player.getInventoryItem(item)

    if player and playerItem ~= nil then
        if playerItem.count > 60 then
            cb(playerItem.label)
            newCount = playerItem.count - 60
			player.removeInventoryItem(item, newCount)
            TriggerClientEvent('esx:showNotification', source, 'Zgniotłeś liście ponieważ miałeś ich za dużo!')
        else
            cb(playerItem.label)
            --TriggerClientEvent('esx:showNotification', source, 'Nie masz potrzebnych przedmiotów!')
        end
    else
        print('[many-info] Nie znaleziono przedmiotów w bazie danych')
    end
end)

lastplant = 0
servertargetid = 0
ESX.RegisterServerCallback('rev-drugs:CheckTimeWeed', function(source, cb, targetID)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    
    if (os.time() - lastplant) < Config.WeedTime and lastplant ~= 0 and servertargetid == targetID then
        local seconds = Config.WeedTime - (os.time() - lastplant)
        TriggerClientEvent('esx:showNotification', source, 'Poczekaj aż liście odrosną! Pozostało '..seconds)
        cb(false)
    else
        lastplant = os.time()
        servertargetid = targetID
        cb(true)
    end
end)

ESX.RegisterServerCallback('rev_drugs:PoliceCount', function(source, cb, policecount)
    local src = source
    local players = ESX.GetPlayers()
    --local policeCount = 0
    local count = exports['esx_scoreboard']:serverCounter('police')

    --[[for i = 1, #players do
        local player = ESX.GetPlayerFromId(players[i])
        if player['job']['name'] == 'police' then
            policeCount = policeCount + 1
        end
    end]]

    if count >= policecount then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('esx:showNotification', source, 'Brak funkcjonariuszy na służbie!')
    end
end)

ESX.RegisterServerCallback('rev_drugs:PlayerCount', function(source, cb, playerCount)
    local src = source
    local players = ESX.GetPlayers()
   
    if #players >= tonumber(playerCount) then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('rev_drugs:SellItemServer')
AddEventHandler('rev_drugs:SellItemServer',function(itemTosell, token)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local playerName = GetPlayerName(src)

    exports['rev_script']:TriggerAC2(src, token, 'Narkotyki:SellItemServer', itemTosell)

    local logChannel = 'sellweed'
    local player = ESX.GetPlayerFromId(source)
    local playerItem = player.getInventoryItem(itemTosell)
    if itemTosell == 'weed2' then
        configcount = Config.WeedMaxSell
        configprice = Config.WeedCena
        logChannel = 'sellweed'
    elseif itemTosell == 'koka2' then
        configcount = Config.KokaMaxSell
        configprice = Config.KokaCena
        logChannel = 'sellkoka'
    elseif itemTosell == 'meta2' then
        configcount = Config.MetaMaxSell
        configprice = Config.MetaCena
        logChannel = 'sellmeta'
    end

      --  print(playerItem.count, configcount)
    if playerItem.count > configcount then
        random3 = math.random(1,Config.MultiSellPercent)
            if random3 == 1 then
            random = math.random(1, configcount)
            else
                random = 1
            end
    else
        random = 1
    end
        zarobek = random * configprice
		player.removeInventoryItem(itemTosell, random)
        player.addInventoryItem('money',zarobek)

        local playerName = GetPlayerName(source)
        exports['many-logs']:LogiMain(source, '**'.. playerName .. 'sprzedał **'.. random ..' szt.** `'.. itemTosell ..'` i zarobił *$ '.. zarobek ..'**', logChannel)
end)

--[[local CreatedNarkos = {}
Citizen.CreateThread(function()
    NarkoCreate()
end)

function NarkoCreate()
    Citizen.Wait(60)
    for i, narko in ipairs(Config.Narkotyki) do
		local model = tostring(narko.propaction)
		local x = tonumber(narko.coords.x)
		local y = tonumber(narko.coords.y)
		local z = tonumber(narko.coords.z)
        local hedding = tonumber(narko.hedding)
        
			Citizen.Wait(5000)

        local cone = CreateObject(model, x, y, z, true, true, true)

        while cone == 0 do
            Citizen.Wait(1000)
            cone = CreateObject(model, x, y, z, true, true, true)
        end
        table.insert(CreatedNarkos,{
            name = narko.name,
            prop = cone})

        SetEntityCoords(cone, x, y, z) 
        SetEntityHeading(cone, hedding)
        
        -- NIE USUWAĆ PRINTA!!
        strin1 = string.format('\27[38;2;%d;%d;%dm[ReV-Drugs]--[CREATE]\27[0m %s',255, 0, 0, narko.name)
        strin2 = string.format('\27[38;2;%d;%d;%dm[ON COORDS]\27[0m %s',0, 255, 0,'x: '..x..' y: '..y..' z: '..z)
        print(strin1,strin2)-- NIE USUWAĆ PRINTA!!

    end

    for i, narko in ipairs(Config.Przerobki) do
		local model = tostring(narko.propaction)
		local x = tonumber(narko.coords.x)
		local y = tonumber(narko.coords.y)
		local z = tonumber(narko.coords.z)
        local hedding = tonumber(narko.hedding)
	
			Citizen.Wait(5000)

        local cone = CreateObject(model, x, y, z, true, true, true)

        while cone == 0 do
            Citizen.Wait(1000)
            cone = CreateObject(model, x, y, z, true, true, true)
        end
        table.insert(CreatedNarkos,{
            name = narko.name,
            prop = cone})
        
        SetEntityCoords(cone, x, y, z) 
        SetEntityHeading(cone, hedding)

        -- NIE USUWAĆ PRINTA!!
        strin1 = string.format('\27[38;2;%d;%d;%dm[ReV-Drugs]--[CREATE]\27[0m %s',255, 0, 0, narko.name)
        strin2 = string.format('\27[38;2;%d;%d;%dm[ON COORDS]\27[0m %s',0, 255, 0,'x: '..x..' y: '..y..' z: '..z)
        print(strin1,strin2) -- NIE USUWAĆ PRINTA!!
    end
end]]




RegisterCommand('resetnarko', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.group == 'best' or xPlayer.group == 'zarzad' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'moderator' or xPlayer.group == 'mod' then
    for i, nark in ipairs(CreatedNarkos) do
        DeleteEntity(nark.prop)
    end

    Citizen.Wait(5000)
    
    NarkoCreate()
    CreatedNarkos = {}
end
end)

RegisterCommand('deletenarko', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.group == 'best' or xPlayer.group == 'zarzad' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'moderator' or xPlayer.group == 'mod' then
    for i, nark in ipairs(CreatedNarkos) do
        DeleteEntity(nark.prop)
    end
    Citizen.Wait(5000)
    CreatedNarkos = {}
end
end)

RegisterCommand('createnarko',function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.group == 'best' or xPlayer.group == 'zarzad' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'moderator' or xPlayer.group == 'mod' then
    CreatedNarkos = {}
    NarkoCreate()
    end
end)
