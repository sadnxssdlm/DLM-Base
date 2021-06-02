local blips = {
  {title="Commissariat BC", colour= 29, id=60, x = -440.04, y = 6019.74, z = 31.49},
  {title="Commissariat SH", colour= 29, id=60, x = 1856.31, y = 3681.54, z = 34.26},
  {title="Commissariat LS", colour= 29, id=60, x = 422.57, y = -980.43, z = 30.70},
  {title="Gouvernement", coulour= 0, id= 419, x = -542.88, y = -206.97, z = 37.64},
  {title="La Maison Blanche", coulour= 0, id= 419,x=-1366.42,y=56.11,z=54.09},
  {title="Taxi", colour= 5, id= 56, x = 911.73, y = -179.03, z = 74.29},
  {title="Récolte Couturier", colour= 1, id=537, x = 2554.85, y = 4651.27, z = 33.10 },
  {title="Entreprise Couturier", colour= 17, id=537, x = 718.27, y = -977.76, z = 24.12},
  {title="Vente Couturier", colour= 2, id=537, x = -1196.05, y = -768.45, z = 16.51},
  {title="Entreprise Mineur", colour= 69, id=477, x = 879.26, y = -2179.32, z = 30.51},
  {title="Récolte LDT", colour= 1, id=52, x = 2748.76, y = 3472.01, z = 54.77},
  {title="Benny's", colour= 5, id=452, x = -205.52, y = -1309.63, z = 31.29},
  {title="Hôpital", colour= 17, id=61, x = 361.63, y = -585.89, z = 28.67},
  {title="Magasins de masque", colour= 47, id=362, x = -1336.37, y = -1278.77, z = 3.85},
  {title="Magasins de masque", colour= 47, id=362, x = 775.92, y = 4183.94, z = 40.78},
  {title="Daymson Record", colour= 1, id= 136, x=-917.35, y=-450.76, z=39.59},
  --{title="Garage Central", colour= 84, id=357, x=229.24, y=-799.46, z=30.58},
  {title="Garage Central Avions & Hélicopeter", colour= 84, id=357, x=-1140.53,y = -3388.06,z=13.94},
  {title="Garage Central Bateaux", colour= 84, id=357, x=-780.56,y=-1505.61,z=1.59},
  {title="Unicorn", colour= 50, id=121, x = 126.257, y = -1296.782, z = 29.269},
  {title="Prison", colour= 29, id=189, x = 1801.502, y = 2607.895, z = 45.564},
  {title="Vigneron", colour= 7, id=478, x = -1885.84, y = 2046.71, z = 140.85},
  {title="Weazel News", colour= 5, id= 184, x = -615.90, y = -930.70, z = 22.49},
  {title="Salon de tatouages", colour=11, id=75, x=1322.645,y=-1651.976,z=52.275},
  {title="Salon de tatouages", colour=11, id=75, x=-1153.676,y=-1425.68,z=4.954},
  {title="Salon de tatouages", colour=11, id=75, x=322.139,y=180.467,z=103.587},
  {title="Salon de tatouages", colour=11, id=75, x=-3170.071,y=1075.059,z=20.829},
  {title="Salon de tatouages", colour=11, id=75, x=1864.633,y=3747.738,z=33.032},
  {title="Salon de tatouages", colour=11, id=75, x=-293.713,y=6200.04,z=31.487},
  {title="Magasin de vêtements", colour=0, id=73, x=88.291, y=-1391.929, z=29.200},
  {title="Magasin de vêtements", colour=0, id=73, x=-718.958, y=-158.059, z=36.996},
  {title="Magasin de vêtements", colour=0, id=73, x=-151.204, y=-306.837, z=38.724},
  {title="Magasin de vêtements", colour=0, id=73, x=414.646, y=-807.452, z=29.338},
  {title="Magasin de vêtements", colour=0, id=73, x=-815.193, y=-1083.333, z=11.022},
  {title="Magasin de vêtements", colour=0, id=73, x=-1208.098, y=-782.020, z=17.163},
  {title="Magasin de vêtements", colour=0, id=73, x=-1457.954, y=-229.426, z=49.158},
  {title="Magasin de vêtements", colour=0, id=73, x=-2.777, y=6518.491, z=31.533},
  {title="Magasin de vêtements", colour=0, id=73, x=1681.586, y=4820.133, z=42.046},
  {title="Magasin de vêtements", colour=0, id=73, x=130.216, y=-202.940, z=54.505},
  {title="Magasin de vêtements", colour=0, id=73, x=618.701, y=2740.564, z=41.905},
  {title="Magasin de vêtements", colour=0, id=73, x=1199.169, y=2694.895, z=37.866},
  {title="Magasin de vêtements", colour=0, id=73, x=-3164.172, y=1063.927, z=20.674},
  {title="Magasin de vêtements", colour=0, id=73, x=-1091.373, y=2702.356, z=19.422},
  {title="Magasin d'armes", colour=4, id=110, x=1701.292, y=3750.450, z=34.365},
  {title="Magasin d'armes", colour=4, id=110, x=237.428, y=-43.655, z=69.698},
  {title="Magasin d'armes", colour=4, id=110, x=843.604, y=-1017.784, z=27.546},
  {title="Magasin d'armes", colour=4, id=110, x=-321.524, y=6072.479, z=31.299},
  {title="Magasin d'armes", colour=4, id=110, x=-664.218, y=-950.097, z=21.509},
  {title="Magasin d'armes", colour=4, id=110, x=-1320.983, y=-389.260, z=36.48},
  {title="Magasin d'armes", colour=4, id=110, x=-1109.053, y=2686.300, z=18.775},
  {title="Magasin d'armes", colour=4, id=110, x=2568.379, y=309.629, z=108.461},
  {title="Magasin d'armes", colour=4, id=110, x=-3157.450, y=1079.633, z=20.692},
  {title="Magasin d'armes", colour=4, id=110, x=21.18, y=-1107.8, z=29.8},
  {title="Magasin d'armes", colour=4, id=110, x=812.14, y=-2147.47, z=28.5},
  {title="Tas de bois", colour=39, id=237, x = -534.32, y = 5373.79, z = 69.50},
  {title="Découpe du bois", colour=39, id=237, x = -552.21, y = 5326.90, z = 72.59},
  {title="Planches", colour=39, id=237, x = -501.38, y = 5280.53, z = 79.61},
  {title="Point de livraison", colour=39, id=237, x = 1201.35, y = -1327.51, z = 34.22},
  {title="Véhicule de fonction", colour=47, id=477, x = 1191.96, y = -1261.77, z = 34.17},
  {title="~g~Bahamas mamas", colour=8, id=93, x=-1388.59,y=-586.72,z=29.22},
  {title="Fourière", colour=47, id=67, x=495.38, y=-1310.80, z =29.26},
  {title="Cinéma", colour=0, id=135, x = 349.90, y = 172.24, z = 102.11},
}

