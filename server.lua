RegisterCommand("me", function(source , args , rawCommand)
    args = table.concat(args, ' ')
    TriggerClientEvent('me:event', -1, source, args, 0)
end)

RegisterCommand("sy", function(source , args , rawCommand)
    args = table.concat(args, ' ')
    TriggerClientEvent('me:event', -1, source, args, 1)
end)

RegisterCommand("do", function(source , args , rawCommand)
    args = table.concat(args, ' ')
    TriggerClientEvent('me:event', -1, source, args, 2)
end)
