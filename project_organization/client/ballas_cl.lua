ESX                           = nil
local PlayerData              = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

exports.qtarget:AddBoxZone('szafka', vector3(2.3484, -1818.8251, 28.1526), 0.5, 2.5, {
  name= 'szafka',
  heading=138,
  debugPoly=false,
  minZ=28.07834,
  maxZ=29.97834,
  }, {
      options = {
          {
              icon = "fas fa-sign-in-alt",
              label = "Szafka",
              job = "ballas",
              action = function()  OpenStashb() end
              
          },
      },
      distance = 1.5
})

exports['qtarget']:AddBoxZone("BossMenu", vector3(0.3544, -1810.5930, 28.8193), 1.5, 1.5, {
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
      action = function()  OpenBossMenub() end
      },          
  },
      job = {"ballas"},
      distance = 3
})

exports['qtarget']:AddBoxZone("Wardrobe", vector3(-2.9525, -1821.3497, 28.6703), 2, 1, {
  name="Wardrobe",
  heading=140,
  debugPoly=fasle,
  minZ=31.5,
  maxZ=33.3
}, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Szafka",
      action = function()  OpenWardrobeb() end
      },          
  },
      job = {"ballas"},
      distance = 3
})

function OpenBossMenub()
	TriggerEvent('esx_society:openBossMenu', 'ballas', function(data, menu)
	end)
end

function OpenStashb()
  exports.ox_inventory:openInventory('stash', 'society_ballas')
end

function OpenWardrobeb()
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