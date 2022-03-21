RegisterServerEvent('ad')
AddEventHandler('ad', function(msg)
    TriggerEvent("chatMessage","Advertisement", .. msg)
end)