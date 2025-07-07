lib.locale();
local config = require 'config.config';
local functions = require 'config.cl_functions';

local point = nil;

---@return boolean
local function isInZone()
    return point.currentDistance < config.afkZone;
end;

local function createNewPoint()
    if point then point:remove() end;

    point = lib.points.new({
        coords = GetEntityCoords(cache.ped),
        distance = config.afkZone or 3.0
    });

    function point:onEnter()
        local totalSeconds = config.afkMinutes * 60;
        local countdownTime = math.floor(totalSeconds * (config.countdownPercent / 100));

        CreateThread(function()
            local preTimer = math.floor(totalSeconds * (config.preAfkPercent / 100));
            while preTimer > 0 and isInZone() do
                Wait(1000);
                preTimer = preTimer - 1;
            end;

            if isInZone() then
                local timer = countdownTime;
                while timer > 0 and isInZone() do
                    functions.setCounter(timer);
                    Wait(1000);
                    timer = timer - 1;
                end;

                if timer <= 0 and isInZone() then
                    functions.setCounter(0);

                    TriggerServerEvent('next-afk:kickPlayer');
                end;
            end;
        end);
    end;

    function point:onExit()
        functions.hideCounter();

        createNewPoint();
    end;
end

CreateThread(function()
    while not NetworkIsPlayerActive(cache.playerId) do Wait(100) end;

    createNewPoint();
end);
