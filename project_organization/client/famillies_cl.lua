ESX                           = nil
local PlayerData              = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

exports.qtarget:AddBoxZone('szafka', vector3(-158.90091, -1608.2863, 32.6494), 0.4, 1.4, {
  name= 'szafka',
  heading=340,
  debugPoly=false,
  minZ=30,
  maxZ=32,
  }, {
      options = {
          {
              icon = "fas fa-sign-in-alt",
              label = "Szafka",
              job = "famillies",
              action = function()  OpenStashf() end
              
          },
      },
      distance = 1.5
})

exports['qtarget']:AddBoxZone("BossMenu", vector3(-164.45092, -1616.8080, 33.349), 1, 2, {
  name="BossMenu",
  heading=160,
  debugPoly=false,
  minZ=32.5,
  maxZ=33
}, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Menu szefa",
      action = function()  OpenBossMenuf() end
      },          
  },
      job = {"famillies"},
      distance = 3
})

exports['qtarget']:AddBoxZone("Wardrobe", vector3(-161.2649, -1614.1837, 32.2765), 1.2, 0.5, {
  name="Wardrobe",
  heading=250,
  debugPoly=false,
  minZ=31.5,
  maxZ=33.3
}, {
  options = {
      {
      icon = "fas fa-sign-in-alt",
      label = "Szafka",
      action = function()  OpenWardrobef() end
      },          
  },
      job = {"famillies"},
      distance = 3
})

function OpenBossMenuf()
	TriggerEvent('esx_society:openBossMenu', 'famillies', function(data, menu)
	end)
end

function OpenStashf()
  exports.ox_inventory:openInventory('stash', 'society_famillies')
end

function OpenWardrobef()
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