Citizen.CreateThread(function()
  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.7)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
  RequestIpl("v_carshowroom")
  RequestIpl("Carwash_with_spinners")
end)

local barber = {
  {title="Hamide coiffeur", colour= 1, id=71, x = 132.17, y = -1713.45, z = 29.28},
  {title="Coiffeur", colour= 1, id=71, x = -282.41, y = 6233.14, z = 31.49},
  {title="Coiffeur", colour= 1, id=71, x = 1933.90, y = 3725.11, z = 32.79},
  {title="Coiffeur", colour= 1, id=71, x = -1289.41, y = -1116.55, z = 6.98},
  {title="Maily coiffeuse", colour= 1, id=71, x = -30.49, y = -146.43, z = 57.01},
  {title="Concessionnaire voitures", colour= 3, id=523, x = -46.19, y = -1097.30, z = 26.420},
  {title="Concessionnaire moto", colour= 3, id=226, x=267.14,y=-1159.75,z=29.26},
  {title="Concessionnaire Aérien & Bateaux", colour= 3, id=359, x = -724.70, y = -1443.57, z = 5.00},
  {title= "Pacific Bank", colour= 2, id=431, x = 241.727, y = 220.706, z = 106.286},
  {title="Vente à la sauvette", colour= 17, id=566, x = 512.40, y = -1950.47, z = 24.98}
}

