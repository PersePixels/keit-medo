local Scenes = {}
local Scenes2 = {}
local Scenes3 = {}
local tRange = 8.0
local switchRange = false
local timer = 0


RegisterCommand('me', function(source, args)
    local text = ''

    for i = 1,#args do
    text = text .. ' ' .. args[i]
    end

    text = text .. ' '
    TriggerServerEvent("3dme:delete")
    TriggerServerEvent("3dme:add", text)
    Wait(9000)
    TriggerServerEvent("3dme:delete")
    end, false)
--------------------------------------------------------------------------------------------------
RegisterCommand('do', function(source, args)
    local text = ''
    
    for i = 1,#args do
    text = text .. ' ' .. args[i]
     end
    
    text = text .. ' '
    TriggerServerEvent("3dme:delete2")
    TriggerServerEvent("3dme:add2", text)
    Wait(9000)
    TriggerServerEvent("3dme:delete2")
    end, false)
    
-----------------------------------------------------------------------------------------------

RegisterCommand('sy', function(source, args)
    local text = ''
    
    for i = 1,#args do
    text = text .. ' ' .. args[i]
     end
    
    text = text .. ' '
    TriggerServerEvent("3dme:delete3")
    TriggerServerEvent("3dme:add3", text)
    Wait(9000)
    TriggerServerEvent("3dme:delete3")
    end, false)
    
-----------------------------------------------------------------------------------------------


function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    local factor = (string.len(text)) / 225

    if onScreen then
    	SetTextScale(0.35, 0.35)
  		SetTextFontForCurrentCommand(23)
    	SetTextColor(255, 255, 255, 255) -- RGBA Color (default White)
    	SetTextCentre(1)
    	DisplayText(str, _x, 0.468)
        DrawSprite("feeds", "help_text_bg", _x + 0.002, 0.47 + 0.0125, 0.015 + factor, 0.03, 0.1, 35, 35, 35, 190, 0)
    end
end
-----------------------------------------------------------------------------------------------
function DrawText3D2(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    local factor = (string.len(text)) / 225

    if onScreen then
    	SetTextScale(0.35, 0.35)
  		SetTextFontForCurrentCommand(23)
    	SetTextColor(255, 0, 0, 255) -- RGBA Color (default Red)
    	SetTextCentre(1)
    	DisplayText(str, _x, 0.61)
        DrawSprite("feeds", "help_text_bg", _x + 0.002, 0.611 + 0.0125, 0.015 + factor, 0.03, 0.1, 35, 35, 35, 190, 0)
    end
end

----------------------------------------------------------------------------------------------

function DrawText3D3(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    local factor = (string.len(text)) / 225

    if onScreen then
    	SetTextScale(0.35, 0.35)
  		SetTextFontForCurrentCommand(23)
    	SetTextColor(0, 255, 0, 255) -- RGBA Color (default Green)
    	SetTextCentre(1)
    	DisplayText(str, _x, 0.498)
        DrawSprite("feeds", "help_text_bg", _x + 0.002, 0.5 + 0.0125, 0.015 + factor, 0.03, 0.1, 35, 35, 35, 190, 0)
    end
end

----------------------------------------------------------------------------------------------

RegisterNetEvent('3dme:sendscenes')
AddEventHandler('3dme:sendscenes', function(scenes)
    Scenes = scenes
end)

Citizen.CreateThread(function()
    TriggerServerEvent("3dme:getscenes")
    while true do
        Citizen.Wait(1)
        if Scenes[1] ~= nil then
            for i,v in pairs(Scenes) do
                local cc = GetEntityCoords(PlayerPedId())
                local sc =  GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(Scenes[i].serverid)))
                local dist = Vdist(cc.x,cc.y,cc.z,sc.x,sc.y,sc.z, 1)
                if dist < tRange then
                    DrawText3D(sc.x,sc.y,sc.z,Scenes[i].text)
                end
            end
        end
    end
end)

--------------------------------------------------------------------------------------------

RegisterNetEvent('3dme:sendscenes2')
AddEventHandler('3dme:sendscenes2', function(scenes2)
    Scenes2 = scenes2
end)

Citizen.CreateThread(function()
    TriggerServerEvent("3dme:getscenes2")
    while true do
        Citizen.Wait(1)
        if Scenes2[1] ~= nil then
            for i,v in pairs(Scenes2) do
                local cc = GetEntityCoords(PlayerPedId())
                local sc =  GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(Scenes2[i].serverid)))
                local dist = Vdist(cc.x,cc.y,cc.z,sc.x,sc.y,sc.z, 1)
                if dist < tRange then
                    DrawText3D2(sc.x,sc.y,sc.z,Scenes2[i].text)
                end
            end
        end
    end
end)

--------------------------------------------------------------------------------------------------

RegisterNetEvent('3dme:sendscenes3')
AddEventHandler('3dme:sendscenes3', function(scenes3)
    Scenes3 = scenes3
end)

Citizen.CreateThread(function()
    TriggerServerEvent("3dme:getscenes3")
    while true do
        Citizen.Wait(1)
        if Scenes3[1] ~= nil then
            for i,v in pairs(Scenes3) do
                local cc = GetEntityCoords(PlayerPedId())
                local sc =  GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(Scenes3[i].serverid)))
                local dist = Vdist(cc.x,cc.y,cc.z,sc.x,sc.y,sc.z, 1)
                if dist < tRange then
                    DrawText3D3(sc.x,sc.y,sc.z,Scenes3[i].text)
                end
            end
        end
    end
end)

--------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(10)
		if switchRange == true then
			if timer < 2000 then
				timer = timer + 100
			else
				timer = 0
				switchRange = false
			end
		end
    end
end)

RegisterNetEvent("syn_changerange")
AddEventHandler("syn_changerange", function(t)
	switchRange = true
	timer = 0
	if t == 1 then 
		tRange = 3.0
	elseif t == 2 then 
		tRange = 8.0
	elseif t == 3 then 
		tRange = 15.0
	elseif t == 4 then 
		tRange = 32.0
	end
	print("Your Text Range Is: "..tRange)
end)
