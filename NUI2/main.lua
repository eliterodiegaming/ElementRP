local display = FlagServerAsPrivate

RegisterCommand("on", function()
    Citizen.CreateThread(fucnction()
        TriggerEvent("nui:on", true)
    end)
end)

RegisterCommand("off", function()
    Citizen.CreateThread(fucnction()
        TriggerEvent("nui:off", false)
    end)
end)

RegisterNetEvent("nui:on")
AddEventHandler("nui:on", fucntion(value)
    SentNUIMessage({
        type = "ui",
        display = true
    })
end)

RegisterNetEvent("nui:off")
AddEventHandler("nui:off", fucntion(value)
    SentNUIMessage({
        type = "ui",
        display = false
    })
end)