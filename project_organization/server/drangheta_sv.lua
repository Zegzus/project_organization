ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_service:activateService', 'drangheta', -1)

TriggerEvent('esx_society:registerSociety', 'drangheta', 'Drangheta', 'society_drangheta', 'society_drangheta', 'society_drangheta', {type = 'private'})