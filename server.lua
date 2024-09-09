RegisterCommand("s", function(source , args , rawCommand)
    args = table.concat(args, ' ')
    TriggerClientEvent('me:event', -1, source, args, 0)
end)

RegisterCommand("t", function(source , args , rawCommand)
    args = table.concat(args, ' ')
    TriggerClientEvent('me:event', -1, source, args, 1)
end)

RegisterCommand("d", function(source , args , rawCommand)
    args = table.concat(args, ' ')
    TriggerClientEvent('me:event', -1, source, args, 2)
end)
