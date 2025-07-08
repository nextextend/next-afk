lib.locale();
local config = require 'config.config';
local functions = require 'config.cl_functions';

local point = nil;
local countdownTimer = nil;
local preAfkTimer = nil;

---@return boolean
local function isInZone()
    return point and point:contains(GetEntityCoords(cache.ped)) or false;
end;

function onEnter()
    local totalSeconds = config.afkMinutes * 60;
    local countdownTime = math.floor(totalSeconds * (config.countdownPercent / 100));
    local preTimer = math.floor(totalSeconds * (config.preAfkPercent / 100));

    preAfkTimer = lib.timer(preTimer * 1000, function()
        if isInZone() then
            countdownTimer = lib.timer(countdownTime * 1000, function()
                if isInZone() then
                    functions.setCounter(0);
                    TriggerServerEvent('next-afk:kickPlayer');
                end;
            end, true);

            CreateThread(function()
                while countdownTimer and countdownTimer:getTimeLeft('s') > 0 and isInZone() do
                    local timeLeft = math.floor(countdownTimer:getTimeLeft('s'));
                    functions.setCounter(timeLeft);
                    Wait(1000);
                end;
            end);
        end;
    end, true);
end;

function onExit()
    if preAfkTimer then
        preAfkTimer:forceEnd(false);
        preAfkTimer = nil;
    end;

    if countdownTimer then
        countdownTimer:forceEnd(false);
        countdownTimer = nil;
    end;

    functions.hideCounter();

    Wait(200);
    createNewPoint();
end;

function createNewPoint()
    if point then point:remove() end;

    point = lib.zones.sphere({
        coords = GetEntityCoords(cache.ped),
        radius = config.afkZone or 0.1,
        onEnter = onEnter,
        onExit = onExit,
    });
end;

local function createCommand()
    RegisterCommand(config.afkCommand, onExit)
end

CreateThread(function()
    while not NetworkIsPlayerActive(cache.playerId) do Wait(500) end;
    createNewPoint();

    if not config.afkCommand then return end;
    createCommand()
end);