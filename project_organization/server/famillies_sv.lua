ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_service:activateService', 'famillies', -1)

TriggerEvent('esx_society:registerSociety', 'famillies', 'famillies', 'society_famillies', 'society_famillies', 'society_famillies', {type = 'private'})