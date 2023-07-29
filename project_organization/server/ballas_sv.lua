ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_service:activateService', 'ballas', -1)

TriggerEvent('esx_society:registerSociety', 'ballas', 'ballas', 'society_ballas', 'society_ballas', 'society_ballas', {type = 'private'})