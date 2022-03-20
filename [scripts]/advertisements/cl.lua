RegisterCommand("ad", function(source, name, msg)
    TriggerServerEvent("ad", name, table.concat(msg, " "))
end)