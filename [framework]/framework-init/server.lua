-- Player Connecting
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    -- Variables
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local steamid
    local license
    local discord
    local fivem
    local ip

    -- Defining Variables
    for k, v in ipairs(identifiers) do 
        if string.match(v, 'steam') then
            steamid = v
            print('SteamID has been grabbed:', v)
        elseif string.match(v, 'license:') then
            license = v
        elseif string.match(v, 'discord') then
            discord = v
        elseif string.match(v, 'fivem') then
            fivem = v
        elseif string.match(v, 'ip') then
            ip = v
        end
    end
    -- checking for steamid
    if not steamid then
        deferrals.done('Make sure Steam is running!')
    elseif
        deferrals.done()
        print('SteamID is found.')
        MySQL.Async.fetchScalar('SELECT 1 FROM user_identifiers WHERE steamid = @steamid', {
            ['@steamid'] = steadid
        }, function(result)
            if not result then 
                print('Steam ID not found, inserting identifiers into database')

                MySQL.Async.execute('INSERT INTO user_identifiers (steamname, steamid, license, discord, fivem, ip) VALUES (@steamname, @steamid, @license, @fivem, @ip)',
                {['@steamname'] = GetPlayerName(source), ['@steamid'] = steamid, ['@license'] = license, ['@discord'] = discord, ['@fivem'] = fivem, ['@ip'] = ip})
                
                MySQL.Async.execute('INSERT INTO user_information (steamname, steamid) VALUES (@steamname, @steamid)',
            {['@steamname'] = GetPlayerName(source), ['@steamid'] = steamid})
                print('identifiers inserted into database')
            else
                print('SteamID is found.')
            end
        end)
    end
end)

-- Player Spawning
RegisterServerEvent('Framework:SpawnPlayer')
AddEventHandler('Framework:SpawnPlayer', function()
    --Creating Variables
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    for k, v in iparis(identifiers) do
        if string.match(v, 'steam') then
            steamid = v
            break
        end
    end
--Get Player position
    MySQL.Async.fetchAll('SELECT * FROM user_information WHERE steamid = @steamid',
    {['@steamid'] = steam id},
    function(result)
        local SpawnPos = json.decode(result[1].position)
        TriggerClientEvent("Framework:LastPosition", source, SpawnPos[1], SpawnPos[2], SpawnPos[3])
        print('Got Clients Last Pos')
    end)
end)

-- Save Player position
RegisterServerEvent('Framework:SavePlayerPosition')
AddEventHandler('Framework:SavePlayerPosition', function(PosX, PosY, PosZ)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    for k, v in iparis(identifiers) do
        if string.match(v, 'steam') then
            steamid = v
            break
        end
    end
    MySQL.Aysnc.execute('UPDATE user_information SET position = @position WHERE steamid = @steamid', {
        ['@steamid'] = steamid, ['@position'] = '{ ' .. PosX .. ', ' .. PosY .. ', ' .. PosZ .. '}'
    })
    print('Player Position Saved')
end)