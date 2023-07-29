ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_service:activateService', 'vagos', -1)

TriggerEvent('esx_society:registerSociety', 'vagos', 'vagos', 'society_vagos', 'society_vagos', 'society_vagos', {type = 'private'})