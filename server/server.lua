local scenes = {}
local scenes2 = {}
local scenes3 = {}
---------------------------------------------------------------------------------------
RegisterServerEvent("3dme:add")
AddEventHandler("3dme:add", function(text)
    local _source = source
    local _text = tostring(text)
    local scene = {text = _text, serverid = _source}
    scenes[#scenes+1] = scene
    TriggerClientEvent("3dme:sendscenes", -1, scenes)
end)

RegisterServerEvent("3dme:getscenes")
AddEventHandler("3dme:getscenes", function(text)
    local _source = source
    TriggerClientEvent("3dme:sendscenes", _source, scenes)
end)

RegisterServerEvent("3dme:delete")
AddEventHandler("3dme:delete", function()
    local _source = source
    if scenes[1] ~= nil then
        for i,v in pairs(scenes) do
            if scenes[i].serverid == _source then
                table.remove(scenes, i)
                break
            end
        end
    end
    TriggerClientEvent("3dme:sendscenes", -1, scenes)
end)

-----------------------------------------------------------------------------------

RegisterServerEvent("3dme:add2")
AddEventHandler("3dme:add2", function(text)
    local _source = source
    local _text = tostring(text)
    local scene = {text = _text, serverid = _source}
    scenes2[#scenes2+1] = scene
    TriggerClientEvent("3dme:sendscenes2", -1, scenes2)
end)

RegisterServerEvent("3dme:getscenes2")
AddEventHandler("3dme:getscenes2", function(text)
    local _source = source
    TriggerClientEvent("3dme:sendscenes2", _source, scenes2)
end)

RegisterServerEvent("3dme:delete2")
AddEventHandler("3dme:delete2", function()
    local _source = source
    if scenes2[1] ~= nil then
        for i,v in pairs(scenes2) do
            if scenes2[i].serverid == _source then
                table.remove(scenes2, i)
                break
            end
        end
    end
    TriggerClientEvent("3dme:sendscenes2", -1, scenes2)
end)

-------------------------------------------------------------------------------------

RegisterServerEvent("3dme:add3")
AddEventHandler("3dme:add3", function(text)
    local _source = source
    local _text = tostring(text)
    local scene = {text = _text, serverid = _source}
    scenes3[#scenes3+1] = scene
    TriggerClientEvent("3dme:sendscenes3", -1, scenes3)
end)

RegisterServerEvent("3dme:getscenes3")
AddEventHandler("3dme:getscenes3", function(text)
    local _source = source
    TriggerClientEvent("3dme:sendscenes3", _source, scenes3)
end)

RegisterServerEvent("3dme:delete3")
AddEventHandler("3dme:delete3", function()
    local _source = source
    if scenes3[1] ~= nil then
        for i,v in pairs(scenes3) do
            if scenes3[i].serverid == _source then
                table.remove(scenes3, i)
                break
            end
        end
    end
    TriggerClientEvent("3dme:sendscenes3", -1, scenes3)
end)