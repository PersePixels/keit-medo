RegisterNetEvent("me:event")
local players = {}
local doPlayers = {}
local syPlayers = {}
local tRange = 8.0
local switchRange = false
local timer = 0


CreateThread(function()
    local lstr = ""
    while true do
        Wait(0)
        local tick = GetGameTimer()
        local str = ""
        local removes = {}
        for a, b in next, players do
            if b.rtime < tick then
                removes[#removes+1] = a
            end
            local p = GetPlayerFromServerId(a)
            if NetworkIsPlayerActive(p) then
                local ped = GetPlayerPed(p)
                if DoesEntityExist(ped) then
                    local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
                    local ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.3)
                    if not ons then
                        x = (x*100)
                        y = (y*70)
                        str = str.."<p style=\"left: "..x.."%;top: "..y.."%;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #ffffff;background-color: #000000AA;border-radius:3px; height: 32px;\"><b>⠀"..b.message.."⠀</b></p>"
                    end
                end
            end
        end
        if #removes > 0 then
            for a, b in ipairs(removes) do
                players[b] = nil
            end
        end
        if str ~= lstr then
            SendNUIMessage({meta = "me", html = str})
            lstr = str
        end
    end
end)

CreateThread(function()
    local lstr = ""
    while true do
        Wait(0)
        local tick = GetGameTimer()
        local str = ""
        local removes = {}
        for a, b in next, syPlayers do
            if b.rtime < tick then
                removes[#removes+1] = a
            end
            local p = GetPlayerFromServerId(a)
            if NetworkIsPlayerActive(p) then
                local ped = GetPlayerPed(p)
                if DoesEntityExist(ped) then
                    local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
                    local ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.3)
                    if not ons then
                        x = (x*100)
                        y = (y*70)
                        str = str.."<p style=\"left: "..x.."%;top: "..y.."%;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #96ff9f;background-color: #000000AA;border-radius:3px; height: 32px;\"><b>⠀"..b.message.."⠀</b></p>"
                    end
                end
            end
        end
        if #removes > 0 then
            for a, b in ipairs(removes) do
                syPlayers[b] = nil
            end
        end
        if str ~= lstr then
            SendNUIMessage({meta = "sy", html = str})
            lstr = str
        end
    end
end)

CreateThread(function()
    local lstr = ""
    while true do
        Wait(0)
        local tick = GetGameTimer()
        local str = ""
        local removes = {}
        for a, b in next, doPlayers do
            if b.rtime < tick then
                removes[#removes+1] = a
            end
            local p = GetPlayerFromServerId(a)
            if NetworkIsPlayerActive(p) then
                local ped = GetPlayerPed(p)
                if DoesEntityExist(ped) then
                    local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
                    local ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.4)
                    if not ons then
                        x = (x*100)
                        y = (y*100)
                        str = str.."<p style=\"left: "..x.."%;top: "..y.."%;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #fc0303;background-color: #000000AA;border-radius:3px; height: 32px;\"><b>⠀"..b.message.."⠀</b></p>"
                    end
                end
            end
        end
        if #removes > 0 then
            for a, b in ipairs(removes) do
                doPlayers[b] = nil
            end
        end
        if str ~= lstr then
            SendNUIMessage({meta = "do", html = str})
            lstr = str
        end
    end
end)

AddEventHandler("me:event", function(source, message, type1)

    source = tonumber(source)
    local sonid = GetPlayerFromServerId(source)
    local monid = PlayerId()
    if #(GetEntityCoords(GetPlayerPed(monid)) - GetEntityCoords(GetPlayerPed(sonid))) < tRange and HasEntityClearLosToEntity( GetPlayerPed(monid), GetPlayerPed(sonid), 17 ) then
        if type1 == 0 then 
            players[source] = {message = fix(message), rtime = 10000+GetGameTimer()} 
        elseif type1 == 1 then 
            syPlayers[source] = {message = fix(message), rtime = 10000+GetGameTimer()} 
        elseif type1 == 2 then 
            doPlayers[source] = {message = fix(message), rtime = 10000+GetGameTimer()} 
        end
    end
end)

function fix(string)
    string = string.gsub(string, "&", "&amp")
    string = string.gsub(string, "<", "&lt")
    string = string.gsub(string, ">", "&gt")
    string = string.gsub(string, "\"", "&quot")
    string = string.gsub(string, "'", "&#039")
    return string
end


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
