Config = {}
Config.NormalPlayerCount = 20
Config.PoliceCount = 2

Config.SellPercent = 5
Config.MultiSellPercent = 3


Config.WeedCena = math.random(95, 115)
Config.MetaCena = math.random(130, 180)
Config.KokaCena = math.random(190, 250)


Config.WeedMaxSell = 4
Config.MetaMaxSell = 2
Config.KokaMaxSell = 2

Config.Narkotyki = {
    {
        name='Marihuana 1',
        --coords = {x = -2003.8714599609, y = 2581.2236328125, z = 1.8352546691895},
         coords = {x = 1942.1175537109, y = 4899.7104492188, z = 46.420780181885},
        hedding = 187.63745117188,
        event = 'rev-drugs:zbiorkaMetaWeed',
        Duration = 1000,
        label = 'Zbierz liście marihuany',
        BarText = 'Zbieranie maryhy',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'weed1',
        ItemMax = 60,
        propaction = 'prop_weed_01',

    },
    {
        name='Marihuana 2',
       -- coords = {x = -2004.1594238281, y = 2578.3486328125, z = 1.8352546691895},
         coords = {x = 1942.1175537109, y = 4899.7104492188, z = 46.420780181885},
        hedding = 187.63745117188,
        event = 'rev-drugs:zbiorkaMetaWeed',
        Duration = 1000,
        label = 'Zbierz liście marihuany',
        BarText = 'Zbieranie maryhy',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'weed1',
        ItemMax = 60,
        propaction = 'prop_weed_01',

    },
    {
        name='Marihuana 3',
       -- coords = {x = -2006.6641845703, y = 2577.580078125, z = 1.8352546691895},
         coords = {x = 1942.1175537109, y = 4899.7104492188, z = 46.420780181885},
        hedding = 187.63745117188,
        event = 'rev-drugs:zbiorkaMetaWeed',
        Duration = 1000,
        label = 'Zbierz liście marihuany',
        BarText = 'Zbieranie maryhy',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'weed1',
        ItemMax = 60,
        propaction = 'prop_weed_01',

    },
    {
        name='Marihuana 4',
       -- coords = {x = -2005.9543457031, y = 2580.6525878906, z = 1.8352546691895},
        coords = {x = 1942.1175537109, y = 4899.7104492188, z = 46.420780181885},
        hedding = 187.63745117188,
        event = 'rev-drugs:zbiorkaMetaWeed',
        Duration = 1000,
        label = 'Zbierz liście marihuany',
        BarText = 'Zbieranie maryhy',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'weed1',
        ItemMax = 60,
        propaction = 'prop_weed_01',

    },
    {
        name='Kokaina 1',
        --coords = {x = 1014.4856567383, y = 4392.9614257813, z = 42.978385375977},
         coords = {x = -363.81704711914, y = 4342.3310546875, z = 59.388771057129},
        hedding = 187.63745117188,
        event = 'rev-drugs:zbiorkaKoka',
        Duration = 1000,
        label = 'Zbierz liście kokainy',
        BarText = 'Zbieranie kokainy',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'koka1',
        ItemMax = 60,
        propaction = 'prop_bush_lrg_01e_cr2',

    },
    {
        name='Meta 1',
        --coords = {x = 2837.85546875, y = 2803.3679199219, z = 56.599198913574},
        coords = {x = -1911.8477783203, y = 1389.318359375, z = 219.54170227051},
        hedding = 101.13496398926,
        event = 'rev-drugs:zbiorkaMetaWeed',
        Duration = 1000,
        label = 'Zbierz Fenyloaceton',
        BarText = 'Zbieranie fenyloacetonu',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'meta1',
        ItemMax = 60,
        propaction = 'sm_prop_smug_crate_m_medical',

    },
}

Config.Przerobki = {
    {
        name='Marihuana 2 Przeróbka',
        --coords = {x = -1604.2242431641, y = 5203.6821289063, z = 3.3150897026062},
        coords = {x = 2938.9929199219, y = 4620.4853515625, z = 49.221138000488},
        hedding = 34.307,
        event = 'rev-drugs:1za1',
        Duration = 1000,
        label = 'Skrusz liście',
        BarText = 'Przerabianie',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'weed2',
        ItemNameOff = 'weed1',
        propaction = 'bkr_prop_weed_table_01a'
    },
    
    {
        name='Kokaina 2',
        --coords = {x = -170.1361541748, y = 6056.7578125, z = 29.559864044189},
        coords = {x = 2461.7180175781, y = 1577.2969970703, z = 33.612598419189},
        hedding = 38.524501800537,
        event = 'rev-drugs:2za1',
        Duration = 1000,
        label = 'Wytwórz kokaine',
        BarText = 'Przerabianie',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'koka2',
        ItemNameOff = 'koka1',
        propaction = 'bkr_prop_coke_table01a'
    },
    
    {
        name='Meta 2',
        --coords = {x = 2664.1726074219, y = 1417.1770019531, z = 23.786603546143},
        coords = {x = 1945.4118652344, y = 4656.34375, z = 41.060691833496},
        hedding = 269.71231079102,
        event = 'rev-drugs:2za1',
        Duration = 1000,
        label = 'Ugotuj metaamfetamine',
        BarText = 'Przerabianie',
        icon = 'fas fa-cannabis',
        animDict = "oddjobs@shop_robbery@rob_till",
        anim = "loop",
        ItemNameAdd = 'meta2',
        ItemNameOff = 'meta1',
        propaction = 'bkr_prop_meth_table01a'
    },
}