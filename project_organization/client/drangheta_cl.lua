ESX                           = nil
local PlayerData              = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

exports.qtarget:AddBoxZone('szafka', vector3(1403.9856, 1152.3692, 113.2562), 1, 1.5, {
  name= 'szafka',
  heading=270,
  debugPoly=false,
  minZ=30.07834,
  maxZ=31.27834,
  }, {
      options = {
          {
              icon = "fas fa-sign-in-alt",
              label = "Szafka",
              job = "drangheta",
              action = function()  OpenStashd() end
              
          },
      },
      distance = 1.5
})

exports['qtarget']:AddBoxZone("BossMenu", vector3(1394.0892, 1161.0453, 113.8335), 2.85, 1.2, {
  name="BossMenu",
  heading=270,
  debugPoly=false,
  minZ=32.5,
  maxZ=33
}, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Menu szefa",
      action = function()  OpenBossMenud() end
      },          
  },
      job = {"drangheta"},
      distance = 3
})

exports['qtarget']:AddBoxZone("Wardrobe", vector3(1394.8373, 1157.6528, 113.4336), 1.2, 0.3, {
  name="Wardrobe",
  heading=270,
  debugPoly=false,
  minZ=31.5,
  maxZ=33.3
}, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Szafka",
      action = function()  OpenWardrobed() end
      },          
  },
      job = {"drangheta"},
      distance = 3
})

function OpenBossMenud()
	TriggerEvent('esx_society:openBossMenu', 'drangheta', function(data, menu)
	end)
end

function OpenStashd()
  exports.ox_inventory:openInventory('stash', 'society_drangheta')
end

function OpenWardrobed()
  ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
    local elements = {{unselectable = true, icon = "fas fa-tshirt", title = "Wardrobe"}}

    for i=1, #dressing, 1 do
        elements[#elements + 1] = {
            title = dressing[i],
            value = i
        }
    end
    
    ESX.OpenContext("right", elements, function(menu, element)
        TriggerEvent('skinchanger:getSkin', function(skin)
            ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
                TriggerEvent('skinchanger:loadClothes', skin, clothes)
                TriggerEvent('esx_skin:setLastSkin', skin)

                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
            end, element.value)
        end)
    end)
  end)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)