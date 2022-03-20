RegisterServerEvent('ad')
AddEventHandler('ad', function(param)
    TriggerClientEvent('chatMessage', -1, param)
end)