Citizen.CreateThread(function()
  for _, Apzp in pairs(barber) do
    Apzp.awAW = AddBlipForCoord(Apzp.x, Apzp.y, Apzp.z)
    SetBlipSprite(Apzp.awAW, Apzp.id)
    SetBlipDisplay(Apzp.awAW, 4)
    SetBlipScale(Apzp.awAW, 0.8)
    SetBlipColour(Apzp.awAW, Apzp.colour)
    SetBlipAsShortRange(Apzp.awAW, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Apzp.title)
    EndTextCommandSetBlipName(Apzp.awAW)
  end
end)

local miniblips = {
  {colour=3, id=427, x=-723.13,y=-1328.24,z=-0.47},
  {colour=0, id=1, x=241.73,y=224.44,z=106.28}
}

Citizen.CreateThread(function()
  for _, MSDBN in pairs(miniblips) do
    MSDBN.OONbX = AddBlipForCoord(MSDBN.x, MSDBN.y, MSDBN.z)
    SetBlipSprite(MSDBN.OONbX, MSDBN.id)
    SetBlipDisplay(MSDBN.OONbX, 4)
    SetBlipScale(MSDBN.OONbX, 0.6)
    SetBlipColour(MSDBN.OONbX, MSDBN.colour)
    SetBlipAsShortRange(MSDBN.OONbX, true)
  end
end)

local blips = {
  {title="Superette", colour=43, id=59, x = 25.742, y = -1345.741, z = 28.497},
  {title="Superette", colour=43, id=59, x = 2557.458, y = 382.282, z = 107.622},
  {title="Superette", colour=43, id=59, x = -3038.939, y = 585.954, z = 6.97},
  {title="Superette", colour=43, id=59, x = -3241.927, y = 1001.462, z = 11.850},
  {title="Superette", colour=43, id=59, x = 547.431, y = 2671.710, z = 41.176},
  {title="Superette", colour=43, id=59, x = 1961.464, y = 3740.672, z = 31.363},
  {title="Superette", colour=43, id=59, x = 2678.916, y = 3280.671, z = 54.261},
  {title="Superette", colour=43, id=59, x = 1729.216, y = 6414.131, z = 34.057},
  {title="Superette", colour=43, id=59, x = 1135.808, y = -982.281, z = 45.45},
  {title="Superette", colour=43, id=59, x = -1222.93, y = -906.99, z = 11.35},
  {title="Superette", colour=43, id=59, x = -1487.553, y = -379.107, z = 39.163},
  {title="Superette", colour=43, id=59, x = -2968.243, y = 390.910, z = 14.054},
  {title="Superette", colour=43, id=59, x = 1166.024, y = 2708.930, z = 37.167},
  {title="Superette", colour=43, id=59, x = 374.74, y = 327.90, z = 103.56},
  {title="LTD", colour=1, id=59, x = -48.519, y = -1757.514, z = 28.47},
  {title="LTD", colour=1, id=59, x = 1163.373, y = -323.801, z = 68.27},
  {title="LTD", colour=1, id=59, x = -707.67, y = -914.22, z = 18.26},
  {title="LTD", colour=1, id=59, x = -1820.523, y = 792.518, z = 137.20},
  {title="LTD", colour=1, id=59, x = 1698.388, y = 4924.404, z = 41.083},
  {title="BurgerShot", colour=1, id=59, x = -1183.04, y = -883.82, z = 13.75},
  {title="Pompe à essence", colour=1, id=361, x = -724.6192, y = -935.1631, z = 19.21386},
  {title="Pompe à essence", colour=1, id=361, x = 1687.156, y = 4929.392, z = 42.07809},
  {title="Pompe à essence", colour=1, id=361, x = 1179.98, y = -330.53, z = 69.31},
  {title="Pompe à essence", colour=1, id=361, x = -70.38, y = -1760.01, z = 29.53},
  {title="Pompe à essence", colour=1, id=361, x = -1799.32, y = 802.55, z = 138.65},
  {title="Pompe à essence", colour=1, id=361, x = -1229.95, y = -2878.01, z = 13.94},
  {title="Pompe à essence", colour=1, id=361, x = -793.86, y = -1443.77, z = -0.47},
  {title="Vendeur électronique", colour=2, id=606, x = -658.01, y = -854.64, z = 24.50}
}

Citizen.CreateThread(function()
  for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.6)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
  end
end)