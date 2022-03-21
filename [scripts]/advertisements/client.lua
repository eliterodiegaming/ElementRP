RegisterCommand("ad", function(source, args1, args2, rawCommand)
    local name = table.concat(args1, " ", 1)
    local message = table.concat(args2, " ", 1)

    TriggerEvent("chatMessage", -1, "^7[AD]" .. name .. ":" .. message)
end)