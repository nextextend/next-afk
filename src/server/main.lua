lib.locale();
local functions = require 'config.sv_functions';

RegisterNetEvent('next-afk:kickPlayer', function ()
    local src = source;

    functions.kickPlayer(src, locale('too_long_afk'));
end);