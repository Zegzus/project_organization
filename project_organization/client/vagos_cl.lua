ESX                           = nil
local PlayerData              = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

exports.qtarget:AddBoxZone('BossMenu', vector3(338.0835, -1980.9039, 23.3060), 1, 2, {
  name= 'BossMenu',
  heading=320,
  debugPoly=false,
  minZ=30.07834,
  maxZ=30.97834,
  }, {
      options = {
          {
              icon = "fas fa-sign-in-alt",
              label = "Menu szefa",
              job = "vagos",
              action = function()  OpenBossMenuv() end
              
          },
      },
      distance = 1.5
})

exports['qtarget']:AddBoxZone("Szafka", vector3(328.4503, -2001.3275, 22.8571), 0.6, 1.5, {
  name="Szafka",
  heading=230,
  debugPoly=false,
  minZ=32,
  maxZ=34.5
}, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Szafka",
      action = function()  OpenStashv() end
      },          
  },
      job = {"vagos"},
      distance = 3
})

exports['qtarget']:AddBoxZone("Wardrobe", vector3(330.2010, -1998.9323, 23.3390), 1.2, 0.3, {
  name="Wardrobe",
  heading=140,
  debugPoly=false,
  minZ=31.5,
  maxZ=33.6
}, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Szafka",
      action = function()  OpenWardrobev() end
      },          
  },
      job = {"vagos"},
      distance = 3
})

function OpenBossMenuv()
	TriggerEvent('esx_society:openBossMenu', 'vagos', function(data, menu)
	end)
end

function OpenStashv()
  exports.ox_inventory:openInventory('stash', 'society_vagos')
end

function OpenWardrobev()
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