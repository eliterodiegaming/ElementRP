local mph = 2.2369
local kmh = 3.6
local cruise = false

function showText(text, x, y, r, g, b)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.9,1.9)
    SetTextOutline()
    SetTextColour(r, g, b, 255)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function notify(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        local speed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*mph)
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            -- Cruise Control
            if IsControlJustPressed(1, 246) then
                if cruise == false then
                    cruise = true
                    local currentSpeed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
                    SetVehicleMinSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), currentSpeed)
                    notify("Cruise Control Speed Set:" .. currentSpeed*mph .. "mph")
                elseif cruise == true then
                    cruise = false
                    SetVehicleMinSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                    notify("Cruise Control Disabled")
                end
            end

        end
    end
